module NameIdChain (IdNameChain, addChain, lookupNameChain, lookupChain, lookupName, lookupEquivalent
    , allChainEquivalents, switchChains, addRuleToChains, chains, names, namesChains, validIds, idsWithName,
    increaseIds, reduceReferenced, notTopLevelChains, topLevelChains, topLevelJumpingTo, limits, limitIds, maxId,
    maxLabel, setUnion, toList', jumpedToWithCriteria, pathSimplification2, pathSimplification2') where
--This is to convert all jumps/gotos/returns to the type Go Int Int,
--which also requires appropriately duplicating chains

import Data.List
import qualified Data.Map.Strict as Map
import qualified Data.Maybe as MB
import Types

import Debug.Trace

data IdNameChain =  INC {addChain :: String -> IdNameChain
                       , lookupNameChain :: ChainId -> Maybe (String, Chain)
                       , lookupChain :: ChainId -> Maybe Chain
                       , lookupName :: ChainId -> Maybe String
                       , lookupEquivalent :: ChainId -> [ChainId]
                       , allChainEquivalents :: [[ChainId]]
                       , switchChains :: (Chain -> Chain) -> ChainId -> IdNameChain
                       , addRuleToChains :: Rule -> ChainId -> Int -> IdNameChain 
                       , chains :: [Chain]
                       , names :: [String]
                       , namesChains :: [(String, Chain)]
                       , validIds :: [ChainId]
                       , idsWithName :: String -> [ChainId]
                       , increaseIds :: Int -> IdNameChain
                       , reduceReferenced :: [ChainId] -> IdNameChain
                       , notTopLevelChains :: [ChainId]
                       , topLevelChains :: [ChainId]
                       , topLevelJumpingTo :: [ChainId] -> [ChainId]
                       , limits :: Int -> Maybe [(ChainId, Int)]
                       , limitIds :: [Int]
                       , maxId :: ChainId
                       , maxLabel :: Label
                       , mergeWithMap :: Map.Map ChainId (String, Chain) -> IdNameChain
                       , setUnion :: IdNameChain -> IdNameChain
                       , toList' :: [(ChainId, (String, Chain))]
                     }

