module ConvertToHorn (stringInputChainsToStringChains, inputInstructionTypeConversion, exampleInstructionsToExamples) where --inputInstructionsToInstructions, inputInstructionsToExamples, inputInstructionsToInsNumExamples) where

import Types

type ElimExt a = a -> Int -> (Maybe Criteria, [Rule], Int)
type ElimOr a = ElimExt a -> [InputCriteria a] -> Int -> ([[Criteria]], [Rule], Int)

stringInputChainsToStringChains :: [(String, FileChain)] -> Int -> [(String, Chain)]
stringInputChainsToStringChains [] _ = []
stringInputChainsToStringChains ((s, c):sc) j = 
    let
        c' = inputChainToChain (eliminateOrPropVar) (eliminateLimits) c j
    in
    (s, c'):stringInputChainsToStringChains sc (j + length c')--Adding length c' is sufficient to ensure no
                                                               --collisions, but will skip some numbers, this is fine

inputChainToChain :: ElimOr a -> ElimExt a -> [InputRule a] -> Int -> [Rule]
inputChainToChain _ _ [] _ = []
inputChainToChain elim elimE (r:rs) i = 
    let
    (newC, newR, i') = inputCriteriaToCriteria (elim) (elimE) (criteria r) i
    r' = map (\c -> Rule c (targets r) (label r)) newC
    newR' = map (\r'' -> Rule (criteria r'') (targets r'') (label r)) newR
    in
    newR' ++ r' ++ (inputChainToChain (elim) (elimE) rs (i + i' + length newR))

--This should be called only on the [InputCriteria] in an And, and will combine multiple And's into one as much as possible
condenseAnd :: [InputCriteria a] -> [InputCriteria a]
condenseAnd [] = []
condenseAnd (And c:cx) = (condenseAnd c) ++ condenseAnd cx
condenseAnd (c:cx) = c:condenseAnd cx

--This should be called only on the [InputCriteria] in an Or, and will combine multiple Or's into one as much as possible
condenseOr :: [InputCriteria a] -> [InputCriteria a]
condenseOr [] = []
condenseOr (Or c:cx) = (condenseOr c) ++ condenseOr cx
condenseOr (c:cx) = c:condenseOr cx

eliminateLimits :: ElimExt LimitInput
eliminateLimits (InCLimit r b) i = (Just . Limit i r $ b, [] , i + 1)

eliminateState :: ElimExt State
eliminateState _ i = (Nothing, [], i)

--This should be called only on the [InputCriteria] in an Or
eliminateOr :: ElimOr a
eliminateOr _ [] i = ([], [], i)
eliminateOr elimE (c:cx) i =
    let
        (c', r, i') = inputCriteriaToCriteria (eliminateOr) (elimE) [c] i
        (c'', r', i'') = eliminateOr (elimE) cx i'
    in
    (c' ++ c'', r ++ r', i'')

eliminateOrPropVar :: ElimOr a
eliminateOrPropVar _ [] _ = ([], [], -1)
eliminateOrPropVar elimE cx i =
    let
        (c', r, i') = inputCriteriaToCriteria (eliminateOrPropVar) (elimE) cx i
        c'' = concat c'
        r' = map (\ct -> Rule [ct] [PropVariableTarget i' True] (-1)) c''
        r'' = Rule (map (\ct -> Not ct) (c'')) [PropVariableTarget i' False] (-1)
    in
    ([[PropVariableCriteria i']], r'':r ++ r', i' + 1)

inputCriteriaToCriteria :: ElimOr a -> ElimExt a -> [InputCriteria a] -> Int -> ([[Criteria]], [Rule], Int)
inputCriteriaToCriteria _  _ [] i = ([[]], [], i)
inputCriteriaToCriteria elim elimE (And c: cx) i = inputCriteriaToCriteria (elim) (elimE) ((condenseAnd c) ++ cx) i
inputCriteriaToCriteria elim elimE (Or c:cx) i = 
    let
        (c', r, i') = elim (elimE) (condenseOr $ c) i
        (c'', r', i'') = inputCriteriaToCriteria (elim) (elimE) cx (i')
    in
    ((mappend) <$> c' <*> c'', r ++ r', i'')
inputCriteriaToCriteria elim elimE (InCNot (InC c):cx) i = 
    let
        (c'', r', i') =  inputCriteriaToCriteria (elim) (elimE) cx i
    in
    (map (Not c:) c'', r', i')
inputCriteriaToCriteria elim elimE (InCNot c:cx) i = inputCriteriaToCriteria elim (elimE) ((simplifyNots [InCNot c]) ++ cx) i
inputCriteriaToCriteria elim elimE (c':cx) i = 
    let
        (c, r'', i') = case c' of InC c2 -> (Just c2, [], i)
                                  Ext a -> elimE a i--Ext (InCLimit r b) -> (Limit i r b, i + 1)
        (c'', r', i'') =  inputCriteriaToCriteria elim (elimE) cx i'
    in
    case c of Just c'''' -> (map (c'''':) c'', r'' ++ r', i'')
              Nothing -> (c'', r'' ++ r', i'')
    


--Moves all Nots as deep into the criteria as possible,
--by applying DeMorgans Law
simplifyNots :: [InputCriteria a] -> [InputCriteria a]
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


-- inputInstructionsToInstructions :: [InputInstruction a] -> Int -> [Instruction]
-- inputInstructionsToInstructions x i = map (snd) (inputInstructionsToInsNumInstructions x i)

-- inputInstructionsToInsNumInstructions :: [InputInstruction a] -> Int -> [(Int, Instruction)]
-- inputInstructionsToInsNumInstructions x i = map (\(i', ex) -> (i', instruction ex)) (inputInstructionsToInsNumExamples x i)

-- inputInstructionsToExamples :: [ExampleInstruction] -> Int -> [Example]
-- inputInstructionsToExamples x i = map (snd) (inputInstructionsToInsNumExamples x i)

-- inputInstructionsToInsNumExamples :: [ExampleInstruction] -> Int -> [(Int, Example)]
-- inputInstructionsToInsNumExamples x i = inputInstructionsToInsNumExamples' x i 0

-- inputInstructionsToInsNumExamples' :: [ExampleInstruction] -> Int -> Int -> [(Int, Example)]
-- inputInstructionsToInsNumExamples' [] _ _ = []
-- inputInstructionsToInsNumExamples' ((ToChainNamed s r):xs) i j =
--     let
--          rules = map ((,) j) $ map (\r' -> Example {instruction = ToChainNamed s $ r'}) (inputChainToChain (eliminateOr) (eliminateState) [r] i)
--     in
--     rules ++ inputInstructionsToInsNumExamples' xs (i + length rules) (j + 1)
-- inputInstructionsToInsNumExamples' ((NoInstruction r):xs) i j =
--     let
--         rules = map ((,) j) $ map (\r' -> Example {instruction =  NoInstruction $ r'}) (inputChainToChain (eliminateOr) (eliminateState) [r] i)
--     in
--     rules ++ inputInstructionsToInsNumExamples' xs (i + length rules) (j + 1)

fileInstructionsToInstruction :: [FileInstruction] -> [Instruction]
fileInstructionsToInstruction xs = inputInstructionTypeConversion (eliminateOrPropVar) (eliminateLimits) (\x -> id) xs

exampleInstructionsToExamples :: [ExampleInstruction] -> [Example]
exampleInstructionsToExamples xs = inputInstructionTypeConversion (eliminateOr) (eliminateState) (insToExample) xs
    where insToExample :: ExampleInstruction -> Instruction -> Example
          insToExample e i = Example {instruction = i, state = []}

inputInstructionTypeConversion :: ElimOr a -> ElimExt a -> (InputInstruction a -> Instruction -> b) -> [InputInstruction a] -> [b]
inputInstructionTypeConversion elimOr elimExt con xs = inputInstructionTypeConversion' (elimOr) (elimExt) con xs 0

inputInstructionTypeConversion' :: ElimOr a -> ElimExt a -> (InputInstruction a -> Instruction -> b) -> [InputInstruction a] -> Int -> [b]
inputInstructionTypeConversion' _ _ _ [] _ = []
inputInstructionTypeConversion' elimOr elimExt con  ((ToChainNamed s r):xs) i = 
    let
        ins = map (ToChainNamed s) (inputChainToChain (elimOr) (elimExt) [r] i)
    in
    (map (con (ToChainNamed s r)) ins) ++ inputInstructionTypeConversion' (elimOr) (elimExt) (con) xs (i + 1)
inputInstructionTypeConversion' elimOr elimExt con ((NoInstruction r):xs) i =
    let
        ins = map (NoInstruction) (inputChainToChain (elimOr) (elimExt) [r] i)
    in
    (map (con (NoInstruction r)) ins) ++ inputInstructionTypeConversion' (elimOr) (elimExt) (con) xs (i + 1)