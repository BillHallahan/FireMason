{-# LANGUAGE FlexibleInstances #-}


module ChainsToSMT where

import Data.List
import Data.Maybe
import Control.Applicative
import Z3.Monad

import NameIdChain
import Types

import Debug.Trace

makeTargetDatatype :: Z3 Sort
makeTargetDatatype = do
    accept <- mkStringSymbol "ACCEPT"
    isAccept <- mkStringSymbol "is-ACCEPT"
    acceptCon <- mkConstructor accept isAccept []

    drop <- mkStringSymbol "DROP"
    isDrop <- mkStringSymbol "is-DROP"
    dropCon <- mkConstructor drop isDrop []

    return <- mkStringSymbol "RETURN"
    isReturn <- mkStringSymbol "is-RETURN"
    returnCon <- mkConstructor return isReturn []

    intSort <- mkIntSort

    go <- mkStringSymbol "GO"
    isGo <- mkStringSymbol "is-GO"
    chain <- mkStringSymbol "chain"
    rule <- mkStringSymbol "rule"
    goCon <- mkConstructor go isGo [(chain, Just intSort, 0), (rule, Just intSort, 0)]

    goReturn <- mkStringSymbol "GORETURN"
    isGoReturn <- mkStringSymbol "is-GORETURN"
    chainR <- mkStringSymbol "chainR"
    ruleR <- mkStringSymbol "ruleR"
    goreturnCon <- mkConstructor goReturn isGoReturn [(chainR, Just intSort, 0), (ruleR, Just intSort, 0)]

    none <- mkStringSymbol "NONE"
    isNone <- mkStringSymbol "is-NONE"
    noneCon <- mkConstructor none isNone []

    target <- mkStringSymbol "Target"

    mkDatatype target [acceptCon, dropCon, returnCon, goCon, goreturnCon, noneCon]

targetDataRecognizer :: Int -> Z3 AST
targetDataRecognizer i = do
    t <- makeTargetDatatype
    cons <- getDatatypeSortConstructors t
    let a = cons !! i
    mkApp a []

acceptAST :: Z3 AST
acceptAST = do
    targetDataRecognizer 0

dropAST :: Z3 AST
dropAST = do
    targetDataRecognizer 1

returnAST :: Z3 AST
returnAST = do
    targetDataRecognizer 2

goAST :: AST -> AST -> Z3 AST
goAST ch r = do
    t <- makeTargetDatatype
    cons <- getDatatypeSortConstructors t
    let a = cons !! 3
    mkApp a [ch, r]

goreturnAST :: AST -> AST -> Z3 AST
goreturnAST ch r = do
    t <- makeTargetDatatype
    cons <- getDatatypeSortConstructors t
    let a = cons !! 4
    mkApp a [ch, r]

noneAST :: Z3 AST
noneAST = do
    targetDataRecognizer 5

intIntIntBoolAST :: String -> AST -> AST -> AST -> Z3 AST
intIntIntBoolAST s i1 i2 i3 = do
    intSort <- mkIntSort
    boolSort <- mkBoolSort
    s' <- mkStringSymbol s
    dec <- mkFuncDecl s' [intSort, intSort, intSort] boolSort
    mkApp dec [i1, i2, i3]

intIntBoolAST :: String -> AST -> AST -> Z3 AST
intIntBoolAST s i1 i2 = do
    intSort <- mkIntSort
    boolSort <- mkBoolSort
    s' <- mkStringSymbol s
    dec <- mkFuncDecl s' [intSort, intSort] boolSort
    mkApp dec [i1, i2]

intBoolAST :: String -> AST -> Z3 AST
intBoolAST s i = do
    intSort <- mkIntSort
    boolSort <- mkBoolSort
    s' <- mkStringSymbol s
    dec <- mkFuncDecl s' [intSort] boolSort
    mkApp dec [i]

intIntBoolFuncDecl :: String -> Z3 FuncDecl
intIntBoolFuncDecl s = do
    intSort <- mkIntSort
    boolSort <- mkBoolSort
    s' <- mkStringSymbol s
    mkFuncDecl s' [intSort, intSort] boolSort

intIntIntIntIntFuncDecl :: String -> Z3 FuncDecl
intIntIntIntIntFuncDecl s = do
    intSort <- mkIntSort
    s' <- mkStringSymbol s
    mkFuncDecl s' [intSort, intSort, intSort, intSort] intSort

intIntIntIntFuncDecl :: String -> Z3 FuncDecl
intIntIntIntFuncDecl s = do
    intSort <- mkIntSort
    s' <- mkStringSymbol s
    mkFuncDecl s' [intSort, intSort, intSort] intSort

intIntIntFuncDecl :: String -> Z3 FuncDecl
intIntIntFuncDecl s = do
    intSort <- mkIntSort
    s' <- mkStringSymbol s
    mkFuncDecl s' [intSort, intSort] intSort

intIntFuncDecl :: String -> Z3 FuncDecl
intIntFuncDecl s = do
    intSort <- mkIntSort
    s' <- mkStringSymbol s
    mkFuncDecl s' [intSort] intSort

intIntAST :: String -> AST -> Z3 AST
intIntAST s i = do
    intSort <- mkIntSort
    s' <- mkStringSymbol s
    dec <- mkFuncDecl s' [intSort] intSort
    mkApp dec [i]

propVariableAST :: Int -> AST -> Z3 AST
propVariableAST v i = intBoolAST ("v" ++ show v) i

maxAST :: AST -> AST -> Z3 AST
maxAST i j = do
    comp <- mkGe i j
    mkIte comp i j

minAST :: AST -> AST -> Z3 AST
minAST i j = do
    comp <- mkLe i j
    mkIte comp i j

matchesCriteria :: AST -> AST -> AST -> Z3 AST
matchesCriteria p c r = intIntIntBoolAST "matches-criteria" p c r

ruleTarget :: AST -> AST -> Z3 AST
ruleTarget c r = do
    intSort <- mkIntSort
    t <- makeTargetDatatype
    ruleTarget <- mkStringSymbol "rule-target"
    dec <- mkFuncDecl ruleTarget [intSort, intSort] t
    mkApp dec [c, r]

arrivalTime :: AST -> Z3 AST
arrivalTime  p = intIntAST "arrival-time" p

limitInitial :: AST -> Z3 AST
limitInitial i = intIntAST "limit-initial" i

reaches :: AST -> AST -> AST -> Z3 AST
reaches p c r = intIntIntBoolAST "reaches" p c r

reachesReturn :: AST -> AST -> AST -> Z3 AST
reachesReturn p c r = intIntIntBoolAST "reaches-return" p c r

reachesEnd :: AST -> AST -> Z3 AST
reachesEnd p c = intIntBoolAST "reaches-end" p c

returnsFrom :: AST -> AST -> Z3 AST
returnsFrom p c = intIntBoolAST "reaches-return" p c

limitFuncAST :: AST -> AST -> AST -> AST -> Z3 AST
limitFuncAST i p c r = do
    intSort <- mkIntSort
    s' <- mkStringSymbol "limit"
    dec <- mkFuncDecl s' [intSort, intSort, intSort, intSort] intSort
    mkApp dec [i, p, c, r]

policy :: AST -> Z3 AST
policy c = do
    intSort <- mkIntSort
    t <- makeTargetDatatype
    ruleTarget <- mkStringSymbol "policy"
    dec <- mkFuncDecl ruleTarget [intSort] t
    mkApp dec [c]

numOfPacketsConst :: Z3 AST
numOfPacketsConst = do
    intSort <- mkIntSort
    numOfPackets <- mkStringSymbol "num-of-packets"
    mkConst numOfPackets intSort

numOfChainsConst :: Z3 AST
numOfChainsConst = do
    intSort <- mkIntSort
    numOfChains <- mkStringSymbol "num-of-chains"
    mkConst numOfChains intSort

chainLength :: AST -> Z3 AST
chainLength c = do
    intSort <- mkIntSort
    chainLength <- mkStringSymbol "chain-length"
    dec <- mkFuncDecl chainLength [intSort] intSort
    mkApp dec [c]

terminatesWith :: AST -> Z3 AST
terminatesWith p = do
    intSort <- mkIntSort
    t <- makeTargetDatatype
    terminatesWith <- mkStringSymbol "terminates-with"
    dec <- mkFuncDecl terminatesWith [intSort] t
    mkApp dec [p]

topLevelChain :: AST -> Z3 AST
topLevelChain c = intBoolAST "top-level-chain" c

--see: http://stackoverflow.com/questions/7740556/equivalent-of-define-fun-in-z3-api
validChain :: AST -> Z3 AST
validChain c = do
    intSort <- mkIntSort

    nCh <- numOfChainsConst

    z <- mkInt 0 intSort

    l <- mkLe z c
    g <- mkLt c nCh
    
    mkAnd [l, g]

validRule :: AST -> AST -> Z3 AST
validRule c r = do
    intSort <- mkIntSort

    vC <- validChain c
    cL <- chainLength c

    z <- mkInt 0 intSort

    l <- mkLe z r
    g <- mkLt r cL

    mkAnd[vC, l, g]

matchesRule :: AST -> AST -> AST -> Z3 AST
matchesRule p c r = do
    vR <- validRule c r
    mC <- matchesCriteria p c r
    re <- reaches p c r

    mkAnd [vR, mC, re]

terminating :: AST -> Z3 AST
terminating t = do
    isA <- acceptAST
    eqA <- mkEq isA t
    isD <- dropAST
    eqD <- mkEq isD t

    mkOr [eqA, eqD]

terminatesAt :: AST -> AST -> AST -> Z3 AST
terminatesAt p c r = do
    vR <- validRule c r
    mR <- matchesRule p c r
    rT <- ruleTarget c r
    t <- terminating rT
    mkAnd [vR, mR, t]

reachesTopLevelChain :: AST -> AST -> Z3 AST
reachesTopLevelChain p c = do
    intSort <- mkIntSort
    z <- mkInt 0 intSort

    vC <- validChain c
    tLC <- topLevelChain c
    re <- reaches p c z

    mkAnd [vC, tLC, re]

--For each pair of top level chains, we assert that each packet can be in only one
onlyOneTopLevel :: AST -> [AST] -> Z3 ()
onlyOneTopLevel _ [] = return ()
onlyOneTopLevel p (c:cx) = do
    onlyOneTopLevel' p c cx
    onlyOneTopLevel p cx

onlyOneTopLevel' :: AST -> AST -> [AST] -> Z3 ()
onlyOneTopLevel' _ _ [] = return ()
onlyOneTopLevel' p c (c':cx) = do
    intSort <- mkIntSort
    z <- mkInt 0 intSort

    re <- reaches p c z
    re' <- mkNot =<< reaches p c' z

    assert =<< mkImplies re re'

