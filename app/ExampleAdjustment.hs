module ExampleAdjustment (exInstructionsToMap, contradictingExampleIdsToExampleInstructions, statefulExampleInstructionsToInstructions, criteriaPrereqAddition, findInconsistentRulesStateful, findInconsistentRules,
 findInconsistentRulesLabels, chainRuleToLabel, groupInconsistentRules, contradictBeforeLists, contradict) where

import Data.List
import qualified Data.Map as Map
import Data.Maybe

import Z3.Monad

import ChainsToSMT
import NameIdChain
import Types

import Debug.Trace

exInstructionsToMap :: [ExampleInstruction] -> Map.Map String ExampleChain
exInstructionsToMap [] = Map.fromList []
exInstructionsToMap (ToChainNamed n e:xs) =
    let
        m = exInstructionsToMap xs
        existing = Map.findWithDefault [] n m
    in
    Map.insert n (e:existing) m
exInstructionsToMap (_:xs) = exInstructionsToMap xs


statefulExampleInstructionsToInstructions :: [ExampleInstruction] -> IO [Instruction]
statefulExampleInstructionsToInstructions e = evalZ3 . statefulExampleInstructionsToInstructions' e . pathSimplificationExamples . exInstructionsToMap $ e


statefulExampleInstructionsToInstructions' :: [ExampleInstruction] -> IdNameExamples -> Z3 [Instruction]
statefulExampleInstructionsToInstructions' ex n = do
    let ruleNum = foldr (+) 0 . map (length) $ (chains n)
    trace ("IdNameExamples = " ++ (show . toList' $ n)) convertExamplesSMT n ruleNum
    mapM_ (\(ei, p) ->
        do
            let e = insRule ei

            intSort <- mkIntSort
            
            zero <- mkInt 0 intSort
            p' <- mkInt p intSort

            --make sure the packet has the correct critera
            assert =<< toSMTCriteriaList (criteria . exRule $ e) Nothing p' zero zero

            --make sure the packet starts at the right place
            let c = (idsWithName n . chainName $ ei) !! 0 --Only one, because from ExampleInstructions
            c' <- mkInt c intSort

            assert =<< reaches p' c' zero

            --make sure the packet terminates correctly
            tar <- if (targets . exRule $ e) !! 0 == ACCEPT then acceptAST else dropAST
            tw <- terminatesWith p'

            assert =<< mkEq tw tar
            ) $ zip ex [0..]

    --By forcing the policies to be NONE, we can ensure that all packets match some rule
    mapM_ (\c -> 
            do
                intSort <- mkIntSort

                c' <- mkInt c intSort
                pol <- policy c'
                none <- noneAST
                assert =<< mkEq pol none
            ) (validIds n) 

    (checking, model) <- getModel

    viewModel <- if isJust model then showModel . fromJust $ model else return . show $ checking

    trace ("v=  " ++ viewModel) return []


--Given [ExampleInstruction] and [(ChainId, RuleInd, RuleInd)] that are contradictory, returns Right [(ChainId, [RuleInd])] such that
--all rule in each list are resolvable together, or Left [(ChainId, [RuleInd])] such that those rules are not resolvable
groupInconsistentRules :: [ExampleInstruction] -> [(ChainId, RuleInd, RuleInd)] -> Maybe [(ChainId, [RuleInd])]
groupInconsistentRules _ [] = Just []
groupInconsistentRules rs ((c, r1, r2):crr) =
    let
        (s, u) = partition(\(c', _, _) -> c' == c) crr

        over = groupOverlapping . map (\(_, r1', r2') -> [r1', r2']) $ s
        over' = map (\ov -> (c, ov)) over
    in
    groupInconsistentRules rs u >>= \xs -> (Just $ over' ++ xs)
    where
        --Returns whether the two lists share any elements
        overlap :: (Eq a) => [a] -> [a] -> Bool
        overlap xs ys = not . null $ intersect xs ys

        --returns lists merged with other lists that they share at least one element with
        groupOverlapping :: (Eq a, Show a) => [[a]] -> [[a]]
        groupOverlapping [] = []
        groupOverlapping (x:xs) =
            let
                xs' = groupOverlapping xs
                (over, other) = partition (overlap x) xs'
                over' = if not . null $ over then head over else []
            in
            (union x over'):other

--Given two ExampleInstructions, returns the parts of state that they DO NOT share
differingState :: ExampleInstruction -> ExampleInstruction -> [State]
differingState e1 e2 =
    let
        s1 = state . insRule $ e1
        s2 = state . insRule $ e2
    in
    union (s1 \\ s2) (s2 \\ s1)


--Returns a map from the labels of examples with a nonnull contradictBeforeList, to that List
contradictBeforeLists :: (ChainId -> Label -> Label -> Bool) -> [ExampleInstruction] -> Map.Map Label [ExampleInstruction]
contradictBeforeLists f exL =
    let
        lx = nonNullContradictBeforeList f exL
    in
    Map.fromList . map (\l -> (l, contradictBeforeList f exL l)) $ lx

--Returns a list of all labels that, when passed with otherwise the same parameters to contradictBeforeList,
--will return a non null list
nonNullContradictBeforeList :: (ChainId -> Label -> Label -> Bool) -> [ExampleInstruction] -> [Label]
nonNullContradictBeforeList f exL =
    let
        lx = map (label . exRule . insRule) exL
    in
    filter (not . null . contradictBeforeList f exL) lx

--Takes a function that returns the contradict-before list for a given example, based on a function that returns whether two
--packets are contradicting, the example list, and the example label
contradictBeforeList :: (ChainId -> Label -> Label -> Bool) -> [ExampleInstruction] -> Label -> [ExampleInstruction]
contradictBeforeList f exL i =
    let
        n = pathSimplificationChains . toRules $ exL

        ex = case find (\e -> (label . exRule . insRule $ e) == i) $ exL of
            Just e -> e
            Nothing -> error "Nothing in contradictBeforeList"

        exCId = case idsWithName n . chainName $ ex of
            [h] -> h
            _ -> error "Should only be one element with the given name in contradictBeforeList"

        exTime :: ExampleInstruction -> Maybe Int
        exTime exI =
            let
                time = filter (\e -> case e of
                    (Time _) -> True
                    _ -> False) . state . insRule $ exI
            in
            case time of (Time s:[]) -> Just s
                         t -> Nothing

        cameBefore :: ExampleInstruction -> ExampleInstruction -> Maybe Bool
        cameBefore e e' = (<) <$> exTime e <*> exTime e'

        cameBefore' :: ExampleInstruction -> ExampleInstruction -> Bool
        cameBefore' e e' = case cameBefore e e' of
                                Just b -> b
                                Nothing -> False

        inBetweenList :: [ExampleInstruction] -> ExampleInstruction -> ExampleInstruction -> [ExampleInstruction]
        inBetweenList eL e e' = filter (\e'' -> case (&&) <$> cameBefore e e'' <*> cameBefore e'' e' of
                                                    Just b -> b
                                                    Nothing -> False) eL

        exToLabel :: ExampleInstruction -> Label
        exToLabel e = label . exRule . insRule $ e
    in
    filter (\e -> f exCId (exToLabel e) (exToLabel ex)
                  && cameBefore' e ex
                  && (not . or . map (\e' -> f exCId (exToLabel e) (exToLabel e')) $ (inBetweenList exL e ex))
                  && (null . contradictBeforeList f exL $ exToLabel e)) exL

--For a non-null contradict-before list, gives all other contradict-before list ids that share some criteria
shareCriteriaList :: (ChainId -> Label -> Label -> Bool) -> [ExampleInstruction] -> Label -> [Label]
shareCriteriaList f exL i =
    let
        ex = case find (\e -> (label . exRule . insRule $ e) == i) $ exL of
            Just e -> e
            Nothing -> error "Nothing in contradictBeforeList"
        cbl = contradictBeforeLists f exL
    in
    map (label . exRule . insRule) . filter (\e -> not . null . intersect (criteria . exRule . insRule $ ex) $ (criteria . exRule . insRule $ e )) $ exL


contradictingExampleIdsToExampleInstructions :: [ExampleInstruction] -> [(ChainId, RuleInd, RuleInd)] -> [ExampleInstruction]
contradictingExampleIdsToExampleInstructions ex rs =
    let
        n = pathSimplificationExamples . exInstructionsToMap $ ex
        rs' = map (\(c, r) -> case (lookupName n c, lookupRule n c r) of 
                                    (Just name, Just e) -> (name, e)
                                    (_, _) -> error "Unrecognized rule when resolving contradicting examples."
                    ) . nub . concat . map (\(c, r1, r2) -> [(c, r1), (c, r2)]) $ rs
    in
    map (\(n', r) -> ToChainNamed {chainName = n', insRule = r} ) rs'
    

--Return whether the indicated chainId and RuleInds are in the list of contradictions, in either order
contradict :: [(ChainId, Label, Label)] -> ChainId ->  Label -> Label -> Bool
contradict [] _ _ _ = False
contradict ((c, r1, r2):xs) c' r1' r2' = (c == c && ((r1 == r1' && r2 == r2') || (r1 == r2' && r2 == r1'))) || contradict xs c' r1' r2'

--Given ExampleInstructions and [(ChainId, RuleInd, RuleInd)] from findInconsistent Rules, returns any that are
--not resolvable, even using state
findInconsistentRulesStateful :: [ExampleInstruction] -> [(ChainId, RuleInd, RuleInd)] -> [(ChainId, RuleInd, RuleInd)]
findInconsistentRulesStateful ex ix = findInconsistentRulesStateful' (pathSimplificationExamples . exInstructionsToMap $ ex) ix
    where
        findInconsistentRulesStateful' :: IdNameExamples -> [(ChainId, RuleInd, RuleInd)] -> [(ChainId, RuleInd, RuleInd)]
        findInconsistentRulesStateful' _ [] = []
        findInconsistentRulesStateful' n (crr@(c, r1, r2):ix) =
            let
                r1' = case lookupRule n c r1 of
                            Just r -> r
                            Nothing -> error "Can't find example in inconsistentRulesStateful"
                r2' = case lookupRule n c r2 of
                            Just r -> r
                            Nothing -> error "Can't find example in inconsistentRulesStateful"
                state1 = state r1'
                state2 = state r2'
                diff1 = state1 \\ state2
                diff2 = state2 \\ state1
            in
            if diff1 /= [] && diff2 /= [] then findInconsistentRulesStateful' n ix else  crr:findInconsistentRulesStateful' n ix


--Asserts that there is a chain with instructions to add two rules that are simultaneously
--satisfiable, and tries to find them
--Returns a list of chains, labels for 2 rules that are contradictory
--The smaller label is listed first
--Only considers the examples instructions, not the state!
findInconsistentRulesLabels :: [ExampleInstruction] -> [(ChainId, RuleInd, RuleInd)] -> [(ChainId, Label, Label)]
findInconsistentRulesLabels e rs = 
    let
        n = pathSimplificationChains . toRules $ e
    in
    nub . findInconsistentRulesLabels' n $ rs
    where
        findInconsistentRulesLabels' :: IdNameChain ->  [(ChainId, RuleInd, RuleInd)] -> [(ChainId, Label, Label)]
        findInconsistentRulesLabels' _ [] = []
        findInconsistentRulesLabels' n ((c, r1, r2):rs) =
            let
                r1Label = chainRuleToLabel n c r1
                r2Label = chainRuleToLabel n c r2
            in
            ((c, r1Label, r2Label):findInconsistentRulesLabels' n rs)

findInconsistentRules :: [ExampleInstruction] -> IO [(ChainId, RuleInd, RuleInd)]
findInconsistentRules rs = fmap (nub) (evalZ3 . findInconsistentRules' $ rs)

findInconsistentRules' :: [ExampleInstruction] -> Z3 [(ChainId, RuleInd, RuleInd)]
findInconsistentRules' rs = do
    let rs' = pathSimplificationChains . toRules $ rs
    convertChainsSMT rs' 1

    intSort <- mkIntSort

    z <- mkInt 0 intSort

    chSymb <- mkStringSymbol "ch"
    ch <- mkConst chSymb intSort

    r1Symb <- mkStringSymbol "r1"
    r1 <- mkConst r1Symb intSort

    rt1 <- ruleTarget ch r1

    r2Symb <- mkStringSymbol "r2"
    r2 <- mkConst r2Symb intSort

    rt2 <- ruleTarget ch r2

    assert =<< validRule ch r1
    assert =<< validRule ch r2

    assert =<< mkLe r1 r2
    assert =<< mkNot =<< mkEq r1 r2

    matches1 <- matchesCriteria z ch r1
    matches2 <- matchesCriteria z ch r2

    differentTargets <- mkNot =<< mkEq rt1 rt2

    assert =<< mkAnd [matches1, matches2, differentTargets]

    findInconsistentRules'' rs rs'


toRules :: [ExampleInstruction] -> Map.Map String Chain
toRules [] = Map.fromList []
toRules (ToChainNamed n e:xs) =
    let
        m = toRules xs
        existing = Map.findWithDefault [] n m
    in
    Map.insert n (exRule e:existing) m
toRules (_:xs) = toRules xs

--helps findInconsistentRules', by actually running the check.  Returns the list if unsat,
--if sat extracts the simultaneously satisfiable rules from the model, asserts that the chain
--and rules in question are not them, and continues searching
findInconsistentRules'' :: [ExampleInstruction] -> IdNameChainType ct -> Z3 [(ChainId, RuleInd, RuleInd)]
findInconsistentRules'' rs n = do
    (_, m) <- solverCheckAndGetModel

    case m of
        Just m' -> do
            intSort <- mkIntSort

            chSymb <- mkStringSymbol "ch"
            ch <- mkConst chSymb intSort

            r1Symb <- mkStringSymbol "r1"
            r1 <- mkConst r1Symb intSort

            r2Symb <- mkStringSymbol "r2"
            r2 <- mkConst r2Symb intSort

            ch' <- evalInt m' ch
            r1' <- evalInt m' r1
            r2' <- evalInt m' r2

            --This conditional should always be true- just in case of an unexpected error
            if isJust ch' && isJust r1' && isJust r2' then do
                let ch'' = fromIntegral . fromJust $ ch'
                let r1'' = fromIntegral . fromJust $ r1'
                let r2'' = fromIntegral . fromJust $ r2'

                chInt <- mkInt ch'' intSort
                r1Int <- mkInt r1'' intSort
                r2Int <- mkInt r2'' intSort

                chNeq <- mkNot =<< mkEq ch chInt

                r1Neq <- mkNot =<< mkEq r1 r1Int
                r2Neq <- mkNot =<< mkEq r2 r2Int
                assert =<< mkOr [chNeq, r1Neq, r2Neq]

                r1Neq' <- mkNot =<< mkEq r1 r2Int
                r2Neq' <- mkNot =<< mkEq r2 r1Int
                assert =<< mkOr [chNeq, r1Neq', r2Neq']

                rs' <- findInconsistentRules'' rs n

                let r1Label = chainRuleToLabel n ch'' r1''
                let r2Label = chainRuleToLabel n ch'' r2''
                return ((ch'', r1Label, r2Label):rs')

                return ((ch'', r1'', r2''):rs')
            else return []
        Nothing -> return []

chainRuleToLabel :: IdNameChainType ct -> ChainId -> RuleInd -> Label
chainRuleToLabel n ch r = case lookupRule n ch r of Just r' -> label . accessRules n $ r'
                                                    Nothing -> error "Error - inconsistency detected with nonexisting rule."


--Responsible for adding criteria to a rule that other criteria in that rule depending on
--for example, ports only make sense in iptables if specifying compatible protocol

criteriaPrereqAddition :: ExampleInstruction -> [ExampleInstruction]
criteriaPrereqAddition (ToChainNamed n e) = map (\r' -> ToChainNamed n (Example {exRule = r', state = state e})) (criteriaPrereqAdditionRule . exRule $ e)
criteriaPrereqAddition (NoInstruction e) = map (\r' -> NoInstruction (Example {exRule = r', state = state e})) (criteriaPrereqAdditionRule . exRule $ e)

criteriaPrereqAdditionRule :: Rule -> [Rule]
criteriaPrereqAdditionRule (Rule c t i) = map (\c' -> Rule c' t i) $ criteriaPrereqAdditionCriteriaList c c

criteriaPrereqAdditionCriteriaList :: [Criteria] -> [Criteria] -> [[Criteria]]
criteriaPrereqAdditionCriteriaList [] _ = [[]]
criteriaPrereqAdditionCriteriaList (c:cx) c' =
    if (not . null $ use) && (null $ use `intersect` c') then
        (++) <$> map (\u -> u:[c]) (use) <*> criteriaPrereqAdditionCriteriaList cx (c' ++ use)
    else
        (++) <$> [[c]] <*> criteriaPrereqAdditionCriteriaList cx c'
    where
        rc = case c of Not e -> e
                       _ -> c
        use = criteriaPrereqAdditionCriteria rc

criteriaPrereqAdditionCriteria :: Criteria -> [Criteria]
criteriaPrereqAdditionCriteria (Port _ _) = [Protocol 6, Protocol 17]
criteriaPrereqAdditionCriteria (BoolFlag _) = [Protocol 6]
criteriaPrereqAdditionCriteria _ = []
