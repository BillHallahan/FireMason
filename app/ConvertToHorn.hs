module ConvertToHorn (stringInputChainsToStringChains, inputInstructionsToInstructions) where

import Types

stringInputChainsToStringChains :: [(String, InputChain)] -> Int -> [(String, Chain)]
stringInputChainsToStringChains [] _ = []
stringInputChainsToStringChains ((s, c):sc) j = 
    let
        c' = inputChainToChain (eliminateOrPropVar) c j
    in
    (s, c'):stringInputChainsToStringChains sc (j + length c')--Adding length c' is sufficient to ensure no
                                                               --collisions, but will skip some numbers, this is fine

inputChainToChain :: ([InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)) -> [InputRule] -> Int -> [Rule]
inputChainToChain _ [] _ = []
inputChainToChain elim (r:rs) i = 
    let
    (newC, newR, i') = inputCriteriaToCriteria (elim) (criteria r) i
    r' = map (\c -> Rule c (targets r) (label r)) newC
    newR' = map (\r'' -> Rule (criteria r'') (targets r'') (label r)) newR
    in
    newR' ++ r' ++ (inputChainToChain (elim) rs (i + i' + length newR))

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
        (c', r, i') = inputCriteriaToCriteria (eliminateOr) [c] i
        (c'', r', i'') = eliminateOr cx i'
    in
    (c' ++ c'', r ++ r', i'')

eliminateOrPropVar :: [InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)
eliminateOrPropVar [] _ = ([], [], -1)
eliminateOrPropVar cx i =
    let
        (c', r, i') = inputCriteriaToCriteria (eliminateOrPropVar) cx i
        c'' = concat c'
        r' = map (\ct -> Rule [ct] [PropVariableTarget i' True] (-1)) c''
        r'' = Rule (map (\ct -> Not ct) (c'')) [PropVariableTarget i' False] (-1)
    in
    ([[PropVariableCriteria i']], r'':r ++ r', i' + 1)

inputCriteriaToCriteria :: ([InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)) -> [InputCriteria] -> Int -> ([[Criteria]], [Rule], Int)
inputCriteriaToCriteria _ [] i = ([[]], [], i)
inputCriteriaToCriteria elim (And c: cx) i = inputCriteriaToCriteria (elim) ((condenseAnd c) ++ cx) i
inputCriteriaToCriteria elim (Or c:cx) i = 
    let
        (c', r, i') = elim (condenseOr $ c) i
        (c'', r', i'') = inputCriteriaToCriteria (elim) cx (i')
    in
    ((mappend) <$> c' <*> c'', r ++ r', i'')
inputCriteriaToCriteria elim (InCNot (InC c):cx) i = 
    let
        (c'', r', i') =  inputCriteriaToCriteria (elim) cx i
    in
    (map (Not c:) c'', r', i')
inputCriteriaToCriteria elim (InCNot c:cx) i = inputCriteriaToCriteria elim ((simplifyNots [InCNot c]) ++ cx) i
inputCriteriaToCriteria elim (c':cx) i = 
    let
        (c, i') = case c' of InC c -> (c, i)
                             InCLimit r b -> (Limit i r b, i + 1)
        (c'', r', i'') =  inputCriteriaToCriteria elim cx i'
        propRules = [Rule [c] [PropVariableTarget i True] (-1), Rule [Not c] [PropVariableTarget i False] (-1)]
    in
    (map (c:) c'', r', i'')
    


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
         rules = map (ToChainNamed s) (inputChainToChain (eliminateOr) [r] i)
    in
    rules ++ inputInstructionsToInstructions xs (i + length rules)
inputInstructionsToInstructions ((NoInstruction r):xs) i =
    let
        rules = map (NoInstruction) (inputChainToChain (eliminateOr) [r] i)
    in
    rules ++ inputInstructionsToInstructions xs (i + length rules)