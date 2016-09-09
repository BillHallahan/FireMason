module NameIdChain (IdNameChain, addChain, lookupNameChain, lookupChain, lookupName, lookupEquivalent, switchChains, chains, names, namesChains, validIds, idsWithName,
    increaseIndexes, reduceReferenced, notTopLevelChains, topLevelChains, topLevelJumpingTo, maxId,
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
                       , switchChains :: (Chain -> Chain) -> ChainId -> IdNameChain
                       , chains :: [Chain]
                       , names :: [String]
                       , namesChains :: [(String, Chain)]
                       , validIds :: [ChainId]
                       , idsWithName :: String -> [ChainId]
                       , increaseIndexes :: Int -> IdNameChain
                       , reduceReferenced :: [ChainId] -> IdNameChain
                       , notTopLevelChains :: [ChainId]
                       , topLevelChains :: [ChainId]
                       , topLevelJumpingTo :: [ChainId] -> [ChainId]
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
        sC = 
            (\f i->
                let
                    equiv = lEquiv i
                    m'' = foldr (\i' l -> Map.adjust (\(s, c) -> (s, f c)) i' l) m equiv
                in
                pathSimplification2 m''
            )
        chs = map (snd) (Map.elems m)
        ns = map (fst) (Map.elems m)
        idsName = (\s -> Map.keys $ Map.filter (\x -> s == fst x) m)
        incr = (\i -> pathSimplification2 $ increaseIndexes' m i)
        redRef = (\i -> pathSimplification2 $ reduceReferenced' m i)
        topJ = (\i -> topLevelJumpingTo' m i)
        mI' = maximum . Map.keys $ m
        mL = maximum . labels $ m
        merge = (\m' -> pathSimplification2 $ Map.union m m')
        u = (\m' -> mergeWithMap m' m)
    in
    INC {addChain = add
         , lookupNameChain = (flip Map.lookup) m
         , lookupChain = lC
         , lookupName = lN
         , lookupEquivalent = lEquiv
         , switchChains = sC
         , chains = chs
         , names = ns
         , namesChains = Map.elems m
         , validIds = Map.keys m
         , idsWithName = idsName
         , increaseIndexes = incr
         , reduceReferenced = redRef
         , topLevelChains = topLevelChains' m
         , notTopLevelChains = notTopLevelChains' m
         , topLevelJumpingTo = topJ
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
    --(NameIdChain s ch simplified):newChains ++ pathSimplification' cx m (ch + 1 + length newChains)

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

--Returns a list of all top level chains from which it is eventually possible to reach one of the chains with the given ids
topLevelJumpingTo' :: Map.Map ChainId (String, Chain) -> [ChainId] -> [ChainId]
topLevelJumpingTo' _ [] = []
topLevelJumpingTo' n (i:ix) = union (topLevelJumpingTo'' n i) (topLevelJumpingTo' n ix)

topLevelJumpingTo'' :: Map.Map ChainId (String, Chain) -> ChainId -> [ChainId]
topLevelJumpingTo'' n i = filter (\c -> i `elem` (Map.keys $ reduceReferenced' n [c])) (topLevelChains' n)



idsWithName' :: String -> Map.Map ChainId (String, Chain) -> [ChainId]
idsWithName' s n = Map.keys $ Map.filter (\x -> s == fst x) n

increaseIndexes' :: Map.Map ChainId (String, Chain) -> Int -> Map.Map ChainId (String, Chain)
increaseIndexes' x j = Map.mapKeys (j +) $ Map.map (\(n, c) -> (n, increaseIndexesChain c j)) x

increaseIndexesChain :: Chain -> Int -> Chain
increaseIndexesChain [] _ = []
increaseIndexesChain ((Rule c t l):cx) i = (Rule c (map (flip increaseIndexesTarget i) t) l):increaseIndexesChain cx i

increaseIndexesTarget :: Target -> Int -> Target
increaseIndexesTarget (Go c r) i = Go (c + i) r
increaseIndexesTarget (GoReturn c r) i = GoReturn (c + i) r
increaseIndexesTarget t _ = t

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