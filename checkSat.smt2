;When being used, make sure to initialize the following correctly:
;num-of-packets
;num-of-chains
;chain-length

(declare-datatypes () ((Target ACCEPT DROP RETURN (GO (chain Int) (rule Int)) (GORETURN (chainR Int) (ruleR Int)) NONE)))

(declare-fun matches-criteria (Int Int Int) Bool)
(declare-fun rule-target (Int Int) Target)
(declare-fun reaches (Int Int Int) Bool)
(declare-fun reaches-return (Int Int) Bool)
(declare-fun reaches-end (Int Int) Bool)
(declare-fun returns-from (Int Int) Bool)
(declare-fun policy (Int) Target)

(declare-const num-of-packets Int)
(declare-const num-of-chains Int)
(declare-fun chain-length (Int) Int)
(declare-fun terminates-with (Int) Target)
(declare-fun top-level-chain (Int) Bool)

(define-fun valid-packet ((p Int)) Bool
    (and (<= 0 p) (< p num-of-packets)))

(define-fun valid-chain ((c Int)) Bool
    (and (<= 0 c) (< c num-of-chains))
)

(define-fun valid-rule ((c Int) (r Int)) Bool
    (and 
        (valid-chain c)
        (<= 0 r)
        (< r (chain-length c))
    )
)

(define-fun matches-rule((p Int) (c Int) (r Int)) Bool
   (and (valid-rule c r) (valid-packet p) (matches-criteria p c r) (reaches p c r)))

(define-fun terminating ((t Target)) Bool 
    (or (= t ACCEPT) (= t DROP))
)

(define-fun terminates-at ((p Int) (c Int) (r Int)) Bool
    (and (matches-rule p c r) (terminating (rule-target c r))))



(define-fun reaches-top-level-chain ((p Int) (c Int)) Bool
    (and (valid-packet p) (valid-chain c) (top-level-chain c) (reaches p c 0))
)



(assert (= num-of-packets 2))
(declare-const chain0 Int)
(declare-const chain1 Int)
(assert (= (chain-length 0) 12))(assert (= (chain-length 1) 16))(assert (= (chain-length 2) 4))(assert (= (chain-length 3) 4))(assert (= (chain-length 4) 4))(assert (= (chain-length 5) 4))(assert (= (chain-length 6) 2))(assert (= (chain-length 7) 2))(assert (= (chain-length 8) 2))(assert (= (chain-length 9) 2))(assert (= (chain-length 10) 2))(assert (= (chain-length 11) 3))(assert (= (chain-length 12) 2))(assert (= (chain-length 13) 4))(assert (= (chain-length 14) 0))(assert (= (chain-length 15) 12))(assert (= (chain-length 16) 16))(assert (= (chain-length 17) 5))(assert (= (chain-length 18) 5))(assert (= (chain-length 19) 5))(assert (= (chain-length 20) 5))(assert (= (chain-length 21) 2))(assert (= (chain-length 22) 2))(assert (= (chain-length 23) 2))(assert (= (chain-length 24) 2))(assert (= (chain-length 25) 2))(assert (= (chain-length 26) 3))(assert (= (chain-length 27) 2))(assert (= (chain-length 28) 5))(assert (= (chain-length 29) 0))
(assert (not (reaches 0 0 13)))
(assert (= (reaches 0 0 12) (reaches-end 0 0)))
(assert (= (returns-from 0 0) (or (reaches-return 0 0)(reaches-end 0 0))))(assert (not (reaches 1 0 13)))
(assert (= (reaches 1 0 12) (reaches-end 1 0)))
(assert (= (returns-from 1 0) (or (reaches-return 1 0)(reaches-end 1 0))))(assert (not (reaches 0 1 17)))
(assert (= (reaches 0 1 16) (reaches-end 0 1)))
(assert (= (returns-from 0 1) (or (reaches-return 0 1)(reaches-end 0 1))))(assert (not (reaches 1 1 17)))
(assert (= (reaches 1 1 16) (reaches-end 1 1)))
(assert (= (returns-from 1 1) (or (reaches-return 1 1)(reaches-end 1 1))))(assert (not (reaches 0 2 5)))
(assert (= (reaches 0 2 4) (reaches-end 0 2)))
(assert (= (returns-from 0 2) (or (reaches-return 0 2)(reaches-end 0 2))))(assert (not (reaches 1 2 5)))
(assert (= (reaches 1 2 4) (reaches-end 1 2)))
(assert (= (returns-from 1 2) (or (reaches-return 1 2)(reaches-end 1 2))))(assert (not (reaches 0 3 5)))
(assert (= (reaches 0 3 4) (reaches-end 0 3)))
(assert (= (returns-from 0 3) (or (reaches-return 0 3)(reaches-end 0 3))))(assert (not (reaches 1 3 5)))
(assert (= (reaches 1 3 4) (reaches-end 1 3)))
(assert (= (returns-from 1 3) (or (reaches-return 1 3)(reaches-end 1 3))))(assert (not (reaches 0 4 5)))
(assert (= (reaches 0 4 4) (reaches-end 0 4)))
(assert (= (returns-from 0 4) (or (reaches-return 0 4)(reaches-end 0 4))))(assert (not (reaches 1 4 5)))
(assert (= (reaches 1 4 4) (reaches-end 1 4)))
(assert (= (returns-from 1 4) (or (reaches-return 1 4)(reaches-end 1 4))))(assert (not (reaches 0 5 5)))
(assert (= (reaches 0 5 4) (reaches-end 0 5)))
(assert (= (returns-from 0 5) (or (reaches-return 0 5)(reaches-end 0 5))))(assert (not (reaches 1 5 5)))
(assert (= (reaches 1 5 4) (reaches-end 1 5)))
(assert (= (returns-from 1 5) (or (reaches-return 1 5)(reaches-end 1 5))))(assert (not (reaches 0 6 3)))
(assert (= (reaches 0 6 2) (reaches-end 0 6)))
(assert (= (returns-from 0 6) (or (reaches-return 0 6)(reaches-end 0 6))))(assert (not (reaches 1 6 3)))
(assert (= (reaches 1 6 2) (reaches-end 1 6)))
(assert (= (returns-from 1 6) (or (reaches-return 1 6)(reaches-end 1 6))))(assert (not (reaches 0 7 3)))
(assert (= (reaches 0 7 2) (reaches-end 0 7)))
(assert (= (returns-from 0 7) (or (reaches-return 0 7)(reaches-end 0 7))))(assert (not (reaches 1 7 3)))
(assert (= (reaches 1 7 2) (reaches-end 1 7)))
(assert (= (returns-from 1 7) (or (reaches-return 1 7)(reaches-end 1 7))))(assert (not (reaches 0 8 3)))
(assert (= (reaches 0 8 2) (reaches-end 0 8)))
(assert (= (returns-from 0 8) (or (reaches-return 0 8)(reaches-end 0 8))))(assert (not (reaches 1 8 3)))
(assert (= (reaches 1 8 2) (reaches-end 1 8)))
(assert (= (returns-from 1 8) (or (reaches-return 1 8)(reaches-end 1 8))))(assert (not (reaches 0 9 3)))
(assert (= (reaches 0 9 2) (reaches-end 0 9)))
(assert (= (returns-from 0 9) (or (reaches-return 0 9)(reaches-end 0 9))))(assert (not (reaches 1 9 3)))
(assert (= (reaches 1 9 2) (reaches-end 1 9)))
(assert (= (returns-from 1 9) (or (reaches-return 1 9)(reaches-end 1 9))))(assert (not (reaches 0 10 3)))
(assert (= (reaches 0 10 2) (reaches-end 0 10)))
(assert (= (returns-from 0 10) (or (reaches-return 0 10)(reaches-end 0 10))))(assert (not (reaches 1 10 3)))
(assert (= (reaches 1 10 2) (reaches-end 1 10)))
(assert (= (returns-from 1 10) (or (reaches-return 1 10)(reaches-end 1 10))))(assert (not (reaches 0 11 4)))
(assert (= (reaches 0 11 3) (reaches-end 0 11)))
(assert (= (returns-from 0 11) (or (reaches-return 0 11)(reaches-end 0 11))))(assert (not (reaches 1 11 4)))
(assert (= (reaches 1 11 3) (reaches-end 1 11)))
(assert (= (returns-from 1 11) (or (reaches-return 1 11)(reaches-end 1 11))))(assert (not (reaches 0 12 3)))
(assert (= (reaches 0 12 2) (reaches-end 0 12)))
(assert (= (returns-from 0 12) (or (reaches-return 0 12)(reaches-end 0 12))))(assert (not (reaches 1 12 3)))
(assert (= (reaches 1 12 2) (reaches-end 1 12)))
(assert (= (returns-from 1 12) (or (reaches-return 1 12)(reaches-end 1 12))))(assert (not (reaches 0 13 5)))
(assert (= (reaches 0 13 4) (reaches-end 0 13)))
(assert (= (returns-from 0 13) (or (reaches-return 0 13)(reaches-end 0 13))))(assert (not (reaches 1 13 5)))
(assert (= (reaches 1 13 4) (reaches-end 1 13)))
(assert (= (returns-from 1 13) (or (reaches-return 1 13)(reaches-end 1 13))))(assert (not (reaches 0 14 1)))
(assert (= (reaches 0 14 0) (reaches-end 0 14)))
(assert (= (returns-from 0 14) (or (reaches-return 0 14)(reaches-end 0 14))))(assert (not (reaches 1 14 1)))
(assert (= (reaches 1 14 0) (reaches-end 1 14)))
(assert (= (returns-from 1 14) (or (reaches-return 1 14)(reaches-end 1 14))))(assert (not (reaches 0 15 13)))
(assert (= (reaches 0 15 12) (reaches-end 0 15)))
(assert (= (returns-from 0 15) (or (reaches-return 0 15)(reaches-end 0 15))))(assert (not (reaches 1 15 13)))
(assert (= (reaches 1 15 12) (reaches-end 1 15)))
(assert (= (returns-from 1 15) (or (reaches-return 1 15)(reaches-end 1 15))))(assert (not (reaches 0 16 17)))
(assert (= (reaches 0 16 16) (reaches-end 0 16)))
(assert (= (returns-from 0 16) (or (reaches-return 0 16)(reaches-end 0 16))))(assert (not (reaches 1 16 17)))
(assert (= (reaches 1 16 16) (reaches-end 1 16)))
(assert (= (returns-from 1 16) (or (reaches-return 1 16)(reaches-end 1 16))))(assert (not (reaches 0 17 6)))
(assert (= (reaches 0 17 5) (reaches-end 0 17)))
(assert (= (returns-from 0 17) (or (reaches-return 0 17)(reaches-end 0 17))))(assert (not (reaches 1 17 6)))
(assert (= (reaches 1 17 5) (reaches-end 1 17)))
(assert (= (returns-from 1 17) (or (reaches-return 1 17)(reaches-end 1 17))))(assert (not (reaches 0 18 6)))
(assert (= (reaches 0 18 5) (reaches-end 0 18)))
(assert (= (returns-from 0 18) (or (reaches-return 0 18)(reaches-end 0 18))))(assert (not (reaches 1 18 6)))
(assert (= (reaches 1 18 5) (reaches-end 1 18)))
(assert (= (returns-from 1 18) (or (reaches-return 1 18)(reaches-end 1 18))))(assert (not (reaches 0 19 6)))
(assert (= (reaches 0 19 5) (reaches-end 0 19)))
(assert (= (returns-from 0 19) (or (reaches-return 0 19)(reaches-end 0 19))))(assert (not (reaches 1 19 6)))
(assert (= (reaches 1 19 5) (reaches-end 1 19)))
(assert (= (returns-from 1 19) (or (reaches-return 1 19)(reaches-end 1 19))))(assert (not (reaches 0 20 6)))
(assert (= (reaches 0 20 5) (reaches-end 0 20)))
(assert (= (returns-from 0 20) (or (reaches-return 0 20)(reaches-end 0 20))))(assert (not (reaches 1 20 6)))
(assert (= (reaches 1 20 5) (reaches-end 1 20)))
(assert (= (returns-from 1 20) (or (reaches-return 1 20)(reaches-end 1 20))))(assert (not (reaches 0 21 3)))
(assert (= (reaches 0 21 2) (reaches-end 0 21)))
(assert (= (returns-from 0 21) (or (reaches-return 0 21)(reaches-end 0 21))))(assert (not (reaches 1 21 3)))
(assert (= (reaches 1 21 2) (reaches-end 1 21)))
(assert (= (returns-from 1 21) (or (reaches-return 1 21)(reaches-end 1 21))))(assert (not (reaches 0 22 3)))
(assert (= (reaches 0 22 2) (reaches-end 0 22)))
(assert (= (returns-from 0 22) (or (reaches-return 0 22)(reaches-end 0 22))))(assert (not (reaches 1 22 3)))
(assert (= (reaches 1 22 2) (reaches-end 1 22)))
(assert (= (returns-from 1 22) (or (reaches-return 1 22)(reaches-end 1 22))))(assert (not (reaches 0 23 3)))
(assert (= (reaches 0 23 2) (reaches-end 0 23)))
(assert (= (returns-from 0 23) (or (reaches-return 0 23)(reaches-end 0 23))))(assert (not (reaches 1 23 3)))
(assert (= (reaches 1 23 2) (reaches-end 1 23)))
(assert (= (returns-from 1 23) (or (reaches-return 1 23)(reaches-end 1 23))))(assert (not (reaches 0 24 3)))
(assert (= (reaches 0 24 2) (reaches-end 0 24)))
(assert (= (returns-from 0 24) (or (reaches-return 0 24)(reaches-end 0 24))))(assert (not (reaches 1 24 3)))
(assert (= (reaches 1 24 2) (reaches-end 1 24)))
(assert (= (returns-from 1 24) (or (reaches-return 1 24)(reaches-end 1 24))))(assert (not (reaches 0 25 3)))
(assert (= (reaches 0 25 2) (reaches-end 0 25)))
(assert (= (returns-from 0 25) (or (reaches-return 0 25)(reaches-end 0 25))))(assert (not (reaches 1 25 3)))
(assert (= (reaches 1 25 2) (reaches-end 1 25)))
(assert (= (returns-from 1 25) (or (reaches-return 1 25)(reaches-end 1 25))))(assert (not (reaches 0 26 4)))
(assert (= (reaches 0 26 3) (reaches-end 0 26)))
(assert (= (returns-from 0 26) (or (reaches-return 0 26)(reaches-end 0 26))))(assert (not (reaches 1 26 4)))
(assert (= (reaches 1 26 3) (reaches-end 1 26)))
(assert (= (returns-from 1 26) (or (reaches-return 1 26)(reaches-end 1 26))))(assert (not (reaches 0 27 3)))
(assert (= (reaches 0 27 2) (reaches-end 0 27)))
(assert (= (returns-from 0 27) (or (reaches-return 0 27)(reaches-end 0 27))))(assert (not (reaches 1 27 3)))
(assert (= (reaches 1 27 2) (reaches-end 1 27)))
(assert (= (returns-from 1 27) (or (reaches-return 1 27)(reaches-end 1 27))))(assert (not (reaches 0 28 6)))
(assert (= (reaches 0 28 5) (reaches-end 0 28)))
(assert (= (returns-from 0 28) (or (reaches-return 0 28)(reaches-end 0 28))))(assert (not (reaches 1 28 6)))
(assert (= (reaches 1 28 5) (reaches-end 1 28)))
(assert (= (returns-from 1 28) (or (reaches-return 1 28)(reaches-end 1 28))))(assert (not (reaches 0 29 1)))
(assert (= (reaches 0 29 0) (reaches-end 0 29)))
(assert (= (returns-from 0 29) (or (reaches-return 0 29)(reaches-end 0 29))))(assert (not (reaches 1 29 1)))
(assert (= (reaches 1 29 0) (reaches-end 1 29)))
(assert (= (returns-from 1 29) (or (reaches-return 1 29)(reaches-end 1 29))))
(assert (top-level-chain 0))(assert (top-level-chain 11))(assert (top-level-chain 14))(assert (top-level-chain 15))(assert (top-level-chain 26))(assert (top-level-chain 29))
(assert (=> (reaches-end 0 0) (= (terminates-with 0) (policy 0))))(assert (=> (reaches-end 0 11) (= (terminates-with 0) (policy 11))))(assert (=> (reaches-end 0 14) (= (terminates-with 0) (policy 14))))(assert (=> (reaches-end 0 15) (= (terminates-with 0) (policy 15))))(assert (=> (reaches-end 0 26) (= (terminates-with 0) (policy 26))))(assert (=> (reaches-end 0 29) (= (terminates-with 0) (policy 29))))(assert (=> (reaches-end 1 0) (= (terminates-with 1) (policy 0))))(assert (=> (reaches-end 1 11) (= (terminates-with 1) (policy 11))))(assert (=> (reaches-end 1 14) (= (terminates-with 1) (policy 14))))(assert (=> (reaches-end 1 15) (= (terminates-with 1) (policy 15))))(assert (=> (reaches-end 1 26) (= (terminates-with 1) (policy 26))))(assert (=> (reaches-end 1 29) (= (terminates-with 1) (policy 29))))
(assert (= (policy 1) NONE))(assert (= (policy 2) NONE))(assert (= (policy 3) NONE))(assert (= (policy 4) NONE))(assert (= (policy 5) NONE))(assert (= (policy 6) NONE))(assert (= (policy 7) NONE))(assert (= (policy 8) NONE))(assert (= (policy 9) NONE))(assert (= (policy 10) NONE))(assert (= (policy 12) NONE))(assert (= (policy 13) NONE))(assert (= (policy 16) NONE))(assert (= (policy 17) NONE))(assert (= (policy 18) NONE))(assert (= (policy 19) NONE))(assert (= (policy 20) NONE))(assert (= (policy 21) NONE))(assert (= (policy 22) NONE))(assert (= (policy 23) NONE))(assert (= (policy 24) NONE))(assert (= (policy 25) NONE))(assert (= (policy 27) NONE))(assert (= (policy 28) NONE))(assert (= (policy 1) NONE))(assert (= (policy 2) NONE))(assert (= (policy 3) NONE))(assert (= (policy 4) NONE))(assert (= (policy 5) NONE))(assert (= (policy 6) NONE))(assert (= (policy 7) NONE))(assert (= (policy 8) NONE))(assert (= (policy 9) NONE))(assert (= (policy 10) NONE))(assert (= (policy 12) NONE))(assert (= (policy 13) NONE))(assert (= (policy 16) NONE))(assert (= (policy 17) NONE))(assert (= (policy 18) NONE))(assert (= (policy 19) NONE))(assert (= (policy 20) NONE))(assert (= (policy 21) NONE))(assert (= (policy 22) NONE))(assert (= (policy 23) NONE))(assert (= (policy 24) NONE))(assert (= (policy 25) NONE))(assert (= (policy 27) NONE))(assert (= (policy 28) NONE))
(assert (=> (reaches 0 0 0) (not (reaches 0 11 0))))(assert (=> (reaches 0 0 0) (not (reaches 0 14 0))))(assert (=> (reaches 0 0 0) (not (reaches 0 15 0))))(assert (=> (reaches 0 0 0) (not (reaches 0 26 0))))(assert (=> (reaches 0 0 0) (not (reaches 0 29 0))))(assert (=> (reaches 0 11 0) (not (reaches 0 14 0))))(assert (=> (reaches 0 11 0) (not (reaches 0 15 0))))(assert (=> (reaches 0 11 0) (not (reaches 0 26 0))))(assert (=> (reaches 0 11 0) (not (reaches 0 29 0))))(assert (=> (reaches 0 14 0) (not (reaches 0 15 0))))(assert (=> (reaches 0 14 0) (not (reaches 0 26 0))))(assert (=> (reaches 0 14 0) (not (reaches 0 29 0))))(assert (=> (reaches 0 15 0) (not (reaches 0 26 0))))(assert (=> (reaches 0 15 0) (not (reaches 0 29 0))))(assert (=> (reaches 0 26 0) (not (reaches 0 29 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 11 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 14 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 15 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 26 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 29 0))))(assert (=> (reaches 1 11 0) (not (reaches 1 14 0))))(assert (=> (reaches 1 11 0) (not (reaches 1 15 0))))(assert (=> (reaches 1 11 0) (not (reaches 1 26 0))))(assert (=> (reaches 1 11 0) (not (reaches 1 29 0))))(assert (=> (reaches 1 14 0) (not (reaches 1 15 0))))(assert (=> (reaches 1 14 0) (not (reaches 1 26 0))))(assert (=> (reaches 1 14 0) (not (reaches 1 29 0))))(assert (=> (reaches 1 15 0) (not (reaches 1 26 0))))(assert (=> (reaches 1 15 0) (not (reaches 1 29 0))))(assert (=> (reaches 1 26 0) (not (reaches 1 29 0))))
(assert (not (top-level-chain 1)))(assert (not (top-level-chain 2)))(assert (not (top-level-chain 3)))(assert (not (top-level-chain 4)))(assert (not (top-level-chain 5)))(assert (not (top-level-chain 6)))(assert (not (top-level-chain 7)))(assert (not (top-level-chain 8)))(assert (not (top-level-chain 9)))(assert (not (top-level-chain 10)))(assert (not (top-level-chain 12)))(assert (not (top-level-chain 13)))(assert (not (top-level-chain 16)))(assert (not (top-level-chain 17)))(assert (not (top-level-chain 18)))(assert (not (top-level-chain 19)))(assert (not (top-level-chain 20)))(assert (not (top-level-chain 21)))(assert (not (top-level-chain 22)))(assert (not (top-level-chain 23)))(assert (not (top-level-chain 24)))(assert (not (top-level-chain 25)))(assert (not (top-level-chain 27)))(assert (not (top-level-chain 28)))
(assert (= num-of-chains 30))
(declare-fun SYN () Bool)
(declare-fun ACK () Bool)
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun FIN () Bool)
(declare-fun RST () Bool)
(declare-fun URG () Bool)

