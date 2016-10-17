{-# LANGUAGE FlexibleInstances #-}

module InstructionsToIptables (addToIptables, commentOutRules) where

import Data.List
import qualified Data.Map as Map
import Data.Maybe

import ParserHelp
import ConvertIptables

import NameIdChain
import IptablesTypes
import Types

import Debug.Trace


--adds the rules to the iptables specification in the string, based on information from IdNameChain
addToIptables :: [(Rule, String, Int)] -> IdNameChain -> String -> String
addToIptables [] _ s = s
addToIptables ((r, c, i):xs) n s = 
    let
        above = command . fromJust $ find (\l -> fileline l == i) (convertScript' s)
        com = if (fromJust . comChainName $ above) == c then above else Append c
        xs' = increaseLabelsAbove i xs
    in
    addToIptables xs' n (addToStringAtLine ("iptables " ++ convert com n ++ " " ++ convert r n) i s)

commentOutRules :: [(String, Int)] -> String -> String
commentOutRules [] s = s
commentOutRules ((s', i):xs) s = 
    let
        ss = lines s
        (hxs, t:txs) = splitAt (i - 1) ss
        ss' = hxs ++ (('#':t):txs)
        fxs = foldr1 (\x e -> x ++ "\n" ++ e) ss'
    in
    commentOutRules xs fxs


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
    convert [] n = []
    convert (BoolFlag b:xs) n = 
        let
            (b', xs') = convertBoolFlags (BoolFlag b:xs)
        in
        b' ++ convert xs' n
    convert (Not (BoolFlag b):xs) n = 
        let
            (b', xs') = convertBoolFlags (Not (BoolFlag b):xs)
        in
        b' ++ convert xs' n
    convert (IPAddress Destination i:xs) n = "-d " ++ show i ++ " " ++ convert xs n
    convert (IPAddress Source i:xs) n = "-s " ++ show i ++ " " ++ convert xs n
    convert (Limit i r b s:xs) n = "-m limit --limit " ++ show r ++ "/" ++ convertLimitUnits s ++ " --limit-burst " ++ show (b `div` s) ++ " "  ++ convert xs n
    convert (Not c:xs) n = "! " ++ convert [c] n ++ " " ++ convert xs n
    convert (Port Destination (Left x):xs) n = "--dport " ++ show x ++ " " ++ convert xs n
    convert (Port Source (Left x):xs) n = "--sport " ++ show x ++ " " ++ convert xs n
    convert (Port Destination (Right (x, y)):xs) n = "--dport " ++ show x ++ ":" ++ show y ++ " " ++ convert xs n
    convert (Port Source (Right (x, y)):xs) n = "--sport " ++ show x ++ ":" ++ show y ++ " " ++ convert xs n
    convert (Protocol x:xs) n = "-p " ++ show x ++ " " ++ convert xs n
    convert _ _ = "Unrecognized criteria when converting to iptables."

convertLimitUnits :: Int -> String
convertLimitUnits 1 = "second"
convertLimitUnits 60 = "minute"
convertLimitUnits 3600 = "hour"
convertLimitUnits 86400 = "day"
convertLimitUnits _ = error "Invalid units in limit"

convertBoolFlags :: [Criteria] -> (String, [Criteria])
convertBoolFlags xs = 
    let
            (b', xs') = partition (\a -> (ifNotRemoveNot a) `elem` stringsToFlags) xs
            (neg, pos) = partition (isNot) b'
            neg' = map (ifNotRemoveNot) neg
            all = (foldr (++) "" (intersperse "," (map flagsToStrings $ pos ++ neg')))
            mask = if not . null $ pos then (foldr (++) "" (intersperse "," (map flagsToStrings $ pos))) else "NONE"
    in
    ("--tcp-flags " ++ all ++ " " ++ mask ++ " ", xs')

instance ToIptables [Target] where
    convert tx n = foldr (++) "" $ map ((flip convert) n) tx

instance ToIptables Target where
    convert (ACCEPT) n = "-j ACCEPT"
    convert (DROP) n = "-j DROP"
    convert (Go i 0) n = 
        let
            goTo = lookupName n i
        in
        if isJust goTo then "-j " ++ (fromJust (goTo)) else error "Unrecognized chain when converting to iptables."