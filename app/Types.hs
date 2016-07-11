{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}


module Types where

import qualified Data.Set as Set  

type Chain = [Rule]

data Criteria = And [Criteria] --We have and but not or to enforce only having horn clauses.
                               --In general, sometimes just [Criteria] is also used for Anded clauses
                | Not Criteria
                | Port String (Either Int (Int, Int))
                | IPAddress String Int Int Int Int Int
                | Protocol Int
                | SC String deriving (Eq, Show)

data Target = Jump String
              | ACCEPT
              | DROP
              | ST String deriving (Eq, Show)

data Command = Append String Rule
               | Insert String Int Rule
               | New String
               | Flush (Maybe String) deriving (Eq, Show)

data Rule = Rule { criteria :: [Criteria]
                   ,targets :: [Target]
                   ,label :: Int
                 } deriving (Eq, Show)

eitherToRule :: Either Criteria Target -> Rule
eitherToRule (Left c) = Rule [c] [] (minBound :: Int)
eitherToRule (Right t) = Rule [] [t] (minBound :: Int)


instance Monoid Rule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2 }


type ModuleFunc = [String] -> (Maybe [Either Criteria Target], [String])


class ToString a where
  toString :: a -> String

instance ToString Int where
    toString x = show x

instance ToString String where
    toString x = x

instance ToString Char where
    toString x = [x]