topLevelPolicy :: AST -> AST -> Z3 () 
topLevelPolicy p c = do
    re <- reachesEnd p c

    pol <- policy c
    term <- terminatesWith p
    e <- mkEq pol term

    assert =<< (mkImplies re e)

notTopLevelPolicy :: AST -> Z3 ()
notTopLevelPolicy c = do
    none <- noneAST
    pol <- policy c

    assert =<< (mkEq pol none)

setupChain :: AST -> AST -> Z3 ()
setupChain p c = do
    notOverChainEnd p c
    setReachesEnd p c
    setReturnsFrom p c

notOverChainEnd :: AST -> AST -> Z3 ()
notOverChainEnd p c = do
    intSort <- mkIntSort
    o <- mkInt 1 intSort

    cLen <- chainLength c
    cLenP <- mkAdd [cLen, o]
    re <- mkNot =<< reaches p c cLenP

    assert re

setReachesEnd :: AST -> AST -> Z3 ()
setReachesEnd p c = do
    cLen <- chainLength c
    re <- reaches p c cLen
    reEnd <- reachesEnd p c

    assert =<< mkEq re reEnd

setReturnsFrom :: AST -> AST -> Z3 ()
setReturnsFrom p c = do
    retFrom <- returnsFrom p c

    reReturn <- returnsFrom p c
    reEnd <- reachesEnd p c
    or' <- mkOr [reReturn, reEnd]

    assert =<< mkEq retFrom or'

