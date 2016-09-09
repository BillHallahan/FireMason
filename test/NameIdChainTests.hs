module NameIdChainTests where

import Test.HUnit
import Types
import NameIdChain

import Data.Map as Map

nameIdChainTests = TestList [TestLabel "idsWithNameTest" idsWithNameTest
                             , TestLabel "increaseIndexesTest" increaseIndexesTest
                             , TestLabel "topLevelChainsTest" topLevelChainsTest
                             , TestLabel "topLevelJumpingToTest1" topLevelJumpingToTest1
                             , TestLabel "topLevelJumpingToTest2" topLevelJumpingToTest2
                             , TestLabel "reduceReferencedTest1" reduceReferencedTest1
                             , TestLabel "reduceReferencedTest2" reduceReferencedTest2
                             , TestLabel "maxIdTest" maxIdTest
                            ]


chain0 = [Rule {criteria = [Protocol 1, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 1, Port Source (Left 2)], targets = [Go 1 0], label = -1},
          Rule {criteria = [Protocol 1, Port Destination (Left 4)], targets = [Go 5 0], label = -1}
         ]

chain0Plus6 = [Rule {criteria = [Protocol 1, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 1, Port Source (Left 2)], targets = [Go 7 0], label = -1},
          Rule {criteria = [Protocol 1, Port Destination (Left 4)], targets = [Go 11 0], label = -1}
         ]

chain1 = [Rule {criteria = [Protocol 2, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 2, Port Source (Left 2)], targets = [Go 3 0], label = -1},
          Rule {criteria = [Protocol 2, Port Source (Left 3)], targets = [ACCEPT], label = -1},
          Rule {criteria = [Protocol 2, Port Destination (Left 2)], targets = [Go 7 0], label = -1}
         ]

chain1Plus6 = [Rule {criteria = [Protocol 2, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 2, Port Source (Left 2)], targets = [Go 9 0], label = -1},
          Rule {criteria = [Protocol 2, Port Source (Left 3)], targets = [ACCEPT], label = -1},
          Rule {criteria = [Protocol 2, Port Destination (Left 2)], targets = [Go 13 0], label = -1}
         ]

chain3 = [Rule {criteria = [Protocol 3, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 3, Port Source (Left 2)], targets = [Go 8 0], label = -1}
         ]

chain3Plus6 = [Rule {criteria = [Protocol 3, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 3, Port Source (Left 2)], targets = [Go 14 0], label = -1}
         ]

chain5 = [Rule {criteria = [Protocol 5, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 5, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain5_2 = [Rule {criteria = [Protocol 5, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 5, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain8 = [Rule {criteria = [Protocol 8, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 8, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain11 = [Rule {criteria = [Protocol 11, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 11, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain14 = [Rule {criteria = [Protocol 14, Port Destination (Left 1)], targets = [Go 17 0], label = -1},
          Rule {criteria = [Protocol 14, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain14Plus6 = [Rule {criteria = [Protocol 14, Port Destination (Left 1)], targets = [Go 23 0], label = -1},
          Rule {criteria = [Protocol 14, Port Source (Left 2)], targets = [DROP], label = -1}
         ]

chain17 = [Rule {criteria = [Protocol 17, Port Destination (Left 1)], targets = [DROP], label = -1},
          Rule {criteria = [Protocol 17, Port Source (Left 2)], targets = [DROP], label = -1}
         ]


testIdNameChain = pathSimplification2 $
                  Map.fromList [(0, ("chain0", chain0))
                               , (1, ("chain1", chain1))
                               , (3, ("chain3", chain3))
                               , (5, ("chain5", chain5))
                               , (7, ("chain5", chain5_2))
                               , (8, ("chain8", chain8))
                               , (11, ("chain11", chain11))
                               , (14, ("chain14", chain14))
                               , (17, ("chain17", chain17))
                               ]

testIdNameChainPlus6 = pathSimplification2 $
                       Map.fromList [(6, ("chain0", chain0Plus6))
                                    , (7, ("chain1", chain1Plus6))
                                    , (9, ("chain3", chain3Plus6))
                                    , (11, ("chain5", chain5))
                                    , (13, ("chain5", chain5_2))
                                    , (14, ("chain8", chain8))
                                    , (17, ("chain11", chain11))
                                    , (20, ("chain14", chain14Plus6))
                                    , (23, ("chain17", chain17))
                                    ]

idsWithNameTest = 
    TestCase $ assertEqual "idsWithNameTest is not working correctly."
    [5, 7]
    (idsWithName testIdNameChain "chain5")

increaseIndexesTest = 
    TestCase $ assertEqual "increaseIndexes is not working correctly."
    (toList' testIdNameChainPlus6)
    (toList' $ increaseIndexes testIdNameChain 6)

topLevelChainsTest =
  TestCase $ assertEqual "topLevelChains is not working correctly."
    [0, 11, 14]
    (topLevelChains testIdNameChain)

topLevelJumpingToTest1 =
  TestCase $ assertEqual "topLevelJumpingTo is not working correctly."
    [0]
    (topLevelJumpingTo testIdNameChain [7, 8])

topLevelJumpingToTest2 =
  TestCase $ assertEqual "topLevelJumpingTo is not working correctly."
    [0, 14]
    (topLevelJumpingTo testIdNameChain [5, 17])

reduceReferencedTest1 =
    TestCase $ assertEqual "reduceReferenced is not working correctly."
    (toList $ Map.fromList [(1, ("chain1", chain1))
                  , (3, ("chain3", chain3))
                  , (7, ("chain5", chain5_2))
                  , (8, ("chain8", chain8))
                  ])
    (toList' $ reduceReferenced testIdNameChain [1])

reduceReferencedTest2 =
    TestCase $ assertEqual "reduceReferenced is not working correctly."
    (toList $ Map.fromList [(0, ("chain0", chain0))
                  , (1, ("chain1", chain1))
                  , (3, ("chain3", chain3))
                  , (5, ("chain5", chain5))
                  , (7, ("chain5", chain5_2))
                  , (8, ("chain8", chain8))
                  ])
    (toList' $ reduceReferenced testIdNameChain [0, 1])

maxIdTest =
    TestCase $ assertEqual "maxId is not working correctly."
    17
    (maxId testIdNameChain)