(assert (= (rule-target 0 0) ACCEPT))(assert (=> (matches-rule 0 0 0) (and (not (reaches 0 0 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 0) (and (not (reaches 1 0 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 1) DROP))(assert (=> (matches-rule 0 0 1) (and (not (reaches 0 0 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 1) (and (not (reaches 1 0 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 2) ACCEPT))(assert (=> (matches-rule 0 0 2) (and (not (reaches 0 0 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 2) (and (not (reaches 1 0 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 3) ACCEPT))(assert (=> (matches-rule 0 0 3) (and (not (reaches 0 0 4))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 3) (and (not (reaches 1 0 4))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 4) ACCEPT))(assert (=> (matches-rule 0 0 4) (and (not (reaches 0 0 5))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 4) (and (not (reaches 1 0 5))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 5) DROP))(assert (=> (matches-rule 0 0 5) (and (not (reaches 0 0 6))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 5) (and (not (reaches 1 0 6))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 6) (GO 8 0)))(assert (=> (matches-rule 0 0 6) (and (reaches 0 8 0)(= (returns-from 0 8) (reaches 0 0 7)))))(assert (=> (matches-rule 1 0 6) (and (reaches 1 8 0)(= (returns-from 1 8) (reaches 1 0 7)))))(assert (=> (not (matches-rule 0 0 6)) (not (reaches 0 8 0))))(assert (=> (not (matches-rule 1 0 6)) (not (reaches 1 8 0))))
(assert (= (rule-target 0 7) (GO 6 0)))(assert (=> (matches-rule 0 0 7) (and (reaches 0 6 0)(= (returns-from 0 6) (reaches 0 0 8)))))(assert (=> (matches-rule 1 0 7) (and (reaches 1 6 0)(= (returns-from 1 6) (reaches 1 0 8)))))(assert (=> (not (matches-rule 0 0 7)) (not (reaches 0 6 0))))(assert (=> (not (matches-rule 1 0 7)) (not (reaches 1 6 0))))
(assert (= (rule-target 0 8) (GO 1 0)))(assert (=> (matches-rule 0 0 8) (and (reaches 0 1 0)(= (returns-from 0 1) (reaches 0 0 9)))))(assert (=> (matches-rule 1 0 8) (and (reaches 1 1 0)(= (returns-from 1 1) (reaches 1 0 9)))))(assert (=> (not (matches-rule 0 0 8)) (not (reaches 0 1 0))))(assert (=> (not (matches-rule 1 0 8)) (not (reaches 1 1 0))))
(assert (= (rule-target 0 9) ACCEPT))(assert (=> (matches-rule 0 0 9) (and (not (reaches 0 0 10))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 9) (and (not (reaches 1 0 10))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 10) ACCEPT))(assert (=> (matches-rule 0 0 10) (and (not (reaches 0 0 11))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 10) (and (not (reaches 1 0 11))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 0 11) ACCEPT))(assert (=> (matches-rule 0 0 11) (and (not (reaches 0 0 12))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 0 11) (and (not (reaches 1 0 12))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 0) ACCEPT))(assert (=> (matches-rule 0 1 0) (and (not (reaches 0 1 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 0) (and (not (reaches 1 1 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 1) DROP))(assert (=> (matches-rule 0 1 1) (and (not (reaches 0 1 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 1 1) (and (not (reaches 1 1 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 1 2) DROP))(assert (=> (matches-rule 0 1 2) (and (not (reaches 0 1 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 1 2) (and (not (reaches 1 1 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 1 3) NONE))
(assert (= (rule-target 1 4) DROP))(assert (=> (matches-rule 0 1 4) (and (not (reaches 0 1 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 1 4) (and (not (reaches 1 1 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 1 5) DROP))(assert (=> (matches-rule 0 1 5) (and (not (reaches 0 1 6))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 1 5) (and (not (reaches 1 1 6))(= (terminates-with 1) DROP))))

(assert (= (rule-target 1 6) (GO 5 0)))(assert (=> (matches-rule 0 1 6) (and (reaches 0 5 0)(= (returns-from 0 5) (reaches 0 1 7)))))(assert (=> (matches-rule 1 1 6) (and (reaches 1 5 0)(= (returns-from 1 5) (reaches 1 1 7)))))(assert (=> (not (matches-rule 0 1 6)) (not (reaches 0 5 0))))(assert (=> (not (matches-rule 1 1 6)) (not (reaches 1 5 0))))

(assert (= (rule-target 1 7) ACCEPT))(assert (=> (matches-rule 0 1 7) (and (not (reaches 0 1 8))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 7) (and (not (reaches 1 1 8))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 8) ACCEPT))(assert (=> (matches-rule 0 1 8) (and (not (reaches 0 1 9))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 8) (and (not (reaches 1 1 9))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 9) ACCEPT))(assert (=> (matches-rule 0 1 9) (and (not (reaches 0 1 10))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 9) (and (not (reaches 1 1 10))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 10) ACCEPT))(assert (=> (matches-rule 0 1 10) (and (not (reaches 0 1 11))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 10) (and (not (reaches 1 1 11))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 11) ACCEPT))(assert (=> (matches-rule 0 1 11) (and (not (reaches 0 1 12))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 11) (and (not (reaches 1 1 12))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 12) ACCEPT))(assert (=> (matches-rule 0 1 12) (and (not (reaches 0 1 13))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 12) (and (not (reaches 1 1 13))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 13) (GO 4 0)))(assert (=> (matches-rule 0 1 13) (and (reaches 0 4 0)(= (returns-from 0 4) (reaches 0 1 14)))))(assert (=> (matches-rule 1 1 13) (and (reaches 1 4 0)(= (returns-from 1 4) (reaches 1 1 14)))))(assert (=> (not (matches-rule 0 1 13)) (not (reaches 0 4 0))))(assert (=> (not (matches-rule 1 1 13)) (not (reaches 1 4 0))))

(assert (= (rule-target 1 14) (GO 3 0)))(assert (=> (matches-rule 0 1 14) (and (reaches 0 3 0)(= (returns-from 0 3) (reaches 0 1 15)))))(assert (=> (matches-rule 1 1 14) (and (reaches 1 3 0)(= (returns-from 1 3) (reaches 1 1 15)))))(assert (=> (not (matches-rule 0 1 14)) (not (reaches 0 3 0))))(assert (=> (not (matches-rule 1 1 14)) (not (reaches 1 3 0))))

(assert (= (rule-target 1 15) (GO 2 0)))(assert (=> (matches-rule 0 1 15) (and (reaches 0 2 0)(= (returns-from 0 2) (reaches 0 1 16)))))(assert (=> (matches-rule 1 1 15) (and (reaches 1 2 0)(= (returns-from 1 2) (reaches 1 1 16)))))(assert (=> (not (matches-rule 0 1 15)) (not (reaches 0 2 0))))(assert (=> (not (matches-rule 1 1 15)) (not (reaches 1 2 0))))

(assert (= (rule-target 2 0) DROP))(assert (=> (matches-rule 0 2 0) (and (not (reaches 0 2 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 2 0) (and (not (reaches 1 2 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 2 1) DROP))(assert (=> (matches-rule 0 2 1) (and (not (reaches 0 2 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 2 1) (and (not (reaches 1 2 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 2 2) DROP))(assert (=> (matches-rule 0 2 2) (and (not (reaches 0 2 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 2 2) (and (not (reaches 1 2 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 2 3) DROP))(assert (=> (matches-rule 0 2 3) (and (not (reaches 0 2 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 2 3) (and (not (reaches 1 2 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 3 0) DROP))(assert (=> (matches-rule 0 3 0) (and (not (reaches 0 3 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 3 0) (and (not (reaches 1 3 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 3 1) DROP))(assert (=> (matches-rule 0 3 1) (and (not (reaches 0 3 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 3 1) (and (not (reaches 1 3 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 3 2) DROP))(assert (=> (matches-rule 0 3 2) (and (not (reaches 0 3 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 3 2) (and (not (reaches 1 3 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 3 3) DROP))(assert (=> (matches-rule 0 3 3) (and (not (reaches 0 3 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 3 3) (and (not (reaches 1 3 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 4 0) DROP))(assert (=> (matches-rule 0 4 0) (and (not (reaches 0 4 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 4 0) (and (not (reaches 1 4 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 4 1) DROP))(assert (=> (matches-rule 0 4 1) (and (not (reaches 0 4 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 4 1) (and (not (reaches 1 4 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 4 2) DROP))(assert (=> (matches-rule 0 4 2) (and (not (reaches 0 4 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 4 2) (and (not (reaches 1 4 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 4 3) DROP))(assert (=> (matches-rule 0 4 3) (and (not (reaches 0 4 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 4 3) (and (not (reaches 1 4 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 0) DROP))(assert (=> (matches-rule 0 5 0) (and (not (reaches 0 5 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 0) (and (not (reaches 1 5 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 1) DROP))(assert (=> (matches-rule 0 5 1) (and (not (reaches 0 5 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 1) (and (not (reaches 1 5 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 2) DROP))(assert (=> (matches-rule 0 5 2) (and (not (reaches 0 5 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 2) (and (not (reaches 1 5 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 3) DROP))(assert (=> (matches-rule 0 5 3) (and (not (reaches 0 5 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 3) (and (not (reaches 1 5 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 6 0) (GORETURN 7 0)))(assert (=> (matches-rule 0 6 0) (and (reaches 0 7 0)(not (reaches 0 6 1))(= (returns-from 0 7) (returns-from 0 6)))))(assert (=> (matches-rule 1 6 0) (and (reaches 1 7 0)(not (reaches 1 6 1))(= (returns-from 1 7) (returns-from 1 6)))))(assert (=> (not (matches-rule 0 6 0)) (not (reaches 0 7 0))))(assert (=> (not (matches-rule 1 6 0)) (not (reaches 1 7 0))))

(assert (= (rule-target 6 1) DROP))(assert (=> (matches-rule 0 6 1) (and (not (reaches 0 6 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 6 1) (and (not (reaches 1 6 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 7 0) RETURN))(assert (=> (matches-rule 0 7 0) (and (returns-from 0 7)(not (reaches 0 7 1)))))(assert (=> (matches-rule 1 7 0) (and (returns-from 1 7)(not (reaches 1 7 1)))))

(assert (= (rule-target 7 1) DROP))(assert (=> (matches-rule 0 7 1) (and (not (reaches 0 7 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 7 1) (and (not (reaches 1 7 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 8 0) (GORETURN 9 0)))(assert (=> (matches-rule 0 8 0) (and (reaches 0 9 0)(not (reaches 0 8 1))(= (returns-from 0 9) (returns-from 0 8)))))(assert (=> (matches-rule 1 8 0) (and (reaches 1 9 0)(not (reaches 1 8 1))(= (returns-from 1 9) (returns-from 1 8)))))(assert (=> (not (matches-rule 0 8 0)) (not (reaches 0 9 0))))(assert (=> (not (matches-rule 1 8 0)) (not (reaches 1 9 0))))

(assert (= (rule-target 8 1) DROP))(assert (=> (matches-rule 0 8 1) (and (not (reaches 0 8 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 8 1) (and (not (reaches 1 8 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 9 0) (GORETURN 10 0)))(assert (=> (matches-rule 0 9 0) (and (reaches 0 10 0)(not (reaches 0 9 1))(= (returns-from 0 10) (returns-from 0 9)))))(assert (=> (matches-rule 1 9 0) (and (reaches 1 10 0)(not (reaches 1 9 1))(= (returns-from 1 10) (returns-from 1 9)))))(assert (=> (not (matches-rule 0 9 0)) (not (reaches 0 10 0))))(assert (=> (not (matches-rule 1 9 0)) (not (reaches 1 10 0))))

(assert (= (rule-target 9 1) DROP))(assert (=> (matches-rule 0 9 1) (and (not (reaches 0 9 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 9 1) (and (not (reaches 1 9 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 10 0) RETURN))(assert (=> (matches-rule 0 10 0) (and (returns-from 0 10)(not (reaches 0 10 1)))))(assert (=> (matches-rule 1 10 0) (and (returns-from 1 10)(not (reaches 1 10 1)))))

(assert (= (rule-target 10 1) DROP))(assert (=> (matches-rule 0 10 1) (and (not (reaches 0 10 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 10 1) (and (not (reaches 1 10 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 11 0) DROP))(assert (=> (matches-rule 0 11 0) (and (not (reaches 0 11 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 11 0) (and (not (reaches 1 11 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 11 1) (GO 13 0)))(assert (=> (matches-rule 0 11 1) (and (reaches 0 13 0)(= (returns-from 0 13) (reaches 0 11 2)))))(assert (=> (matches-rule 1 11 1) (and (reaches 1 13 0)(= (returns-from 1 13) (reaches 1 11 2)))))(assert (=> (not (matches-rule 0 11 1)) (not (reaches 0 13 0))))(assert (=> (not (matches-rule 1 11 1)) (not (reaches 1 13 0))))
(assert (= (rule-target 11 2) (GO 12 0)))(assert (=> (matches-rule 0 11 2) (and (reaches 0 12 0)(= (returns-from 0 12) (reaches 0 11 3)))))(assert (=> (matches-rule 1 11 2) (and (reaches 1 12 0)(= (returns-from 1 12) (reaches 1 11 3)))))(assert (=> (not (matches-rule 0 11 2)) (not (reaches 0 12 0))))(assert (=> (not (matches-rule 1 11 2)) (not (reaches 1 12 0))))
(assert (= (rule-target 12 0) DROP))(assert (=> (matches-rule 0 12 0) (and (not (reaches 0 12 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 12 0) (and (not (reaches 1 12 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 12 1) ACCEPT))(assert (=> (matches-rule 0 12 1) (and (not (reaches 0 12 2))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 12 1) (and (not (reaches 1 12 2))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 13 0) DROP))(assert (=> (matches-rule 0 13 0) (and (not (reaches 0 13 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 13 0) (and (not (reaches 1 13 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 13 1) DROP))(assert (=> (matches-rule 0 13 1) (and (not (reaches 0 13 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 13 1) (and (not (reaches 1 13 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 13 2) DROP))(assert (=> (matches-rule 0 13 2) (and (not (reaches 0 13 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 13 2) (and (not (reaches 1 13 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 13 3) DROP))(assert (=> (matches-rule 0 13 3) (and (not (reaches 0 13 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 13 3) (and (not (reaches 1 13 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 15 0) ACCEPT))(assert (=> (matches-rule 0 15 0) (and (not (reaches 0 15 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 0) (and (not (reaches 1 15 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 1) DROP))(assert (=> (matches-rule 0 15 1) (and (not (reaches 0 15 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 15 1) (and (not (reaches 1 15 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 15 2) ACCEPT))(assert (=> (matches-rule 0 15 2) (and (not (reaches 0 15 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 2) (and (not (reaches 1 15 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 3) ACCEPT))(assert (=> (matches-rule 0 15 3) (and (not (reaches 0 15 4))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 3) (and (not (reaches 1 15 4))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 4) ACCEPT))(assert (=> (matches-rule 0 15 4) (and (not (reaches 0 15 5))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 4) (and (not (reaches 1 15 5))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 5) DROP))(assert (=> (matches-rule 0 15 5) (and (not (reaches 0 15 6))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 15 5) (and (not (reaches 1 15 6))(= (terminates-with 1) DROP))))

(assert (= (rule-target 15 6) (GO 23 0)))(assert (=> (matches-rule 0 15 6) (and (reaches 0 23 0)(= (returns-from 0 23) (reaches 0 15 7)))))(assert (=> (matches-rule 1 15 6) (and (reaches 1 23 0)(= (returns-from 1 23) (reaches 1 15 7)))))(assert (=> (not (matches-rule 0 15 6)) (not (reaches 0 23 0))))(assert (=> (not (matches-rule 1 15 6)) (not (reaches 1 23 0))))
(assert (= (rule-target 15 7) (GO 21 0)))(assert (=> (matches-rule 0 15 7) (and (reaches 0 21 0)(= (returns-from 0 21) (reaches 0 15 8)))))(assert (=> (matches-rule 1 15 7) (and (reaches 1 21 0)(= (returns-from 1 21) (reaches 1 15 8)))))(assert (=> (not (matches-rule 0 15 7)) (not (reaches 0 21 0))))(assert (=> (not (matches-rule 1 15 7)) (not (reaches 1 21 0))))
(assert (= (rule-target 15 8) (GO 16 0)))(assert (=> (matches-rule 0 15 8) (and (reaches 0 16 0)(= (returns-from 0 16) (reaches 0 15 9)))))(assert (=> (matches-rule 1 15 8) (and (reaches 1 16 0)(= (returns-from 1 16) (reaches 1 15 9)))))(assert (=> (not (matches-rule 0 15 8)) (not (reaches 0 16 0))))(assert (=> (not (matches-rule 1 15 8)) (not (reaches 1 16 0))))
(assert (= (rule-target 15 9) ACCEPT))(assert (=> (matches-rule 0 15 9) (and (not (reaches 0 15 10))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 9) (and (not (reaches 1 15 10))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 10) ACCEPT))(assert (=> (matches-rule 0 15 10) (and (not (reaches 0 15 11))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 10) (and (not (reaches 1 15 11))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 15 11) ACCEPT))(assert (=> (matches-rule 0 15 11) (and (not (reaches 0 15 12))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 15 11) (and (not (reaches 1 15 12))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 0) ACCEPT))(assert (=> (matches-rule 0 16 0) (and (not (reaches 0 16 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 0) (and (not (reaches 1 16 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 1) DROP))(assert (=> (matches-rule 0 16 1) (and (not (reaches 0 16 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 16 1) (and (not (reaches 1 16 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 16 2) DROP))(assert (=> (matches-rule 0 16 2) (and (not (reaches 0 16 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 16 2) (and (not (reaches 1 16 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 16 3) NONE))
(assert (= (rule-target 16 4) DROP))(assert (=> (matches-rule 0 16 4) (and (not (reaches 0 16 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 16 4) (and (not (reaches 1 16 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 16 5) DROP))(assert (=> (matches-rule 0 16 5) (and (not (reaches 0 16 6))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 16 5) (and (not (reaches 1 16 6))(= (terminates-with 1) DROP))))

(assert (= (rule-target 16 6) (GO 20 0)))(assert (=> (matches-rule 0 16 6) (and (reaches 0 20 0)(= (returns-from 0 20) (reaches 0 16 7)))))(assert (=> (matches-rule 1 16 6) (and (reaches 1 20 0)(= (returns-from 1 20) (reaches 1 16 7)))))(assert (=> (not (matches-rule 0 16 6)) (not (reaches 0 20 0))))(assert (=> (not (matches-rule 1 16 6)) (not (reaches 1 20 0))))

(assert (= (rule-target 16 7) ACCEPT))(assert (=> (matches-rule 0 16 7) (and (not (reaches 0 16 8))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 7) (and (not (reaches 1 16 8))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 8) ACCEPT))(assert (=> (matches-rule 0 16 8) (and (not (reaches 0 16 9))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 8) (and (not (reaches 1 16 9))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 9) ACCEPT))(assert (=> (matches-rule 0 16 9) (and (not (reaches 0 16 10))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 9) (and (not (reaches 1 16 10))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 10) ACCEPT))(assert (=> (matches-rule 0 16 10) (and (not (reaches 0 16 11))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 10) (and (not (reaches 1 16 11))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 11) ACCEPT))(assert (=> (matches-rule 0 16 11) (and (not (reaches 0 16 12))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 11) (and (not (reaches 1 16 12))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 12) ACCEPT))(assert (=> (matches-rule 0 16 12) (and (not (reaches 0 16 13))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 16 12) (and (not (reaches 1 16 13))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 16 13) (GO 19 0)))(assert (=> (matches-rule 0 16 13) (and (reaches 0 19 0)(= (returns-from 0 19) (reaches 0 16 14)))))(assert (=> (matches-rule 1 16 13) (and (reaches 1 19 0)(= (returns-from 1 19) (reaches 1 16 14)))))(assert (=> (not (matches-rule 0 16 13)) (not (reaches 0 19 0))))(assert (=> (not (matches-rule 1 16 13)) (not (reaches 1 19 0))))

(assert (= (rule-target 16 14) (GO 18 0)))(assert (=> (matches-rule 0 16 14) (and (reaches 0 18 0)(= (returns-from 0 18) (reaches 0 16 15)))))(assert (=> (matches-rule 1 16 14) (and (reaches 1 18 0)(= (returns-from 1 18) (reaches 1 16 15)))))(assert (=> (not (matches-rule 0 16 14)) (not (reaches 0 18 0))))(assert (=> (not (matches-rule 1 16 14)) (not (reaches 1 18 0))))

(assert (= (rule-target 16 15) (GO 17 0)))(assert (=> (matches-rule 0 16 15) (and (reaches 0 17 0)(= (returns-from 0 17) (reaches 0 16 16)))))(assert (=> (matches-rule 1 16 15) (and (reaches 1 17 0)(= (returns-from 1 17) (reaches 1 16 16)))))(assert (=> (not (matches-rule 0 16 15)) (not (reaches 0 17 0))))(assert (=> (not (matches-rule 1 16 15)) (not (reaches 1 17 0))))

(assert (= (rule-target 17 0) DROP))(assert (=> (matches-rule 0 17 0) (and (not (reaches 0 17 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 17 0) (and (not (reaches 1 17 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 17 1) DROP))(assert (=> (matches-rule 0 17 1) (and (not (reaches 0 17 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 17 1) (and (not (reaches 1 17 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 17 2) ACCEPT))(assert (=> (matches-rule 0 17 2) (and (not (reaches 0 17 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 17 2) (and (not (reaches 1 17 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 17 3) DROP))(assert (=> (matches-rule 0 17 3) (and (not (reaches 0 17 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 17 3) (and (not (reaches 1 17 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 17 4) DROP))(assert (=> (matches-rule 0 17 4) (and (not (reaches 0 17 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 17 4) (and (not (reaches 1 17 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 18 0) DROP))(assert (=> (matches-rule 0 18 0) (and (not (reaches 0 18 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 18 0) (and (not (reaches 1 18 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 18 1) DROP))(assert (=> (matches-rule 0 18 1) (and (not (reaches 0 18 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 18 1) (and (not (reaches 1 18 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 18 2) ACCEPT))(assert (=> (matches-rule 0 18 2) (and (not (reaches 0 18 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 18 2) (and (not (reaches 1 18 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 18 3) DROP))(assert (=> (matches-rule 0 18 3) (and (not (reaches 0 18 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 18 3) (and (not (reaches 1 18 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 18 4) DROP))(assert (=> (matches-rule 0 18 4) (and (not (reaches 0 18 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 18 4) (and (not (reaches 1 18 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 19 0) DROP))(assert (=> (matches-rule 0 19 0) (and (not (reaches 0 19 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 19 0) (and (not (reaches 1 19 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 19 1) DROP))(assert (=> (matches-rule 0 19 1) (and (not (reaches 0 19 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 19 1) (and (not (reaches 1 19 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 19 2) ACCEPT))(assert (=> (matches-rule 0 19 2) (and (not (reaches 0 19 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 19 2) (and (not (reaches 1 19 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 19 3) DROP))(assert (=> (matches-rule 0 19 3) (and (not (reaches 0 19 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 19 3) (and (not (reaches 1 19 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 19 4) DROP))(assert (=> (matches-rule 0 19 4) (and (not (reaches 0 19 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 19 4) (and (not (reaches 1 19 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 20 0) DROP))(assert (=> (matches-rule 0 20 0) (and (not (reaches 0 20 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 20 0) (and (not (reaches 1 20 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 20 1) DROP))(assert (=> (matches-rule 0 20 1) (and (not (reaches 0 20 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 20 1) (and (not (reaches 1 20 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 20 2) ACCEPT))(assert (=> (matches-rule 0 20 2) (and (not (reaches 0 20 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 20 2) (and (not (reaches 1 20 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 20 3) DROP))(assert (=> (matches-rule 0 20 3) (and (not (reaches 0 20 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 20 3) (and (not (reaches 1 20 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 20 4) DROP))(assert (=> (matches-rule 0 20 4) (and (not (reaches 0 20 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 20 4) (and (not (reaches 1 20 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 21 0) (GORETURN 22 0)))(assert (=> (matches-rule 0 21 0) (and (reaches 0 22 0)(not (reaches 0 21 1))(= (returns-from 0 22) (returns-from 0 21)))))(assert (=> (matches-rule 1 21 0) (and (reaches 1 22 0)(not (reaches 1 21 1))(= (returns-from 1 22) (returns-from 1 21)))))(assert (=> (not (matches-rule 0 21 0)) (not (reaches 0 22 0))))(assert (=> (not (matches-rule 1 21 0)) (not (reaches 1 22 0))))

(assert (= (rule-target 21 1) DROP))(assert (=> (matches-rule 0 21 1) (and (not (reaches 0 21 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 21 1) (and (not (reaches 1 21 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 22 0) RETURN))(assert (=> (matches-rule 0 22 0) (and (returns-from 0 22)(not (reaches 0 22 1)))))(assert (=> (matches-rule 1 22 0) (and (returns-from 1 22)(not (reaches 1 22 1)))))

(assert (= (rule-target 22 1) DROP))(assert (=> (matches-rule 0 22 1) (and (not (reaches 0 22 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 22 1) (and (not (reaches 1 22 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 23 0) (GORETURN 24 0)))(assert (=> (matches-rule 0 23 0) (and (reaches 0 24 0)(not (reaches 0 23 1))(= (returns-from 0 24) (returns-from 0 23)))))(assert (=> (matches-rule 1 23 0) (and (reaches 1 24 0)(not (reaches 1 23 1))(= (returns-from 1 24) (returns-from 1 23)))))(assert (=> (not (matches-rule 0 23 0)) (not (reaches 0 24 0))))(assert (=> (not (matches-rule 1 23 0)) (not (reaches 1 24 0))))

(assert (= (rule-target 23 1) DROP))(assert (=> (matches-rule 0 23 1) (and (not (reaches 0 23 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 23 1) (and (not (reaches 1 23 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 24 0) (GORETURN 25 0)))(assert (=> (matches-rule 0 24 0) (and (reaches 0 25 0)(not (reaches 0 24 1))(= (returns-from 0 25) (returns-from 0 24)))))(assert (=> (matches-rule 1 24 0) (and (reaches 1 25 0)(not (reaches 1 24 1))(= (returns-from 1 25) (returns-from 1 24)))))(assert (=> (not (matches-rule 0 24 0)) (not (reaches 0 25 0))))(assert (=> (not (matches-rule 1 24 0)) (not (reaches 1 25 0))))

(assert (= (rule-target 24 1) DROP))(assert (=> (matches-rule 0 24 1) (and (not (reaches 0 24 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 24 1) (and (not (reaches 1 24 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 25 0) RETURN))(assert (=> (matches-rule 0 25 0) (and (returns-from 0 25)(not (reaches 0 25 1)))))(assert (=> (matches-rule 1 25 0) (and (returns-from 1 25)(not (reaches 1 25 1)))))

(assert (= (rule-target 25 1) DROP))(assert (=> (matches-rule 0 25 1) (and (not (reaches 0 25 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 25 1) (and (not (reaches 1 25 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 26 0) DROP))(assert (=> (matches-rule 0 26 0) (and (not (reaches 0 26 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 26 0) (and (not (reaches 1 26 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 26 1) (GO 28 0)))(assert (=> (matches-rule 0 26 1) (and (reaches 0 28 0)(= (returns-from 0 28) (reaches 0 26 2)))))(assert (=> (matches-rule 1 26 1) (and (reaches 1 28 0)(= (returns-from 1 28) (reaches 1 26 2)))))(assert (=> (not (matches-rule 0 26 1)) (not (reaches 0 28 0))))(assert (=> (not (matches-rule 1 26 1)) (not (reaches 1 28 0))))
(assert (= (rule-target 26 2) (GO 27 0)))(assert (=> (matches-rule 0 26 2) (and (reaches 0 27 0)(= (returns-from 0 27) (reaches 0 26 3)))))(assert (=> (matches-rule 1 26 2) (and (reaches 1 27 0)(= (returns-from 1 27) (reaches 1 26 3)))))(assert (=> (not (matches-rule 0 26 2)) (not (reaches 0 27 0))))(assert (=> (not (matches-rule 1 26 2)) (not (reaches 1 27 0))))
(assert (= (rule-target 27 0) DROP))(assert (=> (matches-rule 0 27 0) (and (not (reaches 0 27 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 27 0) (and (not (reaches 1 27 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 27 1) ACCEPT))(assert (=> (matches-rule 0 27 1) (and (not (reaches 0 27 2))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 27 1) (and (not (reaches 1 27 2))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 28 0) DROP))(assert (=> (matches-rule 0 28 0) (and (not (reaches 0 28 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 28 0) (and (not (reaches 1 28 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 28 1) DROP))(assert (=> (matches-rule 0 28 1) (and (not (reaches 0 28 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 28 1) (and (not (reaches 1 28 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 28 2) ACCEPT))(assert (=> (matches-rule 0 28 2) (and (not (reaches 0 28 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 28 2) (and (not (reaches 1 28 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 28 3) DROP))(assert (=> (matches-rule 0 28 3) (and (not (reaches 0 28 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 28 3) (and (not (reaches 1 28 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 28 4) DROP))(assert (=> (matches-rule 0 28 4) (and (not (reaches 0 28 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 28 4) (and (not (reaches 1 28 5))(= (terminates-with 1) DROP))))



(assert (=> 
    (and (<= 1 0) (reaches 0 0 0))
    (reaches 0 0 (- 0 1))
))

(assert (=> 
    (and (reaches 0 0 0) (not (matches-criteria 0 0 0))) 
    (reaches 0 0 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 0 0) (= (rule-target 0 0) NONE)) 
    (reaches 0 0 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 0 1))
    (reaches 0 0 (- 1 1))
))

(assert (=> 
    (and (reaches 0 0 1) (not (matches-criteria 0 0 1))) 
    (reaches 0 0 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 0 1) (= (rule-target 0 1) NONE)) 
    (reaches 0 0 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 0 2))
    (reaches 0 0 (- 2 1))
))

(assert (=> 
    (and (reaches 0 0 2) (not (matches-criteria 0 0 2))) 
    (reaches 0 0 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 0 2) (= (rule-target 0 2) NONE)) 
    (reaches 0 0 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 0 3))
    (reaches 0 0 (- 3 1))
))

(assert (=> 
    (and (reaches 0 0 3) (not (matches-criteria 0 0 3))) 
    (reaches 0 0 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 0 3) (= (rule-target 0 3) NONE)) 
    (reaches 0 0 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 0 4))
    (reaches 0 0 (- 4 1))
))

(assert (=> 
    (and (reaches 0 0 4) (not (matches-criteria 0 0 4))) 
    (reaches 0 0 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 0 4) (= (rule-target 0 4) NONE)) 
    (reaches 0 0 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 0 5))
    (reaches 0 0 (- 5 1))
))

(assert (=> 
    (and (reaches 0 0 5) (not (matches-criteria 0 0 5))) 
    (reaches 0 0 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 0 5) (= (rule-target 0 5) NONE)) 
    (reaches 0 0 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 0 6))
    (reaches 0 0 (- 6 1))
))

(assert (=> 
    (and (reaches 0 0 6) (not (matches-criteria 0 0 6))) 
    (reaches 0 0 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 0 6) (= (rule-target 0 6) NONE)) 
    (reaches 0 0 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 0 7))
    (reaches 0 0 (- 7 1))
))

(assert (=> 
    (and (reaches 0 0 7) (not (matches-criteria 0 0 7))) 
    (reaches 0 0 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 0 7) (= (rule-target 0 7) NONE)) 
    (reaches 0 0 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 0 8))
    (reaches 0 0 (- 8 1))
))

(assert (=> 
    (and (reaches 0 0 8) (not (matches-criteria 0 0 8))) 
    (reaches 0 0 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 0 8) (= (rule-target 0 8) NONE)) 
    (reaches 0 0 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 0 9))
    (reaches 0 0 (- 9 1))
))

(assert (=> 
    (and (reaches 0 0 9) (not (matches-criteria 0 0 9))) 
    (reaches 0 0 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 0 9) (= (rule-target 0 9) NONE)) 
    (reaches 0 0 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 0 10))
    (reaches 0 0 (- 10 1))
))

(assert (=> 
    (and (reaches 0 0 10) (not (matches-criteria 0 0 10))) 
    (reaches 0 0 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 0 10) (= (rule-target 0 10) NONE)) 
    (reaches 0 0 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 0 11))
    (reaches 0 0 (- 11 1))
))

(assert (=> 
    (and (reaches 0 0 11) (not (matches-criteria 0 0 11))) 
    (reaches 0 0 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 0 11) (= (rule-target 0 11) NONE)) 
    (reaches 0 0 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 0 12))
    (reaches 0 0 (- 12 1))
))

(assert (=> 
    (and (reaches 0 0 12) (not (matches-criteria 0 0 12))) 
    (reaches 0 0 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 0 12) (= (rule-target 0 12) NONE)) 
    (reaches 0 0 (+ 12 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 0 0))
    (reaches 1 0 (- 0 1))
))

(assert (=> 
    (and (reaches 1 0 0) (not (matches-criteria 1 0 0))) 
    (reaches 1 0 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 0 0) (= (rule-target 0 0) NONE)) 
    (reaches 1 0 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 0 1))
    (reaches 1 0 (- 1 1))
))

(assert (=> 
    (and (reaches 1 0 1) (not (matches-criteria 1 0 1))) 
    (reaches 1 0 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 0 1) (= (rule-target 0 1) NONE)) 
    (reaches 1 0 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 0 2))
    (reaches 1 0 (- 2 1))
))

(assert (=> 
    (and (reaches 1 0 2) (not (matches-criteria 1 0 2))) 
    (reaches 1 0 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 0 2) (= (rule-target 0 2) NONE)) 
    (reaches 1 0 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 0 3))
    (reaches 1 0 (- 3 1))
))

(assert (=> 
    (and (reaches 1 0 3) (not (matches-criteria 1 0 3))) 
    (reaches 1 0 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 0 3) (= (rule-target 0 3) NONE)) 
    (reaches 1 0 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 0 4))
    (reaches 1 0 (- 4 1))
))

(assert (=> 
    (and (reaches 1 0 4) (not (matches-criteria 1 0 4))) 
    (reaches 1 0 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 0 4) (= (rule-target 0 4) NONE)) 
    (reaches 1 0 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 0 5))
    (reaches 1 0 (- 5 1))
))

(assert (=> 
    (and (reaches 1 0 5) (not (matches-criteria 1 0 5))) 
    (reaches 1 0 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 0 5) (= (rule-target 0 5) NONE)) 
    (reaches 1 0 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 0 6))
    (reaches 1 0 (- 6 1))
))

(assert (=> 
    (and (reaches 1 0 6) (not (matches-criteria 1 0 6))) 
    (reaches 1 0 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 0 6) (= (rule-target 0 6) NONE)) 
    (reaches 1 0 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 0 7))
    (reaches 1 0 (- 7 1))
))

(assert (=> 
    (and (reaches 1 0 7) (not (matches-criteria 1 0 7))) 
    (reaches 1 0 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 0 7) (= (rule-target 0 7) NONE)) 
    (reaches 1 0 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 0 8))
    (reaches 1 0 (- 8 1))
))

(assert (=> 
    (and (reaches 1 0 8) (not (matches-criteria 1 0 8))) 
    (reaches 1 0 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 0 8) (= (rule-target 0 8) NONE)) 
    (reaches 1 0 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 0 9))
    (reaches 1 0 (- 9 1))
))

(assert (=> 
    (and (reaches 1 0 9) (not (matches-criteria 1 0 9))) 
    (reaches 1 0 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 0 9) (= (rule-target 0 9) NONE)) 
    (reaches 1 0 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 0 10))
    (reaches 1 0 (- 10 1))
))

(assert (=> 
    (and (reaches 1 0 10) (not (matches-criteria 1 0 10))) 
    (reaches 1 0 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 0 10) (= (rule-target 0 10) NONE)) 
    (reaches 1 0 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 0 11))
    (reaches 1 0 (- 11 1))
))

(assert (=> 
    (and (reaches 1 0 11) (not (matches-criteria 1 0 11))) 
    (reaches 1 0 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 0 11) (= (rule-target 0 11) NONE)) 
    (reaches 1 0 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 0 12))
    (reaches 1 0 (- 12 1))
))

(assert (=> 
    (and (reaches 1 0 12) (not (matches-criteria 1 0 12))) 
    (reaches 1 0 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 0 12) (= (rule-target 0 12) NONE)) 
    (reaches 1 0 (+ 12 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 1 0))
    (reaches 0 1 (- 0 1))
))

(assert (=> 
    (and (reaches 0 1 0) (not (matches-criteria 0 1 0))) 
    (reaches 0 1 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 1 0) (= (rule-target 1 0) NONE)) 
    (reaches 0 1 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 1 1))
    (reaches 0 1 (- 1 1))
))

(assert (=> 
    (and (reaches 0 1 1) (not (matches-criteria 0 1 1))) 
    (reaches 0 1 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 1 1) (= (rule-target 1 1) NONE)) 
    (reaches 0 1 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 1 2))
    (reaches 0 1 (- 2 1))
))

(assert (=> 
    (and (reaches 0 1 2) (not (matches-criteria 0 1 2))) 
    (reaches 0 1 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 1 2) (= (rule-target 1 2) NONE)) 
    (reaches 0 1 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 1 3))
    (reaches 0 1 (- 3 1))
))

(assert (=> 
    (and (reaches 0 1 3) (not (matches-criteria 0 1 3))) 
    (reaches 0 1 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 1 3) (= (rule-target 1 3) NONE)) 
    (reaches 0 1 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 1 4))
    (reaches 0 1 (- 4 1))
))

(assert (=> 
    (and (reaches 0 1 4) (not (matches-criteria 0 1 4))) 
    (reaches 0 1 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 1 4) (= (rule-target 1 4) NONE)) 
    (reaches 0 1 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 1 5))
    (reaches 0 1 (- 5 1))
))

(assert (=> 
    (and (reaches 0 1 5) (not (matches-criteria 0 1 5))) 
    (reaches 0 1 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 1 5) (= (rule-target 1 5) NONE)) 
    (reaches 0 1 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 1 6))
    (reaches 0 1 (- 6 1))
))

(assert (=> 
    (and (reaches 0 1 6) (not (matches-criteria 0 1 6))) 
    (reaches 0 1 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 1 6) (= (rule-target 1 6) NONE)) 
    (reaches 0 1 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 1 7))
    (reaches 0 1 (- 7 1))
))

(assert (=> 
    (and (reaches 0 1 7) (not (matches-criteria 0 1 7))) 
    (reaches 0 1 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 1 7) (= (rule-target 1 7) NONE)) 
    (reaches 0 1 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 1 8))
    (reaches 0 1 (- 8 1))
))

(assert (=> 
    (and (reaches 0 1 8) (not (matches-criteria 0 1 8))) 
    (reaches 0 1 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 1 8) (= (rule-target 1 8) NONE)) 
    (reaches 0 1 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 1 9))
    (reaches 0 1 (- 9 1))
))

(assert (=> 
    (and (reaches 0 1 9) (not (matches-criteria 0 1 9))) 
    (reaches 0 1 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 1 9) (= (rule-target 1 9) NONE)) 
    (reaches 0 1 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 1 10))
    (reaches 0 1 (- 10 1))
))

(assert (=> 
    (and (reaches 0 1 10) (not (matches-criteria 0 1 10))) 
    (reaches 0 1 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 1 10) (= (rule-target 1 10) NONE)) 
    (reaches 0 1 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 1 11))
    (reaches 0 1 (- 11 1))
))

(assert (=> 
    (and (reaches 0 1 11) (not (matches-criteria 0 1 11))) 
    (reaches 0 1 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 1 11) (= (rule-target 1 11) NONE)) 
    (reaches 0 1 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 1 12))
    (reaches 0 1 (- 12 1))
))

(assert (=> 
    (and (reaches 0 1 12) (not (matches-criteria 0 1 12))) 
    (reaches 0 1 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 1 12) (= (rule-target 1 12) NONE)) 
    (reaches 0 1 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 1 13))
    (reaches 0 1 (- 13 1))
))

(assert (=> 
    (and (reaches 0 1 13) (not (matches-criteria 0 1 13))) 
    (reaches 0 1 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 1 13) (= (rule-target 1 13) NONE)) 
    (reaches 0 1 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 1 14))
    (reaches 0 1 (- 14 1))
))

(assert (=> 
    (and (reaches 0 1 14) (not (matches-criteria 0 1 14))) 
    (reaches 0 1 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 1 14) (= (rule-target 1 14) NONE)) 
    (reaches 0 1 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 1 15))
    (reaches 0 1 (- 15 1))
))

(assert (=> 
    (and (reaches 0 1 15) (not (matches-criteria 0 1 15))) 
    (reaches 0 1 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 1 15) (= (rule-target 1 15) NONE)) 
    (reaches 0 1 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 1 16))
    (reaches 0 1 (- 16 1))
))

(assert (=> 
    (and (reaches 0 1 16) (not (matches-criteria 0 1 16))) 
    (reaches 0 1 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 1 16) (= (rule-target 1 16) NONE)) 
    (reaches 0 1 (+ 16 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 1 0))
    (reaches 1 1 (- 0 1))
))

(assert (=> 
    (and (reaches 1 1 0) (not (matches-criteria 1 1 0))) 
    (reaches 1 1 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 1 0) (= (rule-target 1 0) NONE)) 
    (reaches 1 1 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 1 1))
    (reaches 1 1 (- 1 1))
))

(assert (=> 
    (and (reaches 1 1 1) (not (matches-criteria 1 1 1))) 
    (reaches 1 1 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 1 1) (= (rule-target 1 1) NONE)) 
    (reaches 1 1 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 1 2))
    (reaches 1 1 (- 2 1))
))

(assert (=> 
    (and (reaches 1 1 2) (not (matches-criteria 1 1 2))) 
    (reaches 1 1 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 1 2) (= (rule-target 1 2) NONE)) 
    (reaches 1 1 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 1 3))
    (reaches 1 1 (- 3 1))
))

(assert (=> 
    (and (reaches 1 1 3) (not (matches-criteria 1 1 3))) 
    (reaches 1 1 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 1 3) (= (rule-target 1 3) NONE)) 
    (reaches 1 1 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 1 4))
    (reaches 1 1 (- 4 1))
))

(assert (=> 
    (and (reaches 1 1 4) (not (matches-criteria 1 1 4))) 
    (reaches 1 1 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 1 4) (= (rule-target 1 4) NONE)) 
    (reaches 1 1 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 1 5))
    (reaches 1 1 (- 5 1))
))

(assert (=> 
    (and (reaches 1 1 5) (not (matches-criteria 1 1 5))) 
    (reaches 1 1 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 1 5) (= (rule-target 1 5) NONE)) 
    (reaches 1 1 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 1 6))
    (reaches 1 1 (- 6 1))
))

(assert (=> 
    (and (reaches 1 1 6) (not (matches-criteria 1 1 6))) 
    (reaches 1 1 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 1 6) (= (rule-target 1 6) NONE)) 
    (reaches 1 1 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 1 7))
    (reaches 1 1 (- 7 1))
))

(assert (=> 
    (and (reaches 1 1 7) (not (matches-criteria 1 1 7))) 
    (reaches 1 1 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 1 7) (= (rule-target 1 7) NONE)) 
    (reaches 1 1 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 1 8))
    (reaches 1 1 (- 8 1))
))

(assert (=> 
    (and (reaches 1 1 8) (not (matches-criteria 1 1 8))) 
    (reaches 1 1 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 1 8) (= (rule-target 1 8) NONE)) 
    (reaches 1 1 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 1 9))
    (reaches 1 1 (- 9 1))
))

(assert (=> 
    (and (reaches 1 1 9) (not (matches-criteria 1 1 9))) 
    (reaches 1 1 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 1 9) (= (rule-target 1 9) NONE)) 
    (reaches 1 1 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 1 10))
    (reaches 1 1 (- 10 1))
))

(assert (=> 
    (and (reaches 1 1 10) (not (matches-criteria 1 1 10))) 
    (reaches 1 1 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 1 10) (= (rule-target 1 10) NONE)) 
    (reaches 1 1 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 1 11))
    (reaches 1 1 (- 11 1))
))

(assert (=> 
    (and (reaches 1 1 11) (not (matches-criteria 1 1 11))) 
    (reaches 1 1 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 1 11) (= (rule-target 1 11) NONE)) 
    (reaches 1 1 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 1 12))
    (reaches 1 1 (- 12 1))
))

(assert (=> 
    (and (reaches 1 1 12) (not (matches-criteria 1 1 12))) 
    (reaches 1 1 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 1 12) (= (rule-target 1 12) NONE)) 
    (reaches 1 1 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 1 13))
    (reaches 1 1 (- 13 1))
))

(assert (=> 
    (and (reaches 1 1 13) (not (matches-criteria 1 1 13))) 
    (reaches 1 1 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 1 13) (= (rule-target 1 13) NONE)) 
    (reaches 1 1 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 1 14))
    (reaches 1 1 (- 14 1))
))

(assert (=> 
    (and (reaches 1 1 14) (not (matches-criteria 1 1 14))) 
    (reaches 1 1 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 1 14) (= (rule-target 1 14) NONE)) 
    (reaches 1 1 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 1 15))
    (reaches 1 1 (- 15 1))
))

(assert (=> 
    (and (reaches 1 1 15) (not (matches-criteria 1 1 15))) 
    (reaches 1 1 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 1 15) (= (rule-target 1 15) NONE)) 
    (reaches 1 1 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 1 16))
    (reaches 1 1 (- 16 1))
))

(assert (=> 
    (and (reaches 1 1 16) (not (matches-criteria 1 1 16))) 
    (reaches 1 1 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 1 16) (= (rule-target 1 16) NONE)) 
    (reaches 1 1 (+ 16 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 2 0))
    (reaches 0 2 (- 0 1))
))

(assert (=> 
    (and (reaches 0 2 0) (not (matches-criteria 0 2 0))) 
    (reaches 0 2 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 2 0) (= (rule-target 2 0) NONE)) 
    (reaches 0 2 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 2 1))
    (reaches 0 2 (- 1 1))
))

(assert (=> 
    (and (reaches 0 2 1) (not (matches-criteria 0 2 1))) 
    (reaches 0 2 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 2 1) (= (rule-target 2 1) NONE)) 
    (reaches 0 2 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 2 2))
    (reaches 0 2 (- 2 1))
))

(assert (=> 
    (and (reaches 0 2 2) (not (matches-criteria 0 2 2))) 
    (reaches 0 2 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 2 2) (= (rule-target 2 2) NONE)) 
    (reaches 0 2 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 2 3))
    (reaches 0 2 (- 3 1))
))

(assert (=> 
    (and (reaches 0 2 3) (not (matches-criteria 0 2 3))) 
    (reaches 0 2 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 2 3) (= (rule-target 2 3) NONE)) 
    (reaches 0 2 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 2 4))
    (reaches 0 2 (- 4 1))
))

(assert (=> 
    (and (reaches 0 2 4) (not (matches-criteria 0 2 4))) 
    (reaches 0 2 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 2 4) (= (rule-target 2 4) NONE)) 
    (reaches 0 2 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 2 0))
    (reaches 1 2 (- 0 1))
))

(assert (=> 
    (and (reaches 1 2 0) (not (matches-criteria 1 2 0))) 
    (reaches 1 2 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 2 0) (= (rule-target 2 0) NONE)) 
    (reaches 1 2 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 2 1))
    (reaches 1 2 (- 1 1))
))

(assert (=> 
    (and (reaches 1 2 1) (not (matches-criteria 1 2 1))) 
    (reaches 1 2 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 2 1) (= (rule-target 2 1) NONE)) 
    (reaches 1 2 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 2 2))
    (reaches 1 2 (- 2 1))
))

(assert (=> 
    (and (reaches 1 2 2) (not (matches-criteria 1 2 2))) 
    (reaches 1 2 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 2 2) (= (rule-target 2 2) NONE)) 
    (reaches 1 2 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 2 3))
    (reaches 1 2 (- 3 1))
))

(assert (=> 
    (and (reaches 1 2 3) (not (matches-criteria 1 2 3))) 
    (reaches 1 2 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 2 3) (= (rule-target 2 3) NONE)) 
    (reaches 1 2 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 2 4))
    (reaches 1 2 (- 4 1))
))

(assert (=> 
    (and (reaches 1 2 4) (not (matches-criteria 1 2 4))) 
    (reaches 1 2 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 2 4) (= (rule-target 2 4) NONE)) 
    (reaches 1 2 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 3 0))
    (reaches 0 3 (- 0 1))
))

(assert (=> 
    (and (reaches 0 3 0) (not (matches-criteria 0 3 0))) 
    (reaches 0 3 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 3 0) (= (rule-target 3 0) NONE)) 
    (reaches 0 3 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 3 1))
    (reaches 0 3 (- 1 1))
))

(assert (=> 
    (and (reaches 0 3 1) (not (matches-criteria 0 3 1))) 
    (reaches 0 3 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 3 1) (= (rule-target 3 1) NONE)) 
    (reaches 0 3 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 3 2))
    (reaches 0 3 (- 2 1))
))

(assert (=> 
    (and (reaches 0 3 2) (not (matches-criteria 0 3 2))) 
    (reaches 0 3 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 3 2) (= (rule-target 3 2) NONE)) 
    (reaches 0 3 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 3 3))
    (reaches 0 3 (- 3 1))
))

(assert (=> 
    (and (reaches 0 3 3) (not (matches-criteria 0 3 3))) 
    (reaches 0 3 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 3 3) (= (rule-target 3 3) NONE)) 
    (reaches 0 3 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 3 4))
    (reaches 0 3 (- 4 1))
))

(assert (=> 
    (and (reaches 0 3 4) (not (matches-criteria 0 3 4))) 
    (reaches 0 3 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 3 4) (= (rule-target 3 4) NONE)) 
    (reaches 0 3 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 3 0))
    (reaches 1 3 (- 0 1))
))

(assert (=> 
    (and (reaches 1 3 0) (not (matches-criteria 1 3 0))) 
    (reaches 1 3 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 3 0) (= (rule-target 3 0) NONE)) 
    (reaches 1 3 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 3 1))
    (reaches 1 3 (- 1 1))
))

(assert (=> 
    (and (reaches 1 3 1) (not (matches-criteria 1 3 1))) 
    (reaches 1 3 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 3 1) (= (rule-target 3 1) NONE)) 
    (reaches 1 3 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 3 2))
    (reaches 1 3 (- 2 1))
))

(assert (=> 
    (and (reaches 1 3 2) (not (matches-criteria 1 3 2))) 
    (reaches 1 3 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 3 2) (= (rule-target 3 2) NONE)) 
    (reaches 1 3 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 3 3))
    (reaches 1 3 (- 3 1))
))

(assert (=> 
    (and (reaches 1 3 3) (not (matches-criteria 1 3 3))) 
    (reaches 1 3 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 3 3) (= (rule-target 3 3) NONE)) 
    (reaches 1 3 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 3 4))
    (reaches 1 3 (- 4 1))
))

(assert (=> 
    (and (reaches 1 3 4) (not (matches-criteria 1 3 4))) 
    (reaches 1 3 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 3 4) (= (rule-target 3 4) NONE)) 
    (reaches 1 3 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 4 0))
    (reaches 0 4 (- 0 1))
))

(assert (=> 
    (and (reaches 0 4 0) (not (matches-criteria 0 4 0))) 
    (reaches 0 4 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 4 0) (= (rule-target 4 0) NONE)) 
    (reaches 0 4 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 4 1))
    (reaches 0 4 (- 1 1))
))

(assert (=> 
    (and (reaches 0 4 1) (not (matches-criteria 0 4 1))) 
    (reaches 0 4 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 4 1) (= (rule-target 4 1) NONE)) 
    (reaches 0 4 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 4 2))
    (reaches 0 4 (- 2 1))
))

(assert (=> 
    (and (reaches 0 4 2) (not (matches-criteria 0 4 2))) 
    (reaches 0 4 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 4 2) (= (rule-target 4 2) NONE)) 
    (reaches 0 4 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 4 3))
    (reaches 0 4 (- 3 1))
))

(assert (=> 
    (and (reaches 0 4 3) (not (matches-criteria 0 4 3))) 
    (reaches 0 4 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 4 3) (= (rule-target 4 3) NONE)) 
    (reaches 0 4 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 4 4))
    (reaches 0 4 (- 4 1))
))

(assert (=> 
    (and (reaches 0 4 4) (not (matches-criteria 0 4 4))) 
    (reaches 0 4 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 4 4) (= (rule-target 4 4) NONE)) 
    (reaches 0 4 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 4 0))
    (reaches 1 4 (- 0 1))
))

(assert (=> 
    (and (reaches 1 4 0) (not (matches-criteria 1 4 0))) 
    (reaches 1 4 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 4 0) (= (rule-target 4 0) NONE)) 
    (reaches 1 4 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 4 1))
    (reaches 1 4 (- 1 1))
))

(assert (=> 
    (and (reaches 1 4 1) (not (matches-criteria 1 4 1))) 
    (reaches 1 4 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 4 1) (= (rule-target 4 1) NONE)) 
    (reaches 1 4 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 4 2))
    (reaches 1 4 (- 2 1))
))

(assert (=> 
    (and (reaches 1 4 2) (not (matches-criteria 1 4 2))) 
    (reaches 1 4 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 4 2) (= (rule-target 4 2) NONE)) 
    (reaches 1 4 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 4 3))
    (reaches 1 4 (- 3 1))
))

(assert (=> 
    (and (reaches 1 4 3) (not (matches-criteria 1 4 3))) 
    (reaches 1 4 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 4 3) (= (rule-target 4 3) NONE)) 
    (reaches 1 4 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 4 4))
    (reaches 1 4 (- 4 1))
))

(assert (=> 
    (and (reaches 1 4 4) (not (matches-criteria 1 4 4))) 
    (reaches 1 4 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 4 4) (= (rule-target 4 4) NONE)) 
    (reaches 1 4 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 5 0))
    (reaches 0 5 (- 0 1))
))

(assert (=> 
    (and (reaches 0 5 0) (not (matches-criteria 0 5 0))) 
    (reaches 0 5 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 5 0) (= (rule-target 5 0) NONE)) 
    (reaches 0 5 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 5 1))
    (reaches 0 5 (- 1 1))
))

(assert (=> 
    (and (reaches 0 5 1) (not (matches-criteria 0 5 1))) 
    (reaches 0 5 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 5 1) (= (rule-target 5 1) NONE)) 
    (reaches 0 5 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 5 2))
    (reaches 0 5 (- 2 1))
))

(assert (=> 
    (and (reaches 0 5 2) (not (matches-criteria 0 5 2))) 
    (reaches 0 5 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 5 2) (= (rule-target 5 2) NONE)) 
    (reaches 0 5 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 5 3))
    (reaches 0 5 (- 3 1))
))

(assert (=> 
    (and (reaches 0 5 3) (not (matches-criteria 0 5 3))) 
    (reaches 0 5 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 5 3) (= (rule-target 5 3) NONE)) 
    (reaches 0 5 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 5 4))
    (reaches 0 5 (- 4 1))
))

(assert (=> 
    (and (reaches 0 5 4) (not (matches-criteria 0 5 4))) 
    (reaches 0 5 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 5 4) (= (rule-target 5 4) NONE)) 
    (reaches 0 5 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 5 0))
    (reaches 1 5 (- 0 1))
))

(assert (=> 
    (and (reaches 1 5 0) (not (matches-criteria 1 5 0))) 
    (reaches 1 5 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 5 0) (= (rule-target 5 0) NONE)) 
    (reaches 1 5 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 5 1))
    (reaches 1 5 (- 1 1))
))

(assert (=> 
    (and (reaches 1 5 1) (not (matches-criteria 1 5 1))) 
    (reaches 1 5 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 5 1) (= (rule-target 5 1) NONE)) 
    (reaches 1 5 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 5 2))
    (reaches 1 5 (- 2 1))
))

(assert (=> 
    (and (reaches 1 5 2) (not (matches-criteria 1 5 2))) 
    (reaches 1 5 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 5 2) (= (rule-target 5 2) NONE)) 
    (reaches 1 5 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 5 3))
    (reaches 1 5 (- 3 1))
))

(assert (=> 
    (and (reaches 1 5 3) (not (matches-criteria 1 5 3))) 
    (reaches 1 5 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 5 3) (= (rule-target 5 3) NONE)) 
    (reaches 1 5 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 5 4))
    (reaches 1 5 (- 4 1))
))

(assert (=> 
    (and (reaches 1 5 4) (not (matches-criteria 1 5 4))) 
    (reaches 1 5 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 5 4) (= (rule-target 5 4) NONE)) 
    (reaches 1 5 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 6 0))
    (reaches 0 6 (- 0 1))
))

(assert (=> 
    (and (reaches 0 6 0) (not (matches-criteria 0 6 0))) 
    (reaches 0 6 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 6 0) (= (rule-target 6 0) NONE)) 
    (reaches 0 6 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 6 1))
    (reaches 0 6 (- 1 1))
))

(assert (=> 
    (and (reaches 0 6 1) (not (matches-criteria 0 6 1))) 
    (reaches 0 6 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 6 1) (= (rule-target 6 1) NONE)) 
    (reaches 0 6 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 6 2))
    (reaches 0 6 (- 2 1))
))

(assert (=> 
    (and (reaches 0 6 2) (not (matches-criteria 0 6 2))) 
    (reaches 0 6 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 6 2) (= (rule-target 6 2) NONE)) 
    (reaches 0 6 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 6 0))
    (reaches 1 6 (- 0 1))
))

(assert (=> 
    (and (reaches 1 6 0) (not (matches-criteria 1 6 0))) 
    (reaches 1 6 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 6 0) (= (rule-target 6 0) NONE)) 
    (reaches 1 6 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 6 1))
    (reaches 1 6 (- 1 1))
))

(assert (=> 
    (and (reaches 1 6 1) (not (matches-criteria 1 6 1))) 
    (reaches 1 6 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 6 1) (= (rule-target 6 1) NONE)) 
    (reaches 1 6 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 6 2))
    (reaches 1 6 (- 2 1))
))

(assert (=> 
    (and (reaches 1 6 2) (not (matches-criteria 1 6 2))) 
    (reaches 1 6 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 6 2) (= (rule-target 6 2) NONE)) 
    (reaches 1 6 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 7 0))
    (reaches 0 7 (- 0 1))
))

(assert (=> 
    (and (reaches 0 7 0) (not (matches-criteria 0 7 0))) 
    (reaches 0 7 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 7 0) (= (rule-target 7 0) NONE)) 
    (reaches 0 7 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 7 1))
    (reaches 0 7 (- 1 1))
))

(assert (=> 
    (and (reaches 0 7 1) (not (matches-criteria 0 7 1))) 
    (reaches 0 7 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 7 1) (= (rule-target 7 1) NONE)) 
    (reaches 0 7 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 7 2))
    (reaches 0 7 (- 2 1))
))

(assert (=> 
    (and (reaches 0 7 2) (not (matches-criteria 0 7 2))) 
    (reaches 0 7 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 7 2) (= (rule-target 7 2) NONE)) 
    (reaches 0 7 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 7 0))
    (reaches 1 7 (- 0 1))
))

(assert (=> 
    (and (reaches 1 7 0) (not (matches-criteria 1 7 0))) 
    (reaches 1 7 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 7 0) (= (rule-target 7 0) NONE)) 
    (reaches 1 7 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 7 1))
    (reaches 1 7 (- 1 1))
))

(assert (=> 
    (and (reaches 1 7 1) (not (matches-criteria 1 7 1))) 
    (reaches 1 7 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 7 1) (= (rule-target 7 1) NONE)) 
    (reaches 1 7 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 7 2))
    (reaches 1 7 (- 2 1))
))

(assert (=> 
    (and (reaches 1 7 2) (not (matches-criteria 1 7 2))) 
    (reaches 1 7 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 7 2) (= (rule-target 7 2) NONE)) 
    (reaches 1 7 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 8 0))
    (reaches 0 8 (- 0 1))
))

(assert (=> 
    (and (reaches 0 8 0) (not (matches-criteria 0 8 0))) 
    (reaches 0 8 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 8 0) (= (rule-target 8 0) NONE)) 
    (reaches 0 8 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 8 1))
    (reaches 0 8 (- 1 1))
))

(assert (=> 
    (and (reaches 0 8 1) (not (matches-criteria 0 8 1))) 
    (reaches 0 8 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 8 1) (= (rule-target 8 1) NONE)) 
    (reaches 0 8 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 8 2))
    (reaches 0 8 (- 2 1))
))

(assert (=> 
    (and (reaches 0 8 2) (not (matches-criteria 0 8 2))) 
    (reaches 0 8 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 8 2) (= (rule-target 8 2) NONE)) 
    (reaches 0 8 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 8 0))
    (reaches 1 8 (- 0 1))
))

(assert (=> 
    (and (reaches 1 8 0) (not (matches-criteria 1 8 0))) 
    (reaches 1 8 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 8 0) (= (rule-target 8 0) NONE)) 
    (reaches 1 8 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 8 1))
    (reaches 1 8 (- 1 1))
))

(assert (=> 
    (and (reaches 1 8 1) (not (matches-criteria 1 8 1))) 
    (reaches 1 8 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 8 1) (= (rule-target 8 1) NONE)) 
    (reaches 1 8 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 8 2))
    (reaches 1 8 (- 2 1))
))

(assert (=> 
    (and (reaches 1 8 2) (not (matches-criteria 1 8 2))) 
    (reaches 1 8 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 8 2) (= (rule-target 8 2) NONE)) 
    (reaches 1 8 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 9 0))
    (reaches 0 9 (- 0 1))
))

(assert (=> 
    (and (reaches 0 9 0) (not (matches-criteria 0 9 0))) 
    (reaches 0 9 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 9 0) (= (rule-target 9 0) NONE)) 
    (reaches 0 9 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 9 1))
    (reaches 0 9 (- 1 1))
))

(assert (=> 
    (and (reaches 0 9 1) (not (matches-criteria 0 9 1))) 
    (reaches 0 9 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 9 1) (= (rule-target 9 1) NONE)) 
    (reaches 0 9 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 9 2))
    (reaches 0 9 (- 2 1))
))

(assert (=> 
    (and (reaches 0 9 2) (not (matches-criteria 0 9 2))) 
    (reaches 0 9 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 9 2) (= (rule-target 9 2) NONE)) 
    (reaches 0 9 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 9 0))
    (reaches 1 9 (- 0 1))
))

(assert (=> 
    (and (reaches 1 9 0) (not (matches-criteria 1 9 0))) 
    (reaches 1 9 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 9 0) (= (rule-target 9 0) NONE)) 
    (reaches 1 9 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 9 1))
    (reaches 1 9 (- 1 1))
))

(assert (=> 
    (and (reaches 1 9 1) (not (matches-criteria 1 9 1))) 
    (reaches 1 9 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 9 1) (= (rule-target 9 1) NONE)) 
    (reaches 1 9 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 9 2))
    (reaches 1 9 (- 2 1))
))

(assert (=> 
    (and (reaches 1 9 2) (not (matches-criteria 1 9 2))) 
    (reaches 1 9 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 9 2) (= (rule-target 9 2) NONE)) 
    (reaches 1 9 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 10 0))
    (reaches 0 10 (- 0 1))
))

(assert (=> 
    (and (reaches 0 10 0) (not (matches-criteria 0 10 0))) 
    (reaches 0 10 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 10 0) (= (rule-target 10 0) NONE)) 
    (reaches 0 10 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 10 1))
    (reaches 0 10 (- 1 1))
))

(assert (=> 
    (and (reaches 0 10 1) (not (matches-criteria 0 10 1))) 
    (reaches 0 10 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 10 1) (= (rule-target 10 1) NONE)) 
    (reaches 0 10 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 10 2))
    (reaches 0 10 (- 2 1))
))

(assert (=> 
    (and (reaches 0 10 2) (not (matches-criteria 0 10 2))) 
    (reaches 0 10 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 10 2) (= (rule-target 10 2) NONE)) 
    (reaches 0 10 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 10 0))
    (reaches 1 10 (- 0 1))
))

(assert (=> 
    (and (reaches 1 10 0) (not (matches-criteria 1 10 0))) 
    (reaches 1 10 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 10 0) (= (rule-target 10 0) NONE)) 
    (reaches 1 10 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 10 1))
    (reaches 1 10 (- 1 1))
))

(assert (=> 
    (and (reaches 1 10 1) (not (matches-criteria 1 10 1))) 
    (reaches 1 10 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 10 1) (= (rule-target 10 1) NONE)) 
    (reaches 1 10 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 10 2))
    (reaches 1 10 (- 2 1))
))

(assert (=> 
    (and (reaches 1 10 2) (not (matches-criteria 1 10 2))) 
    (reaches 1 10 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 10 2) (= (rule-target 10 2) NONE)) 
    (reaches 1 10 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 11 0))
    (reaches 0 11 (- 0 1))
))

(assert (=> 
    (and (reaches 0 11 0) (not (matches-criteria 0 11 0))) 
    (reaches 0 11 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 11 0) (= (rule-target 11 0) NONE)) 
    (reaches 0 11 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 11 1))
    (reaches 0 11 (- 1 1))
))

(assert (=> 
    (and (reaches 0 11 1) (not (matches-criteria 0 11 1))) 
    (reaches 0 11 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 11 1) (= (rule-target 11 1) NONE)) 
    (reaches 0 11 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 11 2))
    (reaches 0 11 (- 2 1))
))

(assert (=> 
    (and (reaches 0 11 2) (not (matches-criteria 0 11 2))) 
    (reaches 0 11 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 11 2) (= (rule-target 11 2) NONE)) 
    (reaches 0 11 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 11 3))
    (reaches 0 11 (- 3 1))
))

(assert (=> 
    (and (reaches 0 11 3) (not (matches-criteria 0 11 3))) 
    (reaches 0 11 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 11 3) (= (rule-target 11 3) NONE)) 
    (reaches 0 11 (+ 3 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 11 0))
    (reaches 1 11 (- 0 1))
))

(assert (=> 
    (and (reaches 1 11 0) (not (matches-criteria 1 11 0))) 
    (reaches 1 11 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 11 0) (= (rule-target 11 0) NONE)) 
    (reaches 1 11 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 11 1))
    (reaches 1 11 (- 1 1))
))

(assert (=> 
    (and (reaches 1 11 1) (not (matches-criteria 1 11 1))) 
    (reaches 1 11 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 11 1) (= (rule-target 11 1) NONE)) 
    (reaches 1 11 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 11 2))
    (reaches 1 11 (- 2 1))
))

(assert (=> 
    (and (reaches 1 11 2) (not (matches-criteria 1 11 2))) 
    (reaches 1 11 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 11 2) (= (rule-target 11 2) NONE)) 
    (reaches 1 11 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 11 3))
    (reaches 1 11 (- 3 1))
))

(assert (=> 
    (and (reaches 1 11 3) (not (matches-criteria 1 11 3))) 
    (reaches 1 11 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 11 3) (= (rule-target 11 3) NONE)) 
    (reaches 1 11 (+ 3 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 12 0))
    (reaches 0 12 (- 0 1))
))

(assert (=> 
    (and (reaches 0 12 0) (not (matches-criteria 0 12 0))) 
    (reaches 0 12 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 12 0) (= (rule-target 12 0) NONE)) 
    (reaches 0 12 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 12 1))
    (reaches 0 12 (- 1 1))
))

(assert (=> 
    (and (reaches 0 12 1) (not (matches-criteria 0 12 1))) 
    (reaches 0 12 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 12 1) (= (rule-target 12 1) NONE)) 
    (reaches 0 12 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 12 2))
    (reaches 0 12 (- 2 1))
))

(assert (=> 
    (and (reaches 0 12 2) (not (matches-criteria 0 12 2))) 
    (reaches 0 12 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 12 2) (= (rule-target 12 2) NONE)) 
    (reaches 0 12 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 12 0))
    (reaches 1 12 (- 0 1))
))

(assert (=> 
    (and (reaches 1 12 0) (not (matches-criteria 1 12 0))) 
    (reaches 1 12 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 12 0) (= (rule-target 12 0) NONE)) 
    (reaches 1 12 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 12 1))
    (reaches 1 12 (- 1 1))
))

(assert (=> 
    (and (reaches 1 12 1) (not (matches-criteria 1 12 1))) 
    (reaches 1 12 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 12 1) (= (rule-target 12 1) NONE)) 
    (reaches 1 12 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 12 2))
    (reaches 1 12 (- 2 1))
))

(assert (=> 
    (and (reaches 1 12 2) (not (matches-criteria 1 12 2))) 
    (reaches 1 12 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 12 2) (= (rule-target 12 2) NONE)) 
    (reaches 1 12 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 13 0))
    (reaches 0 13 (- 0 1))
))

(assert (=> 
    (and (reaches 0 13 0) (not (matches-criteria 0 13 0))) 
    (reaches 0 13 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 13 0) (= (rule-target 13 0) NONE)) 
    (reaches 0 13 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 13 1))
    (reaches 0 13 (- 1 1))
))

(assert (=> 
    (and (reaches 0 13 1) (not (matches-criteria 0 13 1))) 
    (reaches 0 13 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 13 1) (= (rule-target 13 1) NONE)) 
    (reaches 0 13 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 13 2))
    (reaches 0 13 (- 2 1))
))

(assert (=> 
    (and (reaches 0 13 2) (not (matches-criteria 0 13 2))) 
    (reaches 0 13 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 13 2) (= (rule-target 13 2) NONE)) 
    (reaches 0 13 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 13 3))
    (reaches 0 13 (- 3 1))
))

(assert (=> 
    (and (reaches 0 13 3) (not (matches-criteria 0 13 3))) 
    (reaches 0 13 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 13 3) (= (rule-target 13 3) NONE)) 
    (reaches 0 13 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 13 4))
    (reaches 0 13 (- 4 1))
))

