module ParserHelp where

import Data.Char
import Data.List
import Data.List.Split

splitNonconsuming :: String -> String -> [String]
splitNonconsuming on s = intersperse on $ splitOn on s

isInteger :: String -> Bool
isInteger "" = False
isInteger s = all isDigit s