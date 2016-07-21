module ConvertToHornTests where

import Test.HUnit
import Types
import ConvertToHorn

convertToHornTests = TestList [TestLabel "eliminateAndsTestNotAnd" eliminateAndsTestNotAnd
                             , TestLabel "eliminateAndsTestNotOrAnd" eliminateAndsTestOrAnd
                             , TestLabel "eliminateAndsTestNotOrAnd" eliminateAndsTestOrAnd2
                             , TestLabel "eliminateAndsTestNotNot" eliminateAndsTestNotNot
                             , TestLabel "eliminateAndsTestAndFalse" eliminateAndsTestAndFalse
                             , TestLabel "eliminateAndsTestAndTrue" eliminateAndsTestAndTrue
                             , TestLabel "eliminateOrsAnd" eliminateOrsTestAnd
                             , TestLabel "simplifyNotsTestAnd" simplifyNotsTestAnd
                             , TestLabel "simplifyNotsTestOr" simplifyNotsTestOr
                             , TestLabel "simplifyNotsTestNot" simplifyNotsTestNot
                             , TestLabel "simplifyNotsTestMixed" simplifyNotsTestMixed]

eliminateAndsTestNotAnd =
    TestCase $ assertEqual "eliminateAnd is not eliminating corrrectly."
        (eliminateAnds
            [Not . And $ 
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2)]
                ]
            ] False)
            [Not . And $ 
                [Protocol 1, Port "destination" (Left 1), Port "source" (Left 2)]
            ]

eliminateAndsTestOrAnd =
    TestCase $ assertEqual "eliminateAnds is not eliminating corrrectly."
        (eliminateAnds 
            [Not . Or $ 
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2)]
                ]
            ] False)
            [Not . Or $
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2)]
                ]
            ]

eliminateAndsTestOrAnd2 =
    TestCase $ assertEqual "eliminateAnds is not eliminating corrrectly."
        (eliminateAnds
            [Not . Or $
                [Protocol 1, 
                    And [Port "destination" (Left 1), 
                        And [Port "source" (Left 2), Port "destination" (Left 3)]
                    ]
                ]
            ] False)
            [Not . Or $ 
                [Protocol 1, 
                    And [Port "destination" (Left 1), Port "source" (Left 2), Port "destination" (Left 3)]
                ]
            ]


eliminateAndsTestNotNot =
    TestCase $ assertEqual "eliminateAnds is not eliminating corrrectly."
        (eliminateAnds
            [ Not . Not . Not . Not . Not $
                And [Protocol 1, 
                    And [Port "source" (Left 1)]
                ]
            ] True
        )
        [ Not . Not . Not . Not . Not $
                And [Protocol 1, Port "source" (Left 1)]
        ]

eliminateAndsTestAndFalse =
    TestCase $ assertEqual "eliminateAnd is not eliminating corrrectly."
        (eliminateAnds [And $ [Protocol 1, Port "destination" (Left 1)]] False)
        [Protocol 1, Port "destination" (Left 1)]

eliminateAndsTestAndTrue =
    TestCase $ assertEqual "eliminateAnd is not eliminating corrrectly."
        (eliminateAnds [And $ [Protocol 1, Port "destination" (Left 1)]] True)
        [And $ [Protocol 1, Port "destination" (Left 1)]]


andCriteria = [And [Protocol 1, Port "destination" (Left 1), And [Protocol 2, Port "destination" (Left 3)]]]

eliminateOrsTestAnd =
    TestCase $ assertEqual "eliminateOrs is not eliminating corrrectly."
        (eliminateOrs andCriteria 0)
        (andCriteria, [], 0)

simplifyNotsTestAnd =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        (simplifyNots [Not . And $ [Protocol 1, Port "destination" (Left 1)]])
        [Or $ [Not $ Protocol 1, Not $ Port "destination" (Left 1)]]

simplifyNotsTestOr =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        (simplifyNots [Not . Or $ [Protocol 1, Port "destination" (Left 1)]])
        [And $ [Not $ Protocol 1, Not $ Port "destination" (Left 1)]]

simplifyNotsTestNot =
    TestCase $ assertEqual "simplifyNot is not adjusting corrrectly."
        (simplifyNots [Not . Not $ Protocol 1])
        [Protocol 1]

simplifyNotsTestMixed = TestCase $
    assertEqual "simplifyNot is not adjusting corrrectly."
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
    --HERE
    [Or 
        [And 
            [Not $ Protocol 1, Not $ Protocol 2], 
            Or[Not $ Protocol 3, Not $ Protocol 4]
        ]
     , Protocol 5
     , Not $ Protocol 7
     , Or [Not $ Protocol 8, And [Not $ Protocol 9, Not $ Protocol 10]]
    ]