(assert (=> 
    (and (reaches 0 13 4) (not (matches-criteria 0 13 4))) 
    (reaches 0 13 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 13 4) (= (rule-target 13 4) NONE)) 
    (reaches 0 13 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 13 0))
    (reaches 1 13 (- 0 1))
))

(assert (=> 
    (and (reaches 1 13 0) (not (matches-criteria 1 13 0))) 
    (reaches 1 13 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 13 0) (= (rule-target 13 0) NONE)) 
    (reaches 1 13 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 13 1))
    (reaches 1 13 (- 1 1))
))

(assert (=> 
    (and (reaches 1 13 1) (not (matches-criteria 1 13 1))) 
    (reaches 1 13 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 13 1) (= (rule-target 13 1) NONE)) 
    (reaches 1 13 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 13 2))
    (reaches 1 13 (- 2 1))
))

(assert (=> 
    (and (reaches 1 13 2) (not (matches-criteria 1 13 2))) 
    (reaches 1 13 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 13 2) (= (rule-target 13 2) NONE)) 
    (reaches 1 13 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 13 3))
    (reaches 1 13 (- 3 1))
))

(assert (=> 
    (and (reaches 1 13 3) (not (matches-criteria 1 13 3))) 
    (reaches 1 13 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 13 3) (= (rule-target 13 3) NONE)) 
    (reaches 1 13 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 13 4))
    (reaches 1 13 (- 4 1))
))

