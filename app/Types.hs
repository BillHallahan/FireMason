{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}


module Types where

import qualified Data.Set as Set  
import qualified Data.Map as Map  


type InputChain = [InputRule]
type Chain = [Rule]

data Criteria = Not Criteria
                | Port Endpoint (Either Int (Int, Int))
                | IPAddress String Int Int Int Int Int
                | PropVariableCriteria Int
                | Protocol Int
                | SC String deriving (Eq, Show)


isStateless :: Criteria -> Bool
isStateless (Not c) = isStateless c
isStateless (Port _ _) = True
isStateless (Protocol _) = True
isStateless (SC _) = True

isStateful :: Criteria -> Bool
isStateful c = not . isStateless $ c

data Endpoint = Source | Destination deriving (Eq, Show)

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

targetsToChainIds :: [Target] -> [Int]
targetsToChainIds [] = []
targetsToChainIds ((Go ch r):tx) = ch:targetsToChainIds tx
targetsToChainIds (t:tx) = targetsToChainIds tx 

--data NameIdChain = NameIdChain {
--                            name ::String
--                            , ids :: Int
--                            , chain :: Chain
--                            } deriving (Eq, Show)

type IdNameChain = Map.Map Int (String, Chain)

nameToIdListMap :: String -> IdNameChain -> [Int]
nameToIdListMap s l = Map.keys . Map.filter (\ (n, _) -> n == s) $ l

type InputInstruction = SynthInstruction InputRule
type Instruction = SynthInstruction Rule


data SynthInstruction r = ToChainNamed {chainName :: String
                                        , insRule :: r}
                          | NoInstruction {insRule :: r} deriving (Eq, Show)


type Label = Int

type InputRule = GenRule InputCriteria
type Rule = GenRule Criteria

data GenRule crit = Rule { criteria :: [crit]
                   ,targets :: [Target]
                   ,label :: Label
                 } deriving (Eq, Show)

eitherToRule :: Either InputCriteria Target -> InputRule
eitherToRule (Left c) = Rule [c] [] (-1)
eitherToRule (Right t) = Rule [] [t] (-1)

instance Monoid Rule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2}

instance Monoid InputRule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2= Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2}


type ModuleFunc = [String] -> (Maybe [Either InputCriteria Target], [String])


class ToString a where
    toString :: a -> String

instance ToString Int where
    toString x = show x

instance ToString String where
    toString x = x

instance ToString Char where
    toString x = [x]