module SMT where

import System.IO
import System.IO.Unsafe
import System.Process


import Types

checkSat :: String -> IO Bool
checkSat s = do
	res <- callSMTSolver "checkSat.smt2" s
	return (res == "sat")

callSMTSolver :: FilePath -> String -> IO String
callSMTSolver f s =
    do
        writeFile f s
        (_, Just hout, _, _) <- createProcess (proc "z3" ["temp.smt2"]){ std_out = CreatePipe }

        hGetContents hout

printSMTFunc1 :: (ToString a) => String -> a -> String
printSMTFunc1 s x = "(" ++ s ++ " " ++ toString x ++ ")"


printSMTFunc2 :: (ToString a, ToString b) => String -> a -> b -> String
printSMTFunc2 s x y = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ ")"