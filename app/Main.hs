module Main where

import System.IO
import System.Environment
import Data.List
import Data.Maybe

import qualified Data.Map as Map

import Types
import ConvertIptables
import ChainsToSMT2
import ConvertToHorn
import InstructionsToIptables
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
        
        let smt = convertChainsCheckSMT pathSimp firewallPredicates "(assert (reaches 0 0 0)) (assert (= num-of-packets 1)) (assert (reaches 0 1 4)) (assert (matches-rule 0 0 1) )"

        putStrLn smt

        (reshout, _) <- callSMTSolver "temp.smt2" smt
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


        let rulesToAdd = (flip inputInstructionsToInstructions 0) . parse . lexer $
                             ("chain INPUT : (destination_port = 78)     => DROP," ++
                              "chain OUTPUT: not protocol = 4  => DROP," ++
                              "chain INPUT :(protocol = 1 AND destination_port = 45 AND not source_port = 90) => ACCEPT," ++
                              "chain INPUT : (destination_port = 4)     => ACCEPT," ++
                              "chain INPUT : (destination_port = 89)     => ACCEPT," ++
                              "chain bad-ports : source_port = 10 => ACCEPT," ++
                              "chain second : destination_port = 100 => ACCEPT")

        putStrLn $ "rulesToAdd = " ++ foldr (\x elm -> show x ++"\n" ++ elm) "" rulesToAdd

        --added <- addRules rulesToAdd pathSimp
        --putStrLn $ "added =\n" ++ foldr (\x e -> x ++ "\n" ++ e) "" (concat (map (\(i, (n, x)) -> (n ++ " " ++ show i):(map (show) x)) (Map.toList added)))

        addedPos <- instructionsToAddAtPos rulesToAdd pathSimp
        putStrLn $ "addedAtPos = " ++ show addedPos

        let iptablesCon = map (((flip convert) pathSimp) . insRule) rulesToAdd

        putStrLn $ foldr (\x e -> show x ++ "\n" ++ e) "" iptablesCon


        let addedToIp = addToIptables addedPos pathSimp contents
        putStrLn addedToIp

        --putStrLn $ "eliminateAndsNots = " ++  foldl (\acc s -> acc ++ show s ++ "\n") "" (inputChainToChain parse1 0)
        --putStrLn $ "eliminateAndsOrsFromChain = " ++ foldr (\x elm -> show x ++"\n" ++ elm) ""  (eliminateAndsOrsFromChain parse1 0)
        )

        --putStrLn $ foldl (++) "" (map (flip (convertChain) 0) v))