reachesNoneTarget :: AST -> AST -> AST -> Z3 ()
reachesNoneTarget p c r = do
    re <- reaches p c r
    
    intSort <- mkIntSort
    o <- mkInt 1 intSort
    r' <- mkAdd [r, o]
    re' <- reaches p c r'

    assert =<< mkImplies re re'

reachesMatchesTerminating :: AST -> AST -> AST -> AST -> Z3 ()
reachesMatchesTerminating p c r t = do
    mR <- matchesRule p c r

    intSort <- mkIntSort
    o <- mkInt 1 intSort
    r' <- mkAdd [r, o]
    notReaches <- mkNot =<< reaches p c r'

    notRet <- mkNot =<< returnsFrom p c

    tW <- terminatesWith p
    e <- mkEq tW t

    and' <- mkAnd [notReaches, notRet, e]

    assert =<< mkImplies mR and'

reachesMatchesReturn :: AST -> AST -> AST -> Z3 ()
reachesMatchesReturn p c r = do
    mR <- matchesRule p c r

    intSort <- mkIntSort
    o <- mkInt 1 intSort
    r' <- mkAdd [r, o]
    notRe <- mkNot =<< reaches p c r'

    rF <- returnsFrom p c

    and' <- mkAnd [notRe, rF]

    assert =<< mkImplies mR and'

reachesMatchesGo :: AST -> AST -> AST -> AST -> AST -> Z3 ()
reachesMatchesGo p c r goC goR = do
    mR <- matchesRule p c r

    intSort <- mkIntSort
    o <- mkInt 1 intSort
    r' <- mkAdd [r, o]
    re <- reaches p c r'

    retF <- returnsFrom p goC

    e <- mkEq re retF

    re' <- reaches p goC goR

    and' <- mkAnd [re', e]

    assert =<< mkImplies mR and'


reachesMatchesGoReturn :: AST -> AST -> AST -> AST -> AST -> Z3 ()
reachesMatchesGoReturn p c r goC goR = do
    mR <- matchesRule p c r

    intSort <- mkIntSort
    o <- mkInt 1 intSort
    r' <- mkAdd [r, o]
    notRe <- mkNot =<< reaches p c r'

    retF <- returnsFrom p goC
    retF' <- returnsFrom p c

    e <- mkEq retF retF'

    re' <- reaches p goC goR

    and' <- mkAnd [re', notRe, e]

    assert =<< mkImplies mR and'

notMatchesGo :: AST -> AST -> AST -> AST -> AST -> Z3 ()
notMatchesGo p c r goC goR = do
    notMR <- mkNot =<< matchesRule p c r
    notRe <- mkNot =<< reaches p goC goR

    assert =<< mkImplies notMR notRe

reachesPrior :: AST -> AST -> AST -> Z3 ()
reachesPrior p c r = do
    intSort <- mkIntSort
    o <- mkInt 1 intSort

    re <- reaches p c r
    rMinus <- mkSub [r, o]
    rePrev <- reaches p c rMinus

    le <- mkLe o r

    a <- mkAnd [le, re]

    assert =<< mkImplies a rePrev

reachesNextNotMatches :: AST -> AST -> AST -> Z3 ()
reachesNextNotMatches p c r = do
    intSort <- mkIntSort
    o <- mkInt 1 intSort

    re <- reaches p c r
    notMC <- mkNot =<< matchesCriteria p c r

    rPlus <- mkAdd [r, o]
    reNext <- reaches p c rPlus


    a <- mkAnd [re, notMC]

    assert =<< mkImplies a reNext

