module RuleEliminating (findRedundantRule) where

import Z3.Monad

import ChainsToSMT
import Types

--returns a list of chain names and rule numbers (in terms of labels) which should be removed 
findRedundantRule :: IdNameChain -> IO [(String, Int)]
findRedundantRule n = []

findRedundantRule' :: IdNameChain -> Z3 (Result, Maybe Model)
findRedundantRule' n = do
	convertChainSMT n 1

	getModel