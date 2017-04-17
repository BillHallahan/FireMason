module ConvertIptablesSets (convertSetRule) where

import Data.Char
import Data.List
import Data.Maybe

import IptablesTypes
import Types

convertSetRule :: ModuleFunc
convertSetRule xs =
    let
        (name, set, mask, rcheck, update, remove, seconds, hitcount, xs') = convertSetRule' xs
        name' = if isJust name then fromJust name else ""
        mask' = if isJust mask then fromJust mask else 32
        seconds' = if isJust seconds then fromJust seconds else 0
        hitcount' = if isJust hitcount then fromJust hitcount else 0
        sort' = SetIPAddress Source mask'
        action' = if set then Add
            else if rcheck || update then Check update seconds' hitcount'
            else Remove
    in
    (Just [Left . Ext . InCSet name' sort' $ action'], xs')

convertSetRule' :: [String] -> (Maybe String, Bool, Maybe Int,  Bool, Bool, Bool,
    Maybe Int, Maybe Int, [String])
convertSetRule' [] = (Nothing, False, Nothing, False, False, False,
    Nothing, Nothing, [])
convertSetRule' ("--name":name:xs) =
    let
        (_, set', mask', rcheck', update', remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (Just (read name :: String), set', mask', rcheck', update', remove', seconds', hitcount', xs')
convertSetRule' ("--set":set:xs) =
    let
        (name', _, mask', rcheck', update', remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', True, mask', rcheck', update', remove', seconds', hitcount', xs')
convertSetRule' ("--mask":mask:xs) =
    let
        (name', set', _, rcheck', update', remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', set', Just (read mask :: Int), rcheck', update', remove', seconds', hitcount', xs')
convertSetRule' ("--rcheck":rcheck:xs) =
    let
        (name', set', mask', _, update', remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', set', mask', True, update', remove', seconds', hitcount', xs')
convertSetRule' ("--update":update:xs) =
    let
        (name', set', mask', rcheck', _, remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', set', mask', rcheck', True, remove', seconds', hitcount', xs')
convertSetRule' ("--remove":remove:xs) =
    let
        (name', set', mask', rcheck', update', _, seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', set', mask', rcheck', update', True, seconds', hitcount', xs')
convertSetRule' ("--seconds":seconds:xs) =
    let
        (name', set', mask', rcheck', update', remove', _, hitcount', xs') = convertSetRule' xs
    in
    (name', set', mask', rcheck', update', remove', Just (read seconds :: Int), hitcount', xs')
convertSetRule' ("--hitcount":hitcount:xs) =
    let
        (name', set', mask', rcheck', update', remove', seconds', _, xs') = convertSetRule' xs
    in
    (name', set', mask', rcheck', update', remove', seconds', Just (read hitcount :: Int), xs')
convertSetRule' (x:xs) =
    let
        (name', set', mask', rcheck', update', remove', seconds', hitcount', xs') = convertSetRule' xs
    in
    (name', set', mask', rcheck', update', remove', seconds', hitcount', x:xs')
