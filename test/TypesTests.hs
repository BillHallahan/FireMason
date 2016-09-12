module TypesTests where

import Test.HUnit
import Data.Either
import Data.IP
import Types

typesTests = TestList [TestLabel "ipToWord1 - IPv4" ipToWord32Test1
                       , TestLabel "ipToWord2 - IPv4" ipToWord32Test2 
                       , TestLabel "ipToWord3 - IPv6" ipToWord128Test3
                       , TestLabel "ipToWord4 - IPv6" ipToWord128Test4
                       , TestLabel "ipMask1 - IPv4" ipMask32Test1
                       , TestLabel "ipMask2 - IPv4" ipMask32Test2
                       , TestLabel "ipMask3 - IPv6" ipMask128Test3
                       , TestLabel "ipMask4 - IPv6" ipMask128Test4
                      ]

ipToWord32Test1 =
    TestCase $ assertEqual "ipToWord is not correctly converting from an IPv4 address to a Word32."
        (Left 3)
        (ipToWord(read "0.0.0.3" :: IP))

ipToWord32Test2 =
    TestCase $ assertEqual "ipToWord is not correctly converting from an IPv4 address to a Word32."
        (Left 3599894545) --decimal from binary 11010110 10010010 00001000 00010001
        (ipToWord(read "214.146.8.17" :: IP))

ipToWord128Test3 =
    TestCase $ assertEqual "ipToWord is not correctly converting from an IPv6 address to a Word128."
        (Right 757)
        (ipToWord(read "00:00:00:00:00:00:00:02f5" :: IP))

ipToWord128Test4 =
    TestCase $ assertEqual "ipToWord is not correctly converting from an IPv6 address to a Word128."
        (Right 209520633566888975801853416979774309109)
        (ipToWord(read "9da0:34ca:8765:acbd:0000:de7a:0000:02f5" :: IP))

ipMask32Test1 =
    TestCase $ assertEqual "ipMask is not correctly converting from an IPv4 mask to an Int."
        (Left 4294967295) --decimal from binary 11111111 11111111 11111111 11111111
        (ipMask(read "214.146.8.17/32" :: IPRange))

ipMask32Test2 =
    TestCase $ assertEqual "ipMask is not correctly converting from an IPv4 mask to an Int."
        (Left 4294901760) --decimal from binary 11111111 11111111 00000000 00000000
        (ipMask(read "214.146.8.17/16" :: IPRange))

ipMask128Test3 =
    TestCase $ assertEqual "ipMask is not correctly converting from an IPv6 mask to an Int."
        (Right 340282366920938463463374607431768211455)
        (ipMask(read "9da0:34ca:8765:acbd:0000:de7a:0000:02f5/128" :: IPRange))

ipMask128Test4 =
    TestCase $ assertEqual "ipMask is not correctly converting from an IPv6 mask to an Int."
        (Right 340282366920938463444927863358058659840)
        (ipMask(read "9da0:34ca:8765:acbd:0000:de7a:0000:02f5/64" :: IPRange))