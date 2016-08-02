module RuleAdding where

import Data.List
import Data.Maybe
import qualified Data.Map as Map

import Types
import NameIdChain
import ChainsToSMT2
import SMT

addRules :: [Instruction] -> IdNameChain -> IdNameChain
addRules [] n = n
addRules (x:xs) n =
    let
        --cut = findPointCut (chainName x)
        n' = addRuleToChain (chainName x) (insRule x) n 
    in
    addRules xs n'

addRuleToChain :: String -> Rule -> IdNameChain -> IdNameChain
addRuleToChain s r n = 
    let
        (change, noChange) = Map.partition (\(s', _) -> s' == s) n
        cut = findPointCut r (snd . snd $ Map.elemAt 0 change)
        change' = Map.map (\(s', c)-> (s', r:c)) change
    in
    Map.union change' noChange

findBestPointCut :: Rule -> Int -> IdNameChain -> IO Int
findBestPointCut r i n =
    let
        c = snd . fromJust $ Map.lookup i n
        cut = findPointCut r c
        newChain = addRuleToChainAtPos r c cut
        newNameIdChain = increaseIndexes (Map.insert i ("", newChain) $ Map.filterWithKey (\i' _ -> i' /= i) n) (maxId n)
        converted = convertChainsCheckSMT (Map.union n newNameIdChain)
            "(declare-const i Int) (declare-const j Int)"
            ("(assert (=> (and (not (reaches i j)) (reaches (+ i " ++ show (maxId n) ++ ") j)) " ++ (toSMT (criteria r) 0 0) ++ "))" ++
            "(assert (=> (and  (reaches i j) (not (reaches (+ i " ++ show (maxId n) ++ ") j))) " ++ (toSMT (criteria r) 0 0) ++ "))")
        shortened = Map.insert i ("", (take cut newChain)) $ Map.filterWithKey (\i' _ -> i' /= i) n
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