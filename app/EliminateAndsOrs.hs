module EliminateAndsOrs where

import Types

eliminateAndsOrsFromStringChains :: [(String, Chain)] -> Int -> [(String, Chain)]
eliminateAndsOrsFromStringChains [] _ = []
eliminateAndsOrsFromStringChains ((s, c):sc) j = 
    let
        c' = eliminateAndsOrsFromChain c j
    in
    (s, c'):eliminateAndsOrsFromStringChains sc (j + length c')--Adding length c' is sufficient to ensure no
                                                               --collisions, but will skip some numbers, this is fine

eliminateAndsOrsFromChain :: Chain -> Int -> Chain
eliminateAndsOrsFromChain [] _ = []
eliminateAndsOrsFromChain (Rule c t i:rs) j =
    let
        (newC, newR) = eliminateAndsOrs c j
    in
    newR ++ (Rule newC t i):eliminateAndsOrsFromChain rs (j + length newR)

--returns new criteria with the or's replaced by propositional variables,
--and rules that correctly determine those propositional variables values
eliminateAndsOrs :: [Criteria] -> Int -> ([Criteria], [Rule])
eliminateAndsOrs [] _ = ([], [])
eliminateAndsOrs (And c:cs) i = 
    let
        (c', r) = eliminateAndsOrs c i
        (cs', rs) = eliminateAndsOrs cs (i + length r)
    in
    (c' ++ cs', r ++ rs)
eliminateAndsOrs (Or c:cs) i = 
    let
        (c', r') = eliminateAndsOrs c i
        r = map (\c''-> Rule [c''] [PropVariableTarget i True] (-1)) c'
        rnot = Rule (map (Not) c') [PropVariableTarget i False] (-1)
        (cs', r'') = eliminateAndsOrs cs (i + length r')
    in
    (PropVariableCriteria i:cs', r ++ rnot:r' ++r'')
eliminateAndsOrs (x:xs) i =
    let
        (c, r) = eliminateAndsOrs xs i
    in
    (x:c, r)