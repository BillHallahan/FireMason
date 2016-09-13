module RuleEliminating (findRedundantRule) where

import Data.Maybe
import Z3.Monad

import ChainsToSMT
import NameIdChain
import Types


import Debug.Trace

--returns a list of chain names and rule numbers (in terms of labels) which should be removed 
findRedundantRule :: IdNameChain -> IO [(String, Int)]
findRedundantRule n = do
    r <- evalZ3 . findRedundantRule' $ n
    return [(show r, 0)]

findRedundantRule':: IdNameChain -> Z3 [(String, Int)]
findRedundantRule' n = do
    convertChainsSMT n 1
    findRedundantRule'' n (allChainEquivalents n)

findRedundantRule'' :: IdNameChain -> [[ChainId]] -> Z3 [(String, Int)]
findRedundantRule'' _ [] = return []
findRedundantRule'' n (c:cs) = do

    r <- findRedundantRule''' n c 0
    rs <- findRedundantRule'' n cs

    return ((map (\r' -> (fromJust . (lookupName n) . head $ c, r')) r) ++ rs)

findRedundantRule''' :: IdNameChain -> [ChainId] -> Int -> Z3 [Int]
findRedundantRule''' n c r =
    if
        r == (length . fromJust $ lookupChain n (head c))
    then
        return []
    else do
        solverPush

        intSort <- mkIntSort
        p <- mkInt 0 intSort
        r' <- mkInt r intSort

        assert =<< mkOr =<< (sequence $ map (\c2 -> matchesRule' p c2 r') c)

        r'' <- solverCheck

        solverPop 1

        rs <- findRedundantRule''' n c (r + 1)

        if r'' == Sat then return (rs) else return (r:rs)
    where 
          matchesRule' :: AST -> Int -> AST -> Z3 AST
          matchesRule' p1 c1 r1 = do
            intSort <- mkIntSort
            c1 <- mkInt c1 intSort
            matchesRule p1 c1 r1