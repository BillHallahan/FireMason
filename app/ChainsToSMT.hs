module ChainsToSMT where

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Data.List

import ChainPathSimplification
import ParserHelp
import Types

--The functions below all deal with taking a chain
--and getting a formula that describes how a packet may move through that chain
--Looking for INPUT/OUTPUT/FORWARD is iptables specific, maybe... adjust in the future
convertMapOfChains :: Map.Map String Chain -> String
convertMapOfChains m = 
    let
        prereqs = preReqForChains $ Map.elems m
        prereqsString = foldr (\x acc -> x ++ "\n" ++ acc ) "" $ nub prereqs
    in
    "(set-option :produce-models true)\n\n" ++ 
    "(declare-fun reaches(Int Int) Bool)\n" ++
    "(declare-fun matches-criteria(Int Int) Bool)\n" ++
    "(define-fun matches-rule((r Int) (c Int)) Bool\n" ++
    "   (ite (and (matches-criteria r c) (reaches r c)) true false))\n" ++
    "(declare-fun ACCEPT () Bool)\n" ++
    "(declare-fun DROP () Bool)\n" ++
    prereqsString ++
    convertMapOfChains' m [("INPUT", 0), ("OUTPUT", 1), ("FORWARD", 2)] 3 ++
    "(check-sat)\n" ++
    "(get-model)"


--The goal here is to map each call of a chain to a seperate int, and then create formulas describing that chain's behavior
--it might be better to split this mapping and conversion to smt into two seperate steps.
--currently, it seems it might be annoying to, for example, propogate back the point at which
--a chain was called...
convertMapOfChains' :: Map.Map String Chain -> [(String, Int)] -> Int -> String
convertMapOfChains' m ((s, i):xs) j =
    let
        chain = MB.fromJust $ Map.lookup s m
        ref = zip (chainsReferencedInChain chain) [j..]
    in
    convertChain chain (Map.fromList ref) i ++ "\n" ++ convertMapOfChains' m (xs ++ ref) (j + length ref)
convertMapOfChains' _ [] _ = ""

--The first int is to identify the chain as having been called from a unique position
--The second and third int identify the chain and rule number, respectively, the chain was called from 
convertChain :: Chain -> Map.Map String Int -> Int -> String
convertChain c m i = convertChain' c m i 0

convertChain' :: Chain -> Map.Map String Int -> Int -> Int -> String
convertChain' (r:r':rs) m ch ru = 
    let
        nextR = if label r == label r' then ru else ru + 1
    in
    convertRule r m ch ru ++ "\n" ++ convertChain' (r':rs) m ch nextR
convertChain' (r:[]) m ch ru = 
    convertRule r m ch ru
convertChain' [] _ _ _= ""

--Rule -> Other_Chain_Int -> Chain_Int -> Rule_Int -> String
--The Chain_Int should be the same for each rule in a chain
--The Rule_Int should be the same for each rule with the same label
convertRule :: Rule -> Map.Map String Int -> Int -> Int -> String
convertRule (Rule [] t _) m ch r =
   printSMTFunc1 "assert" $ printSMTFunc2 "=>" (printSMTFunc2 "reaches" ch r) (convertTargetList t m ch r)
convertRule (Rule c [] i) m ch r =
    printSMTFunc1 "assert" (printSMTFunc2 "=" (convertCriteriaList c) (printSMTFunc2 "matches-criteria" ch r)) ++ "\n" ++
    printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc2 "reaches" ch r) (printSMTFunc2 "reaches" ch (r + 1))) ++ "\n" ++
    printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch r)) (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch (r + 1))))
convertRule (Rule c t i) m ch r =
    printSMTFunc1 "assert" (printSMTFunc2 "=" (convertCriteriaList c) (printSMTFunc2 "matches-criteria" ch r)) ++ "\n"
    ++ printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc2 "and" (printSMTFunc2 "matches-criteria" ch r) (printSMTFunc2 "reaches" ch r)) (convertTargetList t m ch r)) ++ "\n"
    ++ printSMTFunc1 "assert" (printSMTFunc2 "=>"
        (printSMTFunc2 "and" (printSMTFunc1 "not" (printSMTFunc2 "matches-criteria" ch r)) (printSMTFunc2 "reaches" ch r)) (printSMTFunc2 "reaches" ch (r + 1))) ++ "\n"
    ++ printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch r)) (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch (r + 1))))

