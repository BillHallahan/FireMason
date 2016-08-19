{-# LANGUAGE FlexibleInstances #-}

module ChainsToSMT2 where

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Data.List
import Data.String.Utils
import Data.String.ToString


import NameIdChain
import ParserHelp
import Types

import SMT


convertChainsCheckSMT :: IdNameChain -> String -> String -> Int -> String -> String
convertChainsCheckSMT n header replacePCR packetNum check = 
    let
        chainlen = (foldl (++) "" $ map (\(i, (_, c)) -> printSMTFunc1 "assert" $ printSMTFunc2 "=" ("(chain-length " ++ show i ++ ")") (length c)) (Map.toList n)) ++
            (foldl (++) "" $ map (\i -> printSMTFunc1 "assert" $ printSMTFunc2 "=" ("(chain-length " ++ show i ++ ")") "0") (filter ((flip notElem) (Map.keys n)) [0..maxId n]))

        chainSetup = foldr (++) "" $ concat ((map (\(i, (_, c)) -> (map (\p -> setupChain p i (length c)) [0, 1])) (Map.toList n)))

        topLevel = foldr (++) "" $ map (\c -> toString (Assert (TopLevelChain c))) (topLevelChains n)
        notTopLevel = foldr (++) "" $ map (\c -> toString (Assert (SMTNot (TopLevelChain c)))) (notTopLevelChains n)

        tlPolicy = foldr (++) "" $ map (\c -> topLevelPolicy 0 c) (topLevelChains n) ++ map (\c -> topLevelPolicy 1 c) (topLevelChains n)
        notTlPolicy = foldr (++) "" $ map (\c -> notTopLevelPolicy 0 c) (notTopLevelChains n) ++ map (\c -> notTopLevelPolicy 1 c) (notTopLevelChains n)

        prereqs = foldr (++) [] $ map toSMTPrereq $ map (\(_, c) -> c) (Map.elems n)
        prereqsString = foldr (\y acc -> y ++ "\n" ++ acc ) "" $ nub prereqs

        path = map (\(i, (_, x)) -> toSMTPath x i 0) (Map.toList n)
        pathString = foldr (\x acc -> x ++ "\n" ++ acc ) "" path

        converted = map (\(i, (_, x)) -> toSMT x i 0) (Map.toList n)
        convertedString = foldr (\x acc -> x ++ "\n" ++ acc ) "" converted

        repPCR = map (\(i, (_, x)) -> replaceAllCombinations replacePCR [("{p}", stringNumList 0 (packetNum - 1)), ("{c}", [show i]), ("{r}", stringNumList 0 (length x))]) (Map.toList n)
        --repPC = replaceAllCombinations replacePC [("{p}", stringNumList 0 (packetNum - 1)), ("{c}", stringNumList 0 (length n - 1))]
    in
    header ++ "\n" ++
    chainlen ++ "\n" ++
    chainSetup ++ "\n" ++
    topLevel ++ "\n" ++
    tlPolicy ++ "\n" ++
    notTlPolicy ++ "\n" ++ 
    (onlyOneTopLevel 0 (topLevelChains n)) ++ (onlyOneTopLevel 1 (topLevelChains n)) ++ "\n" ++
    notTopLevel ++ "\n" ++
    printSMTFunc1 "assert" (printSMTFunc2 "=" "num-of-chains" (maxId n + 1)) ++ "\n" ++
    prereqsString ++ "\n" ++
    pathString ++ "\n" ++
    (foldr (++) "" repPCR) ++ "\n" ++
    --repPC ++ "\n" ++
    convertedString ++
    check ++
    "(check-sat)\n" ++
    "(get-model)"



class ToSMT a where
    toSMTPrereq :: a -> [String]
    toSMT :: a -> Int -> Int -> String  --The two ints identify the chain and rule number, respectively, the chain was called from
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

    toSMT (Rule [] t _) ch r = foldr (++) "" $ map (\p -> toString (Assert (MatchesCriteria p ch r))) [0, 1]
    toSMT (Rule c _ _) ch r =
        foldr (++) "" $ map (\p -> toString (Assert (SMTEq (SMTString(toSMT c ch r)) (MatchesCriteria p ch r)))) [0, 1]
        
    toSMTPath (Rule [] t _) ch r = (toSMTPath t ch r)

    toSMTPath (Rule c [] _) ch r = toString (Assert (SMTEq (RuleTarget ch r) (SMTString "NONE")))--printSMTFunc1 "assert" (printSMTFunc2 "=" (printSMTFunc2 "rule-target" (show ch) (show r)) "NONE")

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

    toSMTPath (Go i j) ch r = (toString (Assert (SMTEq (RuleTarget ch r) (SMTF2 "GO" (SMTInt i) (SMTInt j))))) ++ (reachesMatchesGo 0 ch r i j) ++ (reachesMatchesGo 1 ch r i j) ++ (notMatchesGo 0 ch r i j) ++ (notMatchesGo 1 ch r i j)
    toSMTPath (GoReturn i j) ch r = (toString (Assert (SMTEq (RuleTarget ch r) (SMTF2 "GORETURN" (SMTInt i) (SMTInt j))))) ++ (reachesMatchesGoReturn 0 ch r i j) ++ (reachesMatchesGoReturn 1 ch r i j) ++ (notMatchesGo 0 ch r i j) ++ (notMatchesGo 1 ch r i j)
    toSMTPath (ACCEPT) ch r = (toString (Assert (SMTEq (RuleTarget ch r) (SMTString "ACCEPT")))) ++ (reachesMatchesTerminating 0 ch r "ACCEPT") ++ (reachesMatchesTerminating 1 ch r "ACCEPT")
    toSMTPath (DROP) ch r = (toString (Assert (SMTEq (RuleTarget ch r) (SMTString "DROP")))) ++ (reachesMatchesTerminating 0 ch r "DROP") ++ (reachesMatchesTerminating 1 ch r "DROP")
    toSMTPath (RETURN) ch r = (toString (Assert (SMTEq (RuleTarget ch r) (SMTString "RETURN")))) ++ (reachesMatchesReturn 0 ch r)  ++ (reachesMatchesReturn 1 ch r)
    toSMTPath (PropVariableTarget i b) _ _ = if b then "(v" ++ show i ++ " p)" else printSMTFunc1 "not" ("(v" ++ show i ++ " p)")
    toSMTPath (ST s) ch r = s
    toSMTPath _ _ _ = error "NOT HERE"

    toSMTNotPath (Go i j) ch r = ""
    toSMTNotPath _ _ _ = ""

onlyOneTopLevel :: Int -> [Int] -> String
onlyOneTopLevel _ [] = []
onlyOneTopLevel p (c:cx) = (foldr (++) "" $ map (\c' -> toString (Assert (Implies (Reaches p c 0) (SMTNot (Reaches p c' 0))))) cx) ++ onlyOneTopLevel p cx

