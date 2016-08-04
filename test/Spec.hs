import Test.HUnit

import ConvertToHornTests
import NameIdChainTests
import RuleAddingTests

main = runTestTT tests--putStrLn "Test suite not yet implemented"

tests = TestList [convertToHornTests, nameIdChainTests, ruleAddingTests]