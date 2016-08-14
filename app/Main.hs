module Main where

import System.IO
import System.Environment
import Data.List
import Data.Maybe

import qualified Data.Map as Map

import Types
import ConvertIptables
import ChainsToSMT2
import ConvertToHorn
import InstructionsToIptables
import ParseSpecificationLanguage
import RuleAdding
import SMT

import IptablesTypes


import NameIdChain--temp

main = do

    args <- getArgs
    let inputScriptName = args !! 0
    let outputScriptName = args !! 1
    let changesFileName = args !! 2

    let x = replaceAllCombinations "xw" [("x", ["y", "z", "zz", "zzz"]), ("w", ["d", "e"])]
    putStrLn . show $ x

    contents <- readFile inputScriptName

    let converted' = Map.toList . convertScript $ contents
    let converted = Map.fromList $ stringInputChainsToStringChains converted' 0 
    let pathSimp = pathSimplification converted

    changes <- readFile changesFileName

    let rulesToAdd = (flip inputInstructionsToInstructions 0) . parse . lexer $ changes

    addedPos <- instructionsToAddAtPos rulesToAdd pathSimp

    let iptablesCon = map (((flip convert) pathSimp) . insRule) rulesToAdd

    let addedToIp = addToIptables addedPos pathSimp contents
    writeFile outputScriptName addedToIp