(assert (=> 
    (and (reaches 1 13 4) (not (matches-criteria 1 13 4))) 
    (reaches 1 13 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 13 4) (= (rule-target 13 4) NONE)) 
    (reaches 1 13 (+ 4 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 14 0))
    (reaches 0 14 (- 0 1))
))

(assert (=> 
    (and (reaches 0 14 0) (not (matches-criteria 0 14 0))) 
    (reaches 0 14 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 14 0) (= (rule-target 14 0) NONE)) 
    (reaches 0 14 (+ 0 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 14 0))
    (reaches 1 14 (- 0 1))
))

(assert (=> 
    (and (reaches 1 14 0) (not (matches-criteria 1 14 0))) 
    (reaches 1 14 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 14 0) (= (rule-target 14 0) NONE)) 
    (reaches 1 14 (+ 0 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 15 0))
    (reaches 0 15 (- 0 1))
))

(assert (=> 
    (and (reaches 0 15 0) (not (matches-criteria 0 15 0))) 
    (reaches 0 15 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 15 0) (= (rule-target 15 0) NONE)) 
    (reaches 0 15 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 15 1))
    (reaches 0 15 (- 1 1))
))

(assert (=> 
    (and (reaches 0 15 1) (not (matches-criteria 0 15 1))) 
    (reaches 0 15 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 15 1) (= (rule-target 15 1) NONE)) 
    (reaches 0 15 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 15 2))
    (reaches 0 15 (- 2 1))
))

