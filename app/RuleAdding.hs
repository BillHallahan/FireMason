module RuleAdding where

import Data.List
import Data.Maybe
import qualified Data.Map as Map
import Data.Ord

import Types
import NameIdChain
import ChainsToSMT2
import SMT
import Debug.Trace

addRules :: [Instruction] -> IdNameChain -> IO IdNameChain
addRules [] n = return n
addRules (x:xs) n =
    do
        n' <- addRuleToChain (chainName x) (insRule x) n 
        trace ("addRules - " ++ (show . length $ xs)) addRules xs n'

addRuleToChain :: String -> Rule -> IdNameChain -> IO IdNameChain
addRuleToChain s r n = 
    do 
        let (change, noChange) = Map.partition (\(s', _) -> s' == s) n
        cut <- (findBestPointCut r (head . Map.keys $ change) n)
        let change' = Map.map (\(s', c)-> (s', addRuleToChainAtPos r c cut)) change
        let ret = Map.union change' noChange
        return ret

findBestPointCut :: Rule -> Int -> IdNameChain -> IO Int
findBestPointCut r i n =
    let
        (_, c) = fromJust $ Map.lookup i n
        cut = findPointCut r c
        newChain = addRuleToChainAtPos r c cut
        newNameIdChain = increaseIndexes (Map.insert i ("", newChain) n) (1 + maxId n)
        converted = convertChainsCheckSMT (Map.union n newNameIdChain)
            "(assert (= num-of-packets 2))"
            (
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "0" (show i) "0")
             ++
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "0" (show $ i + 1 + maxId n) "0")
            ++
                (printSMTFunc1 "assert"
                    (printSMTFunc1 "not"
                        (printSMTFunc2 "and"
                            (printSMTFunc2 "or"
                                (printSMTFunc2 "=" (printSMTFunc1 "terminates-with" "0") (printSMTFunc1 "terminates-with" "1"))
                                (toSMT (criteria r) 0 0)
                            )
                            (printSMTFunc2 "=>" 
                                (toSMT (criteria r) 0 0) 
                                (printSMTFunc2 "=" (printSMTFunc1 "terminates-with" "1") (toSMT (targets r) 0 0))
                            )
                        )
                    )
                )
            )
        shortened = Map.insert i ("", (take cut newChain)) n
    in
    do
        firewallPredicates <- readFile "smt/firewallPredicates.smt2"
        noUndesired <- checkSat (firewallPredicates ++ converted)
        if not noUndesired then return cut else trace ("cut length = " ++ show cut ++ " rule = " ++ show r) findBestPointCut r i shortened

addRuleToChainAtPos :: Rule -> Chain -> Int -> Chain 
addRuleToChainAtPos r c i =
    let
        (c', c'') = splitAt i c
    in
    c' ++ r:c''

findPointCut :: Rule -> Chain -> Int
findPointCut r [] = 0
findPointCut r c = 
    let
        scores =  map (scoreRules r) c
    in
    fromJust $ elemIndex (maximum scores) scores


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t) (Rule c' t') = (scoreCriteriaList c c') + (scoreTargets t t')

scoreCriteriaList :: [Criteria] -> [Criteria] -> Int
scoreCriteriaList [] cx' = - (10000 * length cx')
scoreCriteriaList cx [] = - (10000 * length cx)
scoreCriteriaList (c:cx) cx' = 
    let
        c' = maximumBy (comparing (scoreCriteria c)) cx'
    in
    scoreCriteria c c' + scoreCriteriaList cx (delete c' cx')

--Should return values in between -10000 and 10000, where -10000 is no match, 10000 is a perfect match
scoreCriteria :: Criteria -> Criteria -> Int
scoreCriteria (Protocol i) (Protocol j) = 5000 + div ((255 - (abs $ j - i)) * 10000) 510
scoreCriteria (Port e p) (Port e' p') =
    let
        pNum = case p of Left n -> n
                         Right (n, n') -> n
        pNum' = case p' of Left n -> n
                           Right (n, n') -> n 
    in
    if e == e' then 5000 + div ((65535 + 65535 - (abs $ pNum - pNum')) * 10000) (4 * 65535)
               else div ((65535 - (abs $ pNum - pNum')) * 10000) (2 * 65535)
scoreCriteria (Not c) (Not c') = scoreCriteria c c'
scoreCriteria (Not c) (c') = (scoreCriteria c c') `div` 2
scoreCriteria (c) (Not c') = (scoreCriteria c c') `div` 2
scoreCriteria _ _ = -10000

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets [] _ = 0
scoreTargets (t:tx) t' = if t `elem` t' then 10000 + scoreTargets tx t' else scoreTargets tx t'