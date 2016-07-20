module ConvertToHorn where

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
eliminateAndsOrsFromChain [] _ = []--, 0)
eliminateAndsOrsFromChain (Rule c t i:rs) j =
    let
        simpNotsC = simplifyNots (eliminateAnds c False)
        (newC, newR, k) = eliminateOrs simpNotsC j
        --newC' = eliminateAnds newC False
        afterChain = eliminateAndsOrsFromChain (newR ++ rs) (j + k)
    in
    (Rule newC t i):afterChain

--We track if directly in an Or using the Bool, and only merge And's if not
eliminateAnds :: [Criteria] -> Bool -> [Criteria]
eliminateAnds [] _ = []
eliminateAnds (Not (And c):cs) inOr = Not (And $ eliminateAnds c False):(eliminateAnds cs inOr)
eliminateAnds (Not (Or c):cs) inOr = Not (Or $ eliminateAnds c True):(eliminateAnds cs inOr)--AND COORESPONDING FOR OR
eliminateAnds (Not (Not c):cs) inOr = Not(head $ eliminateAnds [Not c] inOr):(eliminateAnds cs inOr)--might be a better way to do this?
eliminateAnds (And c:cs) inOr = if inOr then And (eliminateAnds c False):eliminateAnds cs inOr else eliminateAnds (c ++ cs) inOr
eliminateAnds (Or c:cs) inOr = Or (eliminateAnds c True):(eliminateAnds cs inOr)
eliminateAnds (c:cs) inOr = c:(eliminateAnds cs inOr)

--returns new criteria with the or's replaced by propositional variables,
--rules that correctly determine those propositional variables values
--and the number of propositional variables added
eliminateOrs :: [Criteria] -> Int -> ([Criteria], [Rule], Int)
eliminateOrs [] _ = ([], [], 0)
eliminateOrs (And c:cs) i =
    let
        (c', r, j) = eliminateOrs c i
        (cs', rs, j') = eliminateOrs cs (i + j)
    in
    ((And c'):cs', r ++ rs, j + j')
eliminateOrs (Or c:cs) i = 
    let
        (c', r', j) = eliminateOrs c (i + 1)
        r = map (\c''-> Rule [c''] [PropVariableTarget i True] (-1)) c'
        rnot = Rule (map (Not) c') [PropVariableTarget i False] (-1)
        (cs', r'', j') = eliminateOrs cs (i + j + 1)
    in
    (PropVariableCriteria i:cs', r ++ rnot:r' ++r'', j + j' + 1)
eliminateOrs (c:cs) i =
    let
        (cs', r, j) = eliminateOrs cs i
    in
    (c:cs', r, j)

simplifyNots :: [Criteria] -> [Criteria]
simplifyNots [] = []
simplifyNots (Not (And c):cx) = 
    let
        notted = map (Not) c
    in
    Or (simplifyNots notted):simplifyNots cx
simplifyNots (Not (Or c):cx) = 
    let
        notted = map (Not) c
    in
    And (simplifyNots notted):simplifyNots cx
simplifyNots (Not (Not c):cx) = simplifyNots (c:cx)
simplifyNots (c:cx) = c:simplifyNots cx