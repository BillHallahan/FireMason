module ConvertIptablesLimits (convertLimitRule) where

import Data.Char
import Data.List
import Data.Maybe

import IptablesTypes
import Types

convertLimitRule :: ModuleFunc
convertLimitRule xs =
    let
        (r, b, xs') = convertLimitRule' xs
        r' = if isJust r then fromJust r else 3 * 60 * 60
        b' = if isJust b then fromJust b else 5
    in
    if isJust r || isJust b then (Just [Left . Ext . InCLimit r' $ b'], xs') else (Nothing, xs')

convertLimitRule' :: [String] -> (Maybe Int, Maybe Int, [String])
convertLimitRule' [] = (Nothing, Nothing, [])
convertLimitRule' ("--limit":r:xs) = 
    let
        (_, j, xs') = convertLimitRule' xs
        (r', u) = span (isDigit) r
        u' = case u of "/second" -> 1
                       "/minute" -> 60
                       "/hour" -> 60 * 60
                       "/day" -> 60 * 60 * 24 
    in
    (Just ((read r' :: Int) * u'), j, xs')
convertLimitRule' ("--limit-burst":b:xs) =
    let
        (i, _, xs') = convertLimitRule' xs
    in
    (i, Just (read b :: Int), xs')
convertLimitRule' (x:xs) = 
    let
        (i, j, xs') = convertLimitRule' xs
    in
    (i, j, x:xs')