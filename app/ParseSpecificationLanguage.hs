module ParseSpecificationLanguage where

import Data.Char
import Data.List
import Data.List.Split

import Data.Maybe

import ParserHelp
import Types

lexer :: String -> [String]
lexer s
    | s == "" = []  
    | 'n':'o':'t':xs <- afterSpaces = "not":lexer xs
    | '=':'>':xs <- afterSpaces = "=>":lexer xs
    | '=':xs <- afterSpaces = "=":lexer xs
    | '(':xs <- afterSpaces = "(":lexer xs
    | ')':xs <- afterSpaces = ")":lexer xs
    | ',':xs <- afterSpaces = ",":lexer xs
    | length nextTerm >= 1 = nextTerm:lexer afterTerm
    | otherwise = error $ "Unrecognized pattern " ++ afterTerm
    where
        afterSpaces = dropWhile isSpace s
        (nextTerm, afterTerm) = span ((flip elem) ('_':['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'])) afterSpaces

parse :: [String] -> [InputRule]
parse s = map parseRule (splitOn [","] s)

parseRule :: [String] -> InputRule
parseRule s =
    let
        (c, t) = break ("=>" == ) s
    in
    Rule (parseSpecificationCriteria c) (if not . null $ t then parseSpecificationTarget $ tail t else []) 0

isConjunction :: String -> Bool
isConjunction s = s `elem` ["AND", "OR"]

toConjunction :: String -> Maybe ([InputCriteria] -> InputCriteria)
toConjunction "AND" = Just And
toConjunction "OR" = Just Or
toConjunction _ = Nothing

--Returns Nothing if passed an empty list, or the conjunction corresponding
--to "AND" or "OR" at the head of the list, if that exists
--if the list has elements, and the first is not valid, errors
conjunctionAtFront :: [String] -> Maybe ([InputCriteria] -> InputCriteria)
conjunctionAtFront [] = Nothing
conjunctionAtFront s =  if isConjunction (head s) then 
                            toConjunction (head s)
                        else
                            error ("Invalid: " ++ (head s))

parseSpecificationCriteria :: [String] -> [InputCriteria]
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

parseSpecificationCriteria' :: [String] -> (InputCriteria, [String])
parseSpecificationCriteria' s
    | ("not":xs) <- s =
        let
            (next, xs') = parseSpecificationCriteria' xs
        in
        (InCNot next, xs')
    | ("protocol":"=":p:xs) <- s =
        let
            p' = if isInteger p then (read p :: Int) else error "Invalid protocol"
        in
        (InC $ Protocol p', xs)
    | ("destination_port":"=":dp:xs) <- s =
        let
            p = if isInteger dp then (read dp :: Int) else error "Invalid port"
        in
        (InC $ Port "destination" (Left p), xs)
    | ("source_port":"=":dp:xs) <- s = --This is terrible, don't duplicate like this...
        let
            p = if isInteger dp then (read dp :: Int) else error "Invalid port"
        in
        (InC $ Port "source" (Left p), xs)
    | otherwise = (InC . SC $ concat s, [])

parseSpecificationTarget :: [String] -> [Target]
parseSpecificationTarget ("DROP":[]) = [DROP]
parseSpecificationTarget ("ACCEPT":[]) = [ACCEPT]

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