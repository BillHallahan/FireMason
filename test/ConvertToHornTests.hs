module ConvertToHornTests where

import Test.HUnit
import Types
import ConvertToHorn

convertToHornTests = TestList [TestLabel "condenseAndsOrsTestNotAnd" condenseAndsOrsTestNotAnd
                             , TestLabel "condenseAndsOrsTestNotOrAnd" condenseAndsOrsTestOrAnd
                             , TestLabel "condenseAndsOrsTestNotOrAnd" condenseAndsOrsTestOrAnd2
                             , TestLabel "condenseAndsOrsTestNotNot" condenseAndsOrsTestNotNot
                             , TestLabel "condenseAndsOrsTestAndFalse" condenseAndsOrsTestAndFalse
                             , TestLabel "condenseAndsOrsTestAndTrue" condenseAndsOrsTestAndTrue

                             , TestLabel "eliminateOrsAnd" eliminateOrsTestAnd
                             , TestLabel "eliminateOrsOr" eliminateOrsTestOr
                             , TestLabel "eliminateOrsOr" eliminateOrsTestOr2
                             , TestLabel "eliminateOrsOr" eliminateOrsTestOr3
                             , TestLabel "eliminateOrsOr" eliminateOrsTestOr4

                             , TestLabel "simplifyNotsTestAnd" simplifyNotsTestAnd
                             , TestLabel "simplifyNotsTestOr" simplifyNotsTestOr
                             , TestLabel "simplifyNotsTestNot" simplifyNotsTestNot
                             , TestLabel "simplifyNotsTestMixed" simplifyNotsTestMixed]

condenseAndsOrsTestNotAnd =
    TestCase $ assertEqual "eliminateAnd is not eliminating corrrectly."
        [Not . And $ 
            [Protocol 1, Port "destination" (Left 1), Port "source" (Left 2)]
        ]
        (condenseAndsOrs
            [Not . And $ 
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2)]
                ]
            ] False)
            

condenseAndsOrsTestOrAnd =
    TestCase $ assertEqual "condenseAndsOrs is not eliminating corrrectly."
        [Not . Or $
            [Protocol 1, 
                And [Port "destination" (Left 1), Port "source" (Left 2)]
            ]
        ]
        (condenseAndsOrs 
            [Not . Or $ 
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2)]
                ]
            ] False)

condenseAndsOrsTestOrAnd2 =
    TestCase $ assertEqual "condenseAndsOrs is not eliminating corrrectly."
        [Not . Or $ 
            [Protocol 1, 
                And [Port "destination" (Left 1), Port "source" (Left 2), Port "destination" (Left 3)]
            ]
        ]
        (condenseAndsOrs
            [Not . Or $
                [Protocol 1, 
                    And [Port "destination" (Left 1), 
                        And [Port "source" (Left 2), Port "destination" (Left 3)]
                    ]
                ]
            ] False)


condenseAndsOrsTestNotNot =
    TestCase $ assertEqual "condenseAndsOrs is not eliminating corrrectly."
        [ Not . Not . Not . Not . Not $
            And [Protocol 1, Port "source" (Left 1)]
        ]
        (condenseAndsOrs
            [ Not . Not . Not . Not . Not $
                And [Protocol 1, 
                    And [Port "source" (Left 1)]
                ]
            ] True
        )
        
condenseAndsOrsTestAndFalse =
    TestCase $ assertEqual "condenseAndsOrs is not eliminating corrrectly."
        [Protocol 1, Port "destination" (Left 1)]
        (condenseAndsOrs [And $ [Protocol 1, Port "destination" (Left 1)]] False)

condenseAndsOrsTestAndTrue =
    TestCase $ assertEqual "condenseAndsOrs is not eliminating corrrectly."
        [And $ [Protocol 1, Port "destination" (Left 1)]]
        (condenseAndsOrs [And $ [Protocol 1, Port "destination" (Left 1)]] True)



andCriteria = 
    [And 
        [Protocol 1, Port "destination" (Left 1), 
            And [Protocol 2, Port "destination" (Left 3)]
        ]
    ]

eliminateOrsTestAnd =
    TestCase $ assertEqual "eliminateOrs is not eliminating corrrectly."
        (andCriteria, [], 0)
        (eliminateOrs andCriteria 0)

eliminateOrsTestOr =
    TestCase $ assertEqual "eliminateOrs is not eliminating corrrectly."
    (
        [PropVariableCriteria 0],
        [Rule {criteria = [And [Protocol 1, Port "destination" (Left 3)]], targets = [PropVariableTarget 0 True], label = -1},
        Rule {criteria = [Protocol 2], targets = [PropVariableTarget 0 True], label = -1},
        Rule {criteria = [Not (And [Protocol 1, Port "destination" (Left 3)]),Not (Protocol 2)], targets = [PropVariableTarget 0 False], label = -1}]
        , 1
    )
    (eliminateOrs [Or [And [Protocol 1, Port "destination" (Left 3)], Protocol 2]] 0)

