module RuleAdding where

import Data.List
import Data.Maybe
import qualified Data.Map as Map
import Data.Ord
import Data.String.ToString

import Types
import NameIdChain
import ChainsToSMT
import qualified ChainsToSMT2 as S
import SMT
import Debug.Trace

import Z3.Monad

--Given a list of instructions and an IdNameChain, returns a list of rules, and chain names and positions at which they should be added
instructionsToAddAtPos :: [Instruction] -> IdNameChain -> IO [(Rule, String, Int)]
instructionsToAddAtPos [] n = return []
instructionsToAddAtPos (x:xs) n = 
    do
        let s = (chainName x)
        let r = (insRule x)

        let changeId = head $ idsWithName n s
        let n' = if not . null $ (idsWithName n s) then n else addChain n s

        (cutC, cutR) <- (findBestPointCut r changeId n')
        let cutCName = if isJust $ lookupName n cutC then fromJust $ lookupName n cutC else error "Trying to cut nonexistent chain."

        let withName = idsWithName n cutCName
        let ch' = fromJust $ lookupChain n (head withName)
        let l = if not . null $ ch' then label $ ch' !! cutR else maxLabel n
        let r' = Rule (criteria r) (targets r) l
        let cutCh' = switchChains n (\c-> addRuleToChainAtPos r' c cutR) (head . idsWithName n $ cutCName)

        instr <- instructionsToAddAtPos xs cutCh'
        
        return $ (r', cutCName, l):instr

findBestPointCut :: Rule -> ChainId -> IdNameChain -> IO (ChainId, Int)
findBestPointCut r i n = findBestPointCut' r i n n

--We cut chains shorter in n' as we determine that certain positions are too deep to insert the new rule
--We use n to always be able to evaluate the new rule with the whole chain
findBestPointCut' :: Rule -> ChainId -> IdNameChain -> IdNameChain -> IO (ChainId, Int)
findBestPointCut' r i n n' =
    let
        nameU = fromJust $ lookupName n i

        (i', cut, _) = findPointCut r i n'
        (name, c) = if isJust $ lookupNameChain n i' then fromJust $ lookupNameChain n i' else error "Rule being inserted into nonexistent chain."

        updatedChains = switchChains n (\c' -> addRuleToChainAtPos r c' cut) i'
        newNameIdChain = increaseIndexes updatedChains (1 + maxId n)
        combinedNIC = setUnion n newNameIdChain

        shortened = switchChains n' (take (cut - 1)) i'

        idsU = idsWithName newNameIdChain nameU

        idsOld = idsWithName n name
        idsNew = idsWithName newNameIdChain name

        topStartingOld = topLevelJumpingTo combinedNIC (idsOld)

        topStarting = topLevelJumpingTo combinedNIC (idsOld ++ idsNew)

        relevant = reduceReferenced combinedNIC (topStarting)

    in
    do
        firewallPredicatesReplacePCR <- readFile "smt/firewallPredicatesReplacePCR.smt2"
        let 
            orChangedChain = SMTOr $ map (\i'' -> (Reaches 1 i'' 0)) idsU
            converted = S.convertChainsCheckSMT relevant
                        ((toString (Assert (SMTEq (SMTString "num-of-packets") (SMTInt 2)))) ++
                                                (toString (DeclareConst "chain0" "Int")) ++
                                                (toString (DeclareConst "chain1" "Int")))
                        firewallPredicatesReplacePCR
                        2
                        (
                            (toString . Assert . SMTOr $ map (\i'' -> (SMTAnd [SMTEq (SMTString "chain0") (SMTInt i''), SMTEq (SMTString "chain1") (SMTInt (i'' + 1 + maxId n))])) topStartingOld)
                         ++
                            (toString (Assert (SMTF3 "reaches" (SMTInt 0) (SMTString "chain0") (SMTInt 0))))
                         ++
                            (toString (Assert (SMTF3 "reaches" (SMTInt 1) (SMTString "chain1") (SMTInt 0))))
                         ++
                            (toString 
                                (Assert
                                    (SMTNot
                                        (SMTAnd [
                                            SMTOr [
                                                SMTEq (TerminatesWith 0) (TerminatesWith 1)
                                                , SMTAnd [SMTF2 "reaches-end" (SMTInt 0) (SMTString "chain0"), SMTF2 "reaches-end" (SMTInt 1) (SMTString "chain1")]
                                                , SMTAnd [SMTString (S.toSMT (criteria r) 0 0), orChangedChain]
                                                ]
                                            , Implies
                                                (SMTAnd [
                                                    SMTString (S.toSMT (criteria r) 0 0)
                                                    , orChangedChain
                                                    ]
                                                )
                                                (SMTEq (TerminatesWith 1) (SMTString (S.toSMT (targets r) 0 0)))
                                            ]
                                        )
                                    )
                                )
                            )
                        )
        firewallPredicates <- readFile "smt/firewallPredicates2.smt2"
        noUndesired <- checkSat (firewallPredicates ++ converted)
        checking <- evalZ3 $ checkRuleImpact r relevant topStartingOld idsU

        let same = (checking == Sat && noUndesired) || (checking == Unsat && not noUndesired)

        if same then
            (trace ("checking = " ++ show checking) (if not noUndesired then return (i', cut) else trace ("cut = " ++ show (chains shortened)) findBestPointCut' r i n shortened))
        else error "not same"


checkRuleImpact :: Rule -> IdNameChain -> [ChainId] -> [ChainId] -> Z3 Result
checkRuleImpact r n top idsU = do
    reset

    intSort <- mkIntSort
    zero <- mkInt 0 intSort
    one <- mkInt 1 intSort
    two <- mkInt 2 intSort

    numOfPacketsSymb <- mkStringSymbol "num-of-packets"
    numOfPackets <- mkConst numOfPacketsSymb intSort
    assert =<< mkEq numOfPackets two

    --convertChainsSMT n 2

    --chain0Symb <- mkStringSymbol "chain0"
    --chain0 <- mkConst chain0Symb intSort
    --chain1Symb <- mkStringSymbol "chain1"
    --chain1 <- mkConst chain1Symb intSort

    --let topStarting = topLevelJumpingTo n top
    --assert =<< mkOr =<< (sequence . (map (mkAnds chain0 chain1)) $ topStarting)

    --assert =<< reaches zero chain0 zero
    --assert =<< reaches one chain1 zero

    --tw0 <- terminatesWith zero
    --tw1 <- terminatesWith one
    --reEnd0 <- reachesEnd zero chain0
    --reEnd1 <- reachesEnd one chain1

    --idsU' <- intSortList idsU
    --let orChangedChain = mkOr =<< (sequence $ map (\i -> reaches one i zero) idsU') 

    --targetAST <- if (head . targets $ r) == ACCEPT then acceptAST else dropAST

    --innerOr <- mkOr =<< sequence [mkEq tw0 tw1
    --                              , mkAnd [reEnd0, reEnd1]
    --                              , mkAnd =<< sequence [toSMTCriteriaList (criteria r) zero, orChangedChain]]
    --imAnd <- mkAnd =<< sequence [toSMTCriteriaList (criteria r) zero, orChangedChain]
    --innerImplies <- mkImplies imAnd =<< mkEq tw1 targetAST

    --assert =<< mkNot =<< mkAnd [innerOr, innerImplies]

    solverCheck
    where
        mkAnds :: AST -> AST -> Int -> Z3 AST
        mkAnds = (\c0 c1 i -> do
                        intSort' <- mkIntSort
                        i' <- mkInt i intSort'
                        i'' <- mkInt (i + 1 + maxId n) intSort'
                        ec0 <- mkEq c0 i'
                        ec1 <- mkEq c1 i''
                        mkAnd [ec0, ec1])

addRuleToChainAtPos :: Rule -> Chain -> Int -> Chain 
addRuleToChainAtPos r c i =
    let
        (c', c'') = splitAt i c
    in
    c' ++ r:c''

--Returns the Name, one Id for, and position of the best (as determined by a similarity heuristic) place to insert the given rule in/below the
--chain with the given id in the IdNameChain
findPointCut :: Rule -> ChainId -> IdNameChain -> (ChainId, Int, Int)
findPointCut r i n = 
    let
        c = fromJust $ lookupChain n i--fromJust $ Map.lookup i n

        --Get scores for rules in chains we can jump to
        jCritTarget = jumpedToWithCriteria c
        jCritIdChains = map (\(crit, t) -> (crit, t, fromJust $ lookupChain n t)) (jumpedToWithCriteria c)
        jIdChainsAddedCrit = map (\(crit, t, ch) -> (t, map (\(Rule c t l) -> Rule (c ++ crit) t l) ch)) jCritIdChains
        jIdScores = map (\(t, ch) -> findPointCut r t n) jIdChainsAddedCrit
        third = (\(_, _, x) -> x)
        maxJ = if not . null $ jIdScores then maximumBy (comparing third) jIdScores else (-1, -1, minBound :: Int)
 
        scores =  map (scoreRules r) c
        maxScore = if not . null $ scores then maximum scores else -scm - 1
        maxScoreLoc = if not . null $ scores then fromJust $ elemIndex maxScore scores else 0
    in
    trace ("r = " ++ show r ++ " maxL = " ++ show maxScore ++ " maxJ = " ++ show maxJ) (if third maxJ <= maxScore then (i, maxScoreLoc, maxScore) else maxJ)


scoreRules :: Rule -> Rule -> Int
scoreRules (Rule c t _) (Rule c' t' _) = (scoreCriteriaList c c') + (scoreTargets t t')

--scoreCriteriaMax
scm :: Int
scm = 100000

scoreCriteriaList :: [Criteria] -> [Criteria] -> Int
scoreCriteriaList [] cx' = - (scm * length cx')
scoreCriteriaList cx [] = - (scm * length cx)
scoreCriteriaList (c:cx) cx' = 
    let
        c' = maximumBy (comparing (scoreCriteria c)) cx'
    in
    scoreCriteria c c' + scoreCriteriaList cx (delete c' cx')

--Should return values in between -scm and scm, where -scm is no match, scm is a perfect match
scoreCriteria :: Criteria -> Criteria -> Int
scoreCriteria (Protocol i) (Protocol j) = (div scm 2) + div ((255 - (abs $ j - i)) * scm) 510
scoreCriteria (Port e p) (Port e' p') =
    let
        pNum = case p of Left n -> n
                         Right (n, n') -> n
        pNum' = case p' of Left n -> n
                           Right (n, n') -> n 
    in
    if e == e' then (div scm 2) + div ((65535 + 65535 - (abs $ pNum - pNum')) * scm) (4 * 65535)
               else div ((65535 - (abs $ pNum - pNum')) * scm) (2 * 65535)
scoreCriteria (Not c) (Not c') = scoreCriteria c c'
scoreCriteria (Not c) (c') = (scoreCriteria c c') `div` 2
scoreCriteria (c) (Not c') = (scoreCriteria c c') `div` 2
scoreCriteria _ _ = -scm

scoreTargets :: [Target] -> [Target] -> Int
scoreTargets [] _ = 0
scoreTargets (t:tx) t' = if t `elem` t' then scm + scoreTargets tx t' else scoreTargets tx t'