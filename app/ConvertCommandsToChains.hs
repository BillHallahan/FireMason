module ConvertCommandsToChains where

import qualified Data.Map as Map

import Types

convertToChains :: [Command] -> Map.Map String Chain -> Map.Map String Chain
convertToChains [] m = m
convertToChains (New s : cs) m = convertToChains cs (Map.insert s [] m)
convertToChains (Flush (Just s) : cs) m =
    if Map.member s m
        then convertToChains cs (Map.insert s [] m)
        else error "HERE!"
convertToChains (Append s r : cs) m = convertToChains cs $ Map.adjust (\v -> v ++ [removeAnds r]) s m 
convertToChains (Insert s i r : cs) m =
    let
        c = case Map.lookup s m of Just c' -> c'
                                   Nothing -> error "HERE"
        (xs, xs') = splitAt i c
    in
    convertToChains cs $ Map.insert s (xs ++ removeAnds r:xs') m
convertToChains _ _ = error "HERE"


removeAnds :: Rule -> Rule
removeAnds (Rule c t i) = Rule (removeAndsCriteria c) t i


removeAndsCriteria :: [Criteria] -> [Criteria]
removeAndsCriteria (And c:cx) = (removeAndsCriteria c) ++ removeAndsCriteria cx
removeAndsCriteria (c:cx) = c:removeAndsCriteria cx
removeAndsCriteria [] = []