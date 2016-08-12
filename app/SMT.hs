module SMT where

import System.IO
import System.IO.Unsafe
import System.Process
import System.Exit

import Types

checkSat :: String -> IO Bool
checkSat s = do
    (res, _) <- callSMTSolver "checkSat.smt2" s
    return ((take 3 res) == "sat")

--See https://mail.haskell.org/pipermail/haskell-cafe/2007-November/035146.html
callSMTSolver :: FilePath -> String -> IO (String, ExitCode)
callSMTSolver f s =
    do
        writeFile f s
        (_pIn, pOut, pErr, handle) <- (runInteractiveCommand ("z3 " ++ f))
        exitCode <- waitForProcess handle

        out <- hGetContents pOut
        return (out, exitCode)

printSMTFunc1 :: (ToString a) => String -> a -> String
printSMTFunc1 s x = "(" ++ s ++ " " ++ toString x ++ ")"

printSMTFunc2 :: (ToString a, ToString b) => String -> a -> b -> String
printSMTFunc2 s x y = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ ")"

printSMTFunc3 :: (ToString a, ToString b, ToString c) => String -> a -> b -> c -> String
printSMTFunc3 s x y z = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ " " ++ toString z ++ ")"