module ConvertIptables where


--Some of this could maybe be considered non iptables specific (applying not to criteria)
--Also, could we add a sperate layer to filter out ors?  So when converting from the firewall, you can
--indiscriminently use and/or, and then our general, second layer would fix it all...

import Data.Either
import Data.List
import Data.Maybe

import qualified Data.Map as Map

import ConvertIptablesPorts
import ParserHelp
import Types


convertLine :: ([String], Int) -> [Command]
convertLine ("iptables":xs, i) = convertLine (xs, i)
convertLine ("-A":chain:xs, i) = map (Append chain) $ convertRule (xs, i) []
convertLine ("-F":chain:_, i) = [Flush $ Just chain]
convertLine ("-F":_, i) = [Flush Nothing]
convertLine ("-I":chain:num:xs, i) | isInteger num = map (Insert chain (read num :: Int)) $ convertRule (xs, i) []
                                   | otherwise = map (Insert chain 0) $ convertRule (num:xs, i) []
convertLine ("-N":chain:_, i) = [New chain]
convertLine (x:xs, i) = convertLine (xs, i)
convertLine(_, i) = [Append "S" $ Rule [] [] i]

convertRule :: ([String], Int) -> [ModuleFunc] -> [Rule]
convertRule ([], i) _ = [Rule [] [] i]
convertRule (x, i) fs =
    case convertCriteriaOrTarget x fs
        of (Just ect, xs, Just f) -> (mappend) <$> (map eitherToRule ect) <*> convertRule(xs, i) (f:fs)
           (Just ect, xs, Nothing) -> (mappend) <$> (map eitherToRule ect) <*> convertRule(xs, i) (fs)
           (Nothing, xs, Just f) -> convertRule(xs, i) (f:fs)
           _ -> error "Not parsable."


convertCriteriaOrTarget :: [String] -> [ModuleFunc] -> (Maybe [Either Criteria Target], [String], Maybe ModuleFunc)
convertCriteriaOrTarget ("-j":j:xs) _ = case j of "ACCEPT" -> (Just [Right ACCEPT],xs, Nothing)
                                                  "DROP" -> (Just [Right DROP],xs, Nothing)
                                                  _ -> (Just [Right $ Jump j], xs, Nothing)
convertCriteriaOrTarget ("-m":m:xs) _ = (Nothing , xs, Just $ convertMultiportRule)
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
        nottedCrit = lefts . fromJust $ notted
        inv = invertAndsOrs nottedCrit
    in
        (Just $ map (\x -> Left x) (notCriteria inv), xss, f)



convertCriteriaOrTarget x fs =
    let
        modParse = case 
                    find (\f -> f x /= (Nothing, x)) fs
                   of Just f -> Just $ f x
                      Nothing -> Nothing
    in
        case modParse of Just (ms, s) -> (ms, s, Nothing)
                         Nothing -> error ("Not parsable." ++ show x)


notCriteria :: [Criteria] -> [Criteria]
notCriteria (And c:cs) = And (map (Not) c):notCriteria cs
notCriteria (c:cs) = Not c:notCriteria cs
notCriteria [] = []


--Needs testing, may not be entirely accurate?
invertAndsOrs :: [Criteria] -> [Criteria]
invertAndsOrs [] = []
invertAndsOrs (And c:cs) = c ++ invertAndsOrs cs
invertAndsOrs (c) =
    let
        firstAnd = (\c' -> case c' of And c' -> False
                                      _ -> True)
        ored = takeWhile firstAnd c
        afterOred = dropWhile firstAnd c
    in
    [And ored] ++ invertAndsOrs afterOred

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