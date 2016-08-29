module SMT where

import System.IO
import System.IO.Unsafe
import System.Process
import System.Exit
import Data.String.ToString
import Z3.Monad

import Types

import Debug.Trace

data SMT = SMTAnd [SMT]
           | Assert SMT
           | SMTEq SMT SMT
           | SMTF1 String SMT
           | SMTF2 String SMT SMT
           | SMTF3 String SMT SMT SMT
           | Implies SMT SMT
           | SMTInt Int
           | SMTNot SMT
           | SMTOrd Ordering SMT SMT
           | SMTOr [SMT]
           | SMTString String

           | DeclareConst String String

           | MatchesCriteria Int Int Int
           | MatchesRule Int Int Int
           | Reaches Int Int Int
           | ReachesEnd Int Int
           | ReachesReturn Int Int
           | ReturnsFrom Int Int
           | RuleTarget Int Int
           | TerminatesWith Int
           | TerminatesAt Int Int Int
           | TopLevelChain Int

instance ToString SMT where
    toString (SMTAnd s) = "(and " ++ foldr (++) "" (map (toString) s) ++ ")"
    toString (Assert s) = toString (SMTF1 "assert" s) ++ "\n"
    toString (SMTEq e1 e2) = toString (SMTF2 "=" e1 e2)
    toString (SMTF1 n s) = "(" ++ n ++ " " ++ toString s ++ ")"
    toString (SMTF2 n s1 s2) = "(" ++ n  ++ " " ++ toString s1 ++ " " ++ toString s2 ++ ")"
    toString (SMTF3 n s1 s2 s3) = "(" ++ n ++ " " ++ toString s1 ++ " " ++ toString s2 ++ " " ++ toString s3 ++ ")"
    toString (Implies s1 s2) = toString (SMTF2 "=>" s1 s2)
    toString (SMTInt i) = toString i
    toString (SMTNot s) = toString (SMTF1 "not" s)
    toString (SMTOrd LT s1 s2) = toString (SMTF2 "<" s1 s2)
    toString (SMTOrd GT s1 s2) = toString (SMTF2 ">" s1 s2)
    toString (SMTOrd EQ s1 s2) = toString (SMTF2 "=" s1 s2)
    toString (SMTOr s) = "(or " ++ foldr (++) "" (map (toString) s) ++ ")"
    toString (SMTString s) = s

    toString (DeclareConst s1 s2) = toString (SMTF2 "declare-const" (SMTString s1) (SMTString s2))

    toString (MatchesCriteria p c r) = toString (SMTF3 "matches-criteria" (SMTInt p) (SMTInt c) (SMTInt r))
    toString (MatchesRule p c r) = toString (SMTF3 "matches-rule" (SMTInt p) (SMTInt c) (SMTInt r))
    toString (Reaches p c r) = toString (SMTF3 "reaches" (SMTInt p) (SMTInt c) (SMTInt r))
    toString (ReachesEnd p c) = toString (SMTF2 "reaches-end" (SMTInt p) (SMTInt c))
    toString (ReachesReturn p c) = toString (SMTF2 "reaches-return" (SMTInt p) (SMTInt c))
    toString (ReturnsFrom p c) = toString (SMTF2 "returns-from" (SMTInt p) (SMTInt c))
    toString (RuleTarget c r) = toString (SMTF2 "rule-target" (SMTInt c) (SMTInt r))
    toString (TerminatesWith p) = toString (SMTF1 "terminates-with" (SMTInt p))
    toString (TerminatesAt p c r) = toString (SMTF3 "terminates-at" (SMTInt p) (SMTInt c) (SMTInt r))
    toString (TopLevelChain c) = toString (SMTF1 "top-level-chain" (SMTInt c))



checkSat :: String -> IO Bool
checkSat s = do
    res <- callSMTSolver "checkSat.smt2" s
    return ((take 3 res) == "sat")

--See https://mail.haskell.org/pipermail/haskell-cafe/2007-November/035146.html
--https://mail.haskell.org/pipermail/haskell-cafe/2007-April/024251.html
callSMTSolver :: FilePath -> String -> IO String
callSMTSolver f s =
    do
        writeFile f s
        (_, pOut, _, handle) <- (runInteractiveCommand ("z3 " ++ f))
        out <- hGetContents pOut
        foldr seq (waitForProcess handle) out

        return out

printSMTFunc1 :: (ToString a) => String -> a -> String
printSMTFunc1 s x = "(" ++ s ++ " " ++ toString x ++ ")"

printSMTFunc2 :: (ToString a, ToString b) => String -> a -> b -> String
printSMTFunc2 s x y = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ ")"

printSMTFunc3 :: (ToString a, ToString b, ToString c) => String -> a -> b -> c -> String
printSMTFunc3 s x y z = "(" ++ s ++ " " ++ toString x ++ " " ++ toString y ++ " " ++ toString z ++ ")"