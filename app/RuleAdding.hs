module RuleAdding where

import Data.List
import Data.Maybe
import qualified Data.Map as Map
import Data.Ord
import Data.String.ToString

import Types
import NameIdChain
import ChainsToSMT2
import SMT
import Debug.Trace

--Given a list of instructions and an IdNameChain, returns a list of rules, and chain names and positions at which they should be added
instructionsToAddAtPos :: [Instruction] -> IdNameChain -> IO [(Rule, String, Int)]
instructionsToAddAtPos [] n = return []
instructionsToAddAtPos (x:xs) n = 
    do
        let s = (chainName x)
        let r = (insRule x)
        
        let (change, noChange) = Map.partition (\(s', _) -> s' == s) n

        let change' = if not . null $ change then change else Map.fromList [(maxId n + 1, (s, []))]

        let (changeId, (_, ch)) = head . Map.toList $ change'
        let n' = if not . null $ change then n else Map.insert (maxId n + 1) (s, []) n

        (cutC, cutR) <- (findBestPointCut r changeId n')
        let cutCName = if isJust $ Map.lookup cutC n then fst . fromJust $ Map.lookup cutC n else error "Trying to cut nonexistent chain."
        let (cutCh, notCutCh) = Map.partition (\(s', _) -> s' == cutCName) n

        let (_, (_, ch')) = head . Map.toList $ cutCh
        let l = if not . null $ ch' then label $ ch' !! cutR else maximum . labels $ n
        let r' = Rule (criteria r) (targets r) l
        let cutCh' = Map.map (\(s', c)-> (s', addRuleToChainAtPos r' c cutR)) cutCh
        let n'' = Map.union cutCh' notCutCh

        instr <- instructionsToAddAtPos xs n''
        
        return $ (r', cutCName, l):instr

findBestPointCut :: Rule -> ChainId -> IdNameChain -> IO (ChainId, Int)
findBestPointCut r i n = findBestPointCut' r i n n

--We cut chains shorter in n' as we determine that certain positions are too deep to insert the new rule
--We use n to always be able to evaluate the new rule with the whole chain
findBestPointCut' :: Rule -> ChainId -> IdNameChain -> IdNameChain -> IO (ChainId, Int)
findBestPointCut' r i n n' =
    let
        nameU = fst . fromJust $ Map.lookup i n

        (i', cut, _) = findPointCut r i n'
        (name, c) = if isJust (Map.lookup i' n) then fromJust $ Map.lookup i' n else error "Rule being inserted into nonexistent chain."

        newChain = (addRuleToChainAtPos r c cut)
        updatedChains = foldr (\i'' e -> Map.insert i'' (name, newChain) e) n (idsWithName name n)
        newNameIdChain = increaseIndexes (updatedChains) (1 + maxId n)
        combinedNIC = Map.union n newNameIdChain

        shortened = Map.insert i (name, (take (cut - 1) newChain)) n'

        idsU = idsWithName nameU newNameIdChain

        idsOld = idsWithName name n
        idsNew = idsWithName name newNameIdChain

        topStartingOld = topLevelJumpingTo combinedNIC (idsOld)
        topStartingNew = topLevelJumpingTo combinedNIC (idsNew)

        topStarting = topLevelJumpingTo combinedNIC (idsOld ++ idsNew)

        relevant = reduceReferenced combinedNIC (topStarting)

    in
    do
        firewallPredicatesReplacePCR <- readFile "smt/firewallPredicatesReplacePCR.smt2"
        let 
            orChangedChain = SMTOr $ map (\i'' -> (Reaches 1 i'' 0)) idsU
            converted = convertChainsCheckSMT relevant
                        ((toString (Assert (SMTEq (SMTString "num-of-packets") (SMTInt 2)))) ++
                                                (toString (DeclareConst "chain0" "Int")) ++
                                                (toString (DeclareConst "chain1" "Int")))
                        firewallPredicatesReplacePCR
                        2
                        (
                            (toString . Assert . SMTOr $ map (\i'' -> (SMTAnd [SMTEq (SMTString "chain0") (SMTInt i''), SMTEq (SMTString "chain1") (SMTInt (i'' + 1 + maxId n))])) topStartingOld)
                         ++
                            (toString (Assert (SMTF3 "reaches" (SMTInt 0) (SMTString "chain0") (SMTInt 0))))
                         ++
                            (toString (Assert (SMTF3 "reaches" (SMTInt 1) (SMTString "chain1") (SMTInt 0))))
                         ++
                            (toString 
                                (Assert
                                    (SMTNot
                                        (SMTAnd [
                                            SMTOr [
                                                SMTEq (TerminatesWith 0) (TerminatesWith 1)
                                                , SMTAnd [SMTF2 "reaches-end" (SMTInt 0) (SMTString "chain0"), SMTF2 "reaches-end" (SMTInt 1) (SMTString "chain1")]
                                                , SMTAnd [SMTString (toSMT (criteria r) 0 0), orChangedChain]
                                                ]
                                            , Implies
                                                (SMTAnd [
                                                    SMTString (toSMT (criteria r) 0 0)
                                                    , orChangedChain
                                                    ]
                                                )
                                                (SMTEq (TerminatesWith 1) (SMTString (toSMT (targets r) 0 0)))
                                            ]
                                        )
                                    )
                                )
                            )
                        )
        firewallPredicates <- readFile "smt/firewallPredicates2.smt2"
        noUndesired <- checkSat (firewallPredicates ++ converted)
        if not noUndesired then return (i', cut) else trace ("cut name = " ++ name ++ " length = " ++ show cut ++ " rule = " ++ show r ++ "\n" ++ "n = " ++ show n ++ "\n") findBestPointCut' r i n shortened

addRuleToChainAtPos :: Rule -> Chain -> Int -> Chain 
addRuleToChainAtPos r c i =
    let
        (c', c'') = splitAt i c
    in
    c' ++ r:c''

--Returns the Name, one Id for, and position of the best (as determined by a similarity heuristic) place to insert the given rule in/below the
--chain with the given id in the IdNameChain
findPointCut :: Rule -> ChainId -> IdNameChain -> (ChainId, Int, Int)
findPointCut r i n = 
    let
        (_, c) = fromJust $ Map.lookup i n

        --Get scores for rules in chains we can jump to
        jCritTarget = jumpedToWithCriteria c
        jCritIdChains = map (\(crit, t) -> (crit, t, snd . fromJust $ Map.lookup t n)) (jumpedToWithCriteria c)
        jIdChainsAddedCrit = map (\(crit, t, ch) -> (t, map (\(Rule c t l) -> Rule (c ++ crit) t l) ch)) jCritIdChains
        jIdScores = map (\(t, ch) -> findPointCut r t n) jIdChainsAddedCrit
        third = (\(_, _, x) -> x)
        maxJ = if not . null $ jIdScores then maximumBy (comparing third) jIdScores else (-1, -1, minBound :: Int)
 
        scores =  map (scoreRules r) c
        maxScore = if not . null $ scores then maximum scores else -scm - 1
        maxScoreLoc = if not . null $ scores then fromJust $ elemIndex maxScore scores else 0
    in
    trace ("r = " ++ show r ++ " maxL = " ++ show maxScore ++ " maxJ = " ++ show maxJ) (if third maxJ <= maxScore then (i, maxScoreLoc, maxScore) else maxJ)


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t _) (Rule c' t' _) = (scoreCriteriaList c c') + (scoreTargets t t')

--scoreCriteriaMax
scm :: Int
scm = 100000

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

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets [] _ = 0
scoreTargets (t:tx) t' = if t `elem` t' then scm + scoreTargets tx t' else scoreTargets tx t'