topLevelPolicy :: Int -> Int -> String
topLevelPolicy p c = 
    toString
    (Assert
        (Implies (ReachesEnd p c) (SMTEq (TerminatesWith p) (SMTString $ "(policy " ++ show c ++ ")")))
    )

notTopLevelPolicy :: Int -> Int -> String
notTopLevelPolicy p c = 
    toString
    (Assert
        (SMTEq (SMTString $ "(policy " ++ show c ++ ")") (SMTString $ "NONE"))
    )

setupChain :: Int -> Int -> Int -> String
setupChain p c cLen =
    (notOverChainEnd p c cLen) ++ "\n" ++ (reachesEnd p c cLen) ++ "\n" ++ (returnsFrom p c)

notOverChainEnd :: Int -> Int -> Int -> String
notOverChainEnd p c cLen =
    toString
    (Assert
        (SMTNot (Reaches p c (cLen + 1)))
    )

reachesEnd :: Int -> Int -> Int -> String
reachesEnd p c cLen =
    toString
    (Assert
        (SMTEq (Reaches p c cLen) (ReachesEnd p c))
    )

returnsFrom :: Int -> Int -> String
returnsFrom p c =
    toString
    (Assert
        (SMTEq (ReturnsFrom p c) (SMTOr [ReachesReturn p c, ReachesEnd p c]))
    )

reachesNoneTarget :: Int -> Int -> Int -> String
reachesNoneTarget p c r = 
    toString
    (Assert
        (Implies (Reaches p c r) (Reaches p c (r + 1)))
    )

reachesMatchesTerminating :: Int -> Int -> Int -> String -> String
reachesMatchesTerminating p c r s =
    toString 
    (Assert
        (Implies
            (MatchesRule p c r)
            (SMTAnd [SMTNot (Reaches p c (r + 1)), SMTEq (TerminatesWith p) (SMTString s)])
        )
    )

reachesMatchesReturn :: Int -> Int -> Int -> String
reachesMatchesReturn p c r =
    toString
    (Assert
        (Implies
            (MatchesRule p c r)
            (SMTAnd [ReturnsFrom p c, SMTNot (Reaches p c (r + 1))])
        )
    )

reachesMatchesGo :: Int -> Int -> Int -> Int -> Int -> String
reachesMatchesGo p c r goC goR =
    toString
    (Assert
        (Implies
            (MatchesRule p c r)
            (SMTAnd [Reaches p goC goR, SMTEq (ReturnsFrom p goC) (Reaches p c (r + 1))])
        )
    )

reachesMatchesGoReturn :: Int -> Int -> Int -> Int -> Int -> String
reachesMatchesGoReturn p c r goC goR =
    toString
    (Assert
        (Implies
            (MatchesRule p c r)
            (SMTAnd [Reaches p goC goR, SMTNot(Reaches p c (r + 1)), SMTEq (ReturnsFrom p goC) (ReturnsFrom p c)])
        )
    )

notMatchesGo :: Int -> Int -> Int -> Int -> Int -> String
notMatchesGo p c r goC goR =
    toString
    (Assert
        (Implies
            (SMTNot (MatchesRule p c r))
            (SMTNot (Reaches p goC goR))
        )
    )

