module RuleAdding where

import Data.List
import Data.Maybe
import qualified Data.Map as Map

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
        newNameIdChain = increaseIndexes (Map.insert i ("", newChain) $ Map.filterWithKey (\i' _ -> i' /= i) n) (maxId n)
        converted = convertChainsCheckSMT (Map.union n newNameIdChain)
            "(assert (= num-of-packets 2))"
            (
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "0" (show i) "0")
             ++
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "0" (show $ i + maxId n) "0")
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
        shortened = Map.insert i ("", (take cut newChain)) $ Map.filterWithKey (\i' _ -> i' /= i) n
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
scoreRules (Rule c t) (Rule c' t') = (scoreCriteria c c') + (scoreTargets t t')

scoreCriteria :: [Criteria] -> [Criteria] -> Int
scoreCriteria [] _ = 0
scoreCriteria (c:cx) c' = if c `elem` c' then 1 + scoreCriteria cx c' else scoreCriteria cx c' 

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets [] _ = 0
scoreTargets (t:tx) t' = if t `elem` t' then 1 + scoreTargets tx t' else scoreTargets tx t'