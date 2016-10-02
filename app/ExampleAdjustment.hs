module ExampleAdjustment (criteriaPrereqAddition, findInconsistentRules) where

import Data.List
import qualified Data.Map as Map
import Data.Maybe

import Z3.Monad

import ChainsToSMT
import NameIdChain
import Types

--Asserts that there is a chain with instructions to add two rules that are simultaneously
--satisfiable, and tries to find them
--Returns a list of chains, labels for 2 rules that are contradictory
--Only considers the examples instructions, not the state!
findInconsistentRules :: [ExampleInstruction] -> IO [(ChainId, RuleInd, RuleInd)]
findInconsistentRules rs = do
    evalZ3 . findInconsistentRules' $ rs

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

    assert =<< mkNot =<< mkEq r1 r2

    matches1 <- matchesCriteria z ch r1
    matches2 <- matchesCriteria z ch r2

    differentTargets <- mkNot =<< mkEq rt1 rt2

    assert =<< mkAnd [matches1, matches2, differentTargets]

    findInconsistentRules'' rs rs'
    where
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

    if isJust m
        then do
            let m' = fromJust m

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

                --return ((ch'', r1'', r2''):rs')
                return ((ch'', r1Label, r2Label):rs')
            else return []
        else return []

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