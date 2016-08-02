{-# LANGUAGE FlexibleInstances #-}

module ChainsToSMT2 where

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Data.List

import NameIdChain
import ParserHelp
import Types

import SMT


convertChainsCheckSMT :: IdNameChain -> String -> String -> String
convertChainsCheckSMT x header check = 
    let
        chainlen = foldl (++) "" $ map (\(i, (_, c)) -> printSMTFunc1 "assert" $ printSMTFunc2 "=" ("(chain-length " ++ show i ++ ")") (length c)) (Map.toList x)

        prereqs = foldr (++) [] $ map toSMTPrereq $ map (\(_, c) -> c) (Map.elems x)
        prereqsString = foldr (\y acc -> y ++ "\n" ++ acc ) "" $ nub prereqs

        path = map (\(i, (_, x)) -> toSMTPath x i 0) (Map.toList x)
        pathString = foldr (\x acc -> x ++ "\n" ++ acc ) "" path

        converted = map (\(i, (_, x)) -> toSMT x i 0) (Map.toList x)
        convertedString = foldr (\x acc -> x ++ "\n" ++ acc ) "" converted
    in
    header ++ "\n" ++
    chainlen ++ "\n" ++
    printSMTFunc1 "assert" (printSMTFunc2 "=" "num-of-chains" (length x)) ++ "\n" ++
    prereqsString ++ "\n" ++
    pathString ++ "\n" ++
    convertedString ++
    check ++
    "(check-sat)\n" ++
    "(get-model)"



class ToSMT a where
    toSMTPrereq :: a -> [String]
    toSMT :: a -> Int -> Int -> String --The first int is to identify the chain as having been called from a unique position
                                       --The second and third int identify the chain and rule number, respectively, the chain was called from
    toSMTPath :: a -> Int -> Int -> String 
    toSMTNotPath :: a -> Int -> Int -> String --If criteria is not met...

    toSMTPrereq _ = []
    toSMTPath _ _ _ = ""
    toSMTNotPath _ _ _ = ""


instance ToSMT Chain where
    toSMTPrereq (c:cx) = toSMTPrereq c ++ toSMTPrereq cx
    toSMTPrereq _ = []


    toSMT rs ch ru = chainToSMT rs toSMT ch ru

    toSMTPath rs ch ru = chainToSMT rs toSMTPath ch ru

--The function is used to iterate over the chain in [Rule], likely using a function from the class ToSMT 
chainToSMT :: [Rule] -> (Rule -> Int -> Int -> String) -> Int -> Int -> String
chainToSMT (r:r':rs) f ch ru = f r ch ru ++ "\n" ++ chainToSMT (r':rs) (f) ch (ru + 1)
chainToSMT (r:[]) f ch ru = 
    f r ch ru
chainToSMT [] _ _ _ = ""


instance ToSMT Rule where
    toSMTPrereq (Rule c t) = toSMTPrereq c ++ toSMTPrereq t

    toSMT (Rule [] t) ch r = printSMTFunc1 "assert" (printSMTFunc2 "matches-criteria" ch r)
    toSMT (Rule c _) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=" (toSMT c ch r) (printSMTFunc2 "matches-criteria" ch r))
        
    toSMTPath (Rule [] t) ch r = (toSMTPath t ch r)
    toSMTPath (Rule c []) ch r = ""
    toSMTPath (Rule c [PropVariableTarget v b]) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc2 "matches-rule" ch r) (toSMTPath (PropVariableTarget v b) ch r)) ++ "\n"
        ++ printSMTFunc1 "assert" (printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "NONE") ++ "\n"
        ++ toSMTNotPath (PropVariableTarget v b) ch r
    toSMTPath (Rule c t) ch r =
        (toSMTPath t ch r) ++ "\n"
        ++ toSMTNotPath t ch r

instance ToSMT [Criteria] where
    toSMTPrereq [] = []
    toSMTPrereq (c:[]) = toSMTPrereq c
    toSMTPrereq (c:cs) = toSMTPrereq c ++ toSMTPrereq cs

    toSMT [] _ _ = ""
    toSMT (c:[]) ch r = toSMT c ch r
    toSMT (c:cs) ch r = printSMTFunc2 "and" (toSMT c ch r) (toSMT cs ch r)

instance ToSMT Criteria where
    toSMTPrereq (Not c) = toSMTPrereq c
    toSMTPrereq (Port s _) = ["(declare-fun " ++ s ++ "_port () Int)",
                              "(assert (<= 0 " ++ s ++ "_port))",
                              "(assert (<= " ++ s ++ "_port 65535))"]
    toSMTPrereq (Protocol _) = ["(declare-fun protocol () Int)",
                                "(assert (<= 0 protocol))",
                                "(assert (<= protocol 255))"]
    toSMTPrereq (PropVariableCriteria i) = ["(declare-fun v" ++ show i ++ " () Bool)"]
    toSMTPrereq _ = []

    toSMT (Not c) ch r = printSMTFunc1 "not" (toSMT c ch r)
    toSMT (Port s (Left i)) _ _ = "(= " ++ s ++ "_port " ++ show i ++ ")"
    toSMT (Port s (Right (i, j))) _ _=
        "(and (<= " ++ show i ++ " " ++ s ++ "_port " ++ ") (<= " ++ s ++ "_port " ++ show j ++ "))"
    toSMT (PropVariableCriteria i) _ _ = "v" ++ show i
    toSMT (Protocol i) _ _ = "(= protocol " ++ show i ++ ")"
    toSMT x _ _ = error $ "unrecognized criteria " ++ show x


instance ToSMT [Target] where 
    toSMT _ _ _ = ""

    toSMTPath [] ch r = ""
    toSMTPath (t:[]) ch r = toSMTPath t ch r
    toSMTPath (t:ts) ch r = printSMTFunc2 "and" (toSMTPath t ch r) (toSMTPath ts ch r)

    toSMTNotPath [] ch r = ""
    toSMTNotPath (t:[]) ch r = toSMTNotPath t ch r
    toSMTNotPath (t:ts) ch r = printSMTFunc2 "and" (toSMTNotPath t ch r) (toSMTNotPath ts ch r)

instance ToSMT Target where 
    toSMT _ _ _ = ""

    toSMTPrereq (PropVariableTarget i _) = ["(declare-fun v" ++ show i ++ " () Bool)"]
    toSMTPrereq _ = []

    toSMTPath (Go i j) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) (printSMTFunc2 "GO" (show i) (show j))
    toSMTPath (ACCEPT) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "ACCEPT"
    toSMTPath (DROP) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "DROP"
    toSMTPath (PropVariableTarget i b) _ _ = if b then "v" ++ show i else printSMTFunc1 "not" ("v" ++ show i)
    toSMTPath (ST s) ch r = s
    toSMTPath _ _ _ = error "NOT HERE"

    toSMTNotPath (Go i j) ch r = ""
    toSMTNotPath _ _ _ = ""