convertCriteriaList :: [Criteria] -> String
convertCriteriaList [] = ""
convertCriteriaList (c:[]) = convertCriteria c
convertCriteriaList (c:cs) = "(and " ++ convertCriteria c ++ convertCriteriaList cs ++ ")"

convertCriteria :: Criteria -> String
convertCriteria (Not c) = "(not " ++ convertCriteria c ++ ")"
convertCriteria (Port s (Left i)) = "(= " ++ s ++ "_port " ++ show i ++ ")"
convertCriteria (Port s (Right (i, j))) =
	"(and (<= " ++ show i ++ " " ++ s ++ "_port " ++ ") (<= " ++ s ++ "_port " ++ show j ++ "))"
convertCriteria (Protocol i) = "(= protocol " ++ show i ++ ")"

convertTargetList :: [Target] -> Map.Map String Int -> Int -> Int -> String
convertTargetList [] m ch r = ""
convertTargetList (t:[]) m ch r = convertTarget t m ch r
convertTargetList (t:ts) m ch r = "(and " ++ convertTarget t m ch r ++ convertTargetList ts m ch r ++ ")"

convertTarget :: Target -> Map.Map String Int -> Int -> Int -> String
convertTarget (Jump s) m ch r = "(reaches " ++ show (MB.fromJust $ Map.lookup s m) ++ " 0)"
convertTarget (Go i j) _ _ _ = "(reaches" ++ show i ++ " " ++ show j ++ ")"
convertTarget (ACCEPT) _ ch r = "(and ACCEPT (not " ++ printSMTFunc2 "reaches" ch (r + 1) ++ "))"
convertTarget (DROP) _ ch r = "(and DROP (not " ++ printSMTFunc2 "reaches" ch (r + 1) ++ "))"
convertTarget (ST s) _ ch r = s

--The below is to determine what functions must be declared
--and formulas must be asserted in the smt solver

chainsReferencedInChain :: Chain -> [String]
chainsReferencedInChain (c:cx) = (chainsReferencedInTargets $ targets c) ++ chainsReferencedInChain cx
chainsReferencedInChain [] = []


chainsReferencedInTargets :: [Target] -> [String]
chainsReferencedInTargets (Jump t:tx) = t:chainsReferencedInTargets tx
chainsReferencedInTargets (_:tx) = chainsReferencedInTargets tx
chainsReferencedInTargets [] = []

preReqForChains :: [Chain] -> [String]
preReqForChains (c:cx) = preReqForChain c ++ preReqForChains cx
preReqForChains _ = []

preReqForChain :: Chain -> [String]
preReqForChain (r:rs) = preReqForRule r ++ preReqForChain rs
preReqForChain _ = []

preReqForRule :: Rule -> [String]
preReqForRule (Rule c t _) = preReqForCriteriaList c ++ preReqForTargetList t

preReqForCriteriaList :: [Criteria] -> [String]
preReqForCriteriaList [] = []
preReqForCriteriaList (c:[]) = preReqForCriteria c
preReqForCriteriaList (c:cs) = preReqForCriteria c ++ preReqForCriteriaList cs

preReqForCriteria :: Criteria -> [String]
preReqForCriteria (Not c) = preReqForCriteria c
preReqForCriteria (Port s _) = ["(declare-fun " ++ s ++ "_port () Int)",
                                "(assert (<= 0 " ++ s ++ "_port))",
                                "(assert (<= " ++ s ++ "_port 65535))"]
preReqForCriteria (Protocol _) = ["(declare-fun protocol () Int)",
                                  "(assert (<= 0 protocol))",
                                  "(assert (<= protocol 255))"]
preReqForCriteria _ = []

preReqForTargetList :: [Target] -> [String]
preReqForTargetList [] = []
preReqForTargetList (t:[]) = preReqForTarget t
preReqForTargetList (t:ts) = preReqForTarget t ++ preReqForTargetList ts

preReqForTarget :: Target -> [String]
preReqForTarget _ = []

printSMTFunc1 :: (ToString a) => String -> a -> String
printSMTFunc1 s x = "(" ++ s ++ " " ++ toString x ++ ")"

printSMTFunc2 :: (ToString a, ToString b) => String -> a -> b -> String
printSMTFunc2 s x y = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ ")"

--This is intended for use with the predicates related to positioning in the SMT solver
--but it actually might not be sufficient, because may need more than one formula for each chain...
chainsToInt :: Map.Map String Chain -> Map.Map String Int
chainsToInt m = 
    let
        k = Map.keys m
    in
    Map.fromList $ zip k [0, 1 ..]