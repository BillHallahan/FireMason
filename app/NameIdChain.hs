module NameIdChain (IdNameChain, IdNameExamples, IdNameChainType, addChain, accessRules, lookupNameChain, lookupChain, lookupRule, chainRuleIds, lookupName, lookupEquivalent
    , allChainEquivalents, switchChains, addRuleToChains, chains, names, namesChains, validIds, idsWithName,
    increaseIds, reduceReferenced, notTopLevelChains, topLevelChains, topLevelJumpingTo, limits, limitIds, maxId,
    maxLabel, setUnion, toList', jumpedToWithCriteria, pathSimplificationChains, pathSimplificationExamples, pathSimplification, increaseIdsCriteria) where
--This is to convert all jumps/gotos/returns to the type Go Int Int,
--which also requires appropriately duplicating chains

import Data.List
import qualified Data.Map.Strict as Map
import qualified Data.Maybe as MB
import Types

data IdNameChainType ct = INC { addChain :: String -> IdNameChainType ct
                               , accessRules :: ct -> Rule
                               , lookupNameChain :: ChainId -> Maybe (String, [ct])
                               , lookupChain :: ChainId -> Maybe [ct]
                               , lookupRule :: ChainId -> RuleInd -> Maybe ct
                               , chainRuleIds :: [(ChainId, RuleInd)]
                               , lookupName :: ChainId -> Maybe String
                               , lookupEquivalent :: ChainId -> [ChainId]
                               , allChainEquivalents :: [[ChainId]]
                               , switchChains :: ([ct] -> [ct]) -> ChainId -> IdNameChainType ct
                               , addRuleToChains :: ct -> ChainId -> RuleInd -> IdNameChainType ct
                               , chains :: [[ct]]
                               , names :: [String]
                               , namesChains :: [(String, [ct])]
                               , validIds :: [ChainId]
                               , idsWithName :: String -> [ChainId]
                               , increaseIds :: Int -> IdNameChain
                               , reduceReferenced :: [ChainId] -> IdNameChainType ct
                               , notTopLevelChains :: [ChainId]
                               , topLevelChains :: [ChainId]
                               , topLevelJumpingTo :: [ChainId] -> [ChainId]
                               , limits :: Int -> Maybe [(ChainId, Int)]
                               , limitIds :: [Int]
                               , maxId :: ChainId
                               , labels :: [Label]
                               , maxLabel :: Label
                               , mergeWithMap :: Map.Map ChainId (String, [ct]) -> IdNameChainType ct
                               , setUnion :: IdNameChainType ct -> IdNameChainType ct
                               , toList' :: [(ChainId, (String, [ct]))]
                            }

type IdNameChain = IdNameChainType Rule
type IdNameExampleRule = IdNameChainType ExampleRule
type IdNameExamples = IdNameChainType Example

idNameChainCons :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> IdNameChainType r
idNameChainCons accessR m =
    let
        add = 
            (\s ->
                if s `elem` ns then
                    error "Can't insert a new chain with an existing name"
                else
                    idNameChainCons accessR $ Map.insert (mI' + 1) (s, []) m
            )
        lC = (\i -> pure (snd) <*> Map.lookup i m)
        lR = (\c i -> case lC c of Just c' -> Just (c' !! i)
                                   Nothing -> Nothing)
        cri = concat . map (\c -> [(c, r) | r <- [0..((length $ case lC c of
                                                                    Just __c -> __c
                                                                    Nothing -> error "cri in IdNameChain") - 1)]]) $ (Map.keys m)
        lN = (\i -> pure (fst) <*> Map.lookup i m)
        lEquiv = 
            (\i -> 
                if MB.isJust $ Map.lookup i m then 
                    Map.keys $ Map.filter (\(s', _) -> s' == (fst $ case Map.lookup i m of
                                                                            Just __n -> __n
                                                                            Nothing -> error "lEquiv in IdNameChain")) m 
                else []
            )
        allEquiv = (map (idsName) ns)
        sC = 
            (\f i->
                let
                    equiv = lEquiv i
                    m'' = foldr (\i' l -> Map.adjust (\(s, c) -> (s, f c)) i' l) m equiv
                in
                idNameChainCons accessR m''
            )
        addR = let
                    addRule :: r -> RuleInd -> [r] -> [r]
                    addRule r i c = let (c', c'') = splitAt i c in c' ++ r:c''
                in
                (\r' ch i' ->  sC (addRule r' i') ch)

        chs = map (snd) (Map.elems m)
        ns = map (fst) (Map.elems m)
        idsName = (\s -> Map.keys $ Map.filter (\x -> s == fst x) m)
        incr = (\i -> idNameChainCons (id) $ increaseIds' accessR m i)
        redRef = (\i -> idNameChainCons accessR $ reduceReferenced' accessR m i)
        topJ = (\i -> topLevelJumpingTo' accessR m i)
        lims = \i -> Map.lookup i (limitsMap accessR m)
        mI' = maximum (Map.keys m ++ limitIds' accessR m ++ propVariableIds' accessR m)
        lab = map (label . accessR) . concat . map (snd) $ Map.elems m
        mL = maximum lab
        merge = (\m' -> idNameChainCons accessR $ Map.union m m')
        u = (\m' -> mergeWithMap m' m)
    in
    INC {addChain = add
         , accessRules = accessR
         , lookupNameChain = (flip Map.lookup) m
         , lookupChain = lC
         , lookupRule = lR
         , chainRuleIds = cri
         , lookupName = lN
         , lookupEquivalent = lEquiv
         , allChainEquivalents = allEquiv
         , switchChains = sC
         , addRuleToChains = addR
         , chains = chs
         , names = ns
         , namesChains = Map.elems m
         , validIds = Map.keys m
         , idsWithName = idsName
         , increaseIds = incr
         , reduceReferenced = redRef
         , topLevelChains = topLevelChains' accessR m
         , notTopLevelChains = notTopLevelChains' accessR m
         , topLevelJumpingTo = topJ
         , limits = lims
         , limitIds = limitIds' accessR m
         , maxId = mI'
         , labels = lab
         , maxLabel = mL
         , mergeWithMap = merge
         , setUnion = u
         , toList' = Map.toList m
        }

pathSimplificationChains :: Map.Map String Chain -> IdNameChain
pathSimplificationChains m = pathSimplification (id) (\_ -> id) m

pathSimplificationExamples :: Map.Map String ExampleChain -> IdNameChainType Example
pathSimplificationExamples m = pathSimplification (exRule) (\e r -> modifyEx e r) m
    where
        modifyEx :: Example -> Rule -> Example
        modifyEx (Example _ s) r = Example r s

pathSimplification :: (ct -> Rule) -> (ct -> Rule -> ct) -> Map.Map String [ct] -> IdNameChainType ct
pathSimplification acc rev m = 
    let
        init = map (\s -> (s, Map.findWithDefault [] s m)) ["INPUT", "OUTPUT", "FORWARD"]
    in
    idNameChainCons (acc) . pathSimplification' acc rev init m $ 0

pathSimplification' :: (ct -> Rule) -> (ct -> Rule -> ct) -> [(String, [ct])] -> Map.Map String [ct] -> ChainId -> Map.Map ChainId (String, [ct])
pathSimplification' _ _ [] _ _ = Map.empty
pathSimplification' acc rev ((s, c):cx) m ch =
    let
        (simplified, newChains) = pathSimplificationChain acc rev c m ch 0
        newMap = Map.insert ch (s, simplified) (pathSimplification' acc rev cx m (ch + 1 + length newChains))
    in
    Map.union newChains newMap

pathSimplificationChain :: (ct -> Rule)  -> (ct -> Rule -> ct) -> [ct] -> Map.Map String [ct] -> ChainId -> RuleInd -> ([ct], Map.Map ChainId (String, [ct]))
pathSimplificationChain _  _[] _ _ _ = ([], Map.empty)
pathSimplificationChain acc rev (r:rx) m ch ru =
    let
        (c, ic) = pathSimplificationChain acc rev rx m ch (ru + 1)
        (newTargets, ic') = pathSimplificationTarget acc rev (targets . acc $ r) m (ch + length ic) ru 
    in
    ((rev r . Rule (criteria . acc $ r) newTargets $ (label . acc $ r)):c, Map.union ic ic')

pathSimplificationTarget :: (ct -> Rule)  -> (ct -> Rule -> ct) -> Target -> Map.Map String [ct] -> ChainId -> RuleInd -> (Target, Map.Map ChainId (String, [ct]))
pathSimplificationTarget acc rev (Jump j) m ch _ = 
    let
        chain = case Map.lookup j m of
                        Just _ch -> _ch
                        Nothing -> error ("Unknown chain in lookup Jump" ++ show j)
    in
        (Go (ch + 1) 0, pathSimplification' acc rev [(j, chain)] m (ch + 1))
pathSimplificationTarget acc rev (GoTo g) m ch _ = 
    let
        chain = case Map.lookup g m of
                        Just _ch -> _ch
                        Nothing -> error ("Unknown chain in lookup GoTo" ++ show g)
    in
        (GoReturn (ch + 1) 0, pathSimplification' acc rev [(g, chain)] m (ch + 1))
pathSimplificationTarget _ _ t _ _ _ = (t, Map.empty)


--Returns a list of the top level chains (that is, the chains a packet must start in, and can't reach through a jump/goto)
topLevelChains' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [ChainId]
topLevelChains' acc n = 
    let
        goes = concat $ map (\(_, (_, c)) -> jumpedTo (map (acc) c)) (Map.toList n)
    in
    filter (\x -> not $ x `elem` goes) (Map.keys n)

notTopLevelChains' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [ChainId]
notTopLevelChains' acc n =
    let
        top = topLevelChains' acc n
    in
    filter (\x -> not $ x `elem` top) (Map.keys n)

--Given a chain, returns all ints in Go or GoReturn, along with accompanying criteria
jumpedToWithCriteria :: Chain -> [([Criteria], ChainId)]
jumpedToWithCriteria [] = []
jumpedToWithCriteria (r:rx) = 
    let
        t = targetToChainIds . targets $ r
    in
    if MB.isJust t then (criteria r, case t of
                                            Just __t -> __t
                                            Nothing -> error ("Unknow in jumpedToWithCriteria " ++ show r)
                        ):jumpedToWithCriteria rx else jumpedToWithCriteria rx

jumpedTo :: Chain -> [ChainId]
jumpedTo t = map (snd) (jumpedToWithCriteria t)



limitsMap ::  (r -> Rule) -> Map.Map ChainId (String, [r]) -> Map.Map Int [(ChainId, Int)]
limitsMap acc n = 
    let
        top = topLevelChains' acc n
    in
    limitsMapChains acc n $ map (\t -> (t, snd $ case Map.lookup t n of
                                                        Just __t -> __t
                                                        Nothing -> error ("In limitsMap unknown " ++ show t))) top

limitsMapChains :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [(ChainId, [r])] -> Map.Map Int [(ChainId, Int)]
limitsMapChains _ _ [] = Map.fromList []
limitsMapChains acc n ((i, c):xs) = Map.unionWith (++) (limitsMapRules acc n i (zip [0..] (map acc c))) (limitsMapChains acc n xs)

limitsMapRules :: (r -> Rule) -> Map.Map ChainId (String, [r]) ->  ChainId -> [(Int, Rule)] -> Map.Map Int [(ChainId, Int)]
limitsMapRules _ _ _ [] = Map.fromList []
limitsMapRules acc n i ((r'', r'):rs) = 
    let
        u = Map.unionWith (++) (limitsMapCriteria n i r'' . criteria $ r') (limitsMapTargets acc n i r'' . targets $ r')
    in
    Map.unionWith (++) u (limitsMapRules acc n i rs)

limitsMapCriteria :: Map.Map ChainId (String, [r]) ->  ChainId -> Int -> [Criteria] -> Map.Map Int [(ChainId, Int)]
limitsMapCriteria _ _ _ [] = Map.fromList []
limitsMapCriteria n ch r' ((Limit i _ _ _) :cs) = Map.unionWith (++) (Map.fromList [(i, [(ch, r')])]) (limitsMapCriteria n ch r' cs)
limitsMapCriteria n ch r' (Not (Limit i _ _ _) :cs) = Map.unionWith (++) (Map.fromList [(i, [(ch, r')])]) (limitsMapCriteria n ch r' cs)
limitsMapCriteria n ch r' (_:cs) = limitsMapCriteria n ch r' cs

limitsMapTargets :: (r -> Rule) -> Map.Map ChainId (String, [r]) ->  ChainId -> Int -> Target -> Map.Map Int [(ChainId, Int)]
limitsMapTargets acc n _ _ (Go ch r) = 
    let
        c = map (acc) . snd $ case Map.lookup ch n of
                                        Just __ch -> __ch
                                        Nothing -> error ("limitsMapTargets has unknown " ++ show ch)
    in
    limitsMapRules acc n ch (zip [0..] c)
limitsMapTargets acc n _ _ (GoReturn ch r) = 
    let
        c = map (acc) . snd $ case Map.lookup ch n of
                                        Just __ch -> __ch
                                        Nothing -> error ("limitsMapTargets has unknown " ++ show ch)
    in
    limitsMapRules acc n ch (zip [0..] c)
limitsMapTargets acc n ch r (t) = mempty

--Returns a list of all top level chains from which it is eventually possible to reach one of the chains with the given ids
topLevelJumpingTo' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [ChainId] -> [ChainId]
topLevelJumpingTo' _ _ [] = []
topLevelJumpingTo' acc n (i:ix) = union (topLevelJumpingTo'' acc n i) (topLevelJumpingTo' acc n ix)

topLevelJumpingTo'' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> ChainId -> [ChainId]
topLevelJumpingTo'' acc n i = filter (\c -> i `elem` (Map.keys $ reduceReferenced' acc n [c])) (topLevelChains' acc n)



idsWithName' :: String -> Map.Map ChainId (String, Chain) -> [ChainId]
idsWithName' s n = Map.keys $ Map.filter (\x -> s == fst x) n

increaseIds' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> Int -> Map.Map ChainId (String, Chain)
increaseIds' acc x j = Map.mapKeys (j +) $ Map.map (\(n, c) -> (n, increaseIdsChain (map (acc) c) j)) x

increaseIdsChain :: Chain -> Int -> Chain
increaseIdsChain [] _ = []
increaseIdsChain ((Rule c t l):cx) i = (Rule (map (flip increaseIdsCriteria i) c) (increaseIdsTarget t i) l):increaseIdsChain cx i

increaseIdsCriteria :: Criteria -> Int -> Criteria
increaseIdsCriteria (Limit j r b s) i = Limit (j + i) r b s
increaseIdsCriteria (PropVariableCriteria j) i = PropVariableCriteria (j + i)
increaseIdsCriteria c _ = c

increaseIdsTarget :: Target -> Int -> Target
increaseIdsTarget (Go c r) i = Go (c + i) r
increaseIdsTarget (GoReturn c r) i = GoReturn (c + i) r
increaseIdsTarget (PropVariableTarget j b) i = PropVariableTarget (j + i) b
increaseIdsTarget t _ = t

limitIds' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [Int]
limitIds' acc n = concat $ map (limitIdsChain . map acc . snd) (Map.elems n)


limitIdsChain :: Chain -> [Int]
limitIdsChain [] = []
limitIdsChain ((Rule c _ _):rx) = limitIdsCriteria c ++ limitIdsChain rx

limitIdsCriteria :: [Criteria] -> [Int]
limitIdsCriteria [] = []
limitIdsCriteria (Limit i _ _ _:cx) = i:limitIdsCriteria cx
limitIdsCriteria (_:cx) = limitIdsCriteria cx

propVariableIds' :: (r -> Rule) ->  Map.Map ChainId (String, [r]) -> [Int]
propVariableIds' acc n = concat $ map (propVariableIdsChain . map acc . snd) (Map.elems n)

propVariableIdsChain :: Chain -> [Int]
propVariableIdsChain [] = []
propVariableIdsChain ((Rule c t _):rx) = propVariableIdsCriteria c ++ (MB.maybeToList . propVariableIdsTarget $ t)  ++ propVariableIdsChain rx

propVariableIdsCriteria :: [Criteria] -> [Int]
propVariableIdsCriteria [] = []
propVariableIdsCriteria (PropVariableCriteria i:cx) = i:propVariableIdsCriteria cx
propVariableIdsCriteria (_:cx) = propVariableIdsCriteria cx

propVariableIdsTarget :: Target -> Maybe Int
propVariableIdsTarget (PropVariableTarget i _) = Just i
propVariableIdsTarget _ = Nothing


--Given a IdNameChain and a list of ids, returns a new IdNameChain with only the IdNameChain with those ids, and all IdNameChain's that can be reached
--from one of them through some sequence of Go/GoReturn's
reduceReferenced' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> [ChainId] -> Map.Map ChainId (String, [r])
reduceReferenced' acc n i = foldr (Map.union) Map.empty $ (map (reduceReferenced'' acc n) i)

reduceReferenced'' :: (r -> Rule) -> Map.Map ChainId (String, [r]) -> ChainId -> Map.Map ChainId (String, [r])
reduceReferenced'' acc x i =
    let
    (n, c) = MB.fromJust $ Map.lookup i x
    t = MB.catMaybes . map targetToChainIds . map (\x -> targets . acc $ x) $ c
    in
    Map.union (foldr (Map.union) Map.empty (map (reduceReferenced'' acc  x) t)) (Map.fromList [(i, (n, c))])