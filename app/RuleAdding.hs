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
findBestPointCut r i n = findBestPointCut' r i n n

--We cut chains shorter in n' as we determine that certain positions are too deep to insert the new rule
--We use n to always be able to evaluate the new rule with the whole chain
findBestPointCut' :: Rule -> Int -> IdNameChain -> IdNameChain -> IO Int
findBestPointCut' r i n n' =
    let
        (i', cut) = findPointCut r i n'
        (name, c) = fromJust $ Map.lookup i' n
        newChain = (addRuleToChainAtPos r c cut)
        updatedChains = foldr (\i'' e -> Map.insert i'' (name, newChain) e) n (idsWithName name n)
        newNameIdChain = increaseIndexes (updatedChains) (1 + maxId n)
        shortened = Map.insert i (name, (take cut newChain)) n'
        combinedNIC = Map.union n newNameIdChain
        idsOld = idsWithName name n
        idsNew = idsWithName name newNameIdChain

        converted = convertChainsCheckSMT (combinedNIC)
            "(assert (= num-of-packets 2))\n(declare-const chain0 Int)\n(declare-const chain1 Int)"
            (
                ((printSMTFunc1 "assert") . (printSMTFunc1 "or") . (foldr1 (++)) $ map (\i'' -> printSMTFunc2 "=" "chain0" (show i'')) idsOld)
             ++
                ((printSMTFunc1 "assert") . (printSMTFunc1 "or") . (foldr1 (++)) $ map (\i'' -> printSMTFunc2 "=" "chain1" (show i'')) idsNew)
             ++
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "0" "chain0" "0")
             ++
                (printSMTFunc1 "assert" $ printSMTFunc3 "reaches" "1" "chain1" "0")
             ++
                (foldr1 (++) (map (\i'' -> printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc1 "policy" i'') "NONE") (idsOld ++ idsNew)))
             ++
                (printSMTFunc1 "assert"
                    (printSMTFunc1 "not"
                        (printSMTFunc2 "and"
                            (printSMTFunc2 "or"
                                (printSMTFunc2 "and"
                                    (printSMTFunc2 "=" (printSMTFunc1 "terminates-with" "0") (printSMTFunc1 "terminates-with" "1"))
                                    (printSMTFunc2 "=" (printSMTFunc2 "reaches-end" "0" "chain0") (printSMTFunc2 "reaches-end" "1" "chain1"))
                                )
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
    in
    do
        firewallPredicates <- readFile "smt/firewallPredicates.smt2"
        noUndesired <- checkSat (firewallPredicates ++ converted)
        if not noUndesired then return cut else trace ("cut length = " ++ show cut ++ " rule = " ++ show r) findBestPointCut' r i n shortened

addRuleToChainAtPos :: Rule -> Chain -> Int -> Chain 
addRuleToChainAtPos r c i =
    let
        (c', c'') = splitAt i c
    in
    c' ++ r:c''

findPointCut :: Rule -> Int -> IdNameChain -> (Int, Int)
findPointCut r i n = 
    let
        (_, c) = fromJust $ Map.lookup i n
        scores =  map (scoreRules r) c
        maxScoreLoc = if not . null $ scores then fromJust $ elemIndex (maximum scores) scores else 0
    in
    (i, maxScoreLoc)


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t) (Rule c' t') = (scoreCriteriaList c c') + (scoreTargets t t')

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