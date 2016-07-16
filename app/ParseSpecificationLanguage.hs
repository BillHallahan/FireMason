module ParseSpecificationLanguage where

import Data.Char

import ParserHelp
import Types

parseSpecificationLanguage :: String -> [Rule]
parseSpecificationLanguage s = 
    let
        splitWords = words $ s
        splitEquals = concat $ map (splitNonconsuming "=") splitWords
        noWhitespace = filter ("" /=) splitEquals
    in
    parseSpecificationLanguage' noWhitespace

parseSpecificationLanguage' :: [String] -> [Rule]
parseSpecificationLanguage' [] =[]
parseSpecificationLanguage' s =
    let
        (r, xs) = parseSpecificationCriteria s
    in
    --error $ show s
    [r]

parseSpecificationCriteria :: [String] -> (Rule, [String])
parseSpecificationCriteria [] = (mempty Rule, [])
parseSpecificationCriteria ("destination_port":"=":dp:xs) =
    let
        p = if isInteger dp then (read dp :: Int) else error "Invalid port"
        (r, xss) = parseAfterCriteria xs
    in
    (Rule [Port "destination" (Left p)] [] (-1) `mappend` r, xss)
parseSpecificationCriteria x = (mempty, x)

parseAfterCriteria :: [String] -> (Rule, [String]) 
parseAfterCriteria [] = (mempty, [])
parseAfterCriteria ("AND":xs) = parseSpecificationCriteria xs
parseAfterCriteria ("=":">":xs) = parseSpecificationTarget xs
parseAfterCriteria (x:xs) = error ("Unrecognized symbol " ++ x ++ "  " ++ show xs)

parseSpecificationTarget :: [String] -> (Rule, [String])
parseSpecificationTarget [] = (mempty, [])
parseSpecificationTarget ("DROP":xs) = 
    let
        (r, xss) = parseAfterCriteria xs
    in
    (Rule [] [DROP] (-1) `mappend` r, xss)

parseAfterTarget :: [String] -> (Rule, [String]) 
parseAfterTarget ("AND":xs) = parseSpecificationTarget xs
parseAfterTarget (",":xs) = (mempty, xs)
parseAfterTarget (x:xs) = error ("Unrecognized symbol " ++ x ++ "  " ++ show xs)