module ChainPathSimplification where
--This is to convert all jumps/gotos/returns to the type Go Int Int,
--which also requires appropriately duplicating chains

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Types

pathSimplification :: Map.Map String Chain -> [(Int, Chain)]
pathSimplification m =
    let
        init = map (\s -> (s, MB.fromJust (Map.lookup s m))) ["INPUT", "OUTPUT", "FORWARD"]
    in
	pathSimplification' init m 0

pathSimplification' :: [(String, Chain)] -> Map.Map String Chain -> Int -> [(Int, Chain)]
pathSimplification' [] _ _= []
pathSimplification' ((s, c):xs) m i = 
    let
        simp = pathSimplificationChain c m (i + 1)
        chainsReffedToInt = Map.fromList $ zip (chainsReferencedInChain c) [i + 1..]
    in
    [(i, replaceTargetsInChain c chainsReffedToInt)] ++ simp ++ pathSimplification' xs m (i + 1 + length simp)

pathSimplificationChain :: Chain -> Map.Map String Chain -> Int -> [(Int, Chain)]
pathSimplificationChain [] _ _ = []
pathSimplificationChain (r:rs) m i =
    let
        simp = pathSimplificationRule r m i
    in
    simp ++ pathSimplificationChain rs m (i + length simp)

pathSimplificationRule :: Rule  -> Map.Map String Chain -> Int -> [(Int, Chain)]
pathSimplificationRule (Rule _ [] _) _ _ = []
pathSimplificationRule (Rule _ (t:ts) j) m i =
    let
        simp = pathSimplificationTarget t m i
    in
        simp ++ pathSimplificationRule (Rule [] ts j) m (i + length simp)

pathSimplificationTarget :: Target  -> Map.Map String Chain -> Int -> [(Int, Chain)]
pathSimplificationTarget (Jump t) m i = 
    let
        newChain = MB.fromJust (Map.lookup t m)
        chainsReffedToInt = Map.fromList $ zip (chainsReferencedInChain newChain) [i + 1..]
    in
    [(i, replaceTargetsInChain newChain chainsReffedToInt)] ++ pathSimplificationChain newChain m (i + 1)
pathSimplificationTarget _ _ _ = []

replaceTargetsInChain :: Chain -> Map.Map String Int -> Chain
replaceTargetsInChain [] _ = []
replaceTargetsInChain ((Rule c t i):cx) m = (Rule c (replaceTargetsInTarget t m) i):replaceTargetsInChain cx m

replaceTargetsInTarget :: [Target] -> Map.Map String Int -> [Target]
replaceTargetsInTarget [] _ = []
replaceTargetsInTarget ((Jump t):tx) m = Go (MB.fromJust (Map.lookup t m)) 0 : replaceTargetsInTarget tx m
replaceTargetsInTarget (t:tx) m = t : replaceTargetsInTarget tx m

chainsReferencedInChain :: Chain -> [String]
chainsReferencedInChain (c:cx) = (chainsReferencedInTargets $ targets c) ++ chainsReferencedInChain cx
chainsReferencedInChain [] = []

chainsReferencedInTargets :: [Target] -> [String]
chainsReferencedInTargets (Jump t:tx) = t:chainsReferencedInTargets tx
chainsReferencedInTargets (_:tx) = chainsReferencedInTargets tx
chainsReferencedInTargets [] = []