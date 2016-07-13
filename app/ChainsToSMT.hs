{-# LANGUAGE FlexibleInstances #-}

module ChainsToSMT where

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Data.List

import ChainPathSimplification
import ParserHelp
import Types


convertChains :: [(Int, Chain)] -> String
convertChains c = 
    let
        prereqs = foldr (++) [] $ map toSMTPrereq $ map (\(i, x) -> x) c
        prereqsString = foldr (\x acc -> x ++ "\n" ++ acc ) "" $ nub prereqs

        path = map (\(i, x) -> toSMTPath x i 0) c
        pathString = foldr (\x acc -> x ++ "\n" ++ acc ) "" path

        converted = map (\(i, x) -> toSMT x i 0) c
        convertedString = foldr (\x acc -> x ++ "\n" ++ acc ) "" converted
    in
    "(set-option :produce-models true)\n\n" ++ 
    "(declare-fun reaches(Int Int) Bool)\n" ++
    "(declare-fun reaches-end(Int) Bool)\n" ++
    "(declare-fun matches-criteria(Int Int) Bool)\n" ++
    "(define-fun matches-rule((r Int) (c Int)) Bool\n" ++
    "   (ite (and (matches-criteria r c) (reaches r c)) true false))\n" ++
    "(declare-fun ACCEPT () Bool)\n" ++
    "(declare-fun DROP () Bool)\n" ++
    "(assert (=> ACCEPT (not DROP)))\n" ++
    "(assert (=> DROP (not ACCEPT)))\n" ++
    prereqsString ++ "\n" ++
    pathString ++ "\n" ++
    convertedString ++
    "(check-sat)\n" ++
    "(get-model)"



class ToSMT a where
    toSMTPrereq :: a -> [String]
    toSMT :: a -> Int -> Int -> String --The first int is to identify the chain as having been called from a unique position
                                       --The second and third int identify the chain and rule number, respectively, the chain was called from
    toSMTPath :: a -> Int -> Int -> String

    toSMTPrereq _ = []
    toSMTPath _ _ _ = ""


instance ToSMT Chain where
    toSMTPrereq (c:cx) = toSMTPrereq c ++ toSMTPrereq cx
    toSMTPrereq _ = []


    toSMT rs ch ru = chainToSMT rs toSMT ch ru

    toSMTPath rs ch ru =
        let
            numLabels = (length . nub $ map (\r -> label r) rs)
            reachesEnd = printSMTFunc1 "assert" $ printSMTFunc2 "=>" (printSMTFunc2 "reaches" ch numLabels) (printSMTFunc1 "reaches-end" ch)
        in
        chainToSMT rs toSMTPath ch ru ++ "\n" ++ reachesEnd

chainToSMT :: [Rule] -> (Rule -> Int -> Int -> String) -> Int -> Int -> String
chainToSMT (r:r':rs) f ch ru = 
    let
        nextR = if label r == label r' then ru else ru + 1
    in
    f r ch ru ++ "\n" ++ chainToSMT (r':rs) (f) ch nextR
chainToSMT (r:[]) f ch ru = 
    f r ch ru
chainToSMT [] _ _ _ = ""


instance ToSMT Rule where
    toSMTPrereq (Rule c t _) = toSMTPrereq c ++ toSMTPrereq t

    toSMT (Rule [] _ i) ch r = ""
    toSMT (Rule c [] i) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=" (toSMT c ch r) (printSMTFunc2 "matches-criteria" ch r))
    toSMT (Rule c _ i) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=" (toSMT c ch r) (printSMTFunc2 "matches-criteria" ch r))
        
    toSMTPath (Rule [] t _) ch r = printSMTFunc1 "assert" $ printSMTFunc2 "=>" (printSMTFunc2 "reaches" ch r) (toSMTPath t ch r)
    toSMTPath (Rule c [] i) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc2 "reaches" ch r) (printSMTFunc2 "reaches" ch (r + 1))) ++ "\n" ++
        printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch r)) (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch (r + 1))))
    toSMTPath (Rule c t i) ch r =
        printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc2 "and" (printSMTFunc2 "matches-criteria" ch r) (printSMTFunc2 "reaches" ch r)) (toSMTPath t ch r)) ++ "\n"
        ++ printSMTFunc1 "assert" (printSMTFunc2 "=>"
            (printSMTFunc2 "and" (printSMTFunc1 "not" (printSMTFunc2 "matches-criteria" ch r)) (printSMTFunc2 "reaches" ch r)) (printSMTFunc2 "reaches" ch (r + 1))) ++ "\n"
        ++ printSMTFunc1 "assert" (printSMTFunc2 "=>" (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch r)) (printSMTFunc1 "not" (printSMTFunc2 "reaches" ch (r + 1))))

instance ToSMT [Criteria] where
    toSMTPrereq [] = []
    toSMTPrereq (c:[]) = toSMTPrereq c
    toSMTPrereq (c:cs) = toSMTPrereq c ++ toSMTPrereq cs

    toSMT [] _ _ = ""
    toSMT (c:[]) ch r = toSMT c ch r
    toSMT (c:cs) ch r = "(and " ++ toSMT c ch r ++ toSMT cs ch r ++ ")"

instance ToSMT Criteria where
    toSMTPrereq (Not c) = toSMTPrereq c
    toSMTPrereq (Port s _) = ["(declare-fun " ++ s ++ "_port () Int)",
                              "(assert (<= 0 " ++ s ++ "_port))",
                              "(assert (<= " ++ s ++ "_port 65535))"]
    toSMTPrereq (Protocol _) = ["(declare-fun protocol () Int)",
                                "(assert (<= 0 protocol))",
                                "(assert (<= protocol 255))"]
    toSMTPrereq _ = []

    toSMT (Not c) ch r = "(not " ++ toSMT c ch r ++ ")"
    toSMT (Port s (Left i)) _ _ = "(= " ++ s ++ "_port " ++ show i ++ ")"
    toSMT (Port s (Right (i, j))) _ _=
        "(and (<= " ++ show i ++ " " ++ s ++ "_port " ++ ") (<= " ++ s ++ "_port " ++ show j ++ "))"
    toSMT (Protocol i) _ _ = "(= protocol " ++ show i ++ ")"


instance ToSMT [Target] where 
    toSMT _ _ _ = ""

    toSMTPath [] ch r = ""
    toSMTPath (t:[]) ch r = toSMTPath t ch r
    toSMTPath (t:ts) ch r = "(and " ++ toSMTPath t ch r ++ toSMTPath ts ch r ++ ")"

instance ToSMT Target where 
    toSMT _ _ _ = ""

    toSMTPath (Go i j) ch r = "(reaches " ++ show i ++ " " ++ show j ++ ")\n(assert (=> (reaches-end " ++ show i ++ ") (reaches " ++ show ch ++ " " ++ show (r + 1) ++ ") ))"
    toSMTPath (ACCEPT) ch r = "(and ACCEPT (not " ++ printSMTFunc2 "reaches" ch (r + 1) ++ "))"
    toSMTPath (DROP) ch r = "(and DROP (not " ++ printSMTFunc2 "reaches" ch (r + 1) ++ "))"
    toSMTPath (ST s) ch r = s
    toSMTPath _ _ _ = error "NOT HERE"


printSMTFunc1 :: (ToString a) => String -> a -> String
printSMTFunc1 s x = "(" ++ s ++ " " ++ toString x ++ ")"

printSMTFunc2 :: (ToString a, ToString b) => String -> a -> b -> String
printSMTFunc2 s x y = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ ")"