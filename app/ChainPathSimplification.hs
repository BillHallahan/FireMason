module ChainPathSimplification where
--This is to convert all jumps/gotos/returns to the type Go Int Int,
--which also requires appropriately duplicating chains

import qualified Data.Map as Map
import qualified Data.Maybe as MB
import Types

pathSimplification :: Map.Map String Chain -> [NameIdChain]
pathSimplification m =
    let
        init = map (\s -> (s, MB.fromJust (Map.lookup s m))) ["INPUT", "OUTPUT", "FORWARD"]
    in
	pathSimplification' init m 0


pathSimplification' :: [(String, Chain)] -> Map.Map String Chain -> Int -> [NameIdChain]
pathSimplification' [] _ _ = []
pathSimplification' ((s, c):cx) m ch =
    let
        (simplified, newChains) = pathSimplificationChain c m ch 0
    in
    (NameIdChain s ch simplified):newChains ++ pathSimplification' cx m (ch + 1 + length newChains)

pathSimplificationChain :: Chain -> Map.Map String Chain -> Int-> Int -> (Chain, [NameIdChain])
pathSimplificationChain [] _ _ _ = ([], [])
pathSimplificationChain (r:rx) m ch ru =
    let
        (c, ic) = pathSimplificationChain rx m ch (ru + 1)
        (newTargets, ic') = pathSimplificationTargets (targets r) m (ch + length ic) ru 
    in
    ((Rule (criteria r) newTargets (label r)):c, ic ++ ic')


pathSimplificationTargets :: [Target] -> Map.Map String Chain -> Int -> Int  -> ([Target], [NameIdChain])
pathSimplificationTargets [] _ _ _ = ([], [])
pathSimplificationTargets (t:ts) m ch r =
    let
        (t', ic) = pathSimplificationTarget t m ch r
        (t'', ic') = pathSimplificationTargets ts m (ch + length ic) r
    in
    (t':t'', ic ++ ic')

pathSimplificationTarget :: Target -> Map.Map String Chain -> Int -> Int  -> (Target, [NameIdChain])
pathSimplificationTarget (Jump j) m ch _ = 
    let
        chain = MB.fromJust (Map.lookup j m) 
    in
        (Go (ch + 1) 0, pathSimplification' [(j, chain)] m (ch + 1))
pathSimplificationTarget t _ _ _ = (t, [])