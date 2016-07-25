{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}


module Types where

import qualified Data.Set as Set  

type Label = Int
type InputChain = [InputRule]
type Chain = [Rule]

data Criteria = Not Criteria
                | Port String (Either Int (Int, Int))
                | IPAddress String Int Int Int Int Int
                | PropVariableCriteria Int
                | Protocol Int
                | SC String deriving (Eq, Show)

--type  InputCriteria = Criteria
data InputCriteria = InC Criteria
                     | InCNot InputCriteria
                     | And [InputCriteria]
                     | Or [InputCriteria] deriving (Eq, Show)


data Target = Jump String
              | Go Int Int
              | ACCEPT
              | DROP
              | PropVariableTarget Int Bool
              | ST String deriving (Eq, Show)

type InputRule = GenRule InputCriteria
type Rule = GenRule Criteria

data GenRule a = Rule { criteria :: [a]
                   ,targets :: [Target]
                   ,label :: Label
                 } deriving (Eq, Show)

eitherToRule :: Either InputCriteria Target -> Int -> InputRule
eitherToRule (Left c) i = Rule [c] [] i
eitherToRule (Right t) i = Rule [] [t] i

instance Monoid Rule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2 }

instance Monoid InputRule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2 }


type ModuleFunc = [String] -> (Maybe [Either InputCriteria Target], [String])


class ToString a where
    toString :: a -> String

instance ToString Int where
    toString x = show x

instance ToString String where
    toString x = x

instance ToString Char where
    toString x = [x]