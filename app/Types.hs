{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}


module Types where

import Data.Bits
import Data.Int
import qualified Data.Set as Set  
import qualified Data.Map as Map  

import Data.IP
import Data.IP.Internal

import Data.LargeWord

import Data.Maybe

import Data.String.ToString

import Data.Word

type InputChain a = [InputRule a]
type FileChain = [FileRule]
type Chain = [Rule]
type ExampleChain = [Example]

type ChainId = Int

data Criteria = BoolFlag Flag
                | IPAddress Endpoint IPRange
                | Limit Int Int Int --Id SubId Rate Burst
                        --The Id relates multiple limits that draw from the same
                        --source, SubId indicates a single limit instance split
                        --between multiple rules, more than one of which could
                        --be matched, but which only should be drawn from once
                | Not Criteria
                | Port Endpoint (Either Int (Int, Int))
                | PropVariableCriteria Int
                | Protocol Int
                | SC String deriving (Eq, Show)

data Flag = SYN | ACK | FIN | RST | URG deriving (Ord, Eq, Show)

isNot :: Criteria -> Bool
isNot (Not _) = True
isNot _ = False

ifNotRemoveNot :: Criteria -> Criteria
ifNotRemoveNot (Not x) = ifNotRemoveNot x
ifNotRemoveNot x = x 

boolFlagToFlag :: Criteria -> Flag
boolFlagToFlag (BoolFlag x) = x
boolFlagToFlag _ = error "Must be a BoolFlag."

stringsToFlags :: Map.Map String Criteria
stringsToFlags = Map.fromList [("SYN", BoolFlag SYN)
                              , ("ACK", BoolFlag ACK)
                              , ("FIN", BoolFlag FIN)
                              , ("RST", BoolFlag RST)
                              , ("URG", BoolFlag URG)]

flagsToStrings :: Criteria -> String
flagsToStrings (BoolFlag f) = fromJust $ Map.lookup f flagsToStrings'
flagsToStrings _ = ""

flagsToStrings' :: Map.Map Flag String
flagsToStrings' = Map.fromList [(SYN, "SYN")
                              , (ACK, "ACK")
                              , (FIN, "FIN")
                              , (RST, "RST")
                              , (URG, "URG")]

isStateless :: Criteria -> Bool
isStateless (BoolFlag _) = True
isStateless (IPAddress _ _) = True
isStateless (Limit _ _ _) = False
isStateless (Not c) = isStateless c
isStateless (Port _ _) = True
isStateless (Protocol _) = True
isStateless (SC _) = True

isStateful :: Criteria -> Bool
isStateful c = not . isStateless $ c

toIPRange :: String -> IPRange
toIPRange s = if '/' `elem` s then read s :: IPRange else read (s ++ "/32") :: IPRange

ipAddr :: IPRange -> IP
ipAddr (IPv4Range a) = IPv4 . addr $ a
ipAddr (IPv6Range a) = IPv6 . addr $ a

ipMask :: IPRange -> Either Word32 Word128
ipMask (IPv4Range a) = Left $ foldl (\e x -> setBit e x) 0 [32 - mlen a..31]
ipMask (IPv6Range a) = Right $ foldl (\e x -> setBit e x) 0 [128 - mlen a..127]

--see https://mail.haskell.org/pipermail/beginners/2010-October/005571.html
ipToWord :: IP -> Either Word32 Word128
ipToWord (IPv4 i) = Left $ foldl accum 0 (map fromIntegral (fromIPv4 i))
    where accum a e = (a `shiftL` 8) .|. fromIntegral e
ipToWord (IPv6 i) = Right $ foldl accum 0 (map fromIntegral (fromIPv6 i))
    where accum a e = (a `shiftL` 16) .|. fromIntegral e


data Endpoint = Source | Destination deriving (Eq, Show)

data InputCriteria a = InC Criteria
                     | Ext a
                     | InCNot (InputCriteria a)
                     | And [InputCriteria a]
                     | Or [InputCriteria a] deriving (Eq, Show)

data LimitInput = InCLimit Int Int deriving (Eq, Show)

type FileCriteria = InputCriteria LimitInput 

type ExampleCriteria = InputCriteria State



data Target = Jump String
              | GoTo String
              | Go ChainId Int
              | GoReturn ChainId Int
              | ACCEPT
              | DROP
              | RETURN
              | PropVariableTarget Int Bool
              | ST String deriving (Eq, Show)

data State = Time Seconds deriving (Eq, Show)

targetsToChainIds :: [Target] -> [ChainId]
targetsToChainIds [] = []
targetsToChainIds ((Go ch r):tx) = ch:targetsToChainIds tx
targetsToChainIds ((GoReturn ch r):tx) = ch:targetsToChainIds tx
targetsToChainIds (t:tx) = targetsToChainIds tx 


type Seconds = Int
data Example = Example {instruction :: Instruction, state :: [State]} deriving (Eq, Show)

exampleToRule :: Example -> Rule
exampleToRule e = insRule . instruction $ e


data SynthInstruction r = ToChainNamed {chainName :: String
                                        , insRule :: r}
                          | NoInstruction {insRule :: r} deriving (Eq, Show)


type FileInstruction = SynthInstruction FileRule
type ExampleInstruction = SynthInstruction ExampleRule
type InputInstruction a = SynthInstruction (InputRule a)
type Instruction = SynthInstruction Rule

type Label = Int

type ExampleRule = GenRule ExampleCriteria
type InputRule a = GenRule (InputCriteria a)
type FileRule = GenRule FileCriteria
type Rule = GenRule Criteria

data GenRule crit = Rule { criteria :: [crit]
                   ,targets :: [Target]
                   ,label :: Label
                 } deriving (Eq, Show)

eitherToRule :: Either FileCriteria Target -> FileRule
eitherToRule (Left c) = Rule [c] [] (-1)
eitherToRule (Right t) = Rule [] [t] (-1)

instance Monoid Rule where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2 = Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2}

instance Monoid (InputRule a) where
    mempty = Rule {criteria = [], targets = [], label = minBound :: Int}
    Rule c1 t1 l1 `mappend` Rule c2 t2 l2= Rule { criteria = c1 ++ c2, targets = t1 ++ t2, label = max l1 l2}


type ModuleFunc = [String] -> (Maybe [Either FileCriteria Target], [String])


instance ToString Int where
    toString x = show x

instance ToString Char where
    toString x = [x]