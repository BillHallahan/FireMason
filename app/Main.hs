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
import ChainsToSMT2
import ConvertToHorn
import CriteriaPrereqAddition
import InstructionsToIptables
import ParseSpecificationLanguage
import RuleAdding
import SMT

import IptablesTypes

import NameIdChain--temp

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
    let pathSimp = pathSimplification2' converted

    changes <- readFile changesFileName

    let rulesToAdd = (flip inputInstructionsToInstructions 0) . parse . lexer $ changes

    let rulesToAdd' = concat $ map (criteriaPrereqAddition) rulesToAdd

    addedPos <- instructionsToAddAtPos rulesToAdd' pathSimp

    let addedToIp = addToIptables addedPos pathSimp contents

    writeFile outputScriptName addedToIp

    end <- getTime

    let diff = secs $ end - start
    printf $ "Computation time: " ++ diff ++ "\n"