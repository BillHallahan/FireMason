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
import ConvertCommandsToChains
import ChainsToSMT
import EliminateAndsOrs



import ChainPathSimplification--temp

main = do
    args <- getArgs
    let fileName = head args
    withFile fileName ReadMode (\handle -> do
        contents <- hGetContents handle
        let converted' = Map.toList . convertScript $ contents
        let converted = Map.fromList $ eliminateAndsOrsFromStringChains converted' 0 
        let k = Map.keys converted
        let v = Map.elems converted
        let listToS = foldl (\acc s -> acc ++ show s ++ "\n") ""
        let toS = \k' -> k' ++ " = " ++ (listToS (fromJust $ Map.lookup k' converted))
        let kToRules = map toS k
        let pathSimp = pathSimplification converted

        putStrLn $ foldl (\acc s -> acc ++ s ++ "\n") "" kToRules
        putStrLn $ convertChains pathSimp--convertMapOfChains converted


        
        let testNice = map (\x -> show x) pathSimp
        let folded = foldr (\x acc-> x ++ "\n" ++ acc) "" testNice
        putStrLn folded)

        --putStrLn $ foldl (++) "" (map (flip (convertChain) 0) v))
        
convertScript :: String -> Map.Map String Chain
convertScript coms =
    let
        noBlanks = filter (\s -> any  (not . isSpace) $ fst s) $ zip (lines coms) [1..] 
        noComments = filter (\s -> not $ "#" `isPrefixOf` (fst s)) noBlanks
        noVariables = subBashVariables noComments [("/sbin/iptables", "iptables")]
        splitWords = map (\(s, i) -> (words s, i)) noVariables
    in
        --The map list is iptables specific... should be adjusted at some point
        convertToChains (concat $ map convertLine splitWords) (Map.fromList [("INPUT", []),
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