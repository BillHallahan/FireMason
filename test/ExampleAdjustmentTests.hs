module ExampleAdjustmentTests where

import Test.HUnit
import Types
import ExampleAdjustment

criteriaPrereqAdditionTests = TestList [TestLabel "criteriaPrereqAdditionTest1" criteriaPrereqAdditionTest1
                                        , TestLabel "criteriaPrereqAdditionTest2" criteriaPrereqAdditionTest2
                                        , TestLabel "criteriaPrereqAdditionTest3" criteriaPrereqAdditionTest3
                                        , TestLabel "criteriaPrereqAdditionTest4" criteriaPrereqAdditionTest4]

criteriaPrereqAdditionTest1 =
    TestCase $ assertEqual "criteriaPrereqAdditionTest1 is not working correctly."
    [ToChainNamed "test" (Rule [Protocol 6, Not . BoolFlag $ ACK] [ACCEPT] (-1))]
    (criteriaPrereqAddition $ ToChainNamed "test" (Rule [Not . BoolFlag $ ACK] [ACCEPT] (-1)))

criteriaPrereqAdditionTest2 =
    TestCase $ assertEqual "criteriaPrereqAdditionTest2 is not working correctly."
    [ToChainNamed "test" (Rule [Protocol 6, BoolFlag SYN, BoolFlag ACK] [ACCEPT] (-1))]
    (criteriaPrereqAddition $ ToChainNamed "test" (Rule [BoolFlag SYN, BoolFlag ACK] [ACCEPT] (-1)))

criteriaPrereqAdditionTest3 =
    TestCase $ assertEqual "criteriaPrereqAdditionTest3 is not working correctly."
    [ToChainNamed "test" (Rule [Protocol 6, Port Destination $ Left 8] [ACCEPT] (-1))
    , ToChainNamed "test" (Rule [Protocol 17, Port Destination $ Left 8] [ACCEPT] (-1))]
    (criteriaPrereqAddition $ ToChainNamed "test" (Rule [Port Destination $ Left 8] [ACCEPT] (-1)))

criteriaPrereqAdditionTest4 =
    TestCase $ assertEqual "criteriaPrereqAdditionTest4 is not working correctly."
    [ToChainNamed "test" (Rule [Protocol 6, Port Destination $ Left 8] [ACCEPT] (-1))]
    (criteriaPrereqAddition $ ToChainNamed "test" (Rule [Protocol 6, Port Destination $ Left 8] [ACCEPT] (-1)))