(assert (=> 
    (and (reaches 0 15 2) (not (matches-criteria 0 15 2))) 
    (reaches 0 15 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 15 2) (= (rule-target 15 2) NONE)) 
    (reaches 0 15 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 15 3))
    (reaches 0 15 (- 3 1))
))

(assert (=> 
    (and (reaches 0 15 3) (not (matches-criteria 0 15 3))) 
    (reaches 0 15 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 15 3) (= (rule-target 15 3) NONE)) 
    (reaches 0 15 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 15 4))
    (reaches 0 15 (- 4 1))
))

(assert (=> 
    (and (reaches 0 15 4) (not (matches-criteria 0 15 4))) 
    (reaches 0 15 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 15 4) (= (rule-target 15 4) NONE)) 
    (reaches 0 15 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 15 5))
    (reaches 0 15 (- 5 1))
))

(assert (=> 
    (and (reaches 0 15 5) (not (matches-criteria 0 15 5))) 
    (reaches 0 15 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 15 5) (= (rule-target 15 5) NONE)) 
    (reaches 0 15 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 15 6))
    (reaches 0 15 (- 6 1))
))

(assert (=> 
    (and (reaches 0 15 6) (not (matches-criteria 0 15 6))) 
    (reaches 0 15 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 15 6) (= (rule-target 15 6) NONE)) 
    (reaches 0 15 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 15 7))
    (reaches 0 15 (- 7 1))
))

