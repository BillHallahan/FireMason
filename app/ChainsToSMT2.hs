{-# LANGUAGE FlexibleInstances #-}

module ChainsToSMT2 where

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Data.List
import Data.String.Utils

import NameIdChain
import ParserHelp
import Types

import SMT


convertChainsCheckSMT :: IdNameChain -> String -> String -> String -> Int -> String -> String
convertChainsCheckSMT n header replacePCR replacePC packetNum check = 
    let
        chainlen = foldl (++) "" $ map (\(i, (_, c)) -> printSMTFunc1 "assert" $ printSMTFunc2 "=" ("(chain-length " ++ show i ++ ")") (length c)) (Map.toList n)

        prereqs = foldr (++) [] $ map toSMTPrereq $ map (\(_, c) -> c) (Map.elems n)
        prereqsString = foldr (\y acc -> y ++ "\n" ++ acc ) "" $ nub prereqs

        path = map (\(i, (_, x)) -> toSMTPath x i 0) (Map.toList n)
        pathString = foldr (\x acc -> x ++ "\n" ++ acc ) "" path

        converted = map (\(i, (_, x)) -> toSMT x i 0) (Map.toList n)
        convertedString = foldr (\x acc -> x ++ "\n" ++ acc ) "" converted

        repPCR = map (\(i, (_, x)) -> replaceAllCombinations replacePCR [("{p}", stringNumList 0 (packetNum - 1)), ("{c}", [show i]), ("{r}", stringNumList 0 (length x))]) (Map.toList n)
        repPC = replaceAllCombinations replacePC [("{p}", stringNumList 0 (packetNum - 1)), ("{c}", stringNumList 0 (length n - 1))]
    in
    header ++ "\n" ++
    chainlen ++ "\n" ++
    printSMTFunc1 "assert" (printSMTFunc2 "=" "num-of-chains" (length n)) ++ "\n" ++
    prereqsString ++ "\n" ++
    pathString ++ "\n" ++
    (foldr (++) "" repPCR) ++ "\n" ++
    repPC ++ "\n" ++
    convertedString ++
    check ++
    "(check-sat-using (then (repeat (then simplify (repeat qe))) smt))\n" ++
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
    toSMTPrereq (Rule c t _) = toSMTPrereq c ++ toSMTPrereq t

    toSMT (Rule [] t _) ch r = foldr (++) "" $ map (\p -> printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "valid-packet" p) (printSMTFunc3 "matches-criteria" p ch r))) (stringNumList 0 1)
    toSMT (Rule c _ _) ch r =
        (foldr (++) "" $ map (\p -> printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "valid-packet" p) (printSMTFunc2 "=" (toSMT c ch r) (printSMTFunc3 "matches-criteria" p ch r)))) (stringNumList 0 1))
        
    toSMTPath (Rule [] t _) ch r = (toSMTPath t ch r)

    toSMTPath (Rule c [] _) ch r = printSMTFunc1 "assert" (printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "NONE")

    toSMTPath (Rule c [PropVariableTarget v b] _) ch r =
        (foldr (++) "" $ map (\p -> printSMTFunc1 "assert" (printSMTFunc2 "=>" 
                    (printSMTFunc2 "and" (printSMTFunc1 "valid-packet" p) (printSMTFunc3 "matches-rule" p ch r))
                    (toSMTPath (PropVariableTarget v b) ch r))) (stringNumList 0 1)) ++ "\n"
        ++ printSMTFunc1 "assert" (printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "NONE") ++ "\n"
        ++ toSMTNotPath (PropVariableTarget v b) ch r

    toSMTPath (Rule c t _) ch r =
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
    toSMTPrereq (BoolFlag f) = ["(declare-fun " ++ (flagToString f) ++ " () Bool)"]
    toSMTPrereq (Not c) = toSMTPrereq c
    toSMTPrereq (Port e _) = 
        let
            s = if e == Source then "source" else "destination"
        in
                             ["(declare-fun " ++ s ++ "_port () Int)",
                              "(assert (<= 0 " ++ s ++ "_port))",
                              "(assert (<= " ++ s ++ "_port 65535))"]
    toSMTPrereq (Protocol _) = ["(declare-fun protocol () Int)",
                                "(assert (<= 0 protocol))",
                                "(assert (<= protocol 255))"]
    toSMTPrereq (PropVariableCriteria i) = ["(declare-fun v" ++ show i ++ " (Int) Bool)"]
    toSMTPrereq _ = []

    toSMT (BoolFlag f) _ _ = flagToString f
    toSMT (Not c) ch r = printSMTFunc1 "not" (toSMT c ch r)
    toSMT (Port e (Left i)) _ _ =
        let
            s = if e == Source then "source" else "destination"
        in
        "(= " ++ s ++ "_port " ++ show i ++ ")"
    toSMT (Port e (Right (i, j))) _ _=
        let
            s = if e == Source then "source" else "destination"
        in
        "(and (<= " ++ show i ++ " " ++ s ++ "_port " ++ ") (<= " ++ s ++ "_port " ++ show j ++ "))"
    toSMT (PropVariableCriteria i) _ _ = "(v" ++ show i ++ " p)"
    toSMT (Protocol i) _ _ = "(= protocol " ++ show i ++ ")"
    toSMT x _ _ = error $ "unrecognized criteria " ++ show x

