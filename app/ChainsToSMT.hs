module ChainsToSMT where

import Data.Maybe

import Z3.Monad

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

isAccept :: Z3 AST
isAccept = do
    targetDataRecognizer 0

isDrop :: Z3 AST
isDrop = do
    targetDataRecognizer 1

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

matchesCriteriaAST :: AST -> AST -> AST -> Z3 AST
matchesCriteriaAST p c r = intIntIntBoolAST "matches-criteria" p c r

ruleTargetAST :: AST -> AST -> Z3 AST
ruleTargetAST c r= do
    intSort <- mkIntSort
    t <- makeTargetDatatype
    ruleTarget <- mkStringSymbol "rule-target"
    dec <- mkFuncDecl ruleTarget [intSort, intSort] t
    mkApp dec [c, r]

reachesAST :: AST -> AST -> AST -> Z3 AST
reachesAST p c r = intIntIntBoolAST "reaches" p c r

reachesReturnAST :: AST -> AST -> AST -> Z3 AST
reachesReturnAST p c r = intIntIntBoolAST "reaches-return" p c r

reachesEndAST :: AST -> AST -> AST -> Z3 AST
reachesEndAST p c r = intIntIntBoolAST "reaches-end" p c r

returnsFromAST :: AST -> AST -> AST -> Z3 AST
returnsFromAST p c r = intIntIntBoolAST "reaches-return" p c r

policyAST :: AST -> Z3 AST
policyAST c = do
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

chainLengthFunc :: Z3 FuncDecl
chainLengthFunc = do
    intSort <- mkIntSort
    chainLength <- mkStringSymbol "chain-length"
    mkFuncDecl chainLength [intSort] intSort

terminatesWithAST :: AST -> Z3 AST
terminatesWithAST p = do
    intSort <- mkIntSort
    t <- makeTargetDatatype
    terminatesWith <- mkStringSymbol "terminates-with"
    dec <- mkFuncDecl terminatesWith [intSort] t
    mkApp dec [p]

topLevelChainAST :: AST -> Z3 AST
topLevelChainAST c = intBoolAST "top-level-chain" c

--see: http://stackoverflow.com/questions/7740556/equivalent-of-define-fun-in-z3-api
validChainAST :: AST -> Z3 AST
validChainAST c = do
    intSort <- mkIntSort

    nCh <- numOfChainsConst

    z <- mkInt 0 intSort

    l <- mkLe z c
    g <- mkLt c nCh
    
    mkAnd [l, g]

validRuleAST :: AST -> AST -> Z3 AST
validRuleAST c r = do
    intSort <- mkIntSort

    vC <- validChainAST c
    cL <- chainLengthFunc
    cL' <- mkApp cL [c]

    z <- mkInt 0 intSort

    l <- mkLe z r
    g <- mkLt r cL'

    mkAnd[vC, l, g]

matchesRuleAST :: AST -> AST -> AST -> Z3 AST
matchesRuleAST p c r = do
    vR <- validRuleAST c r
    mC <- matchesCriteriaAST p c r
    re <- reachesAST p c r

    mkAnd [vR, mC, re]

terminatingAST :: AST -> Z3 AST
terminatingAST t = do
    isA <- isAccept
    eqA <- mkEq isA t
    isD <- isDrop
    eqD <- mkEq isD t

    mkOr [eqA, eqD]

terminatesAtAST :: AST -> AST -> AST -> Z3 AST
terminatesAtAST p c r = do
    vR <- validRuleAST c r
    mR <- matchesRuleAST p c r
    rT <- ruleTargetAST c r
    t <- terminatingAST rT
    mkAnd [vR, mR, t]

reachesTopLevelChain :: AST -> AST -> Z3 AST
reachesTopLevelChain p c = do
    intSort <- mkIntSort
    z <- mkInt 0 intSort

    vC <- validChainAST c
    tLC <- topLevelChainAST c
    re <- reachesAST p c z

    mkAnd [vC, tLC, re]








































