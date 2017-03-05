module ParseSpecificationLanguage where

import Data.Char
import Data.IP
import Data.List
import Data.List.Split

import qualified Data.Map as Map  
import Data.Maybe

import ParserHelp
import Types

lexer :: String -> [String]
lexer s
    | all isSpace s = []  
    | 'N':'O':'T':xs <- afterSpaces = "NOT":lexer xs
    | '=':'>':xs <- afterSpaces = "=>":lexer xs
    | '=':xs <- afterSpaces = "=":lexer xs
    | '(':xs <- afterSpaces = "(":lexer xs
    | ')':xs <- afterSpaces = ")":lexer xs
    | ':':xs <- afterSpaces = ":":lexer xs
    | ',':xs <- afterSpaces = ",":lexer xs
    | '#':xs <- afterSpaces = lexer . dropWhile (/= '\n') $ xs
    | length nextTerm >= 1 = nextTerm:lexer afterTerm
    | otherwise = error $ "Unrecognized pattern " ++ s ++ afterTerm
    where
        afterSpaces = dropWhile isSpace s
        (nextTerm, afterTerm) = span ((flip elem) ('.':'-':'_':'/':['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'])) afterSpaces

parse :: [String] -> [ExampleRuleInstruction]
parse s =
    let
        instrCon = map parseInstruction (splitOn [","] s)
        instrCon' = map (\((s, f), i)-> (s, f, i)) (zip instrCon [0..])
    in 
    map (\(x, sCon, l) -> sCon (parseRule x l)) instrCon'--map parseRule (splitOn [","] s)

parseInstruction :: [String] -> ([String], ExampleRule -> ExampleRuleInstruction)
parseInstruction ("acl":c:":":xs) = (xs, ToChainNamed c)
parseInstruction xs = (xs, NoInstruction)

parseRule :: [String] -> Label -> ExampleRule
parseRule s l =
    let
        (c, t) = break ("=>" == ) s
    in
    Rule (parseSpecificationCriteria c) (if not . null $ t then (parseSpecificationTarget $ t !! 1) else NoTarget) l

isConjunction :: String -> Bool
isConjunction s = s `elem` ["AND", "OR"]

toConjunction :: String -> Maybe ([ExampleCriteria] -> ExampleCriteria)
toConjunction "AND" = Just And
toConjunction "OR" = Just Or
toConjunction _ = Nothing

--Returns Nothing if passed an empty list, or the conjunction corresponding
--to "AND" or "OR" at the head of the list, if that exists
--if the list has elements, and the first is not valid, errors
conjunctionAtFront :: [String] -> Maybe ([ExampleCriteria] -> ExampleCriteria)
conjunctionAtFront [] = Nothing
conjunctionAtFront s =  if isConjunction (head s) then 
                            toConjunction (head s)
                        else
                            error ("Invalid: " ++ (head s))

parseSpecificationCriteria :: [String] -> [ExampleCriteria]
parseSpecificationCriteria s
    | [] <- s = []
    | ("(":xs) <-s =
        let
            inParen = parseSpecificationCriteria (findInLeadingParenthesis $ "(":xs)
            after = findAfterLeadingParenthesis $ "(":xs
            conj = conjunctionAtFront after
        in
        if isJust conj then [fromJust conj (inParen ++ (parseSpecificationCriteria $ tail after))] else inParen
    | otherwise =
        let
            (c, xs) = parseSpecificationCriteria' s
            conj = conjunctionAtFront xs
        in
        if isJust conj then [fromJust conj $ c:(parseSpecificationCriteria $ tail xs)] else [c]

parseSpecificationCriteria' :: [String] -> (ExampleCriteria, [String])
parseSpecificationCriteria' s
    | ("NOT":xs) <- s =
        let
            (next, xs') = parseSpecificationCriteria' xs
        in
        (InCNot $ next, xs')
    | ("protocol":"=":p:xs) <- s =
        let
            p' = if isInteger p then (read p :: Int) else error "Invalid protocol"
        in
        (InC $ Protocol p', xs)
    | ("destination_port":"=":dp:xs) <- s =
        let
            p = if isInteger dp then (read dp :: Int) else error "Invalid port"
        in
        (InC $ Port Destination (Left p), xs)
    | ("source_port":"=":dp:xs) <- s = --This is terrible, don't duplicate like this...
        let
            p = if isInteger dp then (read dp :: Int) else error "Invalid port"
        in
        (InC $ Port Source (Left p), xs)
    | ("destination_ip":"=":di:xs) <- s =
        let di' = if '/' `elem` di then di else di ++ "/32" in (InC . (IPAddress Destination) . toIPRange $ di', xs)
    | ("source_ip":"=":di:xs) <- s =
        let di' = if '/' `elem` di then di else di ++ "/32" in (InC . (IPAddress Source) . toIPRange $ di', xs)
    | ("time":"=":t:xs) <- s =
        let
            t' = if isInteger t then (read t :: Int) else error "Invalid time"
        in
        (Ext . Time $ t', xs)
    | (head s) `elem` (Map.keys stringsToFlags) = (InC . fromJust $ Map.lookup (head s) stringsToFlags, tail s)
    | otherwise = (InC . SC $ concat s, [])

parseSpecificationTarget :: String -> Target
parseSpecificationTarget ("DROP") = DROP
parseSpecificationTarget ("ACCEPT") = ACCEPT
parseSpecificationTarget x = error ("Unrecognized target = " ++ show x)

--Given a list of strings beginning with "(", finds all strings up to the matching ")"
findInLeadingParenthesis :: [String] -> [String]
findInLeadingParenthesis ("(":xs) = findInLeadingParenthesis' xs 1
findInLeadingParenthesis s = s

findInLeadingParenthesis' :: [String] -> Int -> [String]
findInLeadingParenthesis' (")":xs) 1 = []
findInLeadingParenthesis' ("(":xs) i = "(":findInLeadingParenthesis' xs (i + 1)
findInLeadingParenthesis' (")":xs) i = ")":findInLeadingParenthesis' xs (i - 1)
findInLeadingParenthesis' (x:xs) i = x:findInLeadingParenthesis' xs i

--Given a list of strings beginning with "(", finds all strings after the matching ")"
findAfterLeadingParenthesis :: [String] -> [String]
findAfterLeadingParenthesis s =
    let
        leading = findInLeadingParenthesis s
    in
    --The 2 accounts for the opening and closing parenthesis
    drop (2 + length leading) s