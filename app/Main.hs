module Main where

import System.IO
import System.Environment
import Data.List
import Data.String.Utils
import Data.List.Split
import Data.Char
import Data.Maybe

import qualified Data.Map as Map

import Types
import ConvertIptables
import ChainsToSMT2
import ConvertToHorn
import ParseSpecificationLanguage
import RuleAdding
import SMT

import IptablesTypes


import NameIdChain--temp

main = do

    --Gets the prewritten smt describing firewall behavior
    firewallPredicates <- readFile "smt/firewallPredicates.smt2"
    
    args <- getArgs
    let fileName = head args
    withFile fileName ReadMode (\handle -> do

        contents <- hGetContents handle

        let specTest2 = lexer ("(destination_port = 78) OR (source_port = 78 AND destination_port = 79)    => DROP," ++
                              "(not protocol = 4 OR destination_port = 6) AND (source_port=89) => DROP," ++
                              "(protocol = 1 AND destination_port = 45 AND not source_port = 90) OR (protocol = 8 AND destination_port = 9) => ACCEPT," ++
                              "not protocol = 3 => ACCEPT")
        putStrLn $ show specTest2
        let parsed = parse specTest2
        putStrLn $ foldr (\x elm -> show x ++"\n" ++ elm) "" parsed

        --let inputR = inputChainToChain parsed 0
        --putStrLn $ foldr (\x elm -> show x ++"\n" ++ elm) "" inputR
        let converted' = Map.toList . convertScript $ contents
        let converted = Map.fromList $ stringInputChainsToStringChains converted' 0 
        let k = Map.keys converted
        let v = Map.elems converted
        let listToS = foldl (\acc s -> acc ++ show s ++ "\n") ""
        let toS = \k' -> k' ++ " = " ++ (listToS (fromJust $ Map.lookup k' converted))
        let kToRules = map toS k
        let pathSimp = pathSimplification converted

        putStrLn $ foldl (\acc s -> acc ++ s ++ "\n") "" kToRules
        putStrLn $ convertChainsCheckSMT pathSimp firewallPredicates "(assert (reaches 0 0))(assert (matches-rule 3 8))"

        reshout <- callSMTSolver "temp.smt2" (convertChainsCheckSMT pathSimp firewallPredicates "(assert (matches-rule 3 8))")
        putStrLn reshout

        let testNice = map (\x -> show x) (Map.toList pathSimp)
        let folded = foldr (\x acc-> x ++ "\n" ++ acc) "" testNice
        putStrLn folded
        let specTest2 = lexer ("chain INPUT : (destination_port = 78) OR (source_port = 78 AND destination_port = 79)    => DROP," ++
                              "chain OUTPUT:(not protocol = 4 OR destination_port = 6) AND (source_port=89) => DROP," ++
                              "chain INPUT :(protocol = 1 AND destination_port = 45 AND not source_port = 90) OR (protocol = 8 AND destination_port = 9) => ACCEPT")
        putStrLn $ show specTest2
        putStrLn $ show (parse specTest2)

        let elim = inputInstructionsToInstructions (parse specTest2) 0
        putStrLn $ "(destination_port = 78) OR (source_port = 78 AND destination_port = 79)    => DROP,\n" ++
                              "(not protocol = 4 OR destination_port = 6) AND (source_port=89) => DROP,\n" ++
                              "(protocol = 1 AND destination_port = 45 AND not source_port = 90) OR (protocol = 8 AND destination_port = 9) => ACCEPT\n"
        putStrLn $ foldr (\x elm -> show x ++"\n" ++ elm) "" elim


        let parse1 = parse . lexer $ "(protocol = 1 AND (destination_port = 2 OR destination_port = 3 OR destination_port = 4 OR destination_port = 5) AND not source_port = 6) OR (protocol = 7 AND destination_port = 8) => ACCEPT"
        putStrLn $ "\n\ninitial = " ++ show parse1 ++ "\n\n"


        let added = addRules elim pathSimp
        putStrLn $ "added = " ++ show added
        --putStrLn $ "eliminateAndsNots = " ++  foldl (\acc s -> acc ++ show s ++ "\n") "" (inputChainToChain parse1 0)
        --putStrLn $ "eliminateAndsOrsFromChain = " ++ foldr (\x elm -> show x ++"\n" ++ elm) ""  (eliminateAndsOrsFromChain parse1 0)
        )

        --putStrLn $ foldl (++) "" (map (flip (convertChain) 0) v))

convertScript :: String -> Map.Map String InputChain
convertScript coms =
    let
        noBlanks = filter (\s -> any  (not . isSpace) $ fst s) $ zip (lines coms) [1..] 
        noComments = filter (\s -> not $ "#" `isPrefixOf` (fst s)) noBlanks
        noVariables = subBashVariables noComments [("/sbin/iptables", "iptables")]
        splitWords = map (\(s, i) -> (words s, i)) noVariables
    in
        --The map list is iptables specific... should be adjusted at some point
        convertToChains (convertLines splitWords) (Map.fromList [("INPUT", []),
                                                                                  ("OUTPUT", []),
                                                                                  ("FORWARD", [])])

--this only partially finds and substitutes for bash constants, but it's sufficient for
--our current example scripts
subBashVariables :: [(String, Int)] -> [(String, String)] -> [(String, Int)]
subBashVariables [] m = []
subBashVariables ((s, i):xsi) m
    | "=" `isInfixOf` s =
        let
            spl = splitOn "=" s
        in
            subBashVariables xsi (m ++ [("$" ++ spl  !! 0, spl !! 1)])
    | otherwise = 
        let
            rep = foldr (\(old, new) acc -> replace old new acc) s m
        in
        (rep, i):subBashVariables xsi m
