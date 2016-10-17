module RuleEliminating (findRedundantRule) where

import Data.Maybe
import Z3.Monad

import ChainsToSMT
import NameIdChain
import Types

import Debug.Trace

--returns a list of chain names and rule numbers (in terms of labels) which should be removed
findRedundantRule :: IdNameChain -> IO [(String, Label)]
findRedundantRule n = evalZ3 . findRedundantRule' $ n

findRedundantRule':: IdNameChain -> Z3 [(String, Label)]
findRedundantRule' n = do
    convertChainsSMT n 1
    findRedundantRule'' n (allChainEquivalents n)

findRedundantRule'' :: IdNameChain -> [[ChainId]] -> Z3 [(String, Label)]
findRedundantRule'' _ [] = return []
findRedundantRule'' n (c:cs) = do

    r <- findRedundantRule''' n c 0
    rs <- findRedundantRule'' n cs

    return ((map (\r' -> (fromJust . (lookupName n) . head $ c, r')) r) ++ rs)

findRedundantRule''' :: IdNameChain -> [ChainId] -> Int -> Z3 [Int]
findRedundantRule''' n c r =
    let
        ch = fromJust $ lookupChain n (head c)
        rLabel = if r == length ch then
                    -1
                else
                    label (ch !! r)
        rSame = if rLabel == -1 then [] else map (fst) $ filter (\(i, ru) -> label ru == rLabel) (zip [0..] ch)
    in
    if
        null rSame
    then
        return []
    else do
        solverPush

        intSort <- mkIntSort
        p <- mkInt 0 intSort

        assert =<< mkOr =<< mapM (\(c2, r2) -> matchesRule' p c2 r2) ((,) <$> c <*> rSame)

        r'' <- solverCheck

        solverPop 1

        rs <- findRedundantRule''' n c (r + 1)

        if r'' == Sat then return (rs) else return (rLabel:rs)
    where
          matchesRule' :: AST -> ChainId -> RuleInd -> Z3 AST
          matchesRule' p1 c1 r1 = do
            intSort <- mkIntSort
            c1' <- mkInt c1 intSort
            r1' <- mkInt r1 intSort
            matchesRule p1 c1' r1'