reachesNextNoneTarget :: AST -> AST -> AST -> Z3 ()
reachesNextNoneTarget p c r = do
    intSort <- mkIntSort
    o <- mkInt 1 intSort

    re <- reaches p c r

    rT <- ruleTarget c r
    none <- noneAST
    noneTarget <- mkEq rT none

    rPlus <- mkAdd [r, o]
    reNext <- reaches p c rPlus


    a <- mkAnd [re, noneTarget]

    assert =<< mkImplies a reNext

arrivalTimeNonNegative:: AST -> Z3 ()
arrivalTimeNonNegative p = do
    intSort <- mkIntSort
    z <- mkInt 0 intSort
    aT <- arrivalTime p
    assert =<< mkGe aT z

intSortList :: [Int] -> Z3 [AST]
intSortList s = do
    intSort <- mkIntSort
    sequence (map (\x -> mkInt x intSort) s)

toSMTPathChain :: IdNameChainType r -> [r] -> ChainId -> RuleInd -> Int -> Z3 ()
toSMTPathChain _ [] ch r pN = return ()
toSMTPathChain n (c:cx) ch r pN = do
    intSort <- mkIntSort
    ch' <- mkInt ch intSort
    r' <- mkInt r intSort

    toSMTPathRule (accessRules n c) ch' r' pN
    toSMTPathChain n cx ch (r + 1) pN

toSMTPathRule :: Rule -> AST -> AST -> Int -> Z3 ()
toSMTPathRule (Rule [] t _) ch r pN = toSMTPathTargets t ch r pN
toSMTPathRule (Rule c [] _) ch r pN = do
    rT <- ruleTarget ch r
    none <- noneAST
    assert =<< mkEq rT none
toSMTPathRule (Rule c t _) ch r pN = toSMTPathTargets t ch r pN

toSMTPathTargets :: [Target] -> AST -> AST -> Int -> Z3 ()
toSMTPathTargets (t:[]) ch r pN = toSMTPathTarget t ch r pN

toSMTPathTarget :: Target -> AST -> AST -> Int -> Z3 ()
toSMTPathTarget (ACCEPT) ch r pN= do
    rT <- ruleTarget ch r
    accept <- acceptAST
    assert =<< mkEq rT accept

    mapM_ (\p -> reachesMatchesTerminating p ch r accept) =<< intSortList [0..(pN - 1)]
toSMTPathTarget (DROP) ch r pN= do
    rT <- ruleTarget ch r
    drop <- dropAST
    assert =<< mkEq rT drop

    mapM_ (\p -> reachesMatchesTerminating p ch r drop) =<< intSortList [0..(pN - 1)]
toSMTPathTarget (RETURN) ch r pN= do
    rT <- ruleTarget ch r
    return <- returnAST
    assert =<< mkEq rT return

    mapM_ (\p -> reachesMatchesReturn p ch r) =<< intSortList [0..(pN - 1)]
toSMTPathTarget (Go i j) ch r pN = do
    rT <- ruleTarget ch r

    intSort <- mkIntSort
    i' <- mkInt i intSort
    j' <- mkInt j intSort

    go <- goAST i' j'

    assert =<< mkEq rT go

    mapM_ (\p -> reachesMatchesGo p ch r i' j') =<< intSortList [0..(pN - 1)]
    mapM_ (\p -> notMatchesGo p ch r i' j') =<< intSortList [0..(pN - 1)]
toSMTPathTarget (GoReturn i j) ch r pN = do
    rT <- ruleTarget ch r

    intSort <- mkIntSort
    i' <- mkInt i intSort
    j' <- mkInt j intSort

    goreturn <- goreturnAST i' j'

    assert =<< mkEq rT goreturn

    mapM_ (\p -> reachesMatchesGoReturn p ch r i' j') =<< intSortList [0..(pN - 1)]
    mapM_ (\p -> notMatchesGo p ch r i' j') =<< intSortList [0..(pN - 1)]
toSMTPathTarget (PropVariableTarget i b) ch r pN = do
    rT <- ruleTarget ch r
    none <- noneAST
    assert =<< mkEq rT none
    mapM_ (\p -> propVarDec i p b) =<< intSortList [0..(pN - 1)]
    where
        propVarDec :: Int -> AST -> Bool -> Z3 ()
        propVarDec v p b' = do
            b'' <- mkBool b

            matches <- matchesRule p ch r
            app <- propVariableAST v p
            e <- mkEq app b''

            assert =<< mkImplies matches e

toSMTPath t _ _ _ = error "Target " ++ show t ++ " not recognized."

toSMTChain :: (r -> IdNameChainType r -> AST -> AST -> Int -> Z3 ()) -> [r] -> IdNameChainType r -> ChainId -> RuleInd -> Int -> Z3 ()
toSMTChain _ [] _ _ _ _ = return ()
toSMTChain f (c:cx) n ch r pN = do
    intSort <- mkIntSort
    ch' <- mkInt ch intSort
    r' <- mkInt r intSort

    f c n ch' r' pN
    toSMTChain f cx n ch (r + 1) pN

toSMTRule :: Rule -> IdNameChain -> AST -> AST -> Int -> Z3 ()
toSMTRule (Rule [] t _) _ ch r pN = mapM_ (\p -> assert =<< matchesCriteria p ch r) =<< intSortList [0..(pN - 1)]
toSMTRule (Rule c _ _) n ch r pN = 
    mapM_ (\p -> do
            crit <- toSMTCriteriaList c (Just n) p ch r
            mC <- matchesCriteria p ch r
            assert =<< (mkEq crit mC)) =<< intSortList [0..(pN - 1)]

