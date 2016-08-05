module RuleAddingTests where

import Test.HUnit
import Types
import RuleAdding

ruleAddingTests = TestList [TestLabel "scoreCriteriaList1" scoreCriteriaListTest1
                           , TestLabel "scoreCriteriaList2" scoreCriteriaListTest2
                           , TestLabel "scoreCriteriaList3" scoreCriteriaListTest3
                           , TestLabel "scoreCriteriaList4" scoreCriteriaListTest4
                           , TestLabel "scoreCriteriaList5" scoreCriteriaListTest5
                           , TestLabel "scoreCriteriaList6" scoreCriteriaListTest6
                           , TestLabel "scoreCriteriaList7" scoreCriteriaListTest7
                           , TestLabel "scoreCriteriaList8" scoreCriteriaListTest8
                           , TestLabel "scoreCriteriaList9" scoreCriteriaListTest9
                           , TestLabel "scoreCriteriaList10" scoreCriteriaListTest10
                           , TestLabel "addRuleToChainAtPos" addRuleToChainAtPosTest
                           ]

scoreCriteriaListTest1 =
    TestCase $ assertBool "scoreCriteriaList should match constructors as similarly as possible."
        (let
            c = [Port Destination $ Left 22]
         in
            scoreCriteriaList [Protocol 45] c < scoreCriteriaList [Port Destination $ Right (24, 130)] c)

scoreCriteriaListTest2 =
    TestCase $ assertBool "scoreCriteriaList should match as many constructors as similarly as possible."
        (let
            c = [Protocol 1, Port Destination $ Left 22]
         in
            scoreCriteriaList [Port Destination $ Left 22] c < scoreCriteriaList [Port Destination $ Left 134, Protocol 77] c)

scoreCriteriaListTest3 =
    TestCase $ assertBool "Given otherwise identical constructors, scoreCriteriaList should match parameters as similarly as possible, generally left to right."
        (let
            c = [Port Destination $ Left 22]
         in
            scoreCriteriaList [Port Source $ Left 22] c < scoreCriteriaList [Port Destination $ Right (45, 79)] c)

scoreCriteriaListTest4 =
    TestCase $ assertBool "Given otherwise identical constructors, scoreCriteriaList should match parameters as similarly as possible, generally left to right."
        (let
            c = [Protocol 17]
         in
            scoreCriteriaList [Protocol 15] c < scoreCriteriaList [Protocol 16] c)

scoreCriteriaListTest5 =
    TestCase $ assertBool "Given otherwise identical constructors, scoreCriteriaList should match parameters as similarly as possible, generally left to right."
        (let
            c = [Protocol 17, Port Destination $ Left 56]
         in
            scoreCriteriaList [Protocol 15, Port Destination $ Left 56] c < scoreCriteriaList [Port Destination $ Left 56, Protocol 16] c)

scoreCriteriaListTest6 =
    TestCase $ assertBool "scoreCriteriaList should favor lists without extra constructors."
        (let
            c = [Protocol 17]
         in
            scoreCriteriaList [Protocol 16, Port Source $ Left 156] c < scoreCriteriaList [Protocol 123] c)

scoreCriteriaListTest7 =
    TestCase $ assertBool "scoreCriteriaList should look inside Not's, and favor matching two elements that are both in Not's."
        (let
            c = [Not $ Protocol 17]
         in
            scoreCriteriaList [Protocol 17] c < scoreCriteriaList [Not $ Protocol 83] c)

scoreCriteriaListTest8 =
    TestCase $ assertBool "scoreCriteriaList should look inside Not's, but favor matching two elements that are both not in Not's."
        (let
            c = [Protocol 17]
         in
            scoreCriteriaList [Not $ Protocol 17] c < scoreCriteriaList [Protocol 83] c)


scoreCriteriaListTest9 =
    TestCase $ assertBool "scoreCriteriaList should look inside Not's, and matching two elements, only one of which is in a Not."
        (let
            c = [Not $ Protocol 17]
         in
            scoreCriteriaList [Port Destination $ Left 4] c < scoreCriteriaList [Protocol 83] c)

scoreCriteriaListTest10 =
    TestCase $ assertBool "scoreCriteriaList should look inside Not's, and matching two elements, only one of which is in a Not."
        (let
            c = [Protocol 17]
         in
            scoreCriteriaList [Port Destination $ Left 4] c < scoreCriteriaList [Not $ Protocol 83] c)

addRuleToChainAtPosTest =
    TestCase $ assertEqual "addRuleToChainAtPos is not eliminating corrrectly."
        [Rule [Protocol 0] [DROP]
         , Rule [Protocol 1] [DROP]
         , Rule [Protocol 2] [DROP]
         , Rule [Protocol 3] [DROP]
         , Rule [Protocol 4] [DROP]]
        (addRuleToChainAtPos 
            (Rule [Protocol 2] [DROP])
            [Rule [Protocol 0] [DROP]
             , Rule [Protocol 1] [DROP]
             , Rule [Protocol 3] [DROP]
             , Rule [Protocol 4] [DROP]]
             2
        )



