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
        simpNotsC = simplifyNots (condenseAndsOrs c False)
        (newC, newR, k) = eliminateOrs simpNotsC j
        afterChain = eliminateAndsOrsFromChain (newR ++ rs) (j + k)
    in
    (Rule newC t i):afterChain

--We track if directly in an Or using the Bool, and only merge And's if not
condenseAndsOrs :: [Criteria] -> Bool -> [Criteria]
condenseAndsOrs [] _ = []
condenseAndsOrs (Not (And c):cs) inOr = Not (And $ condenseAndsOrs c False):(condenseAndsOrs cs inOr)
condenseAndsOrs (Not (Or c):cs) inOr = Not (Or $ condenseAndsOrs c True):(condenseAndsOrs cs inOr)
condenseAndsOrs (Not (Not c):cs) inOr = Not(head $ condenseAndsOrs [Not c] inOr):(condenseAndsOrs cs inOr)
condenseAndsOrs (And c:cs) inOr = if inOr then And (condenseAndsOrs c False):condenseAndsOrs cs inOr else condenseAndsOrs (c ++ cs) inOr
condenseAndsOrs (Or c:cs) inOr = if not inOr then Or (condenseAndsOrs c True):(condenseAndsOrs cs inOr) else condenseAndsOrs (c ++ cs) inOr--Or (condenseAnds c True):(condenseAnds cs inOr)
condenseAndsOrs (c:cs) inOr = c:(condenseAndsOrs cs inOr)

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

--Moves all Nots as deep into the criteria as possible,
--by applying DeMorgans Law
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