(assert (=> 
    (and (reaches 0 15 7) (not (matches-criteria 0 15 7))) 
    (reaches 0 15 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 15 7) (= (rule-target 15 7) NONE)) 
    (reaches 0 15 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 15 8))
    (reaches 0 15 (- 8 1))
))

(assert (=> 
    (and (reaches 0 15 8) (not (matches-criteria 0 15 8))) 
    (reaches 0 15 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 15 8) (= (rule-target 15 8) NONE)) 
    (reaches 0 15 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 15 9))
    (reaches 0 15 (- 9 1))
))

(assert (=> 
    (and (reaches 0 15 9) (not (matches-criteria 0 15 9))) 
    (reaches 0 15 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 15 9) (= (rule-target 15 9) NONE)) 
    (reaches 0 15 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 15 10))
    (reaches 0 15 (- 10 1))
))

(assert (=> 
    (and (reaches 0 15 10) (not (matches-criteria 0 15 10))) 
    (reaches 0 15 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 15 10) (= (rule-target 15 10) NONE)) 
    (reaches 0 15 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 15 11))
    (reaches 0 15 (- 11 1))
))

(assert (=> 
    (and (reaches 0 15 11) (not (matches-criteria 0 15 11))) 
    (reaches 0 15 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 15 11) (= (rule-target 15 11) NONE)) 
    (reaches 0 15 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 15 12))
    (reaches 0 15 (- 12 1))
))

(assert (=> 
    (and (reaches 0 15 12) (not (matches-criteria 0 15 12))) 
    (reaches 0 15 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 15 12) (= (rule-target 15 12) NONE)) 
    (reaches 0 15 (+ 12 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 15 0))
    (reaches 1 15 (- 0 1))
))

(assert (=> 
    (and (reaches 1 15 0) (not (matches-criteria 1 15 0))) 
    (reaches 1 15 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 15 0) (= (rule-target 15 0) NONE)) 
    (reaches 1 15 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 15 1))
    (reaches 1 15 (- 1 1))
))

(assert (=> 
    (and (reaches 1 15 1) (not (matches-criteria 1 15 1))) 
    (reaches 1 15 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 15 1) (= (rule-target 15 1) NONE)) 
    (reaches 1 15 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 15 2))
    (reaches 1 15 (- 2 1))
))

(assert (=> 
    (and (reaches 1 15 2) (not (matches-criteria 1 15 2))) 
    (reaches 1 15 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 15 2) (= (rule-target 15 2) NONE)) 
    (reaches 1 15 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 15 3))
    (reaches 1 15 (- 3 1))
))

(assert (=> 
    (and (reaches 1 15 3) (not (matches-criteria 1 15 3))) 
    (reaches 1 15 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 15 3) (= (rule-target 15 3) NONE)) 
    (reaches 1 15 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 15 4))
    (reaches 1 15 (- 4 1))
))

(assert (=> 
    (and (reaches 1 15 4) (not (matches-criteria 1 15 4))) 
    (reaches 1 15 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 15 4) (= (rule-target 15 4) NONE)) 
    (reaches 1 15 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 15 5))
    (reaches 1 15 (- 5 1))
))

(assert (=> 
    (and (reaches 1 15 5) (not (matches-criteria 1 15 5))) 
    (reaches 1 15 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 15 5) (= (rule-target 15 5) NONE)) 
    (reaches 1 15 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 15 6))
    (reaches 1 15 (- 6 1))
))

(assert (=> 
    (and (reaches 1 15 6) (not (matches-criteria 1 15 6))) 
    (reaches 1 15 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 15 6) (= (rule-target 15 6) NONE)) 
    (reaches 1 15 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 15 7))
    (reaches 1 15 (- 7 1))
))

(assert (=> 
    (and (reaches 1 15 7) (not (matches-criteria 1 15 7))) 
    (reaches 1 15 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 15 7) (= (rule-target 15 7) NONE)) 
    (reaches 1 15 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 15 8))
    (reaches 1 15 (- 8 1))
))

(assert (=> 
    (and (reaches 1 15 8) (not (matches-criteria 1 15 8))) 
    (reaches 1 15 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 15 8) (= (rule-target 15 8) NONE)) 
    (reaches 1 15 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 15 9))
    (reaches 1 15 (- 9 1))
))

(assert (=> 
    (and (reaches 1 15 9) (not (matches-criteria 1 15 9))) 
    (reaches 1 15 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 15 9) (= (rule-target 15 9) NONE)) 
    (reaches 1 15 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 15 10))
    (reaches 1 15 (- 10 1))
))

(assert (=> 
    (and (reaches 1 15 10) (not (matches-criteria 1 15 10))) 
    (reaches 1 15 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 15 10) (= (rule-target 15 10) NONE)) 
    (reaches 1 15 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 15 11))
    (reaches 1 15 (- 11 1))
))

(assert (=> 
    (and (reaches 1 15 11) (not (matches-criteria 1 15 11))) 
    (reaches 1 15 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 15 11) (= (rule-target 15 11) NONE)) 
    (reaches 1 15 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 15 12))
    (reaches 1 15 (- 12 1))
))

(assert (=> 
    (and (reaches 1 15 12) (not (matches-criteria 1 15 12))) 
    (reaches 1 15 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 15 12) (= (rule-target 15 12) NONE)) 
    (reaches 1 15 (+ 12 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 16 0))
    (reaches 0 16 (- 0 1))
))

(assert (=> 
    (and (reaches 0 16 0) (not (matches-criteria 0 16 0))) 
    (reaches 0 16 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 16 0) (= (rule-target 16 0) NONE)) 
    (reaches 0 16 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 16 1))
    (reaches 0 16 (- 1 1))
))

(assert (=> 
    (and (reaches 0 16 1) (not (matches-criteria 0 16 1))) 
    (reaches 0 16 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 16 1) (= (rule-target 16 1) NONE)) 
    (reaches 0 16 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 16 2))
    (reaches 0 16 (- 2 1))
))

(assert (=> 
    (and (reaches 0 16 2) (not (matches-criteria 0 16 2))) 
    (reaches 0 16 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 16 2) (= (rule-target 16 2) NONE)) 
    (reaches 0 16 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 16 3))
    (reaches 0 16 (- 3 1))
))

(assert (=> 
    (and (reaches 0 16 3) (not (matches-criteria 0 16 3))) 
    (reaches 0 16 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 16 3) (= (rule-target 16 3) NONE)) 
    (reaches 0 16 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 16 4))
    (reaches 0 16 (- 4 1))
))

(assert (=> 
    (and (reaches 0 16 4) (not (matches-criteria 0 16 4))) 
    (reaches 0 16 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 16 4) (= (rule-target 16 4) NONE)) 
    (reaches 0 16 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 16 5))
    (reaches 0 16 (- 5 1))
))

(assert (=> 
    (and (reaches 0 16 5) (not (matches-criteria 0 16 5))) 
    (reaches 0 16 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 16 5) (= (rule-target 16 5) NONE)) 
    (reaches 0 16 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 16 6))
    (reaches 0 16 (- 6 1))
))

(assert (=> 
    (and (reaches 0 16 6) (not (matches-criteria 0 16 6))) 
    (reaches 0 16 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 16 6) (= (rule-target 16 6) NONE)) 
    (reaches 0 16 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 16 7))
    (reaches 0 16 (- 7 1))
))

(assert (=> 
    (and (reaches 0 16 7) (not (matches-criteria 0 16 7))) 
    (reaches 0 16 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 16 7) (= (rule-target 16 7) NONE)) 
    (reaches 0 16 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 16 8))
    (reaches 0 16 (- 8 1))
))

(assert (=> 
    (and (reaches 0 16 8) (not (matches-criteria 0 16 8))) 
    (reaches 0 16 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 16 8) (= (rule-target 16 8) NONE)) 
    (reaches 0 16 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 16 9))
    (reaches 0 16 (- 9 1))
))

(assert (=> 
    (and (reaches 0 16 9) (not (matches-criteria 0 16 9))) 
    (reaches 0 16 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 16 9) (= (rule-target 16 9) NONE)) 
    (reaches 0 16 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 16 10))
    (reaches 0 16 (- 10 1))
))

(assert (=> 
    (and (reaches 0 16 10) (not (matches-criteria 0 16 10))) 
    (reaches 0 16 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 16 10) (= (rule-target 16 10) NONE)) 
    (reaches 0 16 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 16 11))
    (reaches 0 16 (- 11 1))
))

(assert (=> 
    (and (reaches 0 16 11) (not (matches-criteria 0 16 11))) 
    (reaches 0 16 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 16 11) (= (rule-target 16 11) NONE)) 
    (reaches 0 16 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 16 12))
    (reaches 0 16 (- 12 1))
))

(assert (=> 
    (and (reaches 0 16 12) (not (matches-criteria 0 16 12))) 
    (reaches 0 16 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 16 12) (= (rule-target 16 12) NONE)) 
    (reaches 0 16 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 16 13))
    (reaches 0 16 (- 13 1))
))

(assert (=> 
    (and (reaches 0 16 13) (not (matches-criteria 0 16 13))) 
    (reaches 0 16 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 16 13) (= (rule-target 16 13) NONE)) 
    (reaches 0 16 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 16 14))
    (reaches 0 16 (- 14 1))
))

(assert (=> 
    (and (reaches 0 16 14) (not (matches-criteria 0 16 14))) 
    (reaches 0 16 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 16 14) (= (rule-target 16 14) NONE)) 
    (reaches 0 16 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 16 15))
    (reaches 0 16 (- 15 1))
))

(assert (=> 
    (and (reaches 0 16 15) (not (matches-criteria 0 16 15))) 
    (reaches 0 16 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 16 15) (= (rule-target 16 15) NONE)) 
    (reaches 0 16 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 16 16))
    (reaches 0 16 (- 16 1))
))

(assert (=> 
    (and (reaches 0 16 16) (not (matches-criteria 0 16 16))) 
    (reaches 0 16 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 16 16) (= (rule-target 16 16) NONE)) 
    (reaches 0 16 (+ 16 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 16 0))
    (reaches 1 16 (- 0 1))
))

(assert (=> 
    (and (reaches 1 16 0) (not (matches-criteria 1 16 0))) 
    (reaches 1 16 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 16 0) (= (rule-target 16 0) NONE)) 
    (reaches 1 16 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 16 1))
    (reaches 1 16 (- 1 1))
))

(assert (=> 
    (and (reaches 1 16 1) (not (matches-criteria 1 16 1))) 
    (reaches 1 16 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 16 1) (= (rule-target 16 1) NONE)) 
    (reaches 1 16 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 16 2))
    (reaches 1 16 (- 2 1))
))

(assert (=> 
    (and (reaches 1 16 2) (not (matches-criteria 1 16 2))) 
    (reaches 1 16 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 16 2) (= (rule-target 16 2) NONE)) 
    (reaches 1 16 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 16 3))
    (reaches 1 16 (- 3 1))
))

(assert (=> 
    (and (reaches 1 16 3) (not (matches-criteria 1 16 3))) 
    (reaches 1 16 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 16 3) (= (rule-target 16 3) NONE)) 
    (reaches 1 16 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 16 4))
    (reaches 1 16 (- 4 1))
))

(assert (=> 
    (and (reaches 1 16 4) (not (matches-criteria 1 16 4))) 
    (reaches 1 16 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 16 4) (= (rule-target 16 4) NONE)) 
    (reaches 1 16 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 16 5))
    (reaches 1 16 (- 5 1))
))

(assert (=> 
    (and (reaches 1 16 5) (not (matches-criteria 1 16 5))) 
    (reaches 1 16 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 16 5) (= (rule-target 16 5) NONE)) 
    (reaches 1 16 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 16 6))
    (reaches 1 16 (- 6 1))
))

(assert (=> 
    (and (reaches 1 16 6) (not (matches-criteria 1 16 6))) 
    (reaches 1 16 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 16 6) (= (rule-target 16 6) NONE)) 
    (reaches 1 16 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 16 7))
    (reaches 1 16 (- 7 1))
))

(assert (=> 
    (and (reaches 1 16 7) (not (matches-criteria 1 16 7))) 
    (reaches 1 16 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 16 7) (= (rule-target 16 7) NONE)) 
    (reaches 1 16 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 16 8))
    (reaches 1 16 (- 8 1))
))

(assert (=> 
    (and (reaches 1 16 8) (not (matches-criteria 1 16 8))) 
    (reaches 1 16 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 16 8) (= (rule-target 16 8) NONE)) 
    (reaches 1 16 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 16 9))
    (reaches 1 16 (- 9 1))
))

(assert (=> 
    (and (reaches 1 16 9) (not (matches-criteria 1 16 9))) 
    (reaches 1 16 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 16 9) (= (rule-target 16 9) NONE)) 
    (reaches 1 16 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 16 10))
    (reaches 1 16 (- 10 1))
))

(assert (=> 
    (and (reaches 1 16 10) (not (matches-criteria 1 16 10))) 
    (reaches 1 16 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 16 10) (= (rule-target 16 10) NONE)) 
    (reaches 1 16 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 16 11))
    (reaches 1 16 (- 11 1))
))

(assert (=> 
    (and (reaches 1 16 11) (not (matches-criteria 1 16 11))) 
    (reaches 1 16 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 16 11) (= (rule-target 16 11) NONE)) 
    (reaches 1 16 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 16 12))
    (reaches 1 16 (- 12 1))
))

(assert (=> 
    (and (reaches 1 16 12) (not (matches-criteria 1 16 12))) 
    (reaches 1 16 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 16 12) (= (rule-target 16 12) NONE)) 
    (reaches 1 16 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 16 13))
    (reaches 1 16 (- 13 1))
))

(assert (=> 
    (and (reaches 1 16 13) (not (matches-criteria 1 16 13))) 
    (reaches 1 16 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 16 13) (= (rule-target 16 13) NONE)) 
    (reaches 1 16 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 16 14))
    (reaches 1 16 (- 14 1))
))

(assert (=> 
    (and (reaches 1 16 14) (not (matches-criteria 1 16 14))) 
    (reaches 1 16 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 16 14) (= (rule-target 16 14) NONE)) 
    (reaches 1 16 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 16 15))
    (reaches 1 16 (- 15 1))
))

(assert (=> 
    (and (reaches 1 16 15) (not (matches-criteria 1 16 15))) 
    (reaches 1 16 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 16 15) (= (rule-target 16 15) NONE)) 
    (reaches 1 16 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 16 16))
    (reaches 1 16 (- 16 1))
))

(assert (=> 
    (and (reaches 1 16 16) (not (matches-criteria 1 16 16))) 
    (reaches 1 16 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 16 16) (= (rule-target 16 16) NONE)) 
    (reaches 1 16 (+ 16 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 17 0))
    (reaches 0 17 (- 0 1))
))

(assert (=> 
    (and (reaches 0 17 0) (not (matches-criteria 0 17 0))) 
    (reaches 0 17 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 17 0) (= (rule-target 17 0) NONE)) 
    (reaches 0 17 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 17 1))
    (reaches 0 17 (- 1 1))
))

(assert (=> 
    (and (reaches 0 17 1) (not (matches-criteria 0 17 1))) 
    (reaches 0 17 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 17 1) (= (rule-target 17 1) NONE)) 
    (reaches 0 17 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 17 2))
    (reaches 0 17 (- 2 1))
))

(assert (=> 
    (and (reaches 0 17 2) (not (matches-criteria 0 17 2))) 
    (reaches 0 17 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 17 2) (= (rule-target 17 2) NONE)) 
    (reaches 0 17 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 17 3))
    (reaches 0 17 (- 3 1))
))

(assert (=> 
    (and (reaches 0 17 3) (not (matches-criteria 0 17 3))) 
    (reaches 0 17 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 17 3) (= (rule-target 17 3) NONE)) 
    (reaches 0 17 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 17 4))
    (reaches 0 17 (- 4 1))
))

(assert (=> 
    (and (reaches 0 17 4) (not (matches-criteria 0 17 4))) 
    (reaches 0 17 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 17 4) (= (rule-target 17 4) NONE)) 
    (reaches 0 17 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 17 5))
    (reaches 0 17 (- 5 1))
))

(assert (=> 
    (and (reaches 0 17 5) (not (matches-criteria 0 17 5))) 
    (reaches 0 17 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 17 5) (= (rule-target 17 5) NONE)) 
    (reaches 0 17 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 17 0))
    (reaches 1 17 (- 0 1))
))

(assert (=> 
    (and (reaches 1 17 0) (not (matches-criteria 1 17 0))) 
    (reaches 1 17 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 17 0) (= (rule-target 17 0) NONE)) 
    (reaches 1 17 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 17 1))
    (reaches 1 17 (- 1 1))
))

(assert (=> 
    (and (reaches 1 17 1) (not (matches-criteria 1 17 1))) 
    (reaches 1 17 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 17 1) (= (rule-target 17 1) NONE)) 
    (reaches 1 17 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 17 2))
    (reaches 1 17 (- 2 1))
))

(assert (=> 
    (and (reaches 1 17 2) (not (matches-criteria 1 17 2))) 
    (reaches 1 17 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 17 2) (= (rule-target 17 2) NONE)) 
    (reaches 1 17 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 17 3))
    (reaches 1 17 (- 3 1))
))

(assert (=> 
    (and (reaches 1 17 3) (not (matches-criteria 1 17 3))) 
    (reaches 1 17 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 17 3) (= (rule-target 17 3) NONE)) 
    (reaches 1 17 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 17 4))
    (reaches 1 17 (- 4 1))
))

