module IptablesTypes where

import Types

--Useful for parsing

type Table = String

data Line = Line {table :: Table 
                  ,command :: Command
                  ,rule :: Rule} deriving (Show)

data Command = Append String
               | Insert String Int
               | New String
               | Flush (Maybe String)
               | None deriving (Eq, Show)