module ConvertIptablesPorts where

import ParserHelp
import Types


--each module has one function tied to it
--Currently, there may be a glitch if convertTCPRule or convertUDPRule has priority over convertMultiportRule

convertTCPRule :: ModuleFunc
convertTCPRule ("--sport":sps:xs) = convertPortRuleNoCommas "source" sps xs ("--sport":sps:xs)
convertTCPRule ("--dport":dps:xs) = convertPortRuleNoCommas "destination" dps xs ("--dport":dps:xs)
convertTCPRule xs = (Nothing, xs)

convertUDPRule :: ModuleFunc
convertUDPRule ("--sport":sps:xs) = convertPortRuleNoCommas "source" sps xs ("--sport":sps:xs)
convertUDPRule ("--dport":dps:xs) = convertPortRuleNoCommas "destination" dps xs ("--dport":dps:xs)
convertUDPRule xs = (Nothing, xs)

--this will convert a port range, but will return nothing if it is a list of ports
--this is to prevent conflicts between the rules for tcp and udp, and the rule 
--for -m multiport
convertPortRuleNoCommas :: String -> String -> [String] -> [String] -> (Maybe [Either InputCriteria Target], [String])
convertPortRuleNoCommas name p xs xss = if filter (','==) p == "" then (Just [Left $ portCriteriaFromRangeString p name], xs) else (Nothing, xss)

convertMultiportRule :: ModuleFunc
convertMultiportRule ("--sport":sps:xs) = (Just $ [Left $ Or (portCriteriaFromNumsRangesString sps "source")], xs)
convertMultiportRule ("--dport":dps:xs) = (Just $ [Left $ Or (portCriteriaFromNumsRangesString dps "destination")], xs)
convertMultiportRule ("--port":ps:xs) = (Just $ [Left $ Or (portCriteriaFromNumsRangesString ps "source" ++ portCriteriaFromNumsRangesString ps "destination")], xs)
convertMultiportRule xs = (Nothing, xs)

portCriteriaFromRangeString :: String -> String -> InputCriteria
portCriteriaFromRangeString ps portName = InC . Port portName $ convertNumRange . splitNonconsuming ":" $ ps

portCriteriaFromNumsRangesString :: String -> String -> [InputCriteria]
portCriteriaFromNumsRangesString ps portName =
    let
        ports = convertNumsRangesString $ ps
    in
    foldr (\r acc -> [InC $ Port portName r] ++ acc) [] ports


--These are all more generally, eventually need to be in a seperate module
convertNumsRangesString :: String -> [Either Int (Int, Int)]
convertNumsRangesString nrs =
    let
        splitCommas = splitNonconsuming "," nrs
        splitColons = concat $ map (splitNonconsuming ":") splitCommas
    in
    convertNumRangesList splitColons

convertNumRangesList :: [String] -> [Either Int (Int, Int)]
convertNumRangesList (",":xs) = convertNumRangesList xs
convertNumRangesList (x:":":y:xs) = convertNumRange (x:":":[y]):convertNumRangesList xs
convertNumRangesList (x:xs)  = convertNumRange (x:[]):convertNumRangesList xs
convertNumRangesList _ = []

convertNumRange :: [String] -> Either Int (Int, Int)
convertNumRange (x:":":[y])
    | isInteger x && isInteger y = Right (read x :: Int, read y :: Int)
    | isInteger x = Right (read x :: Int, 65535)
    | isInteger y = Right (0, read y :: Int)
    | otherwise = error ("Invalid 1" ++ (show $ x:":":y:[]))
convertNumRange (x:[])
    | isInteger x = Left (read x :: Int)
    | otherwise = error "Invalid 3"
convertNumRange _ = Right (0, 65535)