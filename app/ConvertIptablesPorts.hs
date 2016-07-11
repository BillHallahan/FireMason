module ConvertIptablesPorts where

import ParserHelp
import Types


--each module has one function tied to it
--Currently, there may be a glitch if convertTCPRule or convertUDPRule has priority over convertMultiportRule

convertTCPRule :: ModuleFunc
convertTCPRule ("--sport":sps:xs) = (Just $ portCriteriaFromRangeString sps "source", xs)
convertTCPRule ("--dport":dps:xs) = (Just $ portCriteriaFromRangeString dps "destination", xs)
convertTCPRule xs = (Nothing, xs)

convertUDPRule :: ModuleFunc
convertUDPRule ("--sport":sps:xs) = (Just $ portCriteriaFromRangeString sps "source", xs)
convertUDPRule ("--dport":dps:xs) = (Just $ portCriteriaFromRangeString dps "destination", xs)
convertUDPRule xs = (Nothing, xs)

convertMultiportRule :: ModuleFunc
convertMultiportRule ("--sport":sps:xs) = (Just $ portCriteriaFromNumsRangesString sps "source", xs)
convertMultiportRule ("--dport":dps:xs) = (Just $ (portCriteriaFromNumsRangesString dps "destination"), xs)
convertMultiportRule ("--port":ps:xs) = (Just $ portCriteriaFromNumsRangesString ps "source" ++ portCriteriaFromNumsRangesString ps "destination", xs)
convertMultiportRule xs = (Nothing, xs)




portCriteriaFromRangeString :: String -> String -> [Either Criteria Target]
portCriteriaFromRangeString ps portName = [Left $ Port portName $ convertNumRange . splitNonconsuming ":" $ ps]

portCriteriaFromNumsRangesString :: String -> String -> [Either Criteria Target]
portCriteriaFromNumsRangesString ps portName =
    let
        ports = convertNumsRangesString $ ps
    in
    foldr (\r acc -> [Left $ Port portName r] ++ acc) [] ports


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