module RuleAdding where

import Data.List
import Data.Maybe
import Types
import NameIdChain
import ChainsToSMT2
import SMT

addRules :: [Instruction] -> [NameIdChain] -> [NameIdChain]
addRules [] n = n
addRules (x:xs) n =
    let
        --cut = findPointCut (chainName x)
        n' = addRuleToChain (chainName x) (insRule x) n 
    in
    addRules xs n'

addRuleToChain :: String -> Rule -> [NameIdChain] -> [NameIdChain]
addRuleToChain s r n = 
    let
        (change, noChange) = partition (\x -> name x == s) n
        cut = findPointCut r (chain $ change !! 0)
        change' = map (\(NameIdChain name i c) -> NameIdChain name i (r:c)) change
    in
    change' ++ noChange

findBestPointCut :: Rule -> Int -> [NameIdChain] -> IO Int
findBestPointCut r i n =
    let
        c = chain . fromJust $ nameIdChainWithId n i
        cut = findPointCut r c
        newChain = addRuleToChainAtPos r c cut
        newNameIdChain = increaseIndexes ((NameIdChain "" i newChain):filter (\x -> ids x /= i) n) (maxId n)
        converted = convertChainsCheckSMT (n ++ newNameIdChain)
            "(declare-const i Int) (declare-const j Int)"
            ("(assert (=> (and (not (reaches i j)) (reaches (+ i " ++ show (maxId n) ++ ") j)) " ++ (toSMT (criteria r) 0 0) ++ "))" ++
            "(assert (=> (and  (reaches i j) (not (reaches (+ i " ++ show (maxId n) ++ ") j))) " ++ (toSMT (criteria r) 0 0) ++ "))")
        shortened = (NameIdChain "" i (take cut newChain)):filter (\x -> ids x /= i) n
    in
    do 
        noUndesired <- checkSat $ converted ++ "(assert (reaches " ++ show i ++ " 0))" ++ "(assert (reaches " ++ show i ++ " 0))"
        if noUndesired then return cut else findBestPointCut r i shortened

addRuleToChainAtPos :: Rule -> Chain -> Int -> Chain 
addRuleToChainAtPos r c i =
    let
        (c', c'') = splitAt i c
    in
    c' ++ r:c''

findPointCut :: Rule -> Chain -> Int
findPointCut r c = 
    let 
        scores =  map (scoreRules r) c
    in
    fromJust $ elemIndex (maximum scores) scores


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t) (Rule c' t') = (scoreCriteria c c') + (scoreTargets t t')

scoreCriteria :: [Criteria] -> [Criteria] -> Int
scoreCriteria (c:cx) c' = if c `elem` c' then 1 + scoreCriteria cx c' else scoreCriteria cx c' 

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets (t:tx) t' = if t `elem` t' then 1 + scoreTargets tx t' else scoreTargets tx t'