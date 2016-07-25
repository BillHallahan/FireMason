module ConvertToHornTests where

import Test.HUnit
import Types
import ConvertToHorn

convertToHornTests = TestList [TestLabel "condenseAndTest" condenseAndTest
                               , TestLabel "condenseOrTest" condenseOrTest
                               , TestLabel "eliminateOrTest" eliminateOrTest

                               , TestLabel "inputCriteriaToCriteriaTestAnd" inputCriteriaToCriteriaTestAnd
                               , TestLabel "inputCriteriaToCriteriaTestOr" inputCriteriaToCriteriaTestOr
                               , TestLabel "inputCriteriaToCriteriaTestOr2" inputCriteriaToCriteriaTestOr2
                               , TestLabel "inputCriteriaToCriteriaTestOr3" inputCriteriaToCriteriaTestOr3

                               , TestLabel "simplifyNotsTestAnd" simplifyNotsTestAnd
                               , TestLabel "simplifyNotsTestOr" simplifyNotsTestOr
                               , TestLabel "simplifyNotsTestNot" simplifyNotsTestNot
                               , TestLabel "simplifyNotsTestMixed" simplifyNotsTestMixed

                             --, TestLabel "eliminateOrsOr" eliminateOrsTestOr4
                             ]

condenseAndTest =
    TestCase $ assertEqual "condenseAnd is not eliminating corrrectly."
        [InC . Protocol $ 1, InC $ Port "destination" (Left 1), InC $ Port "source" (Left 2)
            , Or [And [InC . Protocol $ 3, InC . Protocol $ 4]]]
        (condenseAnd
            [And $ 
                [InC . Protocol $ 1
                    , And [InC $ Port "destination" (Left 1), InC $ Port "source" (Left 2)]
                    , Or [And [InC . Protocol $ 3, InC . Protocol $ 4]]
                ]
            ])
            
condenseOrTest =
    TestCase $ assertEqual "condenseOr is not eliminating corrrectly."
        [InC . Protocol $ 1, InC $ Port "destination" (Left 1), InC $ Port "source" (Left 2)
            , And [Or [InC . Protocol $ 3, InC . Protocol $ 4]]]
        (condenseOr
            [Or $ 
                [InC . Protocol $ 1
                    , Or [InC $ Port "destination" (Left 1), InC $ Port "source" (Left 2)]
                    , And [Or [InC . Protocol $ 3, InC . Protocol $ 4]]
                ]
            ])

eliminateOrTest =
    TestCase $ assertEqual "eliminateOr is not correctly converting clauses with Or"
        (PropVariableCriteria 5,
            [Rule {criteria = [InCNot . InC . Protocol $ 1, InCNot . InC . Protocol $ 2, InCNot . InC . Protocol $ 3], targets = [PropVariableTarget 5 False], label = -1},
            Rule {criteria = [InC . Protocol $ 1], targets = [PropVariableTarget 5 True], label = -1},
            Rule {criteria = [InC . Protocol $ 2], targets = [PropVariableTarget 5 True], label = -1},
            Rule {criteria = [InC . Protocol $ 3], targets = [PropVariableTarget 5 True], label = -1}]
        )
        (eliminateOr (Or [InC . Protocol $ 1, InC . Protocol $ 2, InC . Protocol $ 3]) 5)

inputCriteriaToCriteriaTestAnd =
    TestCase $ assertEqual "inputCriteriaToCriteria is not eliminating corrrectly."
        ([Protocol 1, Port "destination" (Left 1), Protocol 2, Port "destination" (Left 3)], [], 0)
        (inputCriteriaToCriteria 
            [And 
                [InC . Protocol $ 1, InC $ Port "destination" (Left 1), 
                    And [InC . Protocol $ 2, InC $ Port "destination" (Left 3)]
                ]
            ]
            0)

inputCriteriaToCriteriaTestOr =
    TestCase $ assertEqual "inputCriteriaToCriteria is not eliminating corrrectly."
    (
        [PropVariableCriteria 0],
        [Rule {criteria = [InCNot . And $ [InC . Protocol $ 1, InC $ Port "destination" (Left 3)], InCNot (InC . Protocol $ 2)], targets = [PropVariableTarget 0 False], label = -1},
        Rule {criteria = [And [InC . Protocol $ 1, InC $ Port "destination" (Left 3)]], targets = [PropVariableTarget 0 True], label = -1},
        Rule {criteria = [InC . Protocol $ 2], targets = [PropVariableTarget 0 True], label = -1}]
        , 1
    )
    (inputCriteriaToCriteria [Or [And [InC . Protocol $ 1, InC $ Port "destination" (Left 3)], InC . Protocol $ 2]] 0)

inputCriteriaToCriteriaTestOr2 =
    TestCase $ assertEqual "eliminateOrs is not eliminating corrrectly."
        (
            [PropVariableCriteria 0, PropVariableCriteria 1],
            [Rule {criteria = [InCNot . InC . Protocol $ 1, InCNot . InC . Protocol $ 2], targets = [PropVariableTarget 0 False], label = -1},
            Rule {criteria = [InC . Protocol $ 1], targets = [PropVariableTarget 0 True], label = -1},
            Rule {criteria = [InC . Protocol $ 2], targets = [PropVariableTarget 0 True], label = -1},
            Rule {criteria = [InCNot . InC $ Port "destination" (Left 1), InCNot . InC $ Port "destination" (Left 2)], targets = [PropVariableTarget 1 False], label = -1},
            Rule {criteria = [InC $ Port "destination" (Left 1)], targets = [PropVariableTarget 1 True], label = -1},
            Rule {criteria = [InC $ Port "destination" (Left 2)], targets = [PropVariableTarget 1 True], label = -1}]
            , 2
        )
        (inputCriteriaToCriteria 
            [And 
                [Or [InC . Protocol $ 1, InC . Protocol $ 2], 
                Or [InC $ Port "destination" (Left 1), InC $ Port "destination" (Left 2)]
                ]
            ] 0)

inputCriteriaToCriteriaTestOr3 =
    TestCase $ assertEqual "eliminateOrs is not eliminating correctly."
    ([
        PropVariableCriteria 0,
        Protocol 5,
        PropVariableCriteria 1
     ], 
     [Rule {criteria = [InCNot . InC . Protocol $ 1, InCNot . InC . Protocol $ 2, InCNot . InC . Protocol $ 3, InCNot . InC . Protocol $ 4], targets = [PropVariableTarget 0 False], label = -1},
     Rule {criteria = [InC . Protocol $ 1], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [InC . Protocol $ 2], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [InC . Protocol $ 3], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [InC . Protocol $ 4], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [InCNot . InC . Protocol $ 6, InCNot . InC . Protocol $ 7, InCNot . InC . Protocol $ 8, InCNot . InC . Protocol $ 9], targets = [PropVariableTarget 1 False], label = -1},
     Rule {criteria = [InC . Protocol $ 6], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [InC . Protocol $ 7], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [InC . Protocol $ 8], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [InC . Protocol $ 9], targets = [PropVariableTarget 1 True], label = -1}]
     , 2)
    (inputCriteriaToCriteria
        [
            And [
                And [
                    Or [
                        Or [InC . Protocol $ 1, InC . Protocol $ 2],
                        Or [InC . Protocol $ 3, InC . Protocol $ 4]
                    ],
                    InC . Protocol $ 5
                ],
                Or [
                    Or [InC . Protocol $ 6, 
                        Or [InC . Protocol $ 7, InC . Protocol $ 8, InC . Protocol $ 9]
                    ]
                ]
            ]
        ] 0)

simplifyNotsTestAnd =
    TestCase $ assertEqual "simplifyNot is not adjusting (Not And) to (Or Not) corrrectly."
        [Or $ [InCNot . InC . Protocol $ 1, InCNot . InC $ Port "destination" (Left 1)]]
        (simplifyNots [InCNot . And $ [InC . Protocol $ 1, InC $ Port "destination" (Left 1)]])

simplifyNotsTestOr =
    TestCase $ assertEqual "simplifyNot is not adjusting (Not Or) to (Or And) corrrectly."
        [And $ [InCNot . InC . Protocol $ 1, InCNot . InC $ Port "destination" (Left 1)]]
        (simplifyNots [InCNot . Or $ [InC . Protocol $ 1, InC $ Port "destination" (Left 1)]])

simplifyNotsTestNot =
    TestCase $ assertEqual "simplifyNot is not adjusting (Not Not) to () corrrectly."
        [InC . Protocol $ 1]
        (simplifyNots [InCNot . InCNot . InC . Protocol $ 1])
        
simplifyNotsTestMixed = TestCase $
    assertEqual "simplifyNot is not adjusting corrrectly."
        [Or 
            [And 
                [InCNot . InC . Protocol $ 1, InCNot . InC . Protocol $ 2], 
                Or [InCNot . InC . Protocol $ 3, InCNot . InC . Protocol $ 4]
            ]
         , InC . Protocol $ 5
         , InCNot . InC . Protocol $ 7
         , Or [InCNot . InC . Protocol $ 8, And [InCNot . InC . Protocol $ 9, InCNot . InC . Protocol $ 10]]
        ]
        (simplifyNots 
        [InCNot 
            (And 
                [Or [InC . Protocol $ 1, InC . Protocol $ 2], 
                 And [InC . Protocol $ 3, InC . Protocol $ 4]
                ]
            )
         , InC . Protocol $ 5
         , InCNot . InCNot . InCNot . InCNot . InCNot . InC . Protocol $ 7
         , InCNot 
            (And [InC . Protocol $ 8, Or [InC . Protocol $ 9, InC . Protocol $ 10]])
        ])