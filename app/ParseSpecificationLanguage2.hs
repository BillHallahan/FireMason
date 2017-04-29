module ParseSpecificationLanguage2 (parse) where

import Types
import ParserHelp

import Data.Char
import Data.List
import Data.List.Split
import Data.Maybe

parse :: String -> [ExampleRuleInstruction]
parse = parseStatement . lexer

--Splits a string into tokens
lexer :: String -> [String]
lexer s
    | all isSpace s = []
    | 'n':'o':'t':xs <- afterSpaces = "not":lexer xs
    | '(':xs <- afterSpaces = "(":lexer xs
    | '=':'>':xs <- afterSpaces = "=>":lexer xs
    | '=':xs <- afterSpaces = "=":lexer xs
    | ')':',':xs <- afterSpaces = ")":lexer xs
    | ',':xs <- afterSpaces = ",":lexer xs
    | ')':xs <- afterSpaces = ")":lexer xs
    | length nextTerm >= 1 = nextTerm:lexer afterTerm
    | otherwise = error $ "Unrecognized pattern " ++ s
    where
        afterSpaces = dropWhile isSpace s
        (nextTerm, afterTerm) = span ((flip elem) ('.':'-':'_':'/':' ':['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'])) afterSpaces

parseStatement :: [String] -> [ExampleRuleInstruction]
parseStatement s
    | (spec:"(":xs) <- s =
        let (ca, xs') = span ((/=) ")") xs in
        parseRule spec ca:(parseStatement . tail $ xs')
    | (",":xs) <- s = parseStatement xs
    | [] <- s = []
    | otherwise = error ("Unrecognizable statement " ++ concat s)

parseRule :: String -> [String] -> ExampleRuleInstruction
parseRule spec s =
    let
        (n:xs) = s
        (c, a') = span ((/=) "=>") xs
        [_, a] = if length a' == 2 then a' else error ("Can't parse action " ++ show a')
        --n = if length s >= 1 then head s else error ("Not a valid rule in parseRule")
        --(c, a) = if length s >= 1 then span ((/=) "=>") . tail $ s else error ("Not a valid rule in parseRule")
    in
    ToChainNamed {  spec = parseSpec spec
                    , chainName = n
                    , insRule = Rule {criteria = parseCriteria c
                                      , targets = parseTarget a
                                      , label = -1}}

parseSpec :: String -> Spec
parseSpec s
    | "maintain" == s' = Maintain
    | "repair" == s' = Repair 
    | "verify" == s' = Verify
    | otherwise = error ("Unknown spec " ++ s)
    where
        s' = filter (not . isSpace) s

parseCriteria :: [String] -> [ExampleCriteria]
parseCriteria = catMaybes . map parseCriteria' . splitOn ["," :: String] . map (filter (not . isSpace))
    where
        parseCriteria' :: [String] -> Maybe ExampleCriteria
        parseCriteria' ("not":xs) = Just . InCNot =<< parseCriteria' xs
        parseCriteria' ("protocol":"=":p:xs) =
            let
                p' = if isInteger p then (read p :: Int) else error "Invalid protocol"
            in
            Just . InC $ Protocol p'
        parseCriteria' ("destination_port":"=":d:xs) =
            let
                d' = if isInteger d then (read d :: Int) else error "Invalid port"
            in
            Just . InC $ Port Destination (Left d')
        parseCriteria' ("source_port":"=":d:xs) =
            let
                d' = if isInteger d then (read d :: Int) else error "Invalid port"
            in
            Just . InC $ Port Source (Left d')
        parseCriteria' ("destination_ip":"=":di:xs)  =
            let
                di' = if '/' `elem` di then di else di ++ "/32"
            in
            Just . InC . (IPAddress Destination) . toIPRange $ di'
        parseCriteria' ("source_ip":"=":di:xs)  =
            let
                di' = if '/' `elem` di then di else di ++ "/32"
            in
            Just . InC . (IPAddress Source) . toIPRange $ di'
        parseCriteria' [] = Nothing
        parseCriteria' s = error ("Unrecognized criteria " ++ show s ++ ".")

parseTarget :: String -> Target
parseTarget s
    | "ACCEPT" == s' = ACCEPT
    | "DROP" == s' = DROP
    where
        s' = filter (not . isSpace) s