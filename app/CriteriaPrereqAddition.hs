module CriteriaPrereqAddition where

import Data.List

import Types

--Responsible for adding criteria to a rule that other criteria in that rule depending on
--for example, ports only make sense in iptables if specifying compatible protocol

criteriaPrereqAddition :: Instruction -> [Instruction]
criteriaPrereqAddition (ToChainNamed n r) = map (ToChainNamed n) (criteriaPrereqAdditionRule r)
criteriaPrereqAddition (NoInstruction r) = map (NoInstruction) (criteriaPrereqAdditionRule r)

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