flagToString :: Flag -> String
flagToString SYN = "SYN"
flagToString ACK = "ACK"
flagToString FIN = "FIN"
flagToString RST = "RST"
flagToString URG = "URG"

stringNumList :: Int -> Int -> [String]
stringNumList i j = map (show) [i..j]

replaceAllCombinations :: String -> [(String, [String])] -> String
replaceAllCombinations s xs =
    let
        xs' = map (\x -> zip (repeat . fst $ x) (snd x)) xs
        cart = (sequence xs')
    in
    foldr (++) "" $ map (\c -> foldr (\(o, n) e -> replace o n e) s c) cart

instance ToSMT [Target] where 
    toSMT [] ch r = ""
    toSMT (t:ts) ch r = toSMT t ch r ++ toSMT ts ch r

    toSMTPath [] ch r = ""
    toSMTPath (t:[]) ch r = toSMTPath t ch r
    toSMTPath (t:ts) ch r = printSMTFunc2 "and" (toSMTPath t ch r) (toSMTPath ts ch r)

    toSMTNotPath [] ch r = ""
    toSMTNotPath (t:[]) ch r = toSMTNotPath t ch r
    toSMTNotPath (t:ts) ch r = printSMTFunc2 "and" (toSMTNotPath t ch r) (toSMTNotPath ts ch r)

instance ToSMT Target where 
    toSMT ACCEPT _ _ = "ACCEPT"
    toSMT DROP _ _ = "DROP"
    toSMT _ _ _ = ""

    toSMTPrereq (PropVariableTarget i _) = ["(declare-fun v" ++ show i ++ " (Int) Bool)"]
    toSMTPrereq _ = []

    toSMTPath (Go i j) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) (printSMTFunc2 "GO" (show i) (show j))
    toSMTPath (GoReturn i j) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) (printSMTFunc2 "GORETURN" (show i) (show j))
    toSMTPath (ACCEPT) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "ACCEPT"
    toSMTPath (DROP) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "DROP"
    toSMTPath (RETURN) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "RETURN"
    toSMTPath (PropVariableTarget i b) _ _ = if b then "(v" ++ show i ++ " p)" else printSMTFunc1 "not" ("(v" ++ show i ++ " p)")
    toSMTPath (ST s) ch r = s
    toSMTPath _ _ _ = error "NOT HERE"

    toSMTNotPath (Go i j) ch r = ""
    toSMTNotPath _ _ _ = ""