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
    r' = map (\c -> Rule c (targets r) (label r)) newC
    newR' = map (\r'' -> Rule (criteria r'') (targets r'') (label r)) newR
    in
    newR' ++ r' ++ (inputChainToChain rs (i + i' + length newR))

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


--This should be called only on the [InputCriteria] in an Or
eliminateOr :: [InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)
eliminateOr [] i = ([], [], i)
eliminateOr (c:cx) i = 
    let
        (c', r, i') = inputCriteriaToCriteria [c] i
        (c'', r', i'') = eliminateOr cx i'
    in
    (c' ++ c'', r ++ r', i'')


inputCriteriaToCriteria :: [InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)
inputCriteriaToCriteria [] i = ([[]], [], i)
inputCriteriaToCriteria (And c: cx) i = inputCriteriaToCriteria ((condenseAnd c) ++ cx) i
inputCriteriaToCriteria (Or c:cx) i = 
    let
        (c', r, i') = eliminateOr (condenseOr $ c) i
        (c'', r', i'') = inputCriteriaToCriteria cx (i')
    in
    ((mappend) <$> c' <*> c'', r ++ r', i'')
inputCriteriaToCriteria (InCNot (InC c):cx) i = 
    let
        (c'', r', i') =  inputCriteriaToCriteria cx i
    in
    (map (Not c:) c'', r', i')
inputCriteriaToCriteria (InCNot c:cx) i = inputCriteriaToCriteria ((simplifyNots [InCNot c]) ++ cx) i
inputCriteriaToCriteria (c':cx) i = 
    let
        c = case c' of InC c -> c
                       InCLimit r b -> Limit i r b
        (c'', r', i') =  inputCriteriaToCriteria cx i
        propRules = [Rule [c] [PropVariableTarget i True] (-1), Rule [Not c] [PropVariableTarget i False] (-1)]
    in
    if isStateless c then (map (c:) c'', r', i')
        else (map (PropVariableCriteria i:) c'', r' ++ propRules, i' + 1)

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


inputInstructionsToInstructions :: [InputInstruction] -> Int -> [Instruction]
inputInstructionsToInstructions [] _ = []
inputInstructionsToInstructions ((ToChainNamed s r):xs) i =
    let
         rules = map (ToChainNamed s) (inputChainToChain [r] i)
    in
    rules ++ inputInstructionsToInstructions xs (i + length rules)
inputInstructionsToInstructions ((NoInstruction r):xs) i =
    let
        rules = map (NoInstruction) (inputChainToChain [r] i)
    in
    rules ++ inputInstructionsToInstructions xs (i + length rules)