module Main where

import Text.Printf
import System.IO
import System.Environment
import Data.List
import Data.Maybe

import qualified Data.Map as Map

import Criterion.Measurement

import Types
import ConvertIptables
import ConvertToHorn
import ExampleAdjustment
import InstructionsToIptables
import qualified ParseSpecificationLanguage2 as PSL2
import RuleAdding

import IptablesTypes

import NameIdChain

import RuleEliminating

import Verifier

import System.Exit

main = do
    initializeTime
    start <- getTime

    args <- getArgs
    let inputScriptName = args !! 0
    let outputScriptName = args !! 1
    let changesFileName = args !! 2

    contents <- readFile inputScriptName

    let converted' = Map.toList . convertScript $ contents

    let converted = Map.fromList $ stringInputChainsToStringChains converted' 0
    let pathSimp = pathSimplificationChains converted

    {-
    redundant <- findRedundantRule pathSimp
    print redundant 
    exitSuccess
    -}

    changes <- readFile changesFileName

    --let rulesToAdd = parse . lexer $ changes
    let rulesToAdd = PSL2.parse $ changes


    let rulesToAdd2 = exampleRuleInstructionsToExamplesInstructions rulesToAdd

    let maintainRules = filter (\r -> spec r == Maintain) rulesToAdd2
    let repairRules = filter (\r -> spec r == Repair) rulesToAdd2
    let verifyRules = filter (\r -> spec r == Verify) rulesToAdd2

    -- print maintainRules
    -- print repairRules
    -- print verifyRules

    let rulesToAdd' = concat $ map (criteriaPrereqAddition) repairRules

    let (haveState, noState) = partition (\e -> not . null . state . insRule $ e) rulesToAdd'

    (consistent, inconsistent) <- findConsistentAndInconsistentRules rulesToAdd'

    let rulesToAdd'' = map (\i -> case i of ToChainNamed spec n e -> ToChainNamed spec n . exRule $ e
                                            NoInstruction e -> NoInstruction . exRule $ e) noState--rulesToAdd'--THIS IS TEMPORARY AND NEEDS TO BE CHANGED TO ELIMINATE STATE

    let inconsistentNonStateful = findInconsistentRulesStateful rulesToAdd' inconsistent

    let inconsistentLabels = findInconsistentRulesLabels rulesToAdd' inconsistentNonStateful

    let inconsistentEx = map (\(ch, r1, r2) -> (find (\ins -> (label . insRule $ ins) == r1) rulesToAdd, find (\ins -> (label . insRule $ ins) == r2) rulesToAdd)) inconsistentLabels

    -- putStrLn . foldr (++) "" . map (\r -> "Example\n" ++ (show . fst $ r) ++ "\nis inconsistent with\n" ++ (show . snd $ r) ++ "\n\n") $ inconsistentEx

    if not . null $ inconsistentEx then error "Resolve inconsistencies in examples before continuing." else return ()

    let rulesToAddMap = exInstructionsToMap rulesToAdd'

    -- putStrLn $ "\n\nInconsistent = " ++ show (filter (\(c, _, _) -> c == 0) inconsistentLabels)
    
    let sec = 1
    let minute = 60
    let hour = minute * 60
    let day = hour * 24

    let contradicting = contradictingExampleIdsToExampleInstructions rulesToAdd' inconsistent

    insStateRes <- (flip statefulExampleInstructionsToInstructions (Just [sec, minute, hour, day])) contradicting-- . contradictingExampleIdsToExampleInstructions rulesToAdd' $ inconsistent
    --insStateRes <- (flip statefulExampleInstructionsToInstructions (Just [sec, minute, hour, day]))  haveState

    -- putStrLn "After Lim gen"

    -- putStrLn ("insStateRes = " ++ show insStateRes)
    -- putStrLn ("rulesToAdd = " ++ show rulesToAdd'')

    addedPos <- case insStateRes of
                        Just insStateRes' -> instructionsToAddAtPos ((reverse insStateRes') ++ rulesToAdd'') pathSimp
                        Nothing -> error "Irresolvable state" -- IMPROVE THIS ERROR MESSAGE

    -- putStrLn "After addedPos"


    let addedToIp = addToIptables (reverse addedPos) pathSimp contents 
    
    let converted2' = Map.toList . convertScript $ addedToIp
    let converted2 = Map.fromList $ stringInputChainsToStringChains converted2' 0
    let pathSimp2 = pathSimplificationChains converted2

    -- putStrLn "Before Red"

    redundant <- findRedundantRule pathSimp2
    --print $ (endRed - startRed)

    -- putStrLn "After Red"

    -- let commentedInIp = commentOutRules redundant addedToIp
    let commentedInIp = addedToIp

    -- putStrLn "After Comm"

    writeFile outputScriptName commentedInIp

    let fixed = addRulesToIdNameChain addedPos pathSimp


    --Verification
    ver <- verify fixed verifyRules

    -- print ver

    end <- getTime

    let diff = secs $ end - start
    printf $ "Computation time: " ++ diff ++ "\n"
