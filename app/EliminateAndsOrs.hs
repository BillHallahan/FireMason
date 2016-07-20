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
        (newC, newR) = eliminateOrs c j--eliminateAndsOrs c j
        newC' = eliminateAnds newC
        newR' = map (\r -> Rule (eliminateAnds $ criteria r) (targets r) (label r)) newR
    in
    newR' ++ (Rule newC' t i):eliminateAndsOrsFromChain rs (j + length newR')

eliminateAnds :: [Criteria] -> [Criteria]
eliminateAnds [] = []
eliminateAnds (And c:cs) = eliminateAnds $ c ++ cs
eliminateAnds (Or c:cs) = Or (eliminateAnds c):eliminateAnds cs
eliminateAnds (c:cs) = c:eliminateAnds cs

--returns new criteria with the or's replaced by propositional variables,
--and rules that correctly determine those propositional variables values
eliminateOrs :: [Criteria] -> Int -> ([Criteria], [Rule])
eliminateOrs [] _ = ([], [])
eliminateOrs (And c:cs) i =
    let
        (c', r) = eliminateOrs c i
        (cs', rs) = eliminateOrs cs (i + length r)
    in
    ((And c'):cs', r ++ rs)
eliminateOrs (Or c:cs) i = 
    let
        (c', r') = eliminateOrs c i
        r = map (\c''-> Rule [c''] [PropVariableTarget i True] (-1)) c'
        rnot = Rule (map (Not) c') [PropVariableTarget i False] (-1)
        (cs', r'') = eliminateOrs cs (i + length r')
    in
    (PropVariableCriteria i:cs', r ++ rnot:r' ++r'')
eliminateOrs (c:cs) i =
    let
        (cs', r) = eliminateOrs cs i
    in
    (c:cs', r)