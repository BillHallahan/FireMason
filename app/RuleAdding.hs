module RuleAdding where

import Types

addRules :: [Instruction] -> [NameIdChain] -> [NameIdChain]
addRules (x:xs) n = []

findPointCut :: Instruction -> [Chain] -> Int
findPointCut i c = findPointCut' i c (-1)

findPointCut' :: Instruction -> [Chain] -> Int -> Int
findPointCut' i c i' = 0


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t i) (Rule c' t' i') = (scoreCriteria c c') + (scoreTargets t t')

scoreCriteria :: Criteria -> Criteria -> Int

scoreTarget :: Target -> Target -> Int