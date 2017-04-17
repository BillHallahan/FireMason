module ConvertIptablesLimits (convertLimitRule) where

import Data.Char
import Data.List
import Data.Maybe

import IptablesTypes
import Types

convertLimitRule :: ModuleFunc
convertLimitRule xs =
    let
        (r, b, s, xs') = convertLimitRule' xs
        r' = if isJust r then fromJust r else 3 * 60 * 60
        b' = (if isJust b then fromJust b else 5) * s'
        s' = if isJust s then fromJust s else 1
    in
    if isJust r || isJust b then (Just [Left . Ext . InCLimit r' b' $ s'], xs') else (Nothing, xs')

convertLimitRule' :: [String] -> (Maybe Int, Maybe Int, Maybe Int, [String])
convertLimitRule' [] = (Nothing, Nothing, Nothing, [])
convertLimitRule' ("--limit":r:xs) = 
    let
        (_, b, s, xs') = convertLimitRule' xs
        (r', u) = span (isDigit) r
        u' = case u of "/second" -> 1
                       "/minute" -> 60
                       "/hour" -> 60 * 60
                       "/day" -> 60 * 60 * 24 
    in
    (Just (read r' :: Int), b, Just u', xs')
convertLimitRule' ("--limit-burst":b:xs) =
    let
        (i, _, s, xs') = convertLimitRule' xs
    in
    (i, Just (read b :: Int), s, xs')
convertLimitRule' (x:xs) = 
    let
        (i, b, s, xs') = convertLimitRule' xs
    in
    (i, b, s, x:xs')