module IptablesTypes where

import Types

--Useful for parsing

type Table = String

type IptablesRule = InputRule

data Line = Line {table :: Table 
                  ,command :: Command
                  ,rule :: IptablesRule
                  ,fileline :: Int} deriving (Show)

data Command = Append String
               | Insert String Int
               | New String
               | Flush (Maybe String)
               | None deriving (Eq, Show)