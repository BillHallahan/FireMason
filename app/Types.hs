{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}


module Types where

import qualified Data.Set as Set  
import qualified Data.Map as Map  


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



type InputRule = GenRule InputCriteria-- Int 
type Rule = GenRule Criteria-- Int

data GenRule crit = Rule { criteria :: [crit]
                   ,targets :: [Target]
                   --,label :: label
                 } deriving (Eq, Show)

eitherToRule :: Either InputCriteria Target -> InputRule
eitherToRule (Left c) = Rule [c] []
eitherToRule (Right t) = Rule [] [t]

instance Monoid Rule where
    mempty = Rule {criteria = [], targets = []}
    Rule c1 t1 `mappend` Rule c2 t2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2}

instance Monoid InputRule where
    mempty = Rule {criteria = [], targets = []}
    Rule c1 t1 `mappend` Rule c2 t2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2}


type ModuleFunc = [String] -> (Maybe [Either InputCriteria Target], [String])


class ToString a where
    toString :: a -> String

instance ToString Int where
    toString x = show x

instance ToString String where
    toString x = x

instance ToString Char where
    toString x = [x]