toSMTExample :: Maybe [Int] -> Example -> IdNameExamples -> AST -> AST -> Int -> Z3 ()
toSMTExample mi e n ch r pN
    | (null . criteria . exRule $ e) && (null . state $ e) = mapM_ (\p -> assert =<< matchesCriteria p ch r) =<< intSortList [0..(pN - 1)]
    | otherwise = 
        mapM_ (\p -> do
            crit <- if not . null . criteria . exRule $ e then toSMTCriteriaList (criteria . exRule $ e) (Just n) p ch r else mkTrue
            st <- if not . null . state $ e then toSMTStateList (state e) n mi p ch r else mkTrue
            mC <- matchesCriteria p ch r
            mA <- mkAnd [crit, st]
            assert =<< (mkEq mA mC)) =<< intSortList [0..(pN - 1)]

toSMTCriteriaList :: [Criteria] -> Maybe (IdNameChainType r) -> AST -> AST -> AST -> Z3 AST
toSMTCriteriaList c n p ch r = do
    mkAnd =<< (sequence $ map (\c' -> toSMTCriteria c' n p ch r) c)

toSMTCriteria :: Criteria -> Maybe (IdNameChainType r) -> AST -> AST -> AST -> Z3 AST
toSMTCriteria (BoolFlag f) _ p _ _ = do
    intSort <- mkIntSort
    boolSort <- mkBoolSort
    f' <- mkStringSymbol . flagToString $ f
    dec <- mkFuncDecl f' [intSort] boolSort
    intBoolAST (flagToString f) p--mkApp dec [p]
toSMTCriteria (IPAddress e i) _ p _ _ = do
    case (ipToWord . ipAddr $ i, ipMask i) of (Left b, Left m) -> ipEq b m 32
                                              (Right b, Right m) -> ipEq b m 128
    where   ipEq :: Integral a => a -> a -> Int -> Z3 AST
            ipEq b' m' l = do
                            let s = if e == Source then "source_ip" else "destination_ip"
                            pSymb <- mkStringSymbol s
                            bitSort <- mkBvSort l
                            intSort <- mkIntSort
                            b <- mkBvNum l b'
                            m <- mkBvNum l m'
                            dec <- mkFuncDecl pSymb [intSort] bitSort
                            app <- mkApp dec [p]
                            mkEq b =<< mkBvand app m
