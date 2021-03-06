module RuleAdding (addRulesToIdNameChain, instructionsToAddAtPos) where

import Data.Either
import Data.List
import Data.Maybe
import qualified Data.Map.Strict as Map
import Data.Ord
import Data.String.ToString
import Data.Word
import Data.LargeWord
import Z3.Monad

import Types
import NameIdChain
import ChainsToSMT

addRulesToIdNameChain :: [(Rule, String, Label)] -> IdNameChain -> IdNameChain
addRulesToIdNameChain [] n = n
addRulesToIdNameChain ((r, s, i):xs) n = 
    let withName = idsWithName n s in addRulesToIdNameChain xs (addRuleToChains n r (head withName) i) 

--Given a list of instructions and an IdNameChain, returns a list of rules, and chain names and positions (in terms of labels) at which they should be added
instructionsToAddAtPos :: [Instruction] -> IdNameChain -> IO [(Rule, String, Label)]
instructionsToAddAtPos [] n = return []
instructionsToAddAtPos (ToChainNamed spec s r:xs) n = 
    do
        let changeId = head $ idsWithName n s
        let n' = if not . null $ (idsWithName n s) then n else addChain n s

        (cutC, cutR) <- (findBestPointCut r changeId n')
        let cutCName = if isJust $ lookupName n cutC then fromJust $ lookupName n cutC else error "Trying to cut nonexistent chain."

        let withName = idsWithName n cutCName
        let ch' = case lookupChain n (head withName) of
                            Just __ch -> __ch
                            Nothing -> error ("Trying to look up with nonexistent name " ++ (show . head $ withName))
        let l = if not . null $ ch' then label $ ch' !! cutR else maxLabel n
        let r' = Rule (criteria r) (targets r) l
        let cutCh' = addRuleToChains n r' (head withName) cutR

        instr <- instructionsToAddAtPos xs cutCh'
        
        return $ (r', cutCName, l):instr
instructionsToAddAtPos (x:xs) _ = error ("Unrecognized instruction " ++ show x)

findBestPointCut :: Rule -> ChainId -> IdNameChain -> IO (ChainId, RuleInd)
findBestPointCut r i n = findBestPointCut' (r {criteria = eliminateLimits . criteria $ r}) i n n
    where
        eliminateLimits :: [Criteria] -> [Criteria]
        eliminateLimits [] = []
        eliminateLimits (Limit _ _ _ _:xs) = eliminateLimits xs
        eliminateLimits (x:xs) = x:eliminateLimits xs


--We cut chains shorter in n' as we determine that certain positions are too deep to insert the new rule
--We use n to always be able to evaluate the new rule with the whole chain
findBestPointCut' :: Rule -> ChainId -> IdNameChain -> IdNameChain -> IO (ChainId, RuleInd)
findBestPointCut' r i n n' =
    let
        nameU = case lookupName n i of
                        Just __n -> __n
                        Nothing -> error ("Unknown name from " ++ (show i) ++ " in findBestPointCut'")

        (i', cut, _) = findPointCut r i n'
        (name, c) = if isJust $ lookupNameChain n i' then fromJust $ lookupNameChain n i' else error "Rule being inserted into nonexistent chain."

        updatedChains = addRuleToChains n r i' cut
        newNameIdChain = increaseIds updatedChains (1 + maxId n)
        combinedNIC = setUnion n newNameIdChain

        shortened = switchChains n' (take (cut - 1)) i'

        idsU = idsWithName newNameIdChain nameU

        idsOld = idsWithName n name
        idsNew = idsWithName newNameIdChain name

        topStartingOld = topLevelJumpingTo combinedNIC (idsOld)

        topStarting = topLevelJumpingTo combinedNIC (idsOld ++ idsNew)

        relevant = reduceReferenced combinedNIC (topStarting)

    in
    do
        putStrLn "evalZ3"
        putStrLn "evalZ3"
        (checking, model) <- evalZ3 $ checkRuleImpact r n relevant topStartingOld idsU

        viewModel <- if isJust model then evalZ3 . showModel . fromJust $ model else return ""


        if checking == Unsat then return (i', cut) else findBestPointCut' r i n shortened


checkRuleImpact :: Rule -> IdNameChain -> IdNameChain -> [ChainId] -> [ChainId] -> Z3 (Result, Maybe Model)
checkRuleImpact r n n' top idsU = do
    reset

    intSort <- mkIntSort
    zero <- mkInt 0 intSort
    one <- mkInt 1 intSort
    two <- mkInt 2 intSort

    convertChainsSMT n' 2
    enforcePacketsEqual zero one

    chain0Symb <- mkStringSymbol "chain0"
    chain0 <- mkConst chain0Symb intSort
    chain1Symb <- mkStringSymbol "chain1"
    chain1 <- mkConst chain1Symb intSort

    --Enforce the chains have the same policy
    let chainIdPairs = map (\x -> (x, x + maxId n + 1)) (validIds n)
    mapM_ (\(x, y) -> do 
        x' <- mkInt x intSort
        y' <- mkInt y intSort
        policyX <- policy x'
        policyY <- policy y'
        assert =<< mkEq policyX policyY
        ) chainIdPairs

    --Enforce that limit information is the same between the chains
    let limIdPairs = map (\x -> (x, x + maxId n + 1)) (limitIds n)
    mapM_ (\(x, y) -> do 
        x' <- mkInt x intSort
        y' <- mkInt y intSort
        enforceLimitsEqual x' y') limIdPairs

    --Enforce that any limits refered to in the packet will be matchable
    mapM_ (\(i, r, b, s) -> do
            i' <- mkInt (i + 1 + maxId n) intSort
            b' <- mkInt b intSort

            limInit <- limitInitial i'

            assert =<< mkEq limInit b'
        ) (limitInfo . criteria $ r)

    let topStarting = topLevelJumpingTo n top
    assert =<< mkOr =<< (sequence . (map (mkAnds chain0 chain1)) $ topStarting)

    assert =<< reaches zero chain0 zero
    assert =<< reaches one chain1 zero

    tw0 <- terminatesWith zero
    tw1 <- terminatesWith one
    reEnd0 <- reachesEnd zero chain0
    reEnd1 <- reachesEnd one chain1

    idsU' <- intSortList idsU
    let orChangedChain = mkOr =<< (sequence $ map (\i -> reaches one i zero) idsU') 

    targetAST <- if targets r == ACCEPT then acceptAST else dropAST

    innerOr <- mkOr =<< sequence [mkEq tw0 tw1
                                  , mkAnd [reEnd0, reEnd1]
                                  , mkAnd =<< sequence [toSMTCriteriaList (eliminateLimits . criteria $ r) (Just n') zero zero zero, orChangedChain]]
    imAnd <- mkAnd =<< sequence [toSMTCriteriaList (eliminateLimits . criteria $ r) (Just n') zero zero zero, orChangedChain]
    innerImplies <- mkImplies imAnd =<< mkEq tw1 targetAST

    assert =<< mkNot =<< mkAnd [innerOr, innerImplies]

    getModel
    where
        mkAnds :: AST -> AST -> Int -> Z3 AST
        mkAnds = (\c0 c1 i -> do
                        intSort' <- mkIntSort
                        i' <- mkInt i intSort'
                        i'' <- mkInt (i + 1 + maxId n) intSort'
                        ec0 <- mkEq c0 i'
                        ec1 <- mkEq c1 i''
                        mkAnd [ec0, ec1])

        eliminateLimits :: [Criteria] -> [Criteria]
        eliminateLimits [] = []
        eliminateLimits (Limit _ _ _ _:xs) = eliminateLimits xs
        eliminateLimits (x:xs) = x:eliminateLimits xs

        limitInfo :: [Criteria] -> [(Int, Int, Int, Int)]
        limitInfo [] = []
        limitInfo (Limit i r b s:xs) = (i, r, b, s):limitInfo xs
        limitInfo (_:xs) = limitInfo xs

--Returns the Name, one Id for, and position of the best (as determined by a similarity heuristic) place to insert the given rule in/below the
--chain with the given id in the IdNameChain
findPointCut :: Rule -> ChainId -> IdNameChain -> (ChainId, RuleInd, Int)
findPointCut r i n = 
    let
        c = case lookupChain n i of--fromJust $ Map.lookup i n
                    Just __c -> __c
                    Nothing -> error ("Unknown name from" ++ (show i) ++ " in findPointCut")

        --Get scores for rules in chains we can jump to
        jCritTarget = jumpedToWithCriteria c
        jCritIdChains = map (\(crit, t) -> (crit, t, case lookupChain n t of
                                                                Just __t -> __t
                                                                Nothing -> error ("Unknown id " ++ (show t)))) (jumpedToWithCriteria c)
        jIdChainsAddedCrit = map (\(crit, t, ch) -> (t, map (\(Rule c t l) -> Rule (c ++ crit) t l) ch)) jCritIdChains
        jIdScores = map (\(t, ch) -> findPointCut r t n) jIdChainsAddedCrit
        third = (\(_, _, x) -> x)
        maxJ = if not . null $ jIdScores then maximumBy (comparing third) jIdScores else (-1, -1, minBound :: Int)
 
        scores =  map (scoreRules r) c
        maxScore = if not . null $ scores then maximum scores else -scm - 1
        maxScoreLoc = if not . null $ scores then case elemIndex maxScore scores of
                                                            Just __s -> __s
                                                            Nothing -> error "Unknow index" else 0
    in
    if third maxJ <= maxScore then (i, maxScoreLoc, maxScore) else maxJ


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t _) (Rule c' t' _) = (scoreCriteriaList c c') + (scoreTargets t t')

--scoreCriteriaMax
scm :: Int
scm = 10^16

scoreCriteriaList :: [Criteria] -> [Criteria] -> Int
scoreCriteriaList [] cx' = - (scm * length cx')
scoreCriteriaList cx [] = - (scm * length cx)
scoreCriteriaList (c:cx) cx' = 
    let
        c' = maximumBy (comparing (scoreCriteria c)) cx'
    in
    scoreCriteria c c' + scoreCriteriaList cx (delete c' cx')

--Should return values in between -scm and scm, where -scm is no match, scm is a perfect match
scoreCriteria :: Criteria -> Criteria -> Int
scoreCriteria (IPAddress e i) (IPAddress e' i') = 
    let
        r1 = ipToWord . ipAddr $ i
        r1' = either (c) (c') r1
        r2 = ipToWord . ipAddr $ i'
        r2' = either (c) (c') r2
        base = scm - div ((abs $ r1' - r2') * scm) (2^32 - 1)
    in
    if e == e' then base else div base 2
    where c :: Word32 -> Int
          c = fromIntegral
          c' :: Word128 -> Int
          c' = fromIntegral
scoreCriteria (Protocol i) (Protocol j) = (div scm 2) + div ((255 - (abs $ j - i)) * scm) 510
scoreCriteria (Port e p) (Port e' p') =
    let
        pNum = case p of Left n -> n
                         Right (n, n') -> n
        pNum' = case p' of Left n -> n
                           Right (n, n') -> n 
    in
    if e == e' then (div scm 2) + div ((65535 + 65535 - (abs $ pNum - pNum')) * scm) (4 * 65535)
               else div ((65535 - (abs $ pNum - pNum')) * scm) (2 * 65535)
scoreCriteria (Not c) (Not c') = scoreCriteria c c'
scoreCriteria (Not c) (c') = (scoreCriteria c c') `div` 2
scoreCriteria (c) (Not c') = (scoreCriteria c c') `div` 2
scoreCriteria _ _ = -scm

scoreTargets :: Target -> Target -> Int
scoreTargets _ _ = 0
