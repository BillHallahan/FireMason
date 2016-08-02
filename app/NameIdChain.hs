module NameIdChain where
--This is to convert all jumps/gotos/returns to the type Go Int Int,
--which also requires appropriately duplicating chains

import Data.List
import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Types

pathSimplification :: Map.Map String Chain -> IdNameChain 
pathSimplification m =
    let
        init = map (\s -> (s, MB.fromJust (Map.lookup s m))) ["INPUT", "OUTPUT", "FORWARD"]
    in
    pathSimplification' init m 0


pathSimplification' :: [(String, Chain)] -> Map.Map String Chain -> Int -> IdNameChain
pathSimplification' [] _ _ = Map.empty
pathSimplification' ((s, c):cx) m ch =
    let
        (simplified, newChains) = pathSimplificationChain c m ch 0
        newMap = Map.insert ch (s, simplified) (pathSimplification' cx m (ch + 1 + length newChains))
    in
    Map.union newChains newMap
    --(NameIdChain s ch simplified):newChains ++ pathSimplification' cx m (ch + 1 + length newChains)

pathSimplificationChain :: Chain -> Map.Map String Chain -> Int-> Int -> (Chain, IdNameChain)
pathSimplificationChain [] _ _ _ = ([], Map.empty)
pathSimplificationChain (r:rx) m ch ru =
    let
        (c, ic) = pathSimplificationChain rx m ch (ru + 1)
        (newTargets, ic') = pathSimplificationTargets (targets r) m (ch + length ic) ru 
    in
    ((Rule (criteria r) newTargets):c, Map.union ic ic')


pathSimplificationTargets :: [Target] -> Map.Map String Chain -> Int -> Int  -> ([Target], IdNameChain)
pathSimplificationTargets [] _ _ _ = ([], Map.empty)
pathSimplificationTargets (t:ts) m ch r =
    let
        (t', ic) = pathSimplificationTarget t m ch r
        (t'', ic') = pathSimplificationTargets ts m (ch + length ic) r
    in
    (t':t'', Map.union ic ic')

pathSimplificationTarget :: Target -> Map.Map String Chain -> Int -> Int  -> (Target, IdNameChain)
pathSimplificationTarget (Jump j) m ch _ = 
    let
        chain = MB.fromJust (Map.lookup j m) 
    in
        (Go (ch + 1) 0, pathSimplification' [(j, chain)] m (ch + 1))
pathSimplificationTarget t _ _ _ = (t, Map.empty)


--nameIdChainWithId :: [IdNameChain] -> Int -> Maybe IdNameChain
--nameIdChainWithId n i = find (\x -> ids x == i) n

increaseIndexes :: IdNameChain -> Int -> IdNameChain
increaseIndexes x j = Map.map (\(n, c) -> (n, increaseIndexesChain c j)) x--NameIdChain n (i + j) (increaseIndexesChain c j):increaseIndexes nx j

increaseIndexesChain :: Chain -> Int -> Chain
increaseIndexesChain [] _ = []
increaseIndexesChain ((Rule c t):cx) i = (Rule c (map (flip increaseIndexesTarget i) t)):increaseIndexesChain cx i

increaseIndexesTarget :: Target -> Int -> Target
increaseIndexesTarget (Go c r) i = Go (c + i) r
increaseIndexesTarget t _ = t

--Given a IdNameChain and an id, returns a new IdNameChain with only the IdNameChain with id, and all IdNameChain's that can be reached
--from it through some sequence of Go's
reduceReferenced :: IdNameChain -> Int -> IdNameChain
reduceReferenced x i =
    let
    (n, c) = MB.fromJust $ Map.lookup i x
    t = targetsToChainIds . concat $ map (\x -> targets x) c
    in
    Map.union (foldr1 (Map.union) (map (reduceReferenced x) t)) (Map.fromList [(i, (n, c))])

maxId :: IdNameChain -> Int
maxId x = maximum . Map.keys $ x