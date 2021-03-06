module ConvertToHorn (stringInputChainsToStringChains, inputInstructionTypeConversion, exampleRuleInstructionsToExamplesInstructions) where --inputInstructionsToInstructions, inputInstructionsToExamples, inputInstructionsToInsNumExamples) where

import Types
import Data.Maybe
import qualified Data.Map as Map

type ElimExt a b = a -> Int -> ((Maybe Criteria), [Rule], Int, [b])
type ElimOr a b = ElimExt a b -> [InputCriteria a] -> Int -> ([([Criteria], [b])], [Rule], Int)

stringInputChainsToStringChains :: [(String, FileChain)] -> Int -> [(String, Chain)]
stringInputChainsToStringChains [] _ = []
stringInputChainsToStringChains ((s, c):sc) j =
    let
        c' = map (fst) $ inputChainToChain (eliminateOrPropVar) (eliminateFileInput) c j
    in
    (s, c'):stringInputChainsToStringChains sc (j + length c')--Adding length c' is sufficient to ensure no
                                                               --collisions, but will skip some numbers, this is fine

inputChainToChain :: (Show a, Show b) =>ElimOr a b -> ElimExt a b -> [InputRule a] -> Int -> [(Rule, [b])]
inputChainToChain _ _ [] _ = []
inputChainToChain elim elimE (r:rs) i =
    let
    (newCS, newR, i') = inputCriteriaToCriteria (elim) (elimE) (criteria r) i
    r' = map (\(c, s) -> (Rule c (targets r) (label r), s)) newCS
    newR' = map (\r'' -> (Rule (criteria r'') (targets r'') (label r), [])) newR
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

eliminateFileInput :: ElimExt FileInput Int
eliminateFileInput (InCLimit r b s) i = (Just . Limit i r b $ s, [] , i + 1, [])
--eliminateFileInput (InCSet name sort action) i = (Just . Set i name sort $ action, [] , i + 1, [])
eliminateFileInput (InCUnrecognizedCriteria s) i = (Just . UnrecognizedCriteria i $ s, [] , i + 1, [])

eliminateInCSet :: Map.Map String Int -> Map.Map String Int -> [FileInput] -> [Criteria]
eliminateInCSet m1 m2 [] = []
eliminateInCSet m1 m2 (x:xs) =
    let
    (InCSet name sort action) = x
    i = Map.lookup name m1
    j = Map.lookup name m2
    i' = if isJust i then fromJust i else succ (getMax (Map.toList m1))
    j' = if isJust j then fromJust j else 0
    tmp = Map.adjust succ name m2
    c = eliminateInCSet m1 tmp xs
    in (Set i' j' name sort action):c

getMax :: (Num v, Ord v) => [(k, v)] -> v
getMax [] = 0
getMax ((k, v):xs) =
    let
    prev = getMax xs
    rst = if v > prev then v else prev
    in rst

eliminateState :: ElimExt State State
eliminateState s i = (Nothing, [], i, [s])

--This should be called only on the [InputCriteria] in an Or
eliminateOr :: (Show a, Show b) => ElimOr a b
eliminateOr _ [] i = ([], [], i)
eliminateOr elimE (c:cx) i =
    let
        (c', r, i') = inputCriteriaToCriteria (eliminateOr) (elimE) [c] i
        (c'', r', i'') = eliminateOr (elimE) cx i'
    in
    (c' ++ c'', r ++ r', i'')

eliminateOrPropVar ::(Show a, Show b) => ElimOr a b
eliminateOrPropVar _ [] _ = ([], [], -1)
eliminateOrPropVar elimE cx i =
    let
        (c', r, i') = inputCriteriaToCriteria (eliminateOrPropVar) (elimE) cx i
        c'' = concat . map (fst) $ c'
        r' = map (\ct -> Rule [ct] (PropVariableTarget i' True) (-1)) c''
        r'' = Rule (map (\ct -> Not ct) (c'')) (PropVariableTarget i' False) (-1)
    in
    ([([PropVariableCriteria i'], [])], r'':r ++ r', i' + 1)

inputCriteriaToCriteria :: (Show a, Show b) => ElimOr a b -> ElimExt a b -> [InputCriteria a] -> Int -> ([([Criteria], [b])], [Rule], Int)
inputCriteriaToCriteria _  _ [] i = ([([], [])], [], i)
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
    (map (\(c''', s) -> (Not c:c''', s)) c'', r', i')
inputCriteriaToCriteria elim elimE (InCNot (Ext a'):cx) i =
    let
        (c, r'', i', b') = eliminatedNot (elimE) a' i
        (c'', r', i'') = inputCriteriaToCriteria elim (elimE) cx i'
    in
    case c of
        Just c'''' -> (map (\(c2, s) -> (c'''':c2, b' ++ s)) c'', r'' ++ r', i'')
        Nothing ->  (map (\(c''', s) -> (c''', b' ++ s)) c'', r'' ++ r', i'')
        where
            eliminatedNot :: (ElimExt a b) -> ElimExt a b
            eliminatedNot elimE' a' i =
                let
                    (c, r, i', b) = elimE' a' $ i
                in
                case c of
                    Just c' -> (Just . Not $ c', r, i', b)
                    otherwise -> (c, r, i', b)
inputCriteriaToCriteria elim elimE (InCNot c:cx) i = inputCriteriaToCriteria elim (elimE) ((simplifyNots [InCNot c]) ++ cx) i
inputCriteriaToCriteria elim elimE (c':cx) i =
    let
        (c, r'', i', b') = case c' of InC c2 -> (Just c2, [], i, [])
                                      Ext a' -> elimE a' i
        (c'', r', i'') = inputCriteriaToCriteria elim (elimE) cx i'
    in
    case c of Just c'''' -> (map (\(c2, s) -> (c'''':c2, b' ++ s)) c'', r'' ++ r', i'')
              Nothing ->  (map (\(c''', s) -> (c''', b' ++ s)) c'', r'' ++ r', i'')


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


fileInstructionsToInstruction :: [FileInstruction] -> [Instruction]
fileInstructionsToInstruction xs = inputInstructionTypeConversion (eliminateOrPropVar) (eliminateFileInput) (\x -> fst) xs

exampleRuleInstructionsToExamplesInstructions :: [ExampleRuleInstruction] -> [ExampleInstruction]
exampleRuleInstructionsToExamplesInstructions xs = inputInstructionTypeConversion (eliminateOr) (eliminateState) (insToExample) xs
    where insToExample :: ExampleRuleInstruction -> (Instruction, [State]) -> ExampleInstruction
          insToExample e (ToChainNamed spec n r, s) = ToChainNamed {spec = spec, chainName = n, insRule = Example {exRule = r, state = s}}
          insToExample e (NoInstruction r, s) = NoInstruction {insRule = Example {exRule = r, state = s}}

inputInstructionTypeConversion :: (Show a, Show c) => ElimOr a c -> ElimExt a c -> (InputInstruction a -> (Instruction, [c]) -> b) -> [InputInstruction a] -> [b]
inputInstructionTypeConversion elimOr elimExt con xs = inputInstructionTypeConversion' (elimOr) (elimExt) con xs 0

inputInstructionTypeConversion' ::(Show a, Show c) => ElimOr a c -> ElimExt a c -> (InputInstruction a -> (Instruction, [c]) -> b) -> [InputInstruction a] -> Int -> [b]
inputInstructionTypeConversion' _ _ _ [] _ = []
inputInstructionTypeConversion' elimOr elimExt con  ((ToChainNamed spec s r):xs) i =
    let
        ins = map (\(ru, st) -> (ToChainNamed spec s ru, st)) (inputChainToChain (elimOr) (elimExt) [r] i)
    in
    (map (con (ToChainNamed spec s r)) ins) ++ inputInstructionTypeConversion' (elimOr) (elimExt) (con) xs (i + 1)
inputInstructionTypeConversion' elimOr elimExt con ((NoInstruction r):xs) i =
    let
        ins = map (\(ru, st) -> (NoInstruction ru, st)) (inputChainToChain (elimOr) (elimExt) [r] i)
    in
    (map (con (NoInstruction r)) ins) ++ inputInstructionTypeConversion' (elimOr) (elimExt) (con) xs (i + 1)