(assert (=> 
    (and (reaches 1 17 4) (not (matches-criteria 1 17 4))) 
    (reaches 1 17 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 17 4) (= (rule-target 17 4) NONE)) 
    (reaches 1 17 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 17 5))
    (reaches 1 17 (- 5 1))
))

(assert (=> 
    (and (reaches 1 17 5) (not (matches-criteria 1 17 5))) 
    (reaches 1 17 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 17 5) (= (rule-target 17 5) NONE)) 
    (reaches 1 17 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 18 0))
    (reaches 0 18 (- 0 1))
))

(assert (=> 
    (and (reaches 0 18 0) (not (matches-criteria 0 18 0))) 
    (reaches 0 18 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 18 0) (= (rule-target 18 0) NONE)) 
    (reaches 0 18 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 18 1))
    (reaches 0 18 (- 1 1))
))

(assert (=> 
    (and (reaches 0 18 1) (not (matches-criteria 0 18 1))) 
    (reaches 0 18 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 18 1) (= (rule-target 18 1) NONE)) 
    (reaches 0 18 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 18 2))
    (reaches 0 18 (- 2 1))
))

(assert (=> 
    (and (reaches 0 18 2) (not (matches-criteria 0 18 2))) 
    (reaches 0 18 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 18 2) (= (rule-target 18 2) NONE)) 
    (reaches 0 18 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 18 3))
    (reaches 0 18 (- 3 1))
))

(assert (=> 
    (and (reaches 0 18 3) (not (matches-criteria 0 18 3))) 
    (reaches 0 18 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 18 3) (= (rule-target 18 3) NONE)) 
    (reaches 0 18 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 18 4))
    (reaches 0 18 (- 4 1))
))

(assert (=> 
    (and (reaches 0 18 4) (not (matches-criteria 0 18 4))) 
    (reaches 0 18 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 18 4) (= (rule-target 18 4) NONE)) 
    (reaches 0 18 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 18 5))
    (reaches 0 18 (- 5 1))
))

(assert (=> 
    (and (reaches 0 18 5) (not (matches-criteria 0 18 5))) 
    (reaches 0 18 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 18 5) (= (rule-target 18 5) NONE)) 
    (reaches 0 18 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 18 0))
    (reaches 1 18 (- 0 1))
))

(assert (=> 
    (and (reaches 1 18 0) (not (matches-criteria 1 18 0))) 
    (reaches 1 18 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 18 0) (= (rule-target 18 0) NONE)) 
    (reaches 1 18 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 18 1))
    (reaches 1 18 (- 1 1))
))

(assert (=> 
    (and (reaches 1 18 1) (not (matches-criteria 1 18 1))) 
    (reaches 1 18 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 18 1) (= (rule-target 18 1) NONE)) 
    (reaches 1 18 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 18 2))
    (reaches 1 18 (- 2 1))
))

(assert (=> 
    (and (reaches 1 18 2) (not (matches-criteria 1 18 2))) 
    (reaches 1 18 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 18 2) (= (rule-target 18 2) NONE)) 
    (reaches 1 18 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 18 3))
    (reaches 1 18 (- 3 1))
))

(assert (=> 
    (and (reaches 1 18 3) (not (matches-criteria 1 18 3))) 
    (reaches 1 18 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 18 3) (= (rule-target 18 3) NONE)) 
    (reaches 1 18 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 18 4))
    (reaches 1 18 (- 4 1))
))

(assert (=> 
    (and (reaches 1 18 4) (not (matches-criteria 1 18 4))) 
    (reaches 1 18 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 18 4) (= (rule-target 18 4) NONE)) 
    (reaches 1 18 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 18 5))
    (reaches 1 18 (- 5 1))
))

(assert (=> 
    (and (reaches 1 18 5) (not (matches-criteria 1 18 5))) 
    (reaches 1 18 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 18 5) (= (rule-target 18 5) NONE)) 
    (reaches 1 18 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 19 0))
    (reaches 0 19 (- 0 1))
))

(assert (=> 
    (and (reaches 0 19 0) (not (matches-criteria 0 19 0))) 
    (reaches 0 19 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 19 0) (= (rule-target 19 0) NONE)) 
    (reaches 0 19 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 19 1))
    (reaches 0 19 (- 1 1))
))

(assert (=> 
    (and (reaches 0 19 1) (not (matches-criteria 0 19 1))) 
    (reaches 0 19 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 19 1) (= (rule-target 19 1) NONE)) 
    (reaches 0 19 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 19 2))
    (reaches 0 19 (- 2 1))
))

(assert (=> 
    (and (reaches 0 19 2) (not (matches-criteria 0 19 2))) 
    (reaches 0 19 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 19 2) (= (rule-target 19 2) NONE)) 
    (reaches 0 19 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 19 3))
    (reaches 0 19 (- 3 1))
))

(assert (=> 
    (and (reaches 0 19 3) (not (matches-criteria 0 19 3))) 
    (reaches 0 19 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 19 3) (= (rule-target 19 3) NONE)) 
    (reaches 0 19 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 19 4))
    (reaches 0 19 (- 4 1))
))

(assert (=> 
    (and (reaches 0 19 4) (not (matches-criteria 0 19 4))) 
    (reaches 0 19 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 19 4) (= (rule-target 19 4) NONE)) 
    (reaches 0 19 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 19 5))
    (reaches 0 19 (- 5 1))
))

(assert (=> 
    (and (reaches 0 19 5) (not (matches-criteria 0 19 5))) 
    (reaches 0 19 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 19 5) (= (rule-target 19 5) NONE)) 
    (reaches 0 19 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 19 0))
    (reaches 1 19 (- 0 1))
))

(assert (=> 
    (and (reaches 1 19 0) (not (matches-criteria 1 19 0))) 
    (reaches 1 19 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 19 0) (= (rule-target 19 0) NONE)) 
    (reaches 1 19 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 19 1))
    (reaches 1 19 (- 1 1))
))

(assert (=> 
    (and (reaches 1 19 1) (not (matches-criteria 1 19 1))) 
    (reaches 1 19 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 19 1) (= (rule-target 19 1) NONE)) 
    (reaches 1 19 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 19 2))
    (reaches 1 19 (- 2 1))
))

(assert (=> 
    (and (reaches 1 19 2) (not (matches-criteria 1 19 2))) 
    (reaches 1 19 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 19 2) (= (rule-target 19 2) NONE)) 
    (reaches 1 19 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 19 3))
    (reaches 1 19 (- 3 1))
))

(assert (=> 
    (and (reaches 1 19 3) (not (matches-criteria 1 19 3))) 
    (reaches 1 19 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 19 3) (= (rule-target 19 3) NONE)) 
    (reaches 1 19 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 19 4))
    (reaches 1 19 (- 4 1))
))

(assert (=> 
    (and (reaches 1 19 4) (not (matches-criteria 1 19 4))) 
    (reaches 1 19 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 19 4) (= (rule-target 19 4) NONE)) 
    (reaches 1 19 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 19 5))
    (reaches 1 19 (- 5 1))
))

(assert (=> 
    (and (reaches 1 19 5) (not (matches-criteria 1 19 5))) 
    (reaches 1 19 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 19 5) (= (rule-target 19 5) NONE)) 
    (reaches 1 19 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 20 0))
    (reaches 0 20 (- 0 1))
))

(assert (=> 
    (and (reaches 0 20 0) (not (matches-criteria 0 20 0))) 
    (reaches 0 20 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 20 0) (= (rule-target 20 0) NONE)) 
    (reaches 0 20 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 20 1))
    (reaches 0 20 (- 1 1))
))

(assert (=> 
    (and (reaches 0 20 1) (not (matches-criteria 0 20 1))) 
    (reaches 0 20 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 20 1) (= (rule-target 20 1) NONE)) 
    (reaches 0 20 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 20 2))
    (reaches 0 20 (- 2 1))
))

(assert (=> 
    (and (reaches 0 20 2) (not (matches-criteria 0 20 2))) 
    (reaches 0 20 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 20 2) (= (rule-target 20 2) NONE)) 
    (reaches 0 20 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 20 3))
    (reaches 0 20 (- 3 1))
))

(assert (=> 
    (and (reaches 0 20 3) (not (matches-criteria 0 20 3))) 
    (reaches 0 20 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 20 3) (= (rule-target 20 3) NONE)) 
    (reaches 0 20 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 20 4))
    (reaches 0 20 (- 4 1))
))

(assert (=> 
    (and (reaches 0 20 4) (not (matches-criteria 0 20 4))) 
    (reaches 0 20 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 20 4) (= (rule-target 20 4) NONE)) 
    (reaches 0 20 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 20 5))
    (reaches 0 20 (- 5 1))
))

(assert (=> 
    (and (reaches 0 20 5) (not (matches-criteria 0 20 5))) 
    (reaches 0 20 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 20 5) (= (rule-target 20 5) NONE)) 
    (reaches 0 20 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 20 0))
    (reaches 1 20 (- 0 1))
))

(assert (=> 
    (and (reaches 1 20 0) (not (matches-criteria 1 20 0))) 
    (reaches 1 20 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 20 0) (= (rule-target 20 0) NONE)) 
    (reaches 1 20 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 20 1))
    (reaches 1 20 (- 1 1))
))

(assert (=> 
    (and (reaches 1 20 1) (not (matches-criteria 1 20 1))) 
    (reaches 1 20 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 20 1) (= (rule-target 20 1) NONE)) 
    (reaches 1 20 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 20 2))
    (reaches 1 20 (- 2 1))
))

(assert (=> 
    (and (reaches 1 20 2) (not (matches-criteria 1 20 2))) 
    (reaches 1 20 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 20 2) (= (rule-target 20 2) NONE)) 
    (reaches 1 20 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 20 3))
    (reaches 1 20 (- 3 1))
))

(assert (=> 
    (and (reaches 1 20 3) (not (matches-criteria 1 20 3))) 
    (reaches 1 20 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 20 3) (= (rule-target 20 3) NONE)) 
    (reaches 1 20 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 20 4))
    (reaches 1 20 (- 4 1))
))

(assert (=> 
    (and (reaches 1 20 4) (not (matches-criteria 1 20 4))) 
    (reaches 1 20 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 20 4) (= (rule-target 20 4) NONE)) 
    (reaches 1 20 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 20 5))
    (reaches 1 20 (- 5 1))
))

(assert (=> 
    (and (reaches 1 20 5) (not (matches-criteria 1 20 5))) 
    (reaches 1 20 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 20 5) (= (rule-target 20 5) NONE)) 
    (reaches 1 20 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 21 0))
    (reaches 0 21 (- 0 1))
))

(assert (=> 
    (and (reaches 0 21 0) (not (matches-criteria 0 21 0))) 
    (reaches 0 21 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 21 0) (= (rule-target 21 0) NONE)) 
    (reaches 0 21 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 21 1))
    (reaches 0 21 (- 1 1))
))

(assert (=> 
    (and (reaches 0 21 1) (not (matches-criteria 0 21 1))) 
    (reaches 0 21 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 21 1) (= (rule-target 21 1) NONE)) 
    (reaches 0 21 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 21 2))
    (reaches 0 21 (- 2 1))
))

(assert (=> 
    (and (reaches 0 21 2) (not (matches-criteria 0 21 2))) 
    (reaches 0 21 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 21 2) (= (rule-target 21 2) NONE)) 
    (reaches 0 21 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 21 0))
    (reaches 1 21 (- 0 1))
))

(assert (=> 
    (and (reaches 1 21 0) (not (matches-criteria 1 21 0))) 
    (reaches 1 21 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 21 0) (= (rule-target 21 0) NONE)) 
    (reaches 1 21 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 21 1))
    (reaches 1 21 (- 1 1))
))

(assert (=> 
    (and (reaches 1 21 1) (not (matches-criteria 1 21 1))) 
    (reaches 1 21 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 21 1) (= (rule-target 21 1) NONE)) 
    (reaches 1 21 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 21 2))
    (reaches 1 21 (- 2 1))
))

(assert (=> 
    (and (reaches 1 21 2) (not (matches-criteria 1 21 2))) 
    (reaches 1 21 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 21 2) (= (rule-target 21 2) NONE)) 
    (reaches 1 21 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 22 0))
    (reaches 0 22 (- 0 1))
))

(assert (=> 
    (and (reaches 0 22 0) (not (matches-criteria 0 22 0))) 
    (reaches 0 22 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 22 0) (= (rule-target 22 0) NONE)) 
    (reaches 0 22 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 22 1))
    (reaches 0 22 (- 1 1))
))

(assert (=> 
    (and (reaches 0 22 1) (not (matches-criteria 0 22 1))) 
    (reaches 0 22 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 22 1) (= (rule-target 22 1) NONE)) 
    (reaches 0 22 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 22 2))
    (reaches 0 22 (- 2 1))
))

(assert (=> 
    (and (reaches 0 22 2) (not (matches-criteria 0 22 2))) 
    (reaches 0 22 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 22 2) (= (rule-target 22 2) NONE)) 
    (reaches 0 22 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 22 0))
    (reaches 1 22 (- 0 1))
))

(assert (=> 
    (and (reaches 1 22 0) (not (matches-criteria 1 22 0))) 
    (reaches 1 22 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 22 0) (= (rule-target 22 0) NONE)) 
    (reaches 1 22 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 22 1))
    (reaches 1 22 (- 1 1))
))

(assert (=> 
    (and (reaches 1 22 1) (not (matches-criteria 1 22 1))) 
    (reaches 1 22 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 22 1) (= (rule-target 22 1) NONE)) 
    (reaches 1 22 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 22 2))
    (reaches 1 22 (- 2 1))
))

(assert (=> 
    (and (reaches 1 22 2) (not (matches-criteria 1 22 2))) 
    (reaches 1 22 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 22 2) (= (rule-target 22 2) NONE)) 
    (reaches 1 22 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 23 0))
    (reaches 0 23 (- 0 1))
))

(assert (=> 
    (and (reaches 0 23 0) (not (matches-criteria 0 23 0))) 
    (reaches 0 23 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 23 0) (= (rule-target 23 0) NONE)) 
    (reaches 0 23 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 23 1))
    (reaches 0 23 (- 1 1))
))

(assert (=> 
    (and (reaches 0 23 1) (not (matches-criteria 0 23 1))) 
    (reaches 0 23 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 23 1) (= (rule-target 23 1) NONE)) 
    (reaches 0 23 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 23 2))
    (reaches 0 23 (- 2 1))
))

(assert (=> 
    (and (reaches 0 23 2) (not (matches-criteria 0 23 2))) 
    (reaches 0 23 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 23 2) (= (rule-target 23 2) NONE)) 
    (reaches 0 23 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 23 0))
    (reaches 1 23 (- 0 1))
))

(assert (=> 
    (and (reaches 1 23 0) (not (matches-criteria 1 23 0))) 
    (reaches 1 23 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 23 0) (= (rule-target 23 0) NONE)) 
    (reaches 1 23 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 23 1))
    (reaches 1 23 (- 1 1))
))

(assert (=> 
    (and (reaches 1 23 1) (not (matches-criteria 1 23 1))) 
    (reaches 1 23 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 23 1) (= (rule-target 23 1) NONE)) 
    (reaches 1 23 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 23 2))
    (reaches 1 23 (- 2 1))
))

(assert (=> 
    (and (reaches 1 23 2) (not (matches-criteria 1 23 2))) 
    (reaches 1 23 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 23 2) (= (rule-target 23 2) NONE)) 
    (reaches 1 23 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 24 0))
    (reaches 0 24 (- 0 1))
))

(assert (=> 
    (and (reaches 0 24 0) (not (matches-criteria 0 24 0))) 
    (reaches 0 24 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 24 0) (= (rule-target 24 0) NONE)) 
    (reaches 0 24 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 24 1))
    (reaches 0 24 (- 1 1))
))

(assert (=> 
    (and (reaches 0 24 1) (not (matches-criteria 0 24 1))) 
    (reaches 0 24 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 24 1) (= (rule-target 24 1) NONE)) 
    (reaches 0 24 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 24 2))
    (reaches 0 24 (- 2 1))
))

(assert (=> 
    (and (reaches 0 24 2) (not (matches-criteria 0 24 2))) 
    (reaches 0 24 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 24 2) (= (rule-target 24 2) NONE)) 
    (reaches 0 24 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 24 0))
    (reaches 1 24 (- 0 1))
))

(assert (=> 
    (and (reaches 1 24 0) (not (matches-criteria 1 24 0))) 
    (reaches 1 24 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 24 0) (= (rule-target 24 0) NONE)) 
    (reaches 1 24 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 24 1))
    (reaches 1 24 (- 1 1))
))

(assert (=> 
    (and (reaches 1 24 1) (not (matches-criteria 1 24 1))) 
    (reaches 1 24 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 24 1) (= (rule-target 24 1) NONE)) 
    (reaches 1 24 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 24 2))
    (reaches 1 24 (- 2 1))
))

(assert (=> 
    (and (reaches 1 24 2) (not (matches-criteria 1 24 2))) 
    (reaches 1 24 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 24 2) (= (rule-target 24 2) NONE)) 
    (reaches 1 24 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 25 0))
    (reaches 0 25 (- 0 1))
))

(assert (=> 
    (and (reaches 0 25 0) (not (matches-criteria 0 25 0))) 
    (reaches 0 25 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 25 0) (= (rule-target 25 0) NONE)) 
    (reaches 0 25 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 25 1))
    (reaches 0 25 (- 1 1))
))

(assert (=> 
    (and (reaches 0 25 1) (not (matches-criteria 0 25 1))) 
    (reaches 0 25 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 25 1) (= (rule-target 25 1) NONE)) 
    (reaches 0 25 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 25 2))
    (reaches 0 25 (- 2 1))
))

(assert (=> 
    (and (reaches 0 25 2) (not (matches-criteria 0 25 2))) 
    (reaches 0 25 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 25 2) (= (rule-target 25 2) NONE)) 
    (reaches 0 25 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 25 0))
    (reaches 1 25 (- 0 1))
))

(assert (=> 
    (and (reaches 1 25 0) (not (matches-criteria 1 25 0))) 
    (reaches 1 25 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 25 0) (= (rule-target 25 0) NONE)) 
    (reaches 1 25 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 25 1))
    (reaches 1 25 (- 1 1))
))

(assert (=> 
    (and (reaches 1 25 1) (not (matches-criteria 1 25 1))) 
    (reaches 1 25 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 25 1) (= (rule-target 25 1) NONE)) 
    (reaches 1 25 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 25 2))
    (reaches 1 25 (- 2 1))
))

(assert (=> 
    (and (reaches 1 25 2) (not (matches-criteria 1 25 2))) 
    (reaches 1 25 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 25 2) (= (rule-target 25 2) NONE)) 
    (reaches 1 25 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 26 0))
    (reaches 0 26 (- 0 1))
))

(assert (=> 
    (and (reaches 0 26 0) (not (matches-criteria 0 26 0))) 
    (reaches 0 26 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 26 0) (= (rule-target 26 0) NONE)) 
    (reaches 0 26 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 26 1))
    (reaches 0 26 (- 1 1))
))

