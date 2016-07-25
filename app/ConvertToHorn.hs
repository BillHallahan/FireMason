module ConvertToHorn where

import Types

stringInputChainsToStringChains :: [(String, InputChain)] -> Int -> [(String, Chain)]
stringInputChainsToStringChains [] _ = []
stringInputChainsToStringChains ((s, c):sc) j = 
    let
        c' = inputChainToChain c j
    in
    (s, c'):stringInputChainsToStringChains sc (j + length c')--Adding length c' is sufficient to ensure no
                                                               --collisions, but will skip some numbers, this is fine

inputChainToChain :: [InputRule] -> Int -> [Rule]
inputChainToChain [] _ = []
inputChainToChain (r:rs) i = 
    let
    (newC, newR, i') = inputCriteriaToCriteria (criteria r) i
    r' = Rule newC (targets r) (label r)
    in
    r':(inputChainToChain (newR ++ rs) (i + i'))

--This should be called only on the [InputCriteria] in an And, and will combine multiple And's into one as much as possible
condenseAnd :: [InputCriteria] -> [InputCriteria]
condenseAnd [] = []
condenseAnd (And c:cx) = (condenseAnd c) ++ condenseAnd cx
condenseAnd (c:cx) = c:condenseAnd cx

--This should be called only on the [InputCriteria] in an Or, and will combine multiple Or's into one as much as possible
condenseOr :: [InputCriteria] -> [InputCriteria]
condenseOr [] = []
condenseOr (Or c:cx) = (condenseOr c) ++ condenseOr cx
condenseOr (c:cx) = c:condenseOr cx

eliminateOr :: InputCriteria -> Int -> (Criteria, [InputRule])
eliminateOr (Or c) i =
    let
        r = map (\c' -> Rule [c'] [PropVariableTarget i True] (-1)) c
        rNot = Rule (map (InCNot) c) [PropVariableTarget i False] (-1)
    in
    (PropVariableCriteria i, rNot:r)
eliminateOr c i = error $ "Invalid " ++ show c

inputCriteriaToCriteria :: [InputCriteria] -> Int -> ([Criteria], [InputRule], Int)
inputCriteriaToCriteria [] _ = ([], [], 0)
inputCriteriaToCriteria (And c: cx) i = inputCriteriaToCriteria ((condenseAnd c) ++ cx) i
inputCriteriaToCriteria (Or c:cx) i = 
    let
        (c', r) = eliminateOr (Or . condenseOr $ c) i
        (c'', r', i'') = inputCriteriaToCriteria cx (i + 1)--We add exactly one Propositional Variable in eliminateOr
    in
    (c':c'', r ++ r', i'' + 1)
inputCriteriaToCriteria (InCNot (InC c):cx) i = 
    let
        (c'', r', i') =  inputCriteriaToCriteria cx i
    in
    (Not c:c'', r', i')
inputCriteriaToCriteria (InCNot c:cx) i = inputCriteriaToCriteria ((simplifyNots [InCNot c]) ++ cx) i
inputCriteriaToCriteria (InC c:cx) i = 
    let
        (c'', r', i') =  inputCriteriaToCriteria cx i
    in
    (c:c'', r', i')

--Moves all Nots as deep into the criteria as possible,
--by applying DeMorgans Law
simplifyNots :: [InputCriteria] -> [InputCriteria]
simplifyNots [] = []
simplifyNots (InCNot (And c):cx) = 
    let
        notted = map (InCNot) c
    in
    Or (simplifyNots $ notted):simplifyNots cx
simplifyNots (InCNot (Or c):cx) = 
    let
        notted = map (InCNot) c
    in
    And (simplifyNots $  notted):simplifyNots cx
simplifyNots (InCNot (InCNot c):cx) = simplifyNots (c:cx)
simplifyNots (c:cx) = c:simplifyNots cx