toSMTCriteria (Limit i ra b s) (Just n) p ch ru = do    
    pInt <- getInt p
    chInt <- getInt ch
    ruInt <- getInt ru

    intSort <- mkIntSort

    i' <- mkInt i intSort
    b' <- mkInt b intSort
    ra' <- mkInt ra intSort
    s' <- mkInt s intSort

    zero <- mkInt 0 intSort

    let same = case limits n i of
                    Just l -> l
                    Nothing -> error "Limit in criteria but no information in NameIdChain"
                    
    let pre = precedingLimit same (fromIntegral pInt) (fromIntegral chInt) (fromIntegral ruInt)
    (preLim, preT) <- case pre of
                    Just (preP, preCh, preR) -> do
                        preP' <- mkInt preP intSort
                        preCh' <- mkInt preCh intSort
                        preR' <- mkInt preR intSort 

                        lim <- limitFuncAST i' preP' preCh' preR'
                        aT <- arrivalTime(preP')
                        return (lim, aT)
                    Nothing ->  do
                        lim <- limitInitial i'
                        return (lim, zero)

    currT <- arrivalTime(p)

    timeDiff <- mkSub [currT, preT]
    timeDiffTimeRate <- mkMul [timeDiff, ra']

    toSMTLimit n i' ra' b' s' p ch ru preLim timeDiffTimeRate Nothing
    where   --gets the packet and limit before the current packet and limit combination
        precedingLimit :: [(ChainId, RuleInd)] -> Int -> Int -> Int -> Maybe (Int, ChainId, Int)
        precedingLimit n 0 c r =
            let 
                pos = case (c, r) `elemIndex` n of
                            Just pos' -> pos'
                            Nothing -> error "Must have information on the limit"
            in
                if pos /= 0 then Just (0, fst $ n !! (pos - 1), snd $ n !! (pos - 1)) else Nothing
        precedingLimit n p' c r =
            let 
                pos = case (c, r) `elemIndex` n of
                            Just pos' -> pos'
                            Nothing -> error "Must have information on the limit"
            in
                if pos /= 0 then Just (p', fst $ n !! (pos - 1), snd $ n !! (pos - 1)) else
                                 Just (p' - 1, fst . last $ n, snd . last $ n)
toSMTCriteria (Limit i ra b s) Nothing _ _ _ = error "Limit criteria with no NameIdChainType encountered."

toSMTCriteria (Not c) n p ch r = do
    mkNot =<< toSMTCriteria c n p ch r
toSMTCriteria (Port e (Left i)) _ p _ _ = do
    let s = if e == Source then "source_port" else "destination_port"
    intSort <- mkIntSort
    i' <- mkInt i intSort
    app <- intIntAST s p
    mkEq app i'
toSMTCriteria (Port e (Right (i, j))) _ p _ _ = do
    let s = if e == Source then "source_port" else "destination_port"
    pSymb <- mkStringSymbol s
    intSort <- mkIntSort
    i' <- mkInt i intSort
    j' <- mkInt j intSort

    dec <- mkFuncDecl pSymb [intSort] intSort
    app <- intIntAST s p

    l <- mkLe i' app
    l' <- mkLe app j' 

    mkAnd [l, l']
toSMTCriteria (Protocol i) _ p _ _ = do
    pSymb <- mkStringSymbol "protocol"
    intSort <- mkIntSort
    i' <- mkInt i intSort

    dec <- mkFuncDecl pSymb [intSort] intSort
    app <- intIntAST "protocol" p
    mkEq app i'
toSMTCriteria (PropVariableCriteria i) _ p _ _ = propVariableAST i p
toSMTCriteria c _ _ _ _ = error ("Criteria " ++ show c ++ " not recognized by SMT conversion.")

--IdNameChain -> LimitId -> Rate -> Burst -> Sub -> PacketNum -> ChainId -> RuleInd -> PreLimit -> timeDiff -> Maybe matchesOnlyIfTrue -> Z3 AST
toSMTLimit :: IdNameChainType r -> AST -> AST -> AST -> AST -> AST -> AST -> AST -> AST -> AST -> Maybe AST-> Z3 AST
toSMTLimit n i ra b s p ch ru preLim timeDiffTimeRate ifTrue = do
    intSort <- mkIntSort

    zero <- mkInt 0 intSort
    one <- mkInt 1 intSort
    negOne <- mkInt (-1) intSort


    limInit <- limitInitial i

    assert =<< mkGe limInit zero

    ifTrue' <- case ifTrue of
                    Just t -> return t
                    Nothing -> mkTrue
    notIfTrue' <- mkNot ifTrue'

    limitFunc <- limitFuncAST i p ch ru    

    limAdjEq <- mkAdd [preLim, timeDiffTimeRate]

    limAdjCap <- minAST limAdjEq b

    limAdjCapMSub <- mkSub [limAdjCap, s]

    limitsEq <- mkEq limitFunc limAdjCapMSub
    matches <- matchesRule p ch ru
    matchesAnd <- mkAnd [matches, ifTrue']

    assert =<< mkImplies matchesAnd limitsEq

    limitsEq' <- mkEq limitFunc limAdjCap
    notMatches <- mkNot matches
    notMatchesOr <- mkOr [notMatches, notIfTrue']

    assert =<< mkImplies notMatchesOr limitsEq'

    mkGe limAdjCap s

toSMTStateList :: [State] -> IdNameExamples -> Maybe [Int] -> AST -> AST -> AST -> Z3 AST
toSMTStateList s n mi p ch r = do
    mkAnd =<< (sequence $ map (\s' -> toSMTState s' n mi p ch r) s)

toSMTState :: State -> IdNameExamples -> Maybe [Int] -> AST -> AST -> AST -> Z3 AST
toSMTState (Time t) n mi p ch ru = do
    pInt <- getInt p
    chInt <- getInt ch
    ruInt <- getInt ru

    intSort <- mkIntSort
    zero <- mkInt 0 intSort

    let r = case lookupRule n (fromIntegral chInt) (fromIntegral ruInt)
                    of Just r' -> accessRules n r'
                       Nothing -> error "Cannot access rule in toSMTState"


    limitIdApp <- limitId ch ru
    
    rateFunc <- intIntFuncDecl "limit-rate"
    rateApp <- mkApp rateFunc [limitIdApp]

    assert =<< mkGt rateApp zero

    burstFunc <- intIntFuncDecl "limit-burst"
    burstApp <- mkApp burstFunc [limitIdApp]

    assert =<< mkGt burstApp zero

    assert =<< mkLe rateApp burstApp

    subFunc <- intIntFuncDecl "subVar"
    subApp <- mkApp subFunc [limitIdApp]

    assert =<< mkGt subApp zero

    assert =<< mkLe subApp burstApp

    case mi of
        Just mi' -> do
            subVarC <- intIntFuncDecl "subVarControl"
            subVarCApp <- mkApp subVarC [limitIdApp]

            assert =<< mkOr =<< mapM (\i ->  do
                i' <- mkInt i intSort
                mkEq i' subApp
                ) mi'

        Nothing -> return ()

    limInit <- limitInitial limitIdApp
    assert =<< mkEq limInit burstApp

    let prevT = prevTime (t) (label r) n
    let timeDiff = t - prevT

    timeDiff' <- mkInt timeDiff intSort

    let preRules = tail . iterate (\res -> case res of
                                        Just (p, c, r) -> preRule n p c r
                                        Nothing -> Nothing) $ (Just (fromIntegral pInt, fromIntegral chInt, fromIntegral ruInt))

    samePacketCheck <- mapM
        (\(p', c', r') -> do
            p'' <- mkInt p' intSort
            c'' <- mkInt c' intSort
            r'' <- mkInt r' intSort

            limitIdApp' <- limitId ch ru
            limitIdApp'' <- limitId c'' r''
            mkEq limitIdApp' limitIdApp''
            ) (filter (\(p', _, _) -> p' == (fromIntegral pInt)) . map (fromJust) . takeWhile (isJust) $ preRules)

    timeDiffOr <- if not . null $ samePacketCheck then mkOr samePacketCheck else mkFalse

    timeDiffRate <- mkMul [timeDiff', rateApp]

    timeDiffRateIte <- mkIte timeDiffOr zero timeDiffRate

    pre <- precedingLimit n limitIdApp (fromIntegral pInt) (fromIntegral chInt) (fromIntegral ruInt) 

    preFunc <- intIntIntIntIntFuncDecl "pre-func"
    preApp <- mkApp preFunc [limitIdApp, p, ch, ru]
    assert =<< mkEq preApp pre 

    useLimitFunc <- intIntBoolFuncDecl "use-limit"
    useLimitApp <- mkApp useLimitFunc [ch, ru]

    lim <- toSMTLimit n limitIdApp rateApp burstApp subApp p ch ru pre timeDiffRateIte (Just useLimitApp)
    mkImplies useLimitApp lim
    where
        limitId :: AST -> AST -> Z3 AST
        limitId c r = do
            limitIdFunc <- intIntIntFuncDecl "limit-id"
            mkApp limitIdFunc [c, r]

        --Get the greatest time that is less than or equal to t and from a packet before l
        prevTime :: Int -> Label -> IdNameExamples -> Int
        prevTime t l ex = maximum . map (prevTime' t l) $ (chains ex)

        prevTime' :: Int -> Label -> ExampleChain -> Int
        prevTime' _ _ [] = 0
        prevTime' t l (e:ex) =
            let
                t' = maximum . map (prevTime'' t (label . exRule $ e) l) $ (state e)
            in
            maximum [t', prevTime' t l ex]

        prevTime'' :: Int -> Label -> Label -> State -> Int
        prevTime'' t l1 l2 (Time t') = if t' < t || (t' == t && l1 < l2) then t' else 0
        prevTime'' t _ _ _ = 0

        --Creates a Z3 AST that references the first limit with the given Id before
        --the given packet, chain id, and rule id, or (0, 0, 0) if none exists
        precedingLimit :: IdNameExamples -> AST -> Int -> ChainId -> RuleInd -> Z3 AST
        precedingLimit _ i 0 0 0 = limitInitial i
        precedingLimit n i p c r = do
            intSort <- mkIntSort
            let (preP, preC, preR) = case preRule n p c r of 
                                            Just res -> res
                                            Nothing -> (0, 0, 0)

            preP' <- mkInt preP intSort
            preC' <- mkInt preC intSort
            preR' <- mkInt preR intSort

            limIdCR <- limitId preC' preR'
            limEq <- mkEq i limIdCR

            limFunc <- limitFuncAST i preP' preC' preR'

            pre' <- precedingLimit n i preP preC preR

            mkIte limEq limFunc pre'

        --This finds the packet, chain, and rule processed immediately before the current
        --packet, chain, and rule and returns them as Just(packet, chainId, RuleId)
        -- or if given (0, 0, 0) returns Nothing
        preRule :: IdNameExamples -> Int -> ChainId -> RuleInd -> Maybe (Int, ChainId, RuleInd)
        preRule n p c r
            | r > 0 = Just (p, c, r - 1)
            | c > 0 = case largestNZLessC of
                            Just (i, c') -> Just (p, i, (length c') - 1)
                            Nothing -> Just (p - 1, head mId, (length largestNZ) - 1)
            | p > 0 = Just (p - 1, fst largestNZ, (length . snd $ largestNZ) - 1)
            | otherwise = Nothing
            where
                ch = case lookupChain n c of
                    Just c' -> c'
                    Nothing -> error "Unrecognized chain in precedingList"

                mId = reverse . validIds $ n

                largestNZLessC = maxNZChain c

                largestNZ = case maxNZChain (head mId + 1) of
                                    Just c' -> c'
                                    Nothing -> error "No chains of nonzero length"

                --Returns ChainId and Chain of the largest chain of nonzero length with an id less than i, or Nothing (if there is not one)
                maxNZChain :: Int -> Maybe (ChainId, ExampleChain)
                maxNZChain i =
                    let
                        chs = filter (\c' -> (length . fromJust . lookupChain n $ c') /= 0) . filter (\c' -> i > c') $ mId
                    in 
                    if length chs /= 0 then Just (head chs, fromJust . lookupChain n . head $ chs) else Nothing




enforcePacketsEqual :: AST -> AST -> Z3 ()
enforcePacketsEqual i j = do
    flagEq "SYN"
    flagEq "ACK"
    flagEq "FIN"
    flagEq "RST"
    flagEq "URG"

    ipEq "source_ip"
    ipEq "destination_ip"
    
    intIntEq "source_port"
    intIntEq "destination_port"

    intIntEq "protocol"

    intIntEq "arrival-time"

    where        
        flagEq :: String -> Z3 ()
        flagEq s = do
            flagI <- intBoolAST s i
            flagJ <- intBoolAST s j
            assert =<< mkEq flagI flagJ

        ipEq :: String -> Z3 ()
        ipEq s = do
            bitSort <- mkBvSort 32
            intSort <- mkIntSort
            ipSymb <- mkStringSymbol s
            ipDec <- mkFuncDecl ipSymb [intSort] bitSort
            ipAppI <- mkApp ipDec [i]
            ipAppJ <- mkApp ipDec [j]
            assert =<< mkEq ipAppI ipAppJ

        intIntEq :: String -> Z3 ()
        intIntEq s = do
            intSort <- mkIntSort
            symb <- mkStringSymbol s
            dec <- mkFuncDecl symb [intSort] intSort
            appI <- mkApp dec [i]
            appJ <- mkApp dec [j]
            assert =<< mkEq appI appJ


enforceLimitsEqual :: AST -> AST -> Z3 ()
enforceLimitsEqual i j = do
    li <- limitInitial i
    lj <- limitInitial j

    assert =<< mkEq li lj

reachabilityRulesChain :: Int -> [r] -> [AST] -> Z3 ()
reachabilityRulesChain i c pN = do
    mapM_ (\p -> mapM_ (\r' -> do
                                intSort <- mkIntSort
                                i' <- mkInt i intSort
                                reachesPrior p i' r'
                                reachesNextNotMatches p i' r'
                                reachesNextNoneTarget p i' r'
                                ) =<< (intSortList [0..((length c) - 1)])) pN

flagToString :: Flag -> String
flagToString SYN = "SYN"
flagToString ACK = "ACK"
flagToString FIN = "FIN"
flagToString RST = "RST"
flagToString URG = "URG"

convertChainsSMT :: IdNameChain -> Int -> Z3 ()
convertChainsSMT n packetNum = convertGenChainsSMT (toSMTRule) n packetNum

convertExamplesSMT :: IdNameExamples -> Int -> Maybe [Int] -> Z3 ()
convertExamplesSMT n packetNum mi = convertGenChainsSMT (toSMTExample mi) n packetNum

convertGenChainsSMT :: (r -> IdNameChainType r -> AST -> AST -> Int -> Z3 ()) -> IdNameChainType r -> Int -> Z3 ()
convertGenChainsSMT f n packetNum = do
    mapM_ (chainLengthCon) (toList' n)
    mapM_ (chainLengthZeroCon) (filter ((flip notElem) (validIds n)) [0..maxId n])

    mapM_ (\(p', c') -> setupCon p' c') (liftA2 (,) [0..(packetNum - 1)] (validIds n))

    mapM_ (topLevelCon) (topLevelChains n)
    mapM_ (notTopLevelCon) (notTopLevelChains n)

    mapM_ (\(p', c') -> topLevelPolicyCon p' c') (liftA2 (,) [0..(packetNum - 1)] (topLevelChains n))
    mapM_ (notTopLevelPolicyCon) (notTopLevelChains n)

    mapM_ (\(i, (_, c')) -> toSMTPathChain n c' i 0 packetNum) (toList' n)

    mapM_ (\(i, (_, c')) -> toSMTChain f c' n i 0 packetNum) (toList' n)

    mapM_ (\(i, (_, c')) -> reachabilityRulesChain i c' =<< intSortList [0..(packetNum - 1)] ) (toList' n)

    mapM_ (\p -> onlyOneTopLevel p =<< (intSortList . topLevelChains $ n)) =<< intSortList [0..(packetNum - 1)]

    mapM_ (\p -> arrivalTimeNonNegative p) =<< intSortList [0..(packetNum - 1)]

    intSort <- mkIntSort
    numOfChains <- mkStringSymbol "num-of-chains"
    numOfChainsConst <- mkConst numOfChains intSort
    numOfChainsInt <- mkInt (maxId n + 1) intSort

    assert =<< mkEq numOfChainsConst numOfChainsInt

    numOfPacketsSymb <- mkStringSymbol "num-of-packets"
    numOfPackets <- mkConst numOfPacketsSymb intSort
    numOfPacketsInt <- mkInt packetNum intSort
    assert =<< mkEq numOfPackets numOfPacketsInt

    where 
        chainLengthCon :: (Int, (String, [r])) -> Z3 ()
        chainLengthCon (i, (_, c)) = do
            intSort <- mkIntSort
            i' <- mkInt i intSort

            intSort <- mkIntSort
            l <- mkInt (length c) intSort
            cl <- chainLength i'
            assert =<< mkEq cl l

        chainLengthZeroCon :: Int -> Z3 ()
        chainLengthZeroCon i = do
            intSort <- mkIntSort
            i' <- mkInt i intSort

            intSort <- mkIntSort
            l <- mkInt 0 intSort
            cl <- chainLength i'
            assert =<< mkEq cl l

        setupCon :: Int -> Int -> Z3 ()
        setupCon p c = do
            intSort <- mkIntSort
            p' <- mkInt p intSort
            c' <- mkInt c intSort

            setupChain p' c'

        topLevelCon :: Int -> Z3 ()
        topLevelCon c = do
            intSort <- mkIntSort
            c' <- mkInt c intSort
            assert =<< topLevelChain c'

        notTopLevelCon :: Int -> Z3 ()
        notTopLevelCon c = do
            intSort <- mkIntSort
            c' <- mkInt c intSort
            assert =<< mkNot =<< topLevelChain c'

        topLevelPolicyCon  :: Int -> Int -> Z3 ()
        topLevelPolicyCon p c = do
            intSort <- mkIntSort
            p' <- mkInt p intSort
            c' <- mkInt c intSort

            topLevelPolicy p' c'

        notTopLevelPolicyCon  :: Int -> Z3 ()
        notTopLevelPolicyCon c = do
            intSort <- mkIntSort
            c' <- mkInt c intSort

            notTopLevelPolicy c'