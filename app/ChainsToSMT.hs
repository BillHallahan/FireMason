{-# LANGUAGE FlexibleInstances #-}


module ChainsToSMT where

import Data.List
import Data.Maybe
import Control.Applicative
import Z3.Monad

import NameIdChain
import Types

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

toSMTPathChain :: Chain -> Int -> Int -> Int -> Z3 ()
toSMTPathChain [] ch r pN = return ()
toSMTPathChain (c:cx) ch r pN = do
    intSort <- mkIntSort
    ch' <- mkInt ch intSort
    r' <- mkInt r intSort

    toSMTPathRule c ch' r' pN
    toSMTPathChain cx ch (r + 1) pN

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

toSMTChain :: Chain -> IdNameChain -> Int -> Int -> Int -> Z3 ()
toSMTChain [] _ _ _ _ = return ()
toSMTChain (c:cx) n ch r pN = do
    intSort <- mkIntSort
    ch' <- mkInt ch intSort
    r' <- mkInt r intSort

    toSMTRule c n ch' r' pN
    toSMTChain cx n ch (r + 1) pN

toSMTRule :: Rule -> IdNameChain -> AST -> AST -> Int -> Z3 ()
toSMTRule (Rule [] t _) n ch r pN = mapM_ (\p -> assert =<< matchesCriteria p ch r) =<< intSortList [0..(pN - 1)]
toSMTRule (Rule c _ _) n ch r pN = 
    mapM_ (\p -> do
            crit <- toSMTCriteriaList c n p ch r
            mC <- matchesCriteria p ch r
            assert =<< (mkEq crit mC)) =<< intSortList [0..(pN - 1)]

toSMTCriteriaList :: [Criteria] -> IdNameChain -> AST -> AST -> AST -> Z3 AST
toSMTCriteriaList c n p ch r = do
    mkAnd =<< (sequence $ map (\c' -> toSMTCriteria c' n p ch r) c)

toSMTCriteria :: Criteria -> IdNameChain -> AST -> AST -> AST -> Z3 AST
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
toSMTCriteria (Limit i ra b) n p ch ru = do
    let same = fromJust $ limits n i
    pInt <- getInt p
    chInt <- getInt ch
    ruInt <- getInt ru

    let pre = precedingLimit same (fromIntegral pInt) (fromIntegral chInt) (fromIntegral ruInt)

    intSort <- mkIntSort

    i' <- mkInt i intSort
    b' <- mkInt b intSort
    ra' <- mkInt ra intSort

    zero <- mkInt 0 intSort
    one <- mkInt 1 intSort
    negOne <- mkInt (-1) intSort


    limInit <- limitInitial i'

    assert =<< mkGe limInit zero

    (preLim, preT) <- if pre == Nothing 
                    then do
                        lim <- limitInitial i'
                        return (lim, zero)
                    else do
                        let (preP, preCh, preR) = fromJust pre
                        preP' <- mkInt preP intSort
                        preCh' <- mkInt preCh intSort
                        preR' <- mkInt preR intSort 

                        lim <- limitFuncAST i' preP' preCh' preR'
                        aT <- arrivalTime(preP')
                        return (lim, aT)

    limitFunc <- limitFuncAST i' p ch ru

    currT <- arrivalTime(p)


    timeDiff <- mkSub [currT, preT]
    timeDiffTimeRate <- mkMul [timeDiff, ra']

    limAdjEq <- mkAdd [preLim, timeDiffTimeRate]

    limAdjCap <- minAST limAdjEq b'

    limAdjCapMOne <- mkSub [limAdjCap, one]

    limitsEq <- mkEq limitFunc limAdjCapMOne
    matches <- matchesRule p ch ru

    assert =<< mkImplies matches limitsEq

    limitsEq' <- mkEq limitFunc limAdjCap
    notMatches <- mkNot matches

    assert =<< mkImplies notMatches limitsEq'

    mkGe limAdjCap one
    where   --gets the packet and limit before the current packet and limit combination
            precedingLimit :: [(ChainId, Int)] -> Int -> Int -> Int -> Maybe (Int, ChainId, Int)
            precedingLimit n 0 c r =
                let pos = fromJust $ (c, r) `elemIndex` n in
                    if pos /= 0 then Just (0, fst $ n !! (pos - 1), snd $ n !! (pos - 1)) else Nothing
            precedingLimit n p' c r =
                let pos = fromJust $ (c, r) `elemIndex` n in
                    if pos /= 0 then Just (p', fst $ n !! (pos - 1), snd $ n !! (pos - 1)) else
                                     Just (p' - 1, fst . last $ n, snd . last $ n)

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

reachabilityRulesChain :: Int -> Chain -> [AST] -> Z3 ()
reachabilityRulesChain i c pN = do
    mapM_ (\p -> mapM_ (\r -> do
                                intSort <- mkIntSort
                                i' <- mkInt i intSort
                                reachesPrior p i' r
                                reachesNextNotMatches p i' r
                                reachesNextNoneTarget p i' r
                                ) =<< (intSortList [0..((length c) - 1)])) pN

flagToString :: Flag -> String
flagToString SYN = "SYN"
flagToString ACK = "ACK"
flagToString FIN = "FIN"
flagToString RST = "RST"
flagToString URG = "URG"

convertChainsSMT :: IdNameChain -> Int -> Z3 ()
convertChainsSMT n packetNum = do
    mapM_ (chainLengthCon) (toList' n)
    mapM_ (chainLengthZeroCon) (filter ((flip notElem) (validIds n)) [0..maxId n])

    mapM_ (\(p', c') -> setupCon p' c') (liftA2 (,) [0..(packetNum - 1)] (validIds n))

    mapM_ (topLevelCon) (topLevelChains n)
    mapM_ (notTopLevelCon) (notTopLevelChains n)

    mapM_ (\(p', c') -> topLevelPolicyCon p' c') (liftA2 (,) [0..(packetNum - 1)] (topLevelChains n))
    mapM_ (notTopLevelPolicyCon) (notTopLevelChains n)

    mapM_ (\(i, (_, c')) -> toSMTPathChain c' i 0 packetNum) (toList' n)

    mapM_ (\(i, (_, c')) -> toSMTChain c' n i 0 packetNum) (toList' n)

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
        chainLengthCon :: (Int, (String, Chain)) -> Z3 ()
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