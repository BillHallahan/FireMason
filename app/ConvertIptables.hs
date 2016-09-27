module ConvertIptables where


import Data.Either
import Data.List
import Data.Maybe
import Data.List.Split
import Data.String.Utils
import Data.Char
import Data.IP

import qualified Data.Map as Map

import IptablesTypes
import ConvertIptablesPorts
import ConvertIptablesLimits
import ParserHelp
import Types


convertScript :: String -> Map.Map String FileChain
convertScript coms =
    convertToChains (convertScript' coms) (Map.fromList [("INPUT", []),
                                                         ("OUTPUT", []),
                                                         ("FORWARD", [])])

convertScript' :: String -> [Line]
convertScript' coms =
    let
        noBlanks = filter (\s -> any  (not . isSpace) $ fst s) $ zip (lines coms) [1..] 
        noComments = filter (\s -> not $ "#" `isPrefixOf` (fst s)) noBlanks
        noVariables = subBashVariables noComments [("/sbin/iptables", "iptables")]
        splitWords = map (\(s, i) -> (words s, i)) noVariables
    in
        --The map list is iptables specific... should be adjusted at some point
        convertLines splitWords

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

convertToChains :: [Line] -> Map.Map String FileChain -> Map.Map String FileChain
convertToChains l m
    | [] <- l = m
    | New s <- c = convertToChains ls (Map.insert s [] m)
    | Flush (Just s) <- c = if Map.member s m
                                then convertToChains ls (Map.insert s [] m)
                                else error "HERE!"
    | Append s <- c = convertToChains ls $  Map.adjust (\v -> v ++ [r]) s m
    | Insert s i <- c = 
        let
            ch = case Map.lookup s m of Just c' -> c'
                                        Nothing -> error "Chain to be inserted into not recognized."
            (xs, xs') = splitAt i ch
        in
        convertToChains ls $ Map.insert s (xs ++ r:xs') m
    | otherwise = error "Iptables command not recognized."
    where (Line t c r j):ls = l


convertLines :: [([String], Int)] -> [Line]
convertLines [] = []
convertLines (x:xs) = convertLine x []:convertLines xs


convertLine :: ([String], Int) -> [ModuleFunc] -> Line
convertLine (s, i) fs
    | [] <- s = Line "filter" None (Rule [] [] i) 0
    | "iptables":xs <- s = convertLine (xs, i) fs
    | "-t":t:xs <- s = 
        let
            l = convertLine (xs, i) fs
        in
        Line t (command l) (rule l) i
    | isJust c = let 
                    l = convertLine (xs', i) fs
                 in
                 Line (table l) (fromJust c) (rule l) i
    | isJust ct = let
                    ect = fromJust ct
                    l = convertLine (xs'', i) newFs
                  in Line (table l) (command l) (((mappend) <$> (map (eitherToRule) ect) <*> [rule l]) !! 0) i
    | isNothing ct = let
                        l = convertLine (xs'', i) newFs
                     in Line (table l) (command l) (rule l) i
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

convertCriteriaOrTarget :: [String] -> [ModuleFunc] -> (Maybe [Either FileCriteria Target], [String], Maybe ModuleFunc)
convertCriteriaOrTarget ("-d":d:xs) _ = 
    let d' = if '/' `elem` d then d else d ++ "/32" in (Just [ Left . InC . (IPAddress Destination) . toIPRange $ d'], xs, Nothing)
convertCriteriaOrTarget ("-s":s:xs) _ =
    let s' = if '/' `elem` s then s else s ++ "/32" in(Just [ Left . InC . (IPAddress Source)  . toIPRange $ s'], xs, Nothing)
convertCriteriaOrTarget ("-j":j:xs) _ = case j of "ACCEPT" -> (Just [Right ACCEPT],xs, Nothing)
                                                  "DROP" -> (Just [Right DROP],xs, Nothing)
                                                  "RETURN" -> (Just [Right RETURN],xs, Nothing)
                                                  _ -> (Just [Right $ Jump j], xs, Nothing)
convertCriteriaOrTarget ("-g":g:xs) _ = (Just [Right $ GoTo g], xs, Nothing)
convertCriteriaOrTarget ("-m":m:xs) _ = (Nothing , xs, Map.lookup m moduleFuncsMap)
convertCriteriaOrTarget ("-p":p:xs) _ = 
    let --We need to add commands based on which protocol is being matched
         --but maybe only if multiport not included?
        protocolNum = if isInteger p then Just (read p :: Int) else Map.lookup p protocolToNum
        protocolFunc = (case protocolNum of Nothing -> Nothing
                                            Just x -> Map.lookup x protocolConvertFuncs)
    in
        (Just [Left . InC . Protocol $ (case protocolNum
                                        of Nothing -> error "No protocol known."
                                           Just x -> x)]
                , xs, protocolFunc)


convertCriteriaOrTarget ("!":xs) fs =
    let
        (notted, xss, f) = convertCriteriaOrTarget xs fs
    in
        (Just [Left . InCNot . And . lefts . fromJust $ notted], xss, f)


convertCriteriaOrTarget x fs =
    let
        modParse = case 
                    find (\f -> f x /= (Nothing, x)) fs
                   of Just f -> Just $ f x
                      Nothing -> Nothing
    in
        case modParse of Just (ms, s) -> (ms, s, Nothing)
                         Nothing -> error ("Not parsable." ++ show x)

moduleFuncsMap :: Map.Map String ModuleFunc
moduleFuncsMap = Map.fromList [("limit", convertLimitRule)
                              , ("multiport", convertMultiportRule)]

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