import Test.HUnit

import ConvertToHornTests
import CriteriaPrereqAdditionTests
import NameIdChainTests
import RuleAddingTests

main = runTestTT tests--putStrLn "Test suite not yet implemented"

tests = TestList [criteriaPrereqAdditionTests
				  , convertToHornTests
				  , nameIdChainTests
				  , ruleAddingTests]