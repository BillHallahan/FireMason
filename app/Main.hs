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
import CriteriaPrereqAddition
import InstructionsToIptables
import ParseSpecificationLanguage
import RuleAdding

import IptablesTypes

import NameIdChain--temp

import RuleEliminating


import Debug.Trace

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
    let pathSimp = pathSimplification2' converted


    putStrLn $ "limit 5" ++ show (limits pathSimp 5)

    putStrLn "pathSimp = "

    putStrLn . show . toList'$ pathSimp

    changes <- readFile changesFileName

    let rulesToAdd = (flip inputInstructionsToInstructions 0) . parse . lexer $ changes

    let rulesToAdd' = concat $ map (criteriaPrereqAddition) rulesToAdd

    addedPos <- instructionsToAddAtPos rulesToAdd' pathSimp

    let addedToIp = addToIptables addedPos pathSimp contents


    let converted2' = Map.toList . convertScript $ addedToIp
    let converted2 = Map.fromList $ stringInputChainsToStringChains converted2' 0 
    let pathSimp2 = pathSimplification2' converted2


    redundant <- trace (show . toList' $ pathSimp2) $ findRedundantRule pathSimp2
    let commentedInIp = commentOutRules redundant addedToIp

    --writeFile outputScriptName addedToIp
    writeFile outputScriptName commentedInIp

    end <- getTime

    let diff = secs $ end - start
    printf $ "Computation time: " ++ diff ++ "\n"

    
    printf $ (show redundant) ++ "\n" 