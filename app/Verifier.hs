module Verifier where

import qualified Data.BitVector as BV
import Data.IP
import Data.List
import Data.Maybe
import Z3.Monad

import ChainsToSMT
import NameIdChain
import Types

import qualified Debug.Trace as T

verify :: IdNameChain -> [ExampleInstruction] -> IO [(String, [Criteria])]
verify i e = do
    evalZ3 (verify' i e)

--Returns a list of lists of criteria, that describe packets that will be incorrectly routed by the firewall 
verify' :: IdNameChain -> [ExampleInstruction] -> Z3 [(String, [Criteria])]
verify' n ex = do
    reset

    convertChainsSMT n 1

    return . filter (not . null . snd) =<< mapM (verifyPacket n) ex

verifyPacket :: IdNameChain -> ExampleInstruction -> Z3 (String, [Criteria])
verifyPacket n c@(ToChainNamed _ _ _) = do
    solverPush


    let name = chainName c
    let rule = insRule c

    let crit = criteria . exRule $ rule
    let tar = targets . exRule $ rule

    intSort <- mkIntSort
    zero <- mkInt 0 intSort

    return True

    let ids = idsWithName n name

    let topStarting = topLevelJumpingTo n ids
    
    assert =<< mkOr =<< mapM (\t -> do
                                    t' <- mkInt t intSort
                                    reaches zero t' zero
                                    ) topStarting


    starting <- mkStringSymbol "starting"
    starting' <- mkVar starting intSort
    assert =<< reaches zero starting' zero

    let maxChainId = maxId n
    maxChainId' <- mkInt maxChainId intSort
    assert =<< mkLe zero starting'
    assert =<< mkLe starting' maxChainId'

    assert =<< toSMTCriteriaList (eliminateLimits $ crit) (Just n) zero zero zero

    tw0 <- terminatesWith zero

    assert =<< mkNot =<< mkEq tw0 =<< if tar == ACCEPT then acceptAST else dropAST

    (b, m) <- solverCheckAndGetModel

    res <- case m of
                Just m' -> do
                            mString <- showModel m'
                            T.trace (mString) parseModel m'
                Nothing -> return (0, [])

    solverPop 1

    let res' = (case lookupName n . fst $ res of
                        Just name' -> name
                        Nothing -> "", snd res)

    return res'
    where
        eliminateLimits :: [Criteria] -> [Criteria]
        eliminateLimits [] = []
        eliminateLimits (Limit _ _ _ _:xs) = eliminateLimits xs
        eliminateLimits (x:xs) = x:eliminateLimits xs

parseModel :: Model -> Z3 (Int, [Criteria])
parseModel m = do
    protSymb <- mkStringSymbol "protocol"
    sourceIPSymb <- mkStringSymbol "source_ip"
    destIPSymb <- mkStringSymbol "destination_ip"
    sourcePortSymb <- mkStringSymbol "source_port"
    destPortSymb <- mkStringSymbol "destination_port"

    syn <- mkStringSymbol "SYN"
    ack <- mkStringSymbol "ACK"
    fin <- mkStringSymbol "FIN"
    rst <- mkStringSymbol "RST"
    urg <- mkStringSymbol "URG"

    intSort <- mkIntSort
    bitSort <- mkBvSort 32

    zero <- mkInt 0 intSort

    starting <- mkStringSymbol "starting"
    starting' <- mkVar starting intSort
    starting'' <- return . fromIntegral . fromJust =<< evalInt m starting'

    protDecl <- mkFuncDecl protSymb [intSort] intSort
    sourceIPDecl <- mkFuncDecl sourceIPSymb [intSort] bitSort
    destIPDecl <- mkFuncDecl destIPSymb [intSort] bitSort
    sourcePortDecl <- mkFuncDecl sourcePortSymb [intSort] intSort
    destPortDecl <- mkFuncDecl destPortSymb [intSort] intSort

    protApp <- mkApp protDecl [zero]
    sourceIPApp <- mkApp sourceIPDecl [zero]
    destIPApp <- mkApp destIPDecl [zero]
    sourcePortApp <- mkApp sourcePortDecl [zero]
    destPortApp <- mkApp destPortDecl [zero]

    prot <- return . Protocol . fromIntegral =<< getInt . fromJust =<< eval m protApp
    sourceIp <- do
                    bv <- getInt . fromJust =<< eval m sourceIPApp
                    let bv' = BV.bitVec 32 bv
                    let bv'' =  map (BV.nat) (BV.split 4 bv')
                    let bv''' = read (intercalate "." (map show bv'') ++ "/32") :: IPRange
                    return (IPAddress Source $ bv''') 
    destIp <- do
                    bv <- getInt . fromJust =<< eval m destIPApp
                    let bv' = BV.bitVec 32 bv
                    let bv'' =  map (BV.nat) (BV.split 4 bv')
                    let bv''' = read (intercalate "." (map show bv'') ++ "/32") :: IPRange
                    return (IPAddress Destination $ bv''') 
    sourcePort <- do
                    p <- getInt . fromJust =<< eval m sourcePortApp
                    return . Port Source $ (Left $ fromIntegral p)
    destPort <- do
                    p <- getInt . fromJust =<< eval m destPortApp
                    return . Port Destination $ (Left $ fromIntegral p)

    return (starting'', prot:sourceIp:destIp:sourcePort:destPort:[])