pathSimplification2 :: Map.Map ChainId (String, Chain) -> IdNameChain
pathSimplification2 m =
    let
        add = 
            (\s ->
                if s `elem` ns then
                    error "Can't insert a new chain with an existing name"
                else
                    pathSimplification2 $ Map.insert (mI' + 1) (s, []) m
            )
        lC = (\i -> pure (snd) <*> Map.lookup i m)
        lN = (\i -> pure (fst) <*> Map.lookup i m)
        lEquiv = 
            (\i -> 
                if MB.isJust $ Map.lookup i m then 
                    Map.keys $ Map.filter (\(s', _) -> s' == (fst. MB.fromJust $ Map.lookup i m)) m 
                else []
            )
        allEquiv = (map (idsName) ns)
        sC = 
            (\f i->
                let
                    equiv = lEquiv i
                    m'' = foldr (\i' l -> Map.adjust (\(s, c) -> (s, f c)) i' l) m equiv
                in
                pathSimplification2 m''
            )
        addR = let
                    addRule :: Rule -> Int -> Chain -> Chain
                    addRule r i c = let (c', c'') = splitAt i c in c' ++ r:c''
                in
                (\r' ch i' ->  sC (addRule r' i') ch)

        chs = map (snd) (Map.elems m)
        ns = map (fst) (Map.elems m)
        idsName = (\s -> Map.keys $ Map.filter (\x -> s == fst x) m)
        incr = (\i -> pathSimplification2 $ increaseIds' m i)
        redRef = (\i -> pathSimplification2 $ reduceReferenced' m i)
        topJ = (\i -> topLevelJumpingTo' m i)
        lims = \i -> Map.lookup i (limitsMap m)
        mI' = maximum (Map.keys m ++ limitIds' m ++ propVariableIds' m)
        mL = maximum . labels $ m
        merge = (\m' -> pathSimplification2 $ Map.union m m')
        u = (\m' -> mergeWithMap m' m)
    in
    INC {addChain = add
         , lookupNameChain = (flip Map.lookup) m
         , lookupChain = lC
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
         , topLevelChains = topLevelChains' m
         , notTopLevelChains = notTopLevelChains' m
         , topLevelJumpingTo = topJ
         , limits = lims
         , limitIds = limitIds' m
         , maxId = mI'
         , maxLabel = mL
         , mergeWithMap = merge
         , setUnion = u
         , toList' = Map.toList m
        }

pathSimplification2' :: Map.Map String Chain -> IdNameChain
pathSimplification2' m = pathSimplification2 . pathSimplification $ m

pathSimplification :: Map.Map String Chain -> Map.Map ChainId (String, Chain) 
pathSimplification m =
    let
        init = map (\s -> (s, MB.fromJust (Map.lookup s m))) ["INPUT", "OUTPUT", "FORWARD"]
    in
    pathSimplification' init m 0


pathSimplification' :: [(String, Chain)] -> Map.Map String Chain -> ChainId -> Map.Map ChainId (String, Chain)
pathSimplification' [] _ _ = Map.empty
pathSimplification' ((s, c):cx) m ch =
    let
        (simplified, newChains) = pathSimplificationChain c m ch 0
        newMap = Map.insert ch (s, simplified) (pathSimplification' cx m (ch + 1 + length newChains))
    in
    Map.union newChains newMap

pathSimplificationChain :: Chain -> Map.Map String Chain -> ChainId-> Int -> (Chain, Map.Map ChainId (String, Chain))
pathSimplificationChain [] _ _ _ = ([], Map.empty)
pathSimplificationChain (r:rx) m ch ru =
    let
        (c, ic) = pathSimplificationChain rx m ch (ru + 1)
        (newTargets, ic') = pathSimplificationTargets (targets r) m (ch + length ic) ru 
    in
    ((Rule (criteria r) newTargets (label r)):c, Map.union ic ic')


pathSimplificationTargets :: [Target] -> Map.Map String Chain -> ChainId -> Int  -> ([Target], Map.Map ChainId (String, Chain))
pathSimplificationTargets [] _ _ _ = ([], Map.empty)
pathSimplificationTargets (t:ts) m ch r =
    let
        (t', ic) = pathSimplificationTarget t m ch r
        (t'', ic') = pathSimplificationTargets ts m (ch + length ic) r
    in
    (t':t'', Map.union ic ic')

pathSimplificationTarget :: Target -> Map.Map String Chain -> ChainId -> Int -> (Target, Map.Map ChainId (String, Chain))
pathSimplificationTarget (Jump j) m ch _ = 
    let
        chain = MB.fromJust (Map.lookup j m) 
    in
        (Go (ch + 1) 0, pathSimplification' [(j, chain)] m (ch + 1))
pathSimplificationTarget (GoTo g) m ch _ = 
    let
        chain = MB.fromJust (Map.lookup g m) 
    in
        (GoReturn (ch + 1) 0, pathSimplification' [(g, chain)] m (ch + 1))
pathSimplificationTarget t _ _ _ = (t, Map.empty)

labels :: Map.Map ChainId (String, Chain) -> [Label]
labels n = map (label) $ concat (map (snd) (Map.elems n))

--Returns a list of the top level chains (that is, the chains a packet must start in, and can't reach through a jump/goto)
topLevelChains' :: Map.Map ChainId (String, Chain) -> [ChainId]
topLevelChains' n = 
    let
        goes = concat $ map (\(_, (_, c)) -> jumpedTo c) (Map.toList n)
    in
    filter (\x -> not $ x `elem` goes) (Map.keys n)

notTopLevelChains' :: Map.Map ChainId (String, Chain) -> [ChainId]
notTopLevelChains' n =
    let
        top = topLevelChains' n
    in
    filter (\x -> not $ x `elem` top) (Map.keys n)

--Given a chain, returns all ints in Go or GoReturn, along with accompanying criteria
jumpedToWithCriteria :: Chain -> [([Criteria], ChainId)]
jumpedToWithCriteria [] = []
jumpedToWithCriteria (r:rx) = 
    let
        goes = map (\t -> (criteria r, t)) (targetsToChainIds (targets r))
    in
    goes ++ jumpedToWithCriteria rx

jumpedTo :: Chain -> [ChainId]
jumpedTo t = map (snd) (jumpedToWithCriteria t)



limitsMap :: Map.Map ChainId (String, Chain) -> Map.Map Int [(ChainId, Int)]
limitsMap n = 
    let
        top = topLevelChains' n
    in
    limitsMapChains n $ map (\t -> (t, snd . MB.fromJust . Map.lookup t $ n)) top

limitsMapChains :: Map.Map ChainId (String, Chain) -> [(ChainId, Chain)] -> Map.Map Int [(ChainId, Int)]
limitsMapChains _ [] = Map.fromList []
limitsMapChains n ((i, c):xs) = Map.unionWith (++) (limitsMapRules n i (zip [0..] c)) (limitsMapChains n xs)

limitsMapRules :: Map.Map ChainId (String, Chain) ->  ChainId -> [(Int, Rule)] -> Map.Map Int [(ChainId, Int)]
limitsMapRules _ _ [] = Map.fromList []
limitsMapRules n i ((r', r):rs) = 
    let
        u = Map.unionWith (++) (limitsMapCriteria n i r' . criteria $ r) (limitsMapTargets n i r' . targets $ r)
    in
    Map.unionWith (++) u (limitsMapRules n i rs)

limitsMapCriteria :: Map.Map ChainId (String, Chain) ->  ChainId -> Int -> [Criteria] -> Map.Map Int [(ChainId, Int)]
limitsMapCriteria _ _ _ [] = Map.fromList []
limitsMapCriteria n ch r (Limit i _ _ :cs) = Map.unionWith (++) (Map.fromList [(i, [(ch, r)])]) (limitsMapCriteria n ch r cs)
limitsMapCriteria n ch r (Not (Limit i _ _) :cs) = Map.unionWith (++) (Map.fromList [(i, [(ch, r)])]) (limitsMapCriteria n ch r cs)
limitsMapCriteria n ch r (_:cs) = limitsMapCriteria n ch r cs

limitsMapTargets :: Map.Map ChainId (String, Chain) ->  ChainId -> Int -> [Target] -> Map.Map Int [(ChainId, Int)]
limitsMapTargets _ _ _ [] = Map.fromList []
limitsMapTargets n _ _ (Go ch r:ts) = 
    let
        c = snd . MB.fromJust . Map.lookup ch $ n
    in
    Map.unionWith (++) (limitsMapRules n ch (zip [0..] c)) (limitsMapTargets n ch r ts)
limitsMapTargets n _ _ (GoReturn ch r:ts) = 
    let
        c = snd . MB.fromJust . Map.lookup ch $ n
    in
    Map.unionWith (++) (limitsMapRules n ch (zip [0..] c)) (limitsMapTargets n ch r ts)
limitsMapTargets n ch r (t:ts) = limitsMapTargets n ch r ts

--Returns a list of all top level chains from which it is eventually possible to reach one of the chains with the given ids
topLevelJumpingTo' :: Map.Map ChainId (String, Chain) -> [ChainId] -> [ChainId]
topLevelJumpingTo' _ [] = []
topLevelJumpingTo' n (i:ix) = union (topLevelJumpingTo'' n i) (topLevelJumpingTo' n ix)

topLevelJumpingTo'' :: Map.Map ChainId (String, Chain) -> ChainId -> [ChainId]
topLevelJumpingTo'' n i = filter (\c -> i `elem` (Map.keys $ reduceReferenced' n [c])) (topLevelChains' n)



idsWithName' :: String -> Map.Map ChainId (String, Chain) -> [ChainId]
idsWithName' s n = Map.keys $ Map.filter (\x -> s == fst x) n

increaseIds' :: Map.Map ChainId (String, Chain) -> Int -> Map.Map ChainId (String, Chain)
increaseIds' x j = Map.mapKeys (j +) $ Map.map (\(n, c) -> (n, increaseIdsChain c j)) x

increaseIdsChain :: Chain -> Int -> Chain
increaseIdsChain [] _ = []
increaseIdsChain ((Rule c t l):cx) i = (Rule (map (flip increaseIdsCriteria i) c) (map (flip increaseIdsTarget i) t) l):increaseIdsChain cx i

increaseIdsCriteria :: Criteria -> Int -> Criteria
increaseIdsCriteria (Limit j r b) i = Limit (j + i) r b
increaseIdsCriteria (PropVariableCriteria j) i = PropVariableCriteria (j + i)
increaseIdsCriteria c _ = c

increaseIdsTarget :: Target -> Int -> Target
increaseIdsTarget (Go c r) i = Go (c + i) r
increaseIdsTarget (GoReturn c r) i = GoReturn (c + i) r
increaseIdsTarget (PropVariableTarget j b) i = PropVariableTarget (j + i) b
increaseIdsTarget t _ = t

limitIds' :: Map.Map ChainId (String, Chain) -> [Int]
limitIds' n = concat $ map (limitIdsChain . snd) (Map.elems n)

limitIdsChain :: Chain -> [Int]
limitIdsChain [] = []
limitIdsChain ((Rule c _ _):rx) = limitIdsCriteria c ++ limitIdsChain rx

limitIdsCriteria :: [Criteria] -> [Int]
limitIdsCriteria [] = []
limitIdsCriteria (Limit i _ _:cx) = i:limitIdsCriteria cx
limitIdsCriteria (_:cx) = limitIdsCriteria cx

propVariableIds' :: Map.Map ChainId (String, Chain) -> [Int]
propVariableIds' n = concat $ map (propVariableIdsChain . snd) (Map.elems n)

propVariableIdsChain :: Chain -> [Int]
propVariableIdsChain [] = []
propVariableIdsChain ((Rule c t _):rx) = propVariableIdsCriteria c ++ propVariableIdsTarget t  ++ propVariableIdsChain rx

propVariableIdsCriteria :: [Criteria] -> [Int]
propVariableIdsCriteria [] = []
propVariableIdsCriteria (PropVariableCriteria i:cx) = i:propVariableIdsCriteria cx
propVariableIdsCriteria (_:cx) = propVariableIdsCriteria cx

propVariableIdsTarget :: [Target] -> [Int]
propVariableIdsTarget [] = []
propVariableIdsTarget (PropVariableTarget i _:cx) = i:propVariableIdsTarget cx
propVariableIdsTarget (_:cx) = propVariableIdsTarget cx


--Given a IdNameChain and a list of ids, returns a new IdNameChain with only the IdNameChain with those ids, and all IdNameChain's that can be reached
--from one of them through some sequence of Go/GoReturn's
reduceReferenced' :: Map.Map ChainId (String, Chain) -> [ChainId] -> Map.Map ChainId (String, Chain)
reduceReferenced' n i = foldr (Map.union) Map.empty $ (map (reduceReferenced'' n) i)

reduceReferenced'' :: Map.Map ChainId (String, Chain) -> ChainId -> Map.Map ChainId (String, Chain)
reduceReferenced'' x i =
    let
    (n, c) = MB.fromJust $ Map.lookup i x
    t = targetsToChainIds . concat $ map (\x -> targets x) c
    in
    Map.union (foldr (Map.union) Map.empty (map (reduceReferenced'' x) t)) (Map.fromList [(i, (n, c))])