(assert (=> 
    (and (reaches 0 26 1) (not (matches-criteria 0 26 1))) 
    (reaches 0 26 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 26 1) (= (rule-target 26 1) NONE)) 
    (reaches 0 26 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 26 2))
    (reaches 0 26 (- 2 1))
))

(assert (=> 
    (and (reaches 0 26 2) (not (matches-criteria 0 26 2))) 
    (reaches 0 26 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 26 2) (= (rule-target 26 2) NONE)) 
    (reaches 0 26 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 26 3))
    (reaches 0 26 (- 3 1))
))

(assert (=> 
    (and (reaches 0 26 3) (not (matches-criteria 0 26 3))) 
    (reaches 0 26 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 26 3) (= (rule-target 26 3) NONE)) 
    (reaches 0 26 (+ 3 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 26 0))
    (reaches 1 26 (- 0 1))
))

(assert (=> 
    (and (reaches 1 26 0) (not (matches-criteria 1 26 0))) 
    (reaches 1 26 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 26 0) (= (rule-target 26 0) NONE)) 
    (reaches 1 26 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 26 1))
    (reaches 1 26 (- 1 1))
))

(assert (=> 
    (and (reaches 1 26 1) (not (matches-criteria 1 26 1))) 
    (reaches 1 26 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 26 1) (= (rule-target 26 1) NONE)) 
    (reaches 1 26 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 26 2))
    (reaches 1 26 (- 2 1))
))

(assert (=> 
    (and (reaches 1 26 2) (not (matches-criteria 1 26 2))) 
    (reaches 1 26 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 26 2) (= (rule-target 26 2) NONE)) 
    (reaches 1 26 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 26 3))
    (reaches 1 26 (- 3 1))
))

(assert (=> 
    (and (reaches 1 26 3) (not (matches-criteria 1 26 3))) 
    (reaches 1 26 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 26 3) (= (rule-target 26 3) NONE)) 
    (reaches 1 26 (+ 3 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 27 0))
    (reaches 0 27 (- 0 1))
))

(assert (=> 
    (and (reaches 0 27 0) (not (matches-criteria 0 27 0))) 
    (reaches 0 27 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 27 0) (= (rule-target 27 0) NONE)) 
    (reaches 0 27 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 27 1))
    (reaches 0 27 (- 1 1))
))

(assert (=> 
    (and (reaches 0 27 1) (not (matches-criteria 0 27 1))) 
    (reaches 0 27 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 27 1) (= (rule-target 27 1) NONE)) 
    (reaches 0 27 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 27 2))
    (reaches 0 27 (- 2 1))
))

(assert (=> 
    (and (reaches 0 27 2) (not (matches-criteria 0 27 2))) 
    (reaches 0 27 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 27 2) (= (rule-target 27 2) NONE)) 
    (reaches 0 27 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 27 0))
    (reaches 1 27 (- 0 1))
))

(assert (=> 
    (and (reaches 1 27 0) (not (matches-criteria 1 27 0))) 
    (reaches 1 27 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 27 0) (= (rule-target 27 0) NONE)) 
    (reaches 1 27 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 27 1))
    (reaches 1 27 (- 1 1))
))

(assert (=> 
    (and (reaches 1 27 1) (not (matches-criteria 1 27 1))) 
    (reaches 1 27 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 27 1) (= (rule-target 27 1) NONE)) 
    (reaches 1 27 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 27 2))
    (reaches 1 27 (- 2 1))
))

(assert (=> 
    (and (reaches 1 27 2) (not (matches-criteria 1 27 2))) 
    (reaches 1 27 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 27 2) (= (rule-target 27 2) NONE)) 
    (reaches 1 27 (+ 2 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 28 0))
    (reaches 0 28 (- 0 1))
))

(assert (=> 
    (and (reaches 0 28 0) (not (matches-criteria 0 28 0))) 
    (reaches 0 28 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 28 0) (= (rule-target 28 0) NONE)) 
    (reaches 0 28 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 28 1))
    (reaches 0 28 (- 1 1))
))

(assert (=> 
    (and (reaches 0 28 1) (not (matches-criteria 0 28 1))) 
    (reaches 0 28 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 28 1) (= (rule-target 28 1) NONE)) 
    (reaches 0 28 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 28 2))
    (reaches 0 28 (- 2 1))
))

(assert (=> 
    (and (reaches 0 28 2) (not (matches-criteria 0 28 2))) 
    (reaches 0 28 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 28 2) (= (rule-target 28 2) NONE)) 
    (reaches 0 28 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 28 3))
    (reaches 0 28 (- 3 1))
))

(assert (=> 
    (and (reaches 0 28 3) (not (matches-criteria 0 28 3))) 
    (reaches 0 28 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 28 3) (= (rule-target 28 3) NONE)) 
    (reaches 0 28 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 28 4))
    (reaches 0 28 (- 4 1))
))

(assert (=> 
    (and (reaches 0 28 4) (not (matches-criteria 0 28 4))) 
    (reaches 0 28 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 28 4) (= (rule-target 28 4) NONE)) 
    (reaches 0 28 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 28 5))
    (reaches 0 28 (- 5 1))
))

(assert (=> 
    (and (reaches 0 28 5) (not (matches-criteria 0 28 5))) 
    (reaches 0 28 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 28 5) (= (rule-target 28 5) NONE)) 
    (reaches 0 28 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 28 0))
    (reaches 1 28 (- 0 1))
))

(assert (=> 
    (and (reaches 1 28 0) (not (matches-criteria 1 28 0))) 
    (reaches 1 28 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 28 0) (= (rule-target 28 0) NONE)) 
    (reaches 1 28 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 28 1))
    (reaches 1 28 (- 1 1))
))

(assert (=> 
    (and (reaches 1 28 1) (not (matches-criteria 1 28 1))) 
    (reaches 1 28 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 28 1) (= (rule-target 28 1) NONE)) 
    (reaches 1 28 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 28 2))
    (reaches 1 28 (- 2 1))
))

(assert (=> 
    (and (reaches 1 28 2) (not (matches-criteria 1 28 2))) 
    (reaches 1 28 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 28 2) (= (rule-target 28 2) NONE)) 
    (reaches 1 28 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 28 3))
    (reaches 1 28 (- 3 1))
))

(assert (=> 
    (and (reaches 1 28 3) (not (matches-criteria 1 28 3))) 
    (reaches 1 28 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 28 3) (= (rule-target 28 3) NONE)) 
    (reaches 1 28 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 28 4))
    (reaches 1 28 (- 4 1))
))

(assert (=> 
    (and (reaches 1 28 4) (not (matches-criteria 1 28 4))) 
    (reaches 1 28 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 28 4) (= (rule-target 28 4) NONE)) 
    (reaches 1 28 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 28 5))
    (reaches 1 28 (- 5 1))
))

(assert (=> 
    (and (reaches 1 28 5) (not (matches-criteria 1 28 5))) 
    (reaches 1 28 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 28 5) (= (rule-target 28 5) NONE)) 
    (reaches 1 28 (+ 5 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 29 0))
    (reaches 0 29 (- 0 1))
))

(assert (=> 
    (and (reaches 0 29 0) (not (matches-criteria 0 29 0))) 
    (reaches 0 29 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 29 0) (= (rule-target 29 0) NONE)) 
    (reaches 0 29 (+ 0 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 29 0))
    (reaches 1 29 (- 0 1))
))

(assert (=> 
    (and (reaches 1 29 0) (not (matches-criteria 1 29 0))) 
    (reaches 1 29 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 29 0) (= (rule-target 29 0) NONE)) 
    (reaches 1 29 (+ 0 1))
))
(assert (= (and (not SYN) ACK) (matches-criteria 0 0 0)))(assert (= (and (not SYN) ACK) (matches-criteria 1 0 0)))
(assert (= (and (not SYN) (not ACK)) (matches-criteria 0 0 1)))(assert (= (and (not SYN) (not ACK)) (matches-criteria 1 0 1)))
(assert (= (and (= protocol 37) (= source_port 97)) (matches-criteria 0 0 2)))(assert (= (and (= protocol 37) (= source_port 97)) (matches-criteria 1 0 2)))
(assert (= (= destination_port 89) (matches-criteria 0 0 3)))(assert (= (= destination_port 89) (matches-criteria 1 0 3)))
(assert (= (= destination_port 4) (matches-criteria 0 0 4)))(assert (= (= destination_port 4) (matches-criteria 1 0 4)))
(assert (= (= destination_port 78) (matches-criteria 0 0 5)))(assert (= (= destination_port 78) (matches-criteria 1 0 5)))
(assert (matches-criteria 0 0 6))(assert (matches-criteria 1 0 6))
(assert (matches-criteria 0 0 7))(assert (matches-criteria 1 0 7))
(assert (matches-criteria 0 0 8))(assert (matches-criteria 1 0 8))
(assert (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 0 0 9)))(assert (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 1 0 9)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 0 10)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 0 10)))
(assert (= (and (= protocol 17) (= source_port 98)) (matches-criteria 0 0 11)))(assert (= (and (= protocol 17) (= source_port 98)) (matches-criteria 1 0 11)))
(assert (= (= destination_port 9) (matches-criteria 0 1 0)))(assert (= (= destination_port 9) (matches-criteria 1 1 0)))
(assert (= (= protocol 0) (matches-criteria 0 1 1)))(assert (= (= protocol 0) (matches-criteria 1 1 1)))
(assert (= (= protocol 22) (matches-criteria 0 1 2)))(assert (= (= protocol 22) (matches-criteria 1 1 2)))
(assert (= (and (= protocol 6) (= source_port 6)) (matches-criteria 0 1 3)))(assert (= (and (= protocol 6) (= source_port 6)) (matches-criteria 1 1 3)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 0 1 4)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 1 1 4)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 0 1 5)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 1 1 5)))
(assert (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 0 1 6)))(assert (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 1 1 6)))
(assert (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 0 1 7)))(assert (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 1 1 7)))
(assert (= (and (= source_port 10) (= protocol 88)) (matches-criteria 0 1 8)))(assert (= (and (= source_port 10) (= protocol 88)) (matches-criteria 1 1 8)))
(assert (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 0 1 9)))(assert (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 1 1 9)))
(assert (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 0 1 10)))(assert (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 1 1 10)))
(assert (= (and (= source_port 10) (= protocol 87)) (matches-criteria 0 1 11)))(assert (= (and (= source_port 10) (= protocol 87)) (matches-criteria 1 1 11)))
(assert (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 0 1 12)))(assert (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 1 1 12)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 0 1 13)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 1 1 13)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 0 1 14)))(assert (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 1 1 14)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 0 1 15)))(assert (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 1 1 15)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 2 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 2 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 2 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 2 1)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 2 2)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 2 2)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 2 3)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 2 3)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 3 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 3 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 3 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 3 1)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 3 2)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 3 2)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 3 3)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 3 3)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 4 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 4 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 4 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 4 1)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 4 2)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 4 2)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 4 3)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 4 3)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 5 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 5 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 5 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 5 1)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 5 2)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 5 2)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 5 3)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 5 3)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 6 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 6 0)))
(assert (= (= protocol 17) (matches-criteria 0 6 1)))(assert (= (= protocol 17) (matches-criteria 1 6 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 7 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 7 0)))
(assert (= (= protocol 17) (matches-criteria 0 7 1)))(assert (= (= protocol 17) (matches-criteria 1 7 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 8 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 8 0)))
(assert (= (= protocol 17) (matches-criteria 0 8 1)))(assert (= (= protocol 17) (matches-criteria 1 8 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 9 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 9 0)))
(assert (= (= protocol 17) (matches-criteria 0 9 1)))(assert (= (= protocol 17) (matches-criteria 1 9 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 10 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 10 0)))
(assert (= (= protocol 17) (matches-criteria 0 10 1)))(assert (= (= protocol 17) (matches-criteria 1 10 1)))
(assert (= (not (= protocol 4)) (matches-criteria 0 11 0)))(assert (= (not (= protocol 4)) (matches-criteria 1 11 0)))
(assert (matches-criteria 0 11 1))(assert (matches-criteria 1 11 1))
(assert (matches-criteria 0 11 2))(assert (matches-criteria 1 11 2))
(assert (= (= protocol 0) (matches-criteria 0 12 0)))(assert (= (= protocol 0) (matches-criteria 1 12 0)))
(assert (= (and (= protocol 6) SYN) (matches-criteria 0 12 1)))(assert (= (and (= protocol 6) SYN) (matches-criteria 1 12 1)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 13 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 13 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 13 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 13 1)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 13 2)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 13 2)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 13 3)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 13 3)))

(assert (= (and (not SYN) ACK) (matches-criteria 0 15 0)))(assert (= (and (not SYN) ACK) (matches-criteria 1 15 0)))
(assert (= (and (not SYN) (not ACK)) (matches-criteria 0 15 1)))(assert (= (and (not SYN) (not ACK)) (matches-criteria 1 15 1)))
(assert (= (and (= protocol 37) (= source_port 97)) (matches-criteria 0 15 2)))(assert (= (and (= protocol 37) (= source_port 97)) (matches-criteria 1 15 2)))
(assert (= (= destination_port 89) (matches-criteria 0 15 3)))(assert (= (= destination_port 89) (matches-criteria 1 15 3)))
(assert (= (= destination_port 4) (matches-criteria 0 15 4)))(assert (= (= destination_port 4) (matches-criteria 1 15 4)))
(assert (= (= destination_port 78) (matches-criteria 0 15 5)))(assert (= (= destination_port 78) (matches-criteria 1 15 5)))
(assert (matches-criteria 0 15 6))(assert (matches-criteria 1 15 6))
(assert (matches-criteria 0 15 7))(assert (matches-criteria 1 15 7))
(assert (matches-criteria 0 15 8))(assert (matches-criteria 1 15 8))
(assert (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 0 15 9)))(assert (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 1 15 9)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 15 10)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 15 10)))
(assert (= (and (= protocol 17) (= source_port 98)) (matches-criteria 0 15 11)))(assert (= (and (= protocol 17) (= source_port 98)) (matches-criteria 1 15 11)))
(assert (= (= destination_port 9) (matches-criteria 0 16 0)))(assert (= (= destination_port 9) (matches-criteria 1 16 0)))
(assert (= (= protocol 0) (matches-criteria 0 16 1)))(assert (= (= protocol 0) (matches-criteria 1 16 1)))
(assert (= (= protocol 22) (matches-criteria 0 16 2)))(assert (= (= protocol 22) (matches-criteria 1 16 2)))
(assert (= (and (= protocol 6) (= source_port 6)) (matches-criteria 0 16 3)))(assert (= (and (= protocol 6) (= source_port 6)) (matches-criteria 1 16 3)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 0 16 4)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 1 16 4)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 0 16 5)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 1 16 5)))
(assert (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 0 16 6)))(assert (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 1 16 6)))
(assert (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 0 16 7)))(assert (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 1 16 7)))
(assert (= (and (= source_port 10) (= protocol 88)) (matches-criteria 0 16 8)))(assert (= (and (= source_port 10) (= protocol 88)) (matches-criteria 1 16 8)))
(assert (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 0 16 9)))(assert (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 1 16 9)))
(assert (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 0 16 10)))(assert (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 1 16 10)))
(assert (= (and (= source_port 10) (= protocol 87)) (matches-criteria 0 16 11)))(assert (= (and (= source_port 10) (= protocol 87)) (matches-criteria 1 16 11)))
(assert (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 0 16 12)))(assert (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 1 16 12)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 0 16 13)))(assert (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 1 16 13)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 0 16 14)))(assert (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 1 16 14)))
(assert (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 0 16 15)))(assert (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 1 16 15)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 17 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 17 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 17 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 17 1)))
(assert (= (= destination_port 100) (matches-criteria 0 17 2)))(assert (= (= destination_port 100) (matches-criteria 1 17 2)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 17 3)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 17 3)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 17 4)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 17 4)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 18 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 18 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 18 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 18 1)))
(assert (= (= destination_port 100) (matches-criteria 0 18 2)))(assert (= (= destination_port 100) (matches-criteria 1 18 2)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 18 3)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 18 3)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 18 4)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 18 4)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 19 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 19 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 19 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 19 1)))
(assert (= (= destination_port 100) (matches-criteria 0 19 2)))(assert (= (= destination_port 100) (matches-criteria 1 19 2)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 19 3)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 19 3)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 19 4)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 19 4)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 20 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 20 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 20 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 20 1)))
(assert (= (= destination_port 100) (matches-criteria 0 20 2)))(assert (= (= destination_port 100) (matches-criteria 1 20 2)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 20 3)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 20 3)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 20 4)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 20 4)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 21 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 21 0)))
(assert (= (= protocol 17) (matches-criteria 0 21 1)))(assert (= (= protocol 17) (matches-criteria 1 21 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 22 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 22 0)))
(assert (= (= protocol 17) (matches-criteria 0 22 1)))(assert (= (= protocol 17) (matches-criteria 1 22 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 23 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 23 0)))
(assert (= (= protocol 17) (matches-criteria 0 23 1)))(assert (= (= protocol 17) (matches-criteria 1 23 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 24 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 24 0)))
(assert (= (= protocol 17) (matches-criteria 0 24 1)))(assert (= (= protocol 17) (matches-criteria 1 24 1)))
(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 25 0)))(assert (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 25 0)))
(assert (= (= protocol 17) (matches-criteria 0 25 1)))(assert (= (= protocol 17) (matches-criteria 1 25 1)))
(assert (= (not (= protocol 4)) (matches-criteria 0 26 0)))(assert (= (not (= protocol 4)) (matches-criteria 1 26 0)))
(assert (matches-criteria 0 26 1))(assert (matches-criteria 1 26 1))
(assert (matches-criteria 0 26 2))(assert (matches-criteria 1 26 2))
(assert (= (= protocol 0) (matches-criteria 0 27 0)))(assert (= (= protocol 0) (matches-criteria 1 27 0)))
(assert (= (and (= protocol 6) SYN) (matches-criteria 0 27 1)))(assert (= (and (= protocol 6) SYN) (matches-criteria 1 27 1)))
(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 28 0)))(assert (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 28 0)))
(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 28 1)))(assert (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 28 1)))
(assert (= (= destination_port 100) (matches-criteria 0 28 2)))(assert (= (= destination_port 100) (matches-criteria 1 28 2)))
(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 28 3)))(assert (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 28 3)))
(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 28 4)))(assert (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 28 4)))

(assert (or (= chain0 2)(= chain0 3)(= chain0 4)(= chain0 5)(= chain0 13)))(assert (or (= chain1 17)(= chain1 18)(= chain1 19)(= chain1 20)(= chain1 28)))(assert (reaches 0 chain0 0))(assert (reaches 1 chain1 0))(assert (not (and (or (= (terminates-with 0) (terminates-with 1)) (and (reaches-end 0 chain0) (reaches-end 1 chain1)) (= destination_port 100)) (=> (= destination_port 100) (= (terminates-with 1) ACCEPT)))))(check-sat)
(get-model)