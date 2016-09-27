module IptablesTypes where

import Types

--Useful for parsing

type Table = String

type IptablesRule = FileRule

data Line = Line {table :: Table 
                  ,command :: Command
                  ,rule :: IptablesRule
                  ,fileline :: Int} deriving (Show)

data Command = Append String
               | Insert String Int
               | New String
               | Flush (Maybe String)
               | None deriving (Eq, Show)

comChainName :: Command -> Maybe String
comChainName (Append n) = Just n
comChainName (Insert n _) = Just n
comChainName (New n) = Just n
comChainName (Flush (Just n)) = Just n
comChainName _ = Nothing