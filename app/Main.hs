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
import ParseSpecificationLanguage
import RuleAdding

import IptablesTypes

import NameIdChain--temp

import RuleEliminating


main = do
    initializeTime
    start <- getTime

    args <- getArgs
    let inputScriptName = args !! 0
    let outputScriptName = args !! 1
    let changesFileName = args !! 2

    contents <- readFile inputScriptName

    let converted' = Map.toList . convertScript $ contents

    putStrLn . show $ converted'

    let converted = Map.fromList $ stringInputChainsToStringChains converted' 0
    let pathSimp = pathSimplificationChains converted


    putStrLn . show . toList'$ pathSimp

    changes <- readFile changesFileName

    let rulesToAdd = parse . lexer $ changes
    let rulesToAdd2 = exampleRuleInstructionsToExamplesInstructions rulesToAdd

    putStrLn $ "\n\n\n\n\ntoAdd = " ++ show rulesToAdd

    let rulesToAdd' = concat $ map (criteriaPrereqAddition) rulesToAdd2

    let (haveState, noState) = partition (\e -> not . null . state . insRule $ e) rulesToAdd'

    (consistent, inconsistent) <- findConsistentAndInconsistentRules rulesToAdd'

    let rulesToAdd'' = map (\i -> case i of ToChainNamed n e -> ToChainNamed n . exRule $ e
                                            NoInstruction e -> NoInstruction . exRule $ e) rulesToAdd'--THIS IS TEMPORARY AND NEEDS TO BE CHANGED TO ELIMINATE STATE

    let inconsistentNonStateful = findInconsistentRulesStateful rulesToAdd' inconsistent

    let inconsistentLabels = findInconsistentRulesLabels rulesToAdd' inconsistentNonStateful

    let inconsistentEx = map (\(ch, r1, r2) -> (find (\ins -> (label . insRule $ ins) == r1) rulesToAdd, find (\ins -> (label . insRule $ ins) == r2) rulesToAdd)) inconsistentLabels

    putStrLn . foldr (++) "" . map (\r -> "Example\n" ++ (show . fst $ r) ++ "\nis inconsistent with\n" ++ (show . snd $ r) ++ "\n\n") $ inconsistentEx

    if not . null $ inconsistentEx then error "Resolve inconsistencies in examples before continuing." else return ()


    putStrLn $ "inconsistent = " ++ show inconsistent

    let rulesToAddMap = exInstructionsToMap rulesToAdd'

    putStrLn $ "\n\n" ++ show (filter (\(c, _, _) -> c == 0) inconsistentLabels)
    

    let sec = 1
    let minute = 60
    let hour = minute * 60
    let day = hour * 24
    insStateRes <- (flip statefulExampleInstructionsToInstructions (Just [sec, minute, hour, day])) . contradictingExampleIdsToExampleInstructions rulesToAdd' $ inconsistent

    addedPos <- instructionsToAddAtPos rulesToAdd'' pathSimp

    let addedToIp = addToIptables addedPos pathSimp contents

    putStrLn addedToIp

    let converted2' = Map.toList . convertScript $ addedToIp
    let converted2 = Map.fromList $ stringInputChainsToStringChains converted2' 0
    let pathSimp2 = pathSimplificationChains converted2

    redundant <- findRedundantRule pathSimp2
    let commentedInIp = commentOutRules redundant addedToIp

    writeFile outputScriptName commentedInIp

    end <- getTime

    let diff = secs $ end - start
    printf $ "Computation time: " ++ diff ++ "\n"