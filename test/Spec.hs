import Test.HUnit

import ConvertToHornTests
import NameIdChainTests

main = runTestTT tests--putStrLn "Test suite not yet implemented"

tests = TestList [convertToHornTests, nameIdChainTests]