eliminateOrsTestOr2 =
    TestCase $ assertEqual "eliminateOrs is not eliminating corrrectly."
        (
            [And [PropVariableCriteria 0,PropVariableCriteria 1]],
            [Rule {criteria = [Protocol 1], targets = [PropVariableTarget 0 True], label = -1},
            Rule {criteria = [Protocol 2], targets = [PropVariableTarget 0 True], label = -1},
            Rule {criteria = [Not (Protocol 1),Not (Protocol 2)], targets = [PropVariableTarget 0 False], label = -1},
            Rule {criteria = [Port "destination" (Left 1)], targets = [PropVariableTarget 1 True], label = -1},
            Rule {criteria = [Port "destination" (Left 2)], targets = [PropVariableTarget 1 True], label = -1},
            Rule {criteria = [Not (Port "destination" (Left 1)),Not (Port "destination" (Left 2))], targets = [PropVariableTarget 1 False], label = -1}]
            , 2
        )
        (eliminateOrs 
            [And 
                [Or [Protocol 1, Protocol 2], 
                Or [Port "destination" (Left 1), Port "destination" (Left 2)]
                ]
            ] 0)



--THIS TEST NEEDS TO BE FIXED TO USE ONE FUNCTION!!!!!!!

eliminateOrsTestOr3 =
    TestCase $ assertEqual "eliminateOrs is not eliminating correctly."
    ([
        PropVariableCriteria 0,
        Protocol 5,
        PropVariableCriteria 1
     ], 
     [Rule {criteria = [Protocol 1], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [Protocol 2], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [Protocol 3], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [Protocol 4], targets = [PropVariableTarget 0 True], label = -1},
     Rule {criteria = [Not (Protocol 1), Not (Protocol 2), Not (Protocol 3), Not (Protocol 4)], targets = [PropVariableTarget 0 False], label = -1},
     Rule {criteria = [Protocol 6], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [Protocol 7], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [Protocol 8], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [Protocol 9], targets = [PropVariableTarget 1 True], label = -1},
     Rule {criteria = [Not (Protocol 6), Not (Protocol 7), Not (Protocol 8), Not (Protocol 9)], targets = [PropVariableTarget 1 False], label = -1}]
     , 2)
    (eliminateOrs (condenseAndsOrs
        [
            And [
                And [
                    Or [
                        Or [Protocol 1, Protocol 2],
                        Or [Protocol 3, Protocol 4]
                    ],
                    Protocol 5
                ],
                Or [
                    Or [Protocol 6, 
                        Or [Protocol 7, Protocol 8, Protocol 9]
                    ]
                ]
            ]
        ] False) 0)

eliminateOrsTestOr4 =
    TestCase $ assertEqual "eliminateOrs is not eliminating correctly."
        ([
            Or [
                And [
                    Protocol 1,
                    Or [Port "destination" (Left 2),
                        Port "destination" (Left 3),
                        Port "destination" (Left 4),
                        Port "destination" (Left 5)
                    ],
                    Not (Port "source" (Left 6))
                ],
                And [Protocol 7,Port "destination" (Left 8)]
            ]
        ] , 
        [Rule {criteria = [And[Protocol 1, PropVariableCriteria 1, Not (Port "source" (Left 6))]], targets = [PropVariableTarget 0 True], label = -1},
        Rule {criteria = [And[Protocol 7,Port "destination" (Left 8)]], targets = [PropVariableTarget 0 True], label = -1},
        Rule {criteria = [And[Protocol 7,Port "destination" (Left 8)]], targets = [PropVariableTarget 0 True], label = -1}
        ]
        , 0)
     (eliminateOrs (condenseAndsOrs
        [
            Or [
                And [ 
                    Protocol 1,
                    And [
                        Or [Port "destination" (Left 2),
                            Or [
                                Port "destination" (Left 3),
                                Or [
                                    Port "destination" (Left 4),
                                    Port "destination" (Left 5)
                                ]
                            ]
                        ],
                        Not (Port "source" (Left 6))
                    ]
                ],
                And [Protocol 7,Port "destination" (Left 8)]
            ]
        ] False) 0)


simplifyNotsTestAnd =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        [Or $ [Not $ Protocol 1, Not $ Port "destination" (Left 1)]]
        (simplifyNots [Not . And $ [Protocol 1, Port "destination" (Left 1)]])

simplifyNotsTestOr =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        [And $ [Not $ Protocol 1, Not $ Port "destination" (Left 1)]]
        (simplifyNots [Not . Or $ [Protocol 1, Port "destination" (Left 1)]])

simplifyNotsTestNot =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        [Protocol 1]
        (simplifyNots [Not . Not $ Protocol 1])
        
simplifyNotsTestMixed = TestCase $
    assertEqual "simplifyNot is not adjusting corrrectly."
        [Or 
            [And 
                [Not $ Protocol 1, Not $ Protocol 2], 
                Or[Not $ Protocol 3, Not $ Protocol 4]
            ]
         , Protocol 5
         , Not $ Protocol 7
         , Or [Not $ Protocol 8, And [Not $ Protocol 9, Not $ Protocol 10]]
        ]
        (simplifyNots 
        [Not 
            (And 
                [Or [Protocol 1, Protocol 2], 
                 And [Protocol 3, Protocol 4]
                ]
            )
         , Protocol 5
         , Not . Not . Not . Not . Not $ Protocol 7
         , Not 
            (And [Protocol 8, Or [Protocol 9, Protocol 10]])
        ])