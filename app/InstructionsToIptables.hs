{-# LANGUAGE FlexibleInstances #-}

module InstructionsToIptables where

import Data.List
import qualified Data.Map as Map
import Data.Maybe

import ParserHelp
import ConvertIptables

import NameIdChain
import IptablesTypes
import Types

--adds the rules to the iptables specification in the string, based on names from IdNameChain
addToIptables :: [(Rule, String, Int)] -> IdNameChain -> String -> String
addToIptables [] _ s = s
addToIptables ((r, c, i):xs) n s = 
    let
        com = command . fromJust $ find (\l -> fileline l == i) (convertScript' s)
        xs' = increaseLabelsAbove i xs
    in
    addToIptables xs' n (addToStringAtLine ("iptables " ++ convert com n ++ " " ++ convert r n) i s)


addToStringAtLine :: String -> Int -> String -> String
addToStringAtLine s i s' =
    let
        (x, xs) = splitAt (i - 1) (lines s')
        s'' = x ++ s:xs
    in
    foldr (\e x' -> e ++ "\n" ++ x') "" s''

increaseLabelsAbove :: Int -> [(Rule, String, Int)] -> [(Rule, String, Int)]
increaseLabelsAbove _ [] = []
increaseLabelsAbove i ((r, s, i'):xs) = (if i' >= i then (r, s, i' + 1) else (r, s , i')):increaseLabelsAbove i xs

class ToIptables a where
    convert :: a -> IdNameChain -> String

instance ToIptables Command where
    convert (Append s) n = "-A " ++ s
    convert (Insert s i) n = "-I " ++ s ++ " " ++ show i


instance ToIptables Rule where
    convert (Rule c t _) n = convert c n ++ convert t n


instance ToIptables [Criteria] where
    convert cx n = foldr (\x e -> x ++ " " ++ e) "" $ map ((flip convert) n) cx


instance ToIptables Criteria where
    convert (Not c) n = "! " ++ convert c n
    convert (Port Destination (Left x)) n = "--dport " ++ show x
    convert (Port Source (Left x)) n = "--sport " ++ show x
    convert (Port Destination (Right (x, y))) n = "--dport " ++ show x ++ ":" ++ show y
    convert (Port Source (Right (x, y))) n = "--sport " ++ show x ++ ":" ++ show y
    convert (Protocol x) n = "-p " ++ show x

instance ToIptables [Target] where
    convert tx n = foldr (++) "" $ map ((flip convert) n) tx

instance ToIptables Target where
    convert (ACCEPT) n = "-j ACCEPT"
    convert (DROP) n = "-j DROP"
    convert (Go i 0) n = "-j " ++ (fst (fromJust (Map.lookup i n)))