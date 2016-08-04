module NameIdChainTests where

import Test.HUnit
import Types
import NameIdChain

import Data.Map as Map

nameIdChainTests = TestList [TestLabel "increaseIndexesTest" increaseIndexesTest
                             , TestLabel "increaseIndexesChainTest" increaseIndexesChainTest
                             , TestLabel "increaseIndexesTargetTest1" increaseIndexesTargetTest1
                             , TestLabel "increaseIndexesTargetTest2" increaseIndexesTargetTest2
                             , TestLabel "reduceReferencedTest" reduceReferencedTest
                             , TestLabel "maxIdTest" maxIdTest
                            ]


chain0 = [Rule {criteria = [Protocol 1, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 1, Port Source (Left 2)], targets = [Go 1 0]},
          Rule {criteria = [Protocol 1, Port Destination (Left 4)], targets = [Go 5 0]}
         ]

chain0Plus6 = [Rule {criteria = [Protocol 1, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 1, Port Source (Left 2)], targets = [Go 7 0]},
          Rule {criteria = [Protocol 1, Port Destination (Left 4)], targets = [Go 11 0]}
         ]

chain1 = [Rule {criteria = [Protocol 2, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 2, Port Source (Left 2)], targets = [Go 3 0]},
          Rule {criteria = [Protocol 2, Port Source (Left 3)], targets = [ACCEPT]},
          Rule {criteria = [Protocol 2, Port Destination (Left 2)], targets = [Go 7 0]}
         ]

chain1Plus6 = [Rule {criteria = [Protocol 2, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 2, Port Source (Left 2)], targets = [Go 9 0]},
          Rule {criteria = [Protocol 2, Port Source (Left 3)], targets = [ACCEPT]},
          Rule {criteria = [Protocol 2, Port Destination (Left 2)], targets = [Go 13 0]}
         ]

chain3 = [Rule {criteria = [Protocol 3, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 3, Port Source (Left 2)], targets = [Go 8 0]}
         ]

chain3Plus6 = [Rule {criteria = [Protocol 3, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 3, Port Source (Left 2)], targets = [Go 14 0]}
         ]

chain5 = [Rule {criteria = [Protocol 5, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 5, Port Source (Left 2)], targets = [DROP]}
         ]

chain5_2 = [Rule {criteria = [Protocol 5, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 5, Port Source (Left 2)], targets = [DROP]}
         ]

chain8 = [Rule {criteria = [Protocol 8, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 8, Port Source (Left 2)], targets = [DROP]}
         ]

chain11 = [Rule {criteria = [Protocol 11, Port Destination (Left 1)], targets = [DROP]},
          Rule {criteria = [Protocol 11, Port Source (Left 2)], targets = [DROP]}
         ]


testIdNameChain = Map.fromList [(0, ("chain0", chain0))
                               , (1, ("chain1", chain1))
                               , (3, ("chain3", chain3))
                               , (5, ("chain5", chain5))
                               , (7, ("chain5", chain5_2))
                               , (8, ("chain8", chain8))
                               , (11, ("chain11", chain11))
                               ]

testIdNameChainPlus6 = Map.fromList [(6, ("chain0", chain0Plus6))
                                    , (7, ("chain1", chain1Plus6))
                                    , (9, ("chain3", chain3Plus6))
                                    , (11, ("chain5", chain5))
                                    , (13, ("chain5", chain5_2))
                                    , (14, ("chain8", chain8))
                                    , (17, ("chain11", chain11))
                                    ]

increaseIndexesTest = 
    TestCase $ assertEqual "increaseIndexes is not working correctly."
    (testIdNameChainPlus6)
    (increaseIndexes testIdNameChain 6)

increaseIndexesChainTest = 
    TestCase $ assertEqual "increaseIndexesChain is not working correctly."
    (chain1Plus6)
    (increaseIndexesChain chain1 6)

increaseIndexesTargetTest1 =
    TestCase $ assertEqual "increaseIndexesTarget is not working correctly."
    (Go 9 0)
    (increaseIndexesTarget (Go 5 0) 4)

increaseIndexesTargetTest2 =
    TestCase $ assertEqual "increaseIndexesTarget is not working correctly."
    DROP
    (increaseIndexesTarget DROP 4)

reduceReferencedTest =
    TestCase $ assertEqual "reduceReferenced is not working correctly."
    (Map.fromList [(1, ("chain1", chain1))
                  , (3, ("chain3", chain3))
                  , (7, ("chain5", chain5_2))
                  , (8, ("chain8", chain8))
                  ])
    (reduceReferenced testIdNameChain 1)

maxIdTest =
    TestCase $ assertEqual "maxId is not working correctly."
    11
    (maxId testIdNameChain)