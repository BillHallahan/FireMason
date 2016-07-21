module ConvertIptables where


import Data.Either
import Data.List
import Data.Maybe

import qualified Data.Map as Map

import IptablesTypes
import ConvertIptablesPorts
import ParserHelp
import Types

convertLine :: ([String], Int) -> [ModuleFunc] -> Line
convertLine (s, i) fs
    | [] <- s = Line "filter" None mempty
    | "iptables":xs <- s = convertLine (xs, i) fs
    | "-t":t:xs <- s = 
        let
            l = convertLine (xs, i) fs
        in
        Line t (command l) (rule l)
    | isJust c = let 
                    l = convertLine (xs', i) fs
                 in
                 Line (table l) (fromJust c) (rule l)
    | isJust ct = let
                    ect = fromJust ct
                    l = convertLine (xs'', i) newFs
                  in Line (table l) (command l) (((mappend) <$> (map (flip eitherToRule $ i) ect) <*> [rule l]) !! 0)
    | isNothing ct = let
                        l = convertLine (xs'', i) newFs
                  in Line (table l) (command l) (rule l)
    where (c, xs') = convertCommand (s, i)
          (ct, xs'', f) = convertCriteriaOrTarget s fs
          newFs = if isJust f then (fromJust f):fs else fs

convertCommand :: ([String], Int) -> (Maybe Command, [String])
convertCommand ("-A":chain:xs, i) = (Just $ Append chain, xs)
convertCommand ("-F":chain:xs, i) = (Just . Flush $ Just chain , xs)
convertCommand ("-F":xs, i) = (Just . Flush $ Nothing , xs)
convertCommand ("-I":chain:num:xs, i) | isInteger num = (Just $ Insert chain (read num :: Int), xs)
                                   | otherwise = (Just $ Insert chain 0, num:xs)
convertCommand ("-N":chain:xs, i) = (Just . New $ chain , xs)
convertCommand (xs, _) = (Nothing, xs)

convertCriteriaOrTarget :: [String] -> [ModuleFunc] -> (Maybe [Either Criteria Target], [String], Maybe ModuleFunc)
convertCriteriaOrTarget ("-j":j:xs) _ = case j of "ACCEPT" -> (Just [Right ACCEPT],xs, Nothing)
                                                  "DROP" -> (Just [Right DROP],xs, Nothing)
                                                  _ -> (Just [Right $ Jump j], xs, Nothing)
convertCriteriaOrTarget ("-m":m:xs) _ = (Nothing , xs, Just $ convertMultiportRule)--Obviously this will eventually be adjusted when we have more modules...
convertCriteriaOrTarget ("-p":p:xs) _ = 
    let --We need to add commands based on which protocol is being matched
         --but maybe only if multiport not included?
        protocolNum = if isInteger p then Just (read p :: Int) else Map.lookup p protocolToNum
        protocolFunc = (case protocolNum of Nothing -> Nothing
                                            Just x -> Map.lookup x protocolConvertFuncs)
    in
        (Just [Left $ Protocol (case protocolNum
                                    of Nothing -> error "No protocol known."
                                       Just x -> x)]
                , xs, protocolFunc)


convertCriteriaOrTarget ("!":xs) fs =
    let
        (notted, xss, f) = convertCriteriaOrTarget xs fs
    in
        (Just [Left . Not . And . lefts . fromJust $ notted], xss, f)


convertCriteriaOrTarget x fs =
    let
        modParse = case 
                    find (\f -> f x /= (Nothing, x)) fs
                   of Just f -> Just $ f x
                      Nothing -> Nothing
    in
        case modParse of Just (ms, s) -> (ms, s, Nothing)
                         Nothing -> error ("Not parsable." ++ show x)


--notCriteria :: [Criteria] -> [Criteria]
--notCriteria (And c:cs) = And (map (Not) c):notCriteria cs
--notCriteria (c:cs) = Not c:notCriteria cs
--notCriteria [] = []


----THIS NEEDS TO GO, AND WE CAN JUST COUNT ON ConvertToHorn.hs later...
--invertAndsOrs :: [Criteria] -> [Criteria]
--invertAndsOrs [] = []
--invertAndsOrs (And c:cs) = (Or $ invertAndsOrs c):invertAndsOrs cs
--invertAndsOrs (Or c:cs) = (And $ invertAndsOrs c):invertAndsOrs cs
--invertAndsOrs (c) =
--    let
--        firstAnd = (\c' -> case c' of And c' -> False
--                                      _ -> True)
--        (ored, afterOred)= span firstAnd c
--    in
--    ored ++ invertAndsOrs afterOred

protocolToNum :: Map.Map String Int
protocolToNum = Map.fromList $ 
                               [("tcp", 6)
                               ,("udp", 17)
                               ,("udplite", 136)
                               ,("icmp", 1)
                               ,("icmpv6", 58)
                               ,("esp", 50)
                               ,("ah", 51)
                               ,("sctp", 132)
                               ,("all", -1)]

protocolConvertFuncs :: Map.Map Int ModuleFunc
protocolConvertFuncs = Map.fromList $ 
                            [(6, convertTCPRule)
                            ,(17, convertUDPRule)]