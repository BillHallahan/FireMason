import Test.HUnit

import ConvertToHornTests

main = runTestTT tests--putStrLn "Test suite not yet implemented"

tests = convertToHornTests

five = TestCase $ assertEqual "5 = 5" 4 5