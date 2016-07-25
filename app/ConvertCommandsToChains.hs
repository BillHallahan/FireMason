module ConvertCommandsToChains where

import qualified Data.Map as Map

import IptablesTypes
import Types

--I'm not sure how iptables specific this is, I seperated it out because I thought it might be useful for other firewalls.

convertToChains :: [Line] -> Map.Map String InputChain -> Map.Map String InputChain
convertToChains l m
    | [] <- l = m
    | New s <- c = convertToChains ls (Map.insert s [] m)
    | Flush (Just s) <- c = if Map.member s m
                                then convertToChains ls (Map.insert s [] m)
                                else error "HERE!"
    | Append s <- c = convertToChains ls $  Map.adjust (\v -> v ++ [r]) s m
    | Insert s i <- c = 
        let
            ch = case Map.lookup s m of Just c' -> c'
                                        Nothing -> error "HERE"
            (xs, xs') = splitAt i ch
        in
        convertToChains ls $ Map.insert s (xs ++ r:xs') m
    | otherwise = error "HERE"
    where (Line t c r):ls = l