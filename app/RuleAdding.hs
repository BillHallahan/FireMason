module RuleAdding where

import Data.List
import Data.Maybe
import Types

addRules :: [Instruction] -> [NameIdChain] -> [NameIdChain]
addRules [] n = n
addRules (x:xs) n =
    let
        --cut = findPointCut (chainName x)
        n' = addRuleToChain (chainName x) (insRule x) n 
    in
    addRules xs n'

--DOESN'T WORK!!!!!
addRuleToChain :: String -> Rule -> [NameIdChain] -> [NameIdChain]
addRuleToChain s r n = 
    let
        (change, noChange) = partition (\x -> name x == s) n
        --change' = map (\x -> r ++ x) change
    in
    change ++ noChange

findPointCut :: Instruction -> Chain -> Int
findPointCut i c = 
    let 
        scores =  map (scoreRules (insRule i)) c
    in
    fromJust $ elemIndex (maximum scores) scores


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t i) (Rule c' t' i') = (scoreCriteria c c') + (scoreTargets t t')

scoreCriteria :: [Criteria] -> [Criteria] -> Int
scoreCriteria (c:cx) c' = if c `elem` c' then 1 + scoreCriteria cx c' else scoreCriteria cx c' 

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets (t:tx) t' = if t `elem` t' then 1 + scoreTargets tx t' else scoreTargets tx t'
