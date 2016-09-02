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
   (and (valid-rule c r) (matches-criteria p c r) (reaches p c r)))

(define-fun terminating ((t Target)) Bool 
    (or (= t ACCEPT) (= t DROP))
)

(define-fun terminates-at ((p Int) (c Int) (r Int)) Bool
    (and (valid-rule c r) (matches-rule p c r) (terminating (rule-target c r))))



(define-fun reaches-top-level-chain ((p Int) (c Int)) Bool
    (and (valid-chain c) (top-level-chain c) (reaches p c 0))
)



(assert (= num-of-packets 2))
(declare-const chain0 Int)(declare-const chain1 Int)
(assert (= (chain-length 16) 64))
(assert (= (chain-length 17) 104))
(assert (= (chain-length 18) 65))
(assert (= (chain-length 19) 65))
(assert (= (chain-length 36) 65))
(assert (= (chain-length 37) 104))
(assert (= (chain-length 38) 65))
(assert (= (chain-length 39) 65))
(assert (= (chain-length 0) 0))
(assert (= (chain-length 1) 0))
(assert (= (chain-length 2) 0))
(assert (= (chain-length 3) 0))
(assert (= (chain-length 4) 0))
(assert (= (chain-length 5) 0))
(assert (= (chain-length 6) 0))
(assert (= (chain-length 7) 0))
(assert (= (chain-length 8) 0))
(assert (= (chain-length 9) 0))
(assert (= (chain-length 10) 0))
(assert (= (chain-length 11) 0))
(assert (= (chain-length 12) 0))
(assert (= (chain-length 13) 0))
(assert (= (chain-length 14) 0))
(assert (= (chain-length 15) 0))
(assert (= (chain-length 20) 0))
(assert (= (chain-length 21) 0))
(assert (= (chain-length 22) 0))
(assert (= (chain-length 23) 0))
(assert (= (chain-length 24) 0))
(assert (= (chain-length 25) 0))
(assert (= (chain-length 26) 0))
(assert (= (chain-length 27) 0))
(assert (= (chain-length 28) 0))
(assert (= (chain-length 29) 0))
(assert (= (chain-length 30) 0))
(assert (= (chain-length 31) 0))
(assert (= (chain-length 32) 0))
(assert (= (chain-length 33) 0))
(assert (= (chain-length 34) 0))
(assert (= (chain-length 35) 0))

(assert (not (reaches 0 16 65)))

(assert (= (reaches 0 16 64) (reaches-end 0 16)))

(assert (= (returns-from 0 16) (or (reaches-return 0 16)(reaches-end 0 16))))
(assert (not (reaches 1 16 65)))

(assert (= (reaches 1 16 64) (reaches-end 1 16)))

(assert (= (returns-from 1 16) (or (reaches-return 1 16)(reaches-end 1 16))))
(assert (not (reaches 0 17 105)))

(assert (= (reaches 0 17 104) (reaches-end 0 17)))

(assert (= (returns-from 0 17) (or (reaches-return 0 17)(reaches-end 0 17))))
(assert (not (reaches 1 17 105)))

(assert (= (reaches 1 17 104) (reaches-end 1 17)))

(assert (= (returns-from 1 17) (or (reaches-return 1 17)(reaches-end 1 17))))
(assert (not (reaches 0 18 66)))

(assert (= (reaches 0 18 65) (reaches-end 0 18)))

(assert (= (returns-from 0 18) (or (reaches-return 0 18)(reaches-end 0 18))))
(assert (not (reaches 1 18 66)))

(assert (= (reaches 1 18 65) (reaches-end 1 18)))

(assert (= (returns-from 1 18) (or (reaches-return 1 18)(reaches-end 1 18))))
(assert (not (reaches 0 19 66)))

(assert (= (reaches 0 19 65) (reaches-end 0 19)))

(assert (= (returns-from 0 19) (or (reaches-return 0 19)(reaches-end 0 19))))
(assert (not (reaches 1 19 66)))

(assert (= (reaches 1 19 65) (reaches-end 1 19)))

(assert (= (returns-from 1 19) (or (reaches-return 1 19)(reaches-end 1 19))))
(assert (not (reaches 0 36 66)))

(assert (= (reaches 0 36 65) (reaches-end 0 36)))

(assert (= (returns-from 0 36) (or (reaches-return 0 36)(reaches-end 0 36))))
(assert (not (reaches 1 36 66)))

(assert (= (reaches 1 36 65) (reaches-end 1 36)))

(assert (= (returns-from 1 36) (or (reaches-return 1 36)(reaches-end 1 36))))
(assert (not (reaches 0 37 105)))

(assert (= (reaches 0 37 104) (reaches-end 0 37)))

(assert (= (returns-from 0 37) (or (reaches-return 0 37)(reaches-end 0 37))))
(assert (not (reaches 1 37 105)))

(assert (= (reaches 1 37 104) (reaches-end 1 37)))

(assert (= (returns-from 1 37) (or (reaches-return 1 37)(reaches-end 1 37))))
(assert (not (reaches 0 38 66)))

(assert (= (reaches 0 38 65) (reaches-end 0 38)))

(assert (= (returns-from 0 38) (or (reaches-return 0 38)(reaches-end 0 38))))
(assert (not (reaches 1 38 66)))

(assert (= (reaches 1 38 65) (reaches-end 1 38)))

(assert (= (returns-from 1 38) (or (reaches-return 1 38)(reaches-end 1 38))))
(assert (not (reaches 0 39 66)))

(assert (= (reaches 0 39 65) (reaches-end 0 39)))

(assert (= (returns-from 0 39) (or (reaches-return 0 39)(reaches-end 0 39))))
(assert (not (reaches 1 39 66)))

(assert (= (reaches 1 39 65) (reaches-end 1 39)))

(assert (= (returns-from 1 39) (or (reaches-return 1 39)(reaches-end 1 39))))

(assert (top-level-chain 16))
(assert (top-level-chain 36))

(assert (=> (reaches-end 0 16) (= (terminates-with 0) (policy 16))))
(assert (=> (reaches-end 0 36) (= (terminates-with 0) (policy 36))))
(assert (=> (reaches-end 1 16) (= (terminates-with 1) (policy 16))))
(assert (=> (reaches-end 1 36) (= (terminates-with 1) (policy 36))))

(assert (= (policy 17) NONE))
(assert (= (policy 18) NONE))
(assert (= (policy 19) NONE))
(assert (= (policy 37) NONE))
(assert (= (policy 38) NONE))
(assert (= (policy 39) NONE))
(assert (= (policy 17) NONE))
(assert (= (policy 18) NONE))
(assert (= (policy 19) NONE))
(assert (= (policy 37) NONE))
(assert (= (policy 38) NONE))
(assert (= (policy 39) NONE))

(assert (=> (reaches 0 16 0) (not (reaches 0 36 0))))
(assert (=> (reaches 1 16 0) (not (reaches 1 36 0))))

(assert (not (top-level-chain 17)))
(assert (not (top-level-chain 18)))
(assert (not (top-level-chain 19)))
(assert (not (top-level-chain 37)))
(assert (not (top-level-chain 38)))
(assert (not (top-level-chain 39)))

(assert (= num-of-chains 40))
(declare-fun protocol (Int) Int)
(assert (<= 0 (protocol 0)))

(assert (<= (protocol 0) 255))

(declare-fun source_port (Int) Int)
(assert (<= 0 (source_port 0)))

(assert (<= (source_port 0) 65535))

(declare-fun destination_port (Int) Int)
(assert (<= 0 (destination_port 0)))

(assert (<= (destination_port 0) 65535))

(declare-fun SYN (Int) Bool)
(declare-fun ACK (Int) Bool)
(declare-fun RST (Int) Bool)

(assert (= (rule-target 16 0) ACCEPT))
(assert (=> (matches-rule 0 16 0) (and (not (reaches 0 16 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 0) (and (not (reaches 1 16 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 1) ACCEPT))
(assert (=> (matches-rule 0 16 1) (and (not (reaches 0 16 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 1) (and (not (reaches 1 16 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 2) ACCEPT))
(assert (=> (matches-rule 0 16 2) (and (not (reaches 0 16 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 2) (and (not (reaches 1 16 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 3) ACCEPT))
(assert (=> (matches-rule 0 16 3) (and (not (reaches 0 16 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 3) (and (not (reaches 1 16 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 4) ACCEPT))
(assert (=> (matches-rule 0 16 4) (and (not (reaches 0 16 5))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 4) (and (not (reaches 1 16 5))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 5) ACCEPT))
(assert (=> (matches-rule 0 16 5) (and (not (reaches 0 16 6))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 5) (and (not (reaches 1 16 6))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 6) ACCEPT))
(assert (=> (matches-rule 0 16 6) (and (not (reaches 0 16 7))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 6) (and (not (reaches 1 16 7))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 7) ACCEPT))
(assert (=> (matches-rule 0 16 7) (and (not (reaches 0 16 8))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 7) (and (not (reaches 1 16 8))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 8) ACCEPT))
(assert (=> (matches-rule 0 16 8) (and (not (reaches 0 16 9))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 8) (and (not (reaches 1 16 9))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 9) ACCEPT))
(assert (=> (matches-rule 0 16 9) (and (not (reaches 0 16 10))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 9) (and (not (reaches 1 16 10))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 10) ACCEPT))
(assert (=> (matches-rule 0 16 10) (and (not (reaches 0 16 11))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 10) (and (not (reaches 1 16 11))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 11) ACCEPT))
(assert (=> (matches-rule 0 16 11) (and (not (reaches 0 16 12))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 11) (and (not (reaches 1 16 12))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 12) ACCEPT))
(assert (=> (matches-rule 0 16 12) (and (not (reaches 0 16 13))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 12) (and (not (reaches 1 16 13))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 13) ACCEPT))
(assert (=> (matches-rule 0 16 13) (and (not (reaches 0 16 14))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 13) (and (not (reaches 1 16 14))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 14) ACCEPT))
(assert (=> (matches-rule 0 16 14) (and (not (reaches 0 16 15))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 14) (and (not (reaches 1 16 15))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 15) ACCEPT))
(assert (=> (matches-rule 0 16 15) (and (not (reaches 0 16 16))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 15) (and (not (reaches 1 16 16))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 16) ACCEPT))
(assert (=> (matches-rule 0 16 16) (and (not (reaches 0 16 17))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 16) (and (not (reaches 1 16 17))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 17) ACCEPT))
(assert (=> (matches-rule 0 16 17) (and (not (reaches 0 16 18))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 17) (and (not (reaches 1 16 18))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 18) ACCEPT))
(assert (=> (matches-rule 0 16 18) (and (not (reaches 0 16 19))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 18) (and (not (reaches 1 16 19))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 19) ACCEPT))
(assert (=> (matches-rule 0 16 19) (and (not (reaches 0 16 20))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 19) (and (not (reaches 1 16 20))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 20) ACCEPT))
(assert (=> (matches-rule 0 16 20) (and (not (reaches 0 16 21))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 20) (and (not (reaches 1 16 21))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 21) ACCEPT))
(assert (=> (matches-rule 0 16 21) (and (not (reaches 0 16 22))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 21) (and (not (reaches 1 16 22))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 22) ACCEPT))
(assert (=> (matches-rule 0 16 22) (and (not (reaches 0 16 23))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 22) (and (not (reaches 1 16 23))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 23) ACCEPT))
(assert (=> (matches-rule 0 16 23) (and (not (reaches 0 16 24))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 23) (and (not (reaches 1 16 24))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 24) ACCEPT))
(assert (=> (matches-rule 0 16 24) (and (not (reaches 0 16 25))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 24) (and (not (reaches 1 16 25))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 25) ACCEPT))
(assert (=> (matches-rule 0 16 25) (and (not (reaches 0 16 26))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 25) (and (not (reaches 1 16 26))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 26) ACCEPT))
(assert (=> (matches-rule 0 16 26) (and (not (reaches 0 16 27))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 26) (and (not (reaches 1 16 27))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 27) ACCEPT))
(assert (=> (matches-rule 0 16 27) (and (not (reaches 0 16 28))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 27) (and (not (reaches 1 16 28))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 28) ACCEPT))
(assert (=> (matches-rule 0 16 28) (and (not (reaches 0 16 29))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 28) (and (not (reaches 1 16 29))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 29) ACCEPT))
(assert (=> (matches-rule 0 16 29) (and (not (reaches 0 16 30))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 29) (and (not (reaches 1 16 30))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 30) ACCEPT))
(assert (=> (matches-rule 0 16 30) (and (not (reaches 0 16 31))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 30) (and (not (reaches 1 16 31))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 31) ACCEPT))
(assert (=> (matches-rule 0 16 31) (and (not (reaches 0 16 32))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 31) (and (not (reaches 1 16 32))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 32) ACCEPT))
(assert (=> (matches-rule 0 16 32) (and (not (reaches 0 16 33))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 32) (and (not (reaches 1 16 33))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 33) ACCEPT))
(assert (=> (matches-rule 0 16 33) (and (not (reaches 0 16 34))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 33) (and (not (reaches 1 16 34))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 34) ACCEPT))
(assert (=> (matches-rule 0 16 34) (and (not (reaches 0 16 35))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 34) (and (not (reaches 1 16 35))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 35) ACCEPT))
(assert (=> (matches-rule 0 16 35) (and (not (reaches 0 16 36))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 35) (and (not (reaches 1 16 36))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 36) ACCEPT))
(assert (=> (matches-rule 0 16 36) (and (not (reaches 0 16 37))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 36) (and (not (reaches 1 16 37))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 37) ACCEPT))
(assert (=> (matches-rule 0 16 37) (and (not (reaches 0 16 38))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 37) (and (not (reaches 1 16 38))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 38) ACCEPT))
(assert (=> (matches-rule 0 16 38) (and (not (reaches 0 16 39))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 38) (and (not (reaches 1 16 39))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 39) ACCEPT))
(assert (=> (matches-rule 0 16 39) (and (not (reaches 0 16 40))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 39) (and (not (reaches 1 16 40))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 40) ACCEPT))
(assert (=> (matches-rule 0 16 40) (and (not (reaches 0 16 41))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 40) (and (not (reaches 1 16 41))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 41) ACCEPT))
(assert (=> (matches-rule 0 16 41) (and (not (reaches 0 16 42))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 41) (and (not (reaches 1 16 42))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 42) ACCEPT))
(assert (=> (matches-rule 0 16 42) (and (not (reaches 0 16 43))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 42) (and (not (reaches 1 16 43))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 43) ACCEPT))
(assert (=> (matches-rule 0 16 43) (and (not (reaches 0 16 44))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 43) (and (not (reaches 1 16 44))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 44) ACCEPT))
(assert (=> (matches-rule 0 16 44) (and (not (reaches 0 16 45))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 44) (and (not (reaches 1 16 45))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 45) ACCEPT))
(assert (=> (matches-rule 0 16 45) (and (not (reaches 0 16 46))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 45) (and (not (reaches 1 16 46))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 46) ACCEPT))
(assert (=> (matches-rule 0 16 46) (and (not (reaches 0 16 47))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 46) (and (not (reaches 1 16 47))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 47) ACCEPT))
(assert (=> (matches-rule 0 16 47) (and (not (reaches 0 16 48))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 47) (and (not (reaches 1 16 48))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 48) ACCEPT))
(assert (=> (matches-rule 0 16 48) (and (not (reaches 0 16 49))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 48) (and (not (reaches 1 16 49))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 49) ACCEPT))
(assert (=> (matches-rule 0 16 49) (and (not (reaches 0 16 50))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 49) (and (not (reaches 1 16 50))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 50) ACCEPT))
(assert (=> (matches-rule 0 16 50) (and (not (reaches 0 16 51))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 50) (and (not (reaches 1 16 51))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 51) ACCEPT))
(assert (=> (matches-rule 0 16 51) (and (not (reaches 0 16 52))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 51) (and (not (reaches 1 16 52))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 52) ACCEPT))
(assert (=> (matches-rule 0 16 52) (and (not (reaches 0 16 53))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 52) (and (not (reaches 1 16 53))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 53) ACCEPT))
(assert (=> (matches-rule 0 16 53) (and (not (reaches 0 16 54))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 53) (and (not (reaches 1 16 54))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 54) ACCEPT))
(assert (=> (matches-rule 0 16 54) (and (not (reaches 0 16 55))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 54) (and (not (reaches 1 16 55))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 55) DROP))
(assert (=> (matches-rule 0 16 55) (and (not (reaches 0 16 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 16 55) (and (not (reaches 1 16 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 16 56) ACCEPT))
(assert (=> (matches-rule 0 16 56) (and (not (reaches 0 16 57))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 56) (and (not (reaches 1 16 57))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 57) ACCEPT))
(assert (=> (matches-rule 0 16 57) (and (not (reaches 0 16 58))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 57) (and (not (reaches 1 16 58))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 58) ACCEPT))
(assert (=> (matches-rule 0 16 58) (and (not (reaches 0 16 59))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 58) (and (not (reaches 1 16 59))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 59) ACCEPT))
(assert (=> (matches-rule 0 16 59) (and (not (reaches 0 16 60))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 16 59) (and (not (reaches 1 16 60))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 16 60) DROP))
(assert (=> (matches-rule 0 16 60) (and (not (reaches 0 16 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 16 60) (and (not (reaches 1 16 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 16 61) (GO 19 0)))
(assert (=> (matches-rule 0 16 61) (and (reaches 0 19 0)(= (returns-from 0 19) (reaches 0 16 62)))))
(assert (=> (matches-rule 1 16 61) (and (reaches 1 19 0)(= (returns-from 1 19) (reaches 1 16 62)))))
(assert (=> (not (matches-rule 0 16 61)) (not (reaches 0 19 0))))
(assert (=> (not (matches-rule 1 16 61)) (not (reaches 1 19 0))))


(assert (= (rule-target 16 62) (GO 18 0)))
(assert (=> (matches-rule 0 16 62) (and (reaches 0 18 0)(= (returns-from 0 18) (reaches 0 16 63)))))
(assert (=> (matches-rule 1 16 62) (and (reaches 1 18 0)(= (returns-from 1 18) (reaches 1 16 63)))))
(assert (=> (not (matches-rule 0 16 62)) (not (reaches 0 18 0))))
(assert (=> (not (matches-rule 1 16 62)) (not (reaches 1 18 0))))


(assert (= (rule-target 16 63) (GO 17 0)))
(assert (=> (matches-rule 0 16 63) (and (reaches 0 17 0)(= (returns-from 0 17) (reaches 0 16 64)))))
(assert (=> (matches-rule 1 16 63) (and (reaches 1 17 0)(= (returns-from 1 17) (reaches 1 16 64)))))
(assert (=> (not (matches-rule 0 16 63)) (not (reaches 0 17 0))))
(assert (=> (not (matches-rule 1 16 63)) (not (reaches 1 17 0))))

(assert (= (rule-target 17 0) ACCEPT))
(assert (=> (matches-rule 0 17 0) (and (not (reaches 0 17 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 17 0) (and (not (reaches 1 17 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 17 1) ACCEPT))
(assert (=> (matches-rule 0 17 1) (and (not (reaches 0 17 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 17 1) (and (not (reaches 1 17 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 17 2) ACCEPT))
(assert (=> (matches-rule 0 17 2) (and (not (reaches 0 17 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 17 2) (and (not (reaches 1 17 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 17 3) ACCEPT))
(assert (=> (matches-rule 0 17 3) (and (not (reaches 0 17 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 17 3) (and (not (reaches 1 17 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 17 4) DROP))
(assert (=> (matches-rule 0 17 4) (and (not (reaches 0 17 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 4) (and (not (reaches 1 17 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 5) DROP))
(assert (=> (matches-rule 0 17 5) (and (not (reaches 0 17 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 5) (and (not (reaches 1 17 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 6) DROP))
(assert (=> (matches-rule 0 17 6) (and (not (reaches 0 17 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 6) (and (not (reaches 1 17 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 7) DROP))
(assert (=> (matches-rule 0 17 7) (and (not (reaches 0 17 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 7) (and (not (reaches 1 17 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 8) DROP))
(assert (=> (matches-rule 0 17 8) (and (not (reaches 0 17 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 8) (and (not (reaches 1 17 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 9) DROP))
(assert (=> (matches-rule 0 17 9) (and (not (reaches 0 17 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 9) (and (not (reaches 1 17 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 10) DROP))
(assert (=> (matches-rule 0 17 10) (and (not (reaches 0 17 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 10) (and (not (reaches 1 17 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 11) DROP))
(assert (=> (matches-rule 0 17 11) (and (not (reaches 0 17 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 11) (and (not (reaches 1 17 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 12) DROP))
(assert (=> (matches-rule 0 17 12) (and (not (reaches 0 17 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 12) (and (not (reaches 1 17 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 13) DROP))
(assert (=> (matches-rule 0 17 13) (and (not (reaches 0 17 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 13) (and (not (reaches 1 17 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 14) DROP))
(assert (=> (matches-rule 0 17 14) (and (not (reaches 0 17 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 14) (and (not (reaches 1 17 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 15) DROP))
(assert (=> (matches-rule 0 17 15) (and (not (reaches 0 17 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 15) (and (not (reaches 1 17 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 16) DROP))
(assert (=> (matches-rule 0 17 16) (and (not (reaches 0 17 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 16) (and (not (reaches 1 17 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 17) DROP))
(assert (=> (matches-rule 0 17 17) (and (not (reaches 0 17 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 17) (and (not (reaches 1 17 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 18) DROP))
(assert (=> (matches-rule 0 17 18) (and (not (reaches 0 17 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 18) (and (not (reaches 1 17 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 19) DROP))
(assert (=> (matches-rule 0 17 19) (and (not (reaches 0 17 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 19) (and (not (reaches 1 17 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 20) DROP))
(assert (=> (matches-rule 0 17 20) (and (not (reaches 0 17 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 20) (and (not (reaches 1 17 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 21) DROP))
(assert (=> (matches-rule 0 17 21) (and (not (reaches 0 17 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 21) (and (not (reaches 1 17 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 22) DROP))
(assert (=> (matches-rule 0 17 22) (and (not (reaches 0 17 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 22) (and (not (reaches 1 17 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 23) DROP))
(assert (=> (matches-rule 0 17 23) (and (not (reaches 0 17 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 23) (and (not (reaches 1 17 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 24) DROP))
(assert (=> (matches-rule 0 17 24) (and (not (reaches 0 17 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 24) (and (not (reaches 1 17 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 25) DROP))
(assert (=> (matches-rule 0 17 25) (and (not (reaches 0 17 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 25) (and (not (reaches 1 17 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 26) DROP))
(assert (=> (matches-rule 0 17 26) (and (not (reaches 0 17 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 26) (and (not (reaches 1 17 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 27) DROP))
(assert (=> (matches-rule 0 17 27) (and (not (reaches 0 17 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 27) (and (not (reaches 1 17 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 28) DROP))
(assert (=> (matches-rule 0 17 28) (and (not (reaches 0 17 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 28) (and (not (reaches 1 17 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 29) DROP))
(assert (=> (matches-rule 0 17 29) (and (not (reaches 0 17 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 29) (and (not (reaches 1 17 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 30) DROP))
(assert (=> (matches-rule 0 17 30) (and (not (reaches 0 17 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 30) (and (not (reaches 1 17 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 31) DROP))
(assert (=> (matches-rule 0 17 31) (and (not (reaches 0 17 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 31) (and (not (reaches 1 17 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 32) DROP))
(assert (=> (matches-rule 0 17 32) (and (not (reaches 0 17 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 32) (and (not (reaches 1 17 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 33) DROP))
(assert (=> (matches-rule 0 17 33) (and (not (reaches 0 17 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 33) (and (not (reaches 1 17 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 34) DROP))
(assert (=> (matches-rule 0 17 34) (and (not (reaches 0 17 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 34) (and (not (reaches 1 17 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 35) DROP))
(assert (=> (matches-rule 0 17 35) (and (not (reaches 0 17 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 35) (and (not (reaches 1 17 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 36) DROP))
(assert (=> (matches-rule 0 17 36) (and (not (reaches 0 17 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 36) (and (not (reaches 1 17 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 37) DROP))
(assert (=> (matches-rule 0 17 37) (and (not (reaches 0 17 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 37) (and (not (reaches 1 17 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 38) DROP))
(assert (=> (matches-rule 0 17 38) (and (not (reaches 0 17 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 38) (and (not (reaches 1 17 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 39) DROP))
(assert (=> (matches-rule 0 17 39) (and (not (reaches 0 17 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 39) (and (not (reaches 1 17 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 40) DROP))
(assert (=> (matches-rule 0 17 40) (and (not (reaches 0 17 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 40) (and (not (reaches 1 17 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 41) DROP))
(assert (=> (matches-rule 0 17 41) (and (not (reaches 0 17 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 41) (and (not (reaches 1 17 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 42) DROP))
(assert (=> (matches-rule 0 17 42) (and (not (reaches 0 17 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 42) (and (not (reaches 1 17 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 43) DROP))
(assert (=> (matches-rule 0 17 43) (and (not (reaches 0 17 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 43) (and (not (reaches 1 17 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 44) DROP))
(assert (=> (matches-rule 0 17 44) (and (not (reaches 0 17 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 44) (and (not (reaches 1 17 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 45) DROP))
(assert (=> (matches-rule 0 17 45) (and (not (reaches 0 17 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 45) (and (not (reaches 1 17 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 46) DROP))
(assert (=> (matches-rule 0 17 46) (and (not (reaches 0 17 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 46) (and (not (reaches 1 17 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 47) DROP))
(assert (=> (matches-rule 0 17 47) (and (not (reaches 0 17 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 47) (and (not (reaches 1 17 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 48) DROP))
(assert (=> (matches-rule 0 17 48) (and (not (reaches 0 17 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 48) (and (not (reaches 1 17 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 49) DROP))
(assert (=> (matches-rule 0 17 49) (and (not (reaches 0 17 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 49) (and (not (reaches 1 17 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 50) DROP))
(assert (=> (matches-rule 0 17 50) (and (not (reaches 0 17 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 50) (and (not (reaches 1 17 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 51) DROP))
(assert (=> (matches-rule 0 17 51) (and (not (reaches 0 17 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 51) (and (not (reaches 1 17 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 52) DROP))
(assert (=> (matches-rule 0 17 52) (and (not (reaches 0 17 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 52) (and (not (reaches 1 17 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 53) DROP))
(assert (=> (matches-rule 0 17 53) (and (not (reaches 0 17 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 53) (and (not (reaches 1 17 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 54) DROP))
(assert (=> (matches-rule 0 17 54) (and (not (reaches 0 17 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 54) (and (not (reaches 1 17 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 55) DROP))
(assert (=> (matches-rule 0 17 55) (and (not (reaches 0 17 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 55) (and (not (reaches 1 17 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 56) DROP))
(assert (=> (matches-rule 0 17 56) (and (not (reaches 0 17 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 56) (and (not (reaches 1 17 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 57) DROP))
(assert (=> (matches-rule 0 17 57) (and (not (reaches 0 17 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 57) (and (not (reaches 1 17 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 58) DROP))
(assert (=> (matches-rule 0 17 58) (and (not (reaches 0 17 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 58) (and (not (reaches 1 17 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 59) DROP))
(assert (=> (matches-rule 0 17 59) (and (not (reaches 0 17 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 59) (and (not (reaches 1 17 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 60) DROP))
(assert (=> (matches-rule 0 17 60) (and (not (reaches 0 17 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 60) (and (not (reaches 1 17 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 61) DROP))
(assert (=> (matches-rule 0 17 61) (and (not (reaches 0 17 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 61) (and (not (reaches 1 17 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 62) DROP))
(assert (=> (matches-rule 0 17 62) (and (not (reaches 0 17 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 62) (and (not (reaches 1 17 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 63) DROP))
(assert (=> (matches-rule 0 17 63) (and (not (reaches 0 17 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 63) (and (not (reaches 1 17 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 64) DROP))
(assert (=> (matches-rule 0 17 64) (and (not (reaches 0 17 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 64) (and (not (reaches 1 17 65))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 65) DROP))
(assert (=> (matches-rule 0 17 65) (and (not (reaches 0 17 66))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 65) (and (not (reaches 1 17 66))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 66) DROP))
(assert (=> (matches-rule 0 17 66) (and (not (reaches 0 17 67))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 66) (and (not (reaches 1 17 67))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 67) DROP))
(assert (=> (matches-rule 0 17 67) (and (not (reaches 0 17 68))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 67) (and (not (reaches 1 17 68))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 68) DROP))
(assert (=> (matches-rule 0 17 68) (and (not (reaches 0 17 69))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 68) (and (not (reaches 1 17 69))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 69) DROP))
(assert (=> (matches-rule 0 17 69) (and (not (reaches 0 17 70))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 69) (and (not (reaches 1 17 70))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 70) DROP))
(assert (=> (matches-rule 0 17 70) (and (not (reaches 0 17 71))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 70) (and (not (reaches 1 17 71))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 71) DROP))
(assert (=> (matches-rule 0 17 71) (and (not (reaches 0 17 72))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 71) (and (not (reaches 1 17 72))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 72) DROP))
(assert (=> (matches-rule 0 17 72) (and (not (reaches 0 17 73))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 72) (and (not (reaches 1 17 73))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 73) DROP))
(assert (=> (matches-rule 0 17 73) (and (not (reaches 0 17 74))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 73) (and (not (reaches 1 17 74))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 74) DROP))
(assert (=> (matches-rule 0 17 74) (and (not (reaches 0 17 75))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 74) (and (not (reaches 1 17 75))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 75) DROP))
(assert (=> (matches-rule 0 17 75) (and (not (reaches 0 17 76))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 75) (and (not (reaches 1 17 76))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 76) DROP))
(assert (=> (matches-rule 0 17 76) (and (not (reaches 0 17 77))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 76) (and (not (reaches 1 17 77))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 77) DROP))
(assert (=> (matches-rule 0 17 77) (and (not (reaches 0 17 78))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 77) (and (not (reaches 1 17 78))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 78) DROP))
(assert (=> (matches-rule 0 17 78) (and (not (reaches 0 17 79))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 78) (and (not (reaches 1 17 79))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 79) DROP))
(assert (=> (matches-rule 0 17 79) (and (not (reaches 0 17 80))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 79) (and (not (reaches 1 17 80))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 80) DROP))
(assert (=> (matches-rule 0 17 80) (and (not (reaches 0 17 81))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 80) (and (not (reaches 1 17 81))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 81) DROP))
(assert (=> (matches-rule 0 17 81) (and (not (reaches 0 17 82))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 81) (and (not (reaches 1 17 82))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 82) DROP))
(assert (=> (matches-rule 0 17 82) (and (not (reaches 0 17 83))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 82) (and (not (reaches 1 17 83))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 83) DROP))
(assert (=> (matches-rule 0 17 83) (and (not (reaches 0 17 84))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 83) (and (not (reaches 1 17 84))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 84) DROP))
(assert (=> (matches-rule 0 17 84) (and (not (reaches 0 17 85))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 84) (and (not (reaches 1 17 85))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 85) DROP))
(assert (=> (matches-rule 0 17 85) (and (not (reaches 0 17 86))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 85) (and (not (reaches 1 17 86))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 86) DROP))
(assert (=> (matches-rule 0 17 86) (and (not (reaches 0 17 87))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 86) (and (not (reaches 1 17 87))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 87) DROP))
(assert (=> (matches-rule 0 17 87) (and (not (reaches 0 17 88))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 87) (and (not (reaches 1 17 88))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 88) DROP))
(assert (=> (matches-rule 0 17 88) (and (not (reaches 0 17 89))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 88) (and (not (reaches 1 17 89))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 89) DROP))
(assert (=> (matches-rule 0 17 89) (and (not (reaches 0 17 90))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 89) (and (not (reaches 1 17 90))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 90) DROP))
(assert (=> (matches-rule 0 17 90) (and (not (reaches 0 17 91))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 90) (and (not (reaches 1 17 91))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 91) DROP))
(assert (=> (matches-rule 0 17 91) (and (not (reaches 0 17 92))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 91) (and (not (reaches 1 17 92))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 92) DROP))
(assert (=> (matches-rule 0 17 92) (and (not (reaches 0 17 93))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 92) (and (not (reaches 1 17 93))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 93) DROP))
(assert (=> (matches-rule 0 17 93) (and (not (reaches 0 17 94))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 93) (and (not (reaches 1 17 94))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 94) DROP))
(assert (=> (matches-rule 0 17 94) (and (not (reaches 0 17 95))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 94) (and (not (reaches 1 17 95))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 95) DROP))
(assert (=> (matches-rule 0 17 95) (and (not (reaches 0 17 96))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 95) (and (not (reaches 1 17 96))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 96) DROP))
(assert (=> (matches-rule 0 17 96) (and (not (reaches 0 17 97))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 96) (and (not (reaches 1 17 97))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 97) DROP))
(assert (=> (matches-rule 0 17 97) (and (not (reaches 0 17 98))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 97) (and (not (reaches 1 17 98))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 98) DROP))
(assert (=> (matches-rule 0 17 98) (and (not (reaches 0 17 99))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 98) (and (not (reaches 1 17 99))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 99) DROP))
(assert (=> (matches-rule 0 17 99) (and (not (reaches 0 17 100))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 99) (and (not (reaches 1 17 100))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 100) DROP))
(assert (=> (matches-rule 0 17 100) (and (not (reaches 0 17 101))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 100) (and (not (reaches 1 17 101))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 101) DROP))
(assert (=> (matches-rule 0 17 101) (and (not (reaches 0 17 102))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 101) (and (not (reaches 1 17 102))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 102) DROP))
(assert (=> (matches-rule 0 17 102) (and (not (reaches 0 17 103))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 102) (and (not (reaches 1 17 103))(= (terminates-with 1) DROP))))


(assert (= (rule-target 17 103) DROP))
(assert (=> (matches-rule 0 17 103) (and (not (reaches 0 17 104))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 17 103) (and (not (reaches 1 17 104))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 0) DROP))
(assert (=> (matches-rule 0 18 0) (and (not (reaches 0 18 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 0) (and (not (reaches 1 18 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 1) DROP))
(assert (=> (matches-rule 0 18 1) (and (not (reaches 0 18 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 1) (and (not (reaches 1 18 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 2) DROP))
(assert (=> (matches-rule 0 18 2) (and (not (reaches 0 18 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 2) (and (not (reaches 1 18 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 3) DROP))
(assert (=> (matches-rule 0 18 3) (and (not (reaches 0 18 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 3) (and (not (reaches 1 18 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 4) DROP))
(assert (=> (matches-rule 0 18 4) (and (not (reaches 0 18 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 4) (and (not (reaches 1 18 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 5) DROP))
(assert (=> (matches-rule 0 18 5) (and (not (reaches 0 18 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 5) (and (not (reaches 1 18 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 6) DROP))
(assert (=> (matches-rule 0 18 6) (and (not (reaches 0 18 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 6) (and (not (reaches 1 18 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 7) DROP))
(assert (=> (matches-rule 0 18 7) (and (not (reaches 0 18 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 7) (and (not (reaches 1 18 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 8) DROP))
(assert (=> (matches-rule 0 18 8) (and (not (reaches 0 18 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 8) (and (not (reaches 1 18 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 9) DROP))
(assert (=> (matches-rule 0 18 9) (and (not (reaches 0 18 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 9) (and (not (reaches 1 18 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 10) DROP))
(assert (=> (matches-rule 0 18 10) (and (not (reaches 0 18 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 10) (and (not (reaches 1 18 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 11) DROP))
(assert (=> (matches-rule 0 18 11) (and (not (reaches 0 18 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 11) (and (not (reaches 1 18 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 12) DROP))
(assert (=> (matches-rule 0 18 12) (and (not (reaches 0 18 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 12) (and (not (reaches 1 18 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 13) DROP))
(assert (=> (matches-rule 0 18 13) (and (not (reaches 0 18 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 13) (and (not (reaches 1 18 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 14) DROP))
(assert (=> (matches-rule 0 18 14) (and (not (reaches 0 18 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 14) (and (not (reaches 1 18 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 15) DROP))
(assert (=> (matches-rule 0 18 15) (and (not (reaches 0 18 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 15) (and (not (reaches 1 18 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 16) DROP))
(assert (=> (matches-rule 0 18 16) (and (not (reaches 0 18 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 16) (and (not (reaches 1 18 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 17) DROP))
(assert (=> (matches-rule 0 18 17) (and (not (reaches 0 18 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 17) (and (not (reaches 1 18 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 18) DROP))
(assert (=> (matches-rule 0 18 18) (and (not (reaches 0 18 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 18) (and (not (reaches 1 18 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 19) DROP))
(assert (=> (matches-rule 0 18 19) (and (not (reaches 0 18 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 19) (and (not (reaches 1 18 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 20) DROP))
(assert (=> (matches-rule 0 18 20) (and (not (reaches 0 18 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 20) (and (not (reaches 1 18 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 21) DROP))
(assert (=> (matches-rule 0 18 21) (and (not (reaches 0 18 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 21) (and (not (reaches 1 18 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 22) DROP))
(assert (=> (matches-rule 0 18 22) (and (not (reaches 0 18 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 22) (and (not (reaches 1 18 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 23) DROP))
(assert (=> (matches-rule 0 18 23) (and (not (reaches 0 18 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 23) (and (not (reaches 1 18 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 24) DROP))
(assert (=> (matches-rule 0 18 24) (and (not (reaches 0 18 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 24) (and (not (reaches 1 18 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 25) DROP))
(assert (=> (matches-rule 0 18 25) (and (not (reaches 0 18 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 25) (and (not (reaches 1 18 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 26) DROP))
(assert (=> (matches-rule 0 18 26) (and (not (reaches 0 18 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 26) (and (not (reaches 1 18 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 27) DROP))
(assert (=> (matches-rule 0 18 27) (and (not (reaches 0 18 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 27) (and (not (reaches 1 18 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 28) DROP))
(assert (=> (matches-rule 0 18 28) (and (not (reaches 0 18 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 28) (and (not (reaches 1 18 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 29) DROP))
(assert (=> (matches-rule 0 18 29) (and (not (reaches 0 18 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 29) (and (not (reaches 1 18 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 30) DROP))
(assert (=> (matches-rule 0 18 30) (and (not (reaches 0 18 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 30) (and (not (reaches 1 18 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 31) DROP))
(assert (=> (matches-rule 0 18 31) (and (not (reaches 0 18 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 31) (and (not (reaches 1 18 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 32) DROP))
(assert (=> (matches-rule 0 18 32) (and (not (reaches 0 18 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 32) (and (not (reaches 1 18 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 33) DROP))
(assert (=> (matches-rule 0 18 33) (and (not (reaches 0 18 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 33) (and (not (reaches 1 18 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 34) DROP))
(assert (=> (matches-rule 0 18 34) (and (not (reaches 0 18 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 34) (and (not (reaches 1 18 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 35) DROP))
(assert (=> (matches-rule 0 18 35) (and (not (reaches 0 18 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 35) (and (not (reaches 1 18 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 36) DROP))
(assert (=> (matches-rule 0 18 36) (and (not (reaches 0 18 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 36) (and (not (reaches 1 18 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 37) DROP))
(assert (=> (matches-rule 0 18 37) (and (not (reaches 0 18 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 37) (and (not (reaches 1 18 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 38) DROP))
(assert (=> (matches-rule 0 18 38) (and (not (reaches 0 18 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 38) (and (not (reaches 1 18 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 39) DROP))
(assert (=> (matches-rule 0 18 39) (and (not (reaches 0 18 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 39) (and (not (reaches 1 18 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 40) DROP))
(assert (=> (matches-rule 0 18 40) (and (not (reaches 0 18 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 40) (and (not (reaches 1 18 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 41) DROP))
(assert (=> (matches-rule 0 18 41) (and (not (reaches 0 18 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 41) (and (not (reaches 1 18 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 42) DROP))
(assert (=> (matches-rule 0 18 42) (and (not (reaches 0 18 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 42) (and (not (reaches 1 18 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 43) DROP))
(assert (=> (matches-rule 0 18 43) (and (not (reaches 0 18 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 43) (and (not (reaches 1 18 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 44) DROP))
(assert (=> (matches-rule 0 18 44) (and (not (reaches 0 18 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 44) (and (not (reaches 1 18 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 45) DROP))
(assert (=> (matches-rule 0 18 45) (and (not (reaches 0 18 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 45) (and (not (reaches 1 18 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 46) DROP))
(assert (=> (matches-rule 0 18 46) (and (not (reaches 0 18 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 46) (and (not (reaches 1 18 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 47) DROP))
(assert (=> (matches-rule 0 18 47) (and (not (reaches 0 18 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 47) (and (not (reaches 1 18 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 48) DROP))
(assert (=> (matches-rule 0 18 48) (and (not (reaches 0 18 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 48) (and (not (reaches 1 18 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 49) DROP))
(assert (=> (matches-rule 0 18 49) (and (not (reaches 0 18 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 49) (and (not (reaches 1 18 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 50) DROP))
(assert (=> (matches-rule 0 18 50) (and (not (reaches 0 18 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 50) (and (not (reaches 1 18 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 51) DROP))
(assert (=> (matches-rule 0 18 51) (and (not (reaches 0 18 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 51) (and (not (reaches 1 18 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 52) DROP))
(assert (=> (matches-rule 0 18 52) (and (not (reaches 0 18 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 52) (and (not (reaches 1 18 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 53) DROP))
(assert (=> (matches-rule 0 18 53) (and (not (reaches 0 18 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 53) (and (not (reaches 1 18 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 54) DROP))
(assert (=> (matches-rule 0 18 54) (and (not (reaches 0 18 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 54) (and (not (reaches 1 18 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 55) DROP))
(assert (=> (matches-rule 0 18 55) (and (not (reaches 0 18 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 55) (and (not (reaches 1 18 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 56) DROP))
(assert (=> (matches-rule 0 18 56) (and (not (reaches 0 18 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 56) (and (not (reaches 1 18 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 57) DROP))
(assert (=> (matches-rule 0 18 57) (and (not (reaches 0 18 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 57) (and (not (reaches 1 18 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 58) DROP))
(assert (=> (matches-rule 0 18 58) (and (not (reaches 0 18 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 58) (and (not (reaches 1 18 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 59) DROP))
(assert (=> (matches-rule 0 18 59) (and (not (reaches 0 18 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 59) (and (not (reaches 1 18 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 60) DROP))
(assert (=> (matches-rule 0 18 60) (and (not (reaches 0 18 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 60) (and (not (reaches 1 18 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 61) DROP))
(assert (=> (matches-rule 0 18 61) (and (not (reaches 0 18 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 61) (and (not (reaches 1 18 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 62) DROP))
(assert (=> (matches-rule 0 18 62) (and (not (reaches 0 18 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 62) (and (not (reaches 1 18 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 63) DROP))
(assert (=> (matches-rule 0 18 63) (and (not (reaches 0 18 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 63) (and (not (reaches 1 18 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 18 64) DROP))
(assert (=> (matches-rule 0 18 64) (and (not (reaches 0 18 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 18 64) (and (not (reaches 1 18 65))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 0) DROP))
(assert (=> (matches-rule 0 19 0) (and (not (reaches 0 19 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 0) (and (not (reaches 1 19 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 1) DROP))
(assert (=> (matches-rule 0 19 1) (and (not (reaches 0 19 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 1) (and (not (reaches 1 19 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 2) DROP))
(assert (=> (matches-rule 0 19 2) (and (not (reaches 0 19 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 2) (and (not (reaches 1 19 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 3) DROP))
(assert (=> (matches-rule 0 19 3) (and (not (reaches 0 19 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 3) (and (not (reaches 1 19 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 4) DROP))
(assert (=> (matches-rule 0 19 4) (and (not (reaches 0 19 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 4) (and (not (reaches 1 19 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 5) DROP))
(assert (=> (matches-rule 0 19 5) (and (not (reaches 0 19 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 5) (and (not (reaches 1 19 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 6) DROP))
(assert (=> (matches-rule 0 19 6) (and (not (reaches 0 19 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 6) (and (not (reaches 1 19 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 7) DROP))
(assert (=> (matches-rule 0 19 7) (and (not (reaches 0 19 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 7) (and (not (reaches 1 19 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 8) DROP))
(assert (=> (matches-rule 0 19 8) (and (not (reaches 0 19 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 8) (and (not (reaches 1 19 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 9) DROP))
(assert (=> (matches-rule 0 19 9) (and (not (reaches 0 19 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 9) (and (not (reaches 1 19 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 10) DROP))
(assert (=> (matches-rule 0 19 10) (and (not (reaches 0 19 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 10) (and (not (reaches 1 19 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 11) DROP))
(assert (=> (matches-rule 0 19 11) (and (not (reaches 0 19 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 11) (and (not (reaches 1 19 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 12) DROP))
(assert (=> (matches-rule 0 19 12) (and (not (reaches 0 19 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 12) (and (not (reaches 1 19 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 13) DROP))
(assert (=> (matches-rule 0 19 13) (and (not (reaches 0 19 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 13) (and (not (reaches 1 19 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 14) DROP))
(assert (=> (matches-rule 0 19 14) (and (not (reaches 0 19 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 14) (and (not (reaches 1 19 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 15) DROP))
(assert (=> (matches-rule 0 19 15) (and (not (reaches 0 19 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 15) (and (not (reaches 1 19 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 16) DROP))
(assert (=> (matches-rule 0 19 16) (and (not (reaches 0 19 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 16) (and (not (reaches 1 19 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 17) DROP))
(assert (=> (matches-rule 0 19 17) (and (not (reaches 0 19 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 17) (and (not (reaches 1 19 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 18) DROP))
(assert (=> (matches-rule 0 19 18) (and (not (reaches 0 19 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 18) (and (not (reaches 1 19 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 19) DROP))
(assert (=> (matches-rule 0 19 19) (and (not (reaches 0 19 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 19) (and (not (reaches 1 19 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 20) DROP))
(assert (=> (matches-rule 0 19 20) (and (not (reaches 0 19 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 20) (and (not (reaches 1 19 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 21) DROP))
(assert (=> (matches-rule 0 19 21) (and (not (reaches 0 19 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 21) (and (not (reaches 1 19 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 22) DROP))
(assert (=> (matches-rule 0 19 22) (and (not (reaches 0 19 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 22) (and (not (reaches 1 19 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 23) DROP))
(assert (=> (matches-rule 0 19 23) (and (not (reaches 0 19 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 23) (and (not (reaches 1 19 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 24) DROP))
(assert (=> (matches-rule 0 19 24) (and (not (reaches 0 19 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 24) (and (not (reaches 1 19 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 25) DROP))
(assert (=> (matches-rule 0 19 25) (and (not (reaches 0 19 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 25) (and (not (reaches 1 19 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 26) DROP))
(assert (=> (matches-rule 0 19 26) (and (not (reaches 0 19 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 26) (and (not (reaches 1 19 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 27) DROP))
(assert (=> (matches-rule 0 19 27) (and (not (reaches 0 19 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 27) (and (not (reaches 1 19 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 28) DROP))
(assert (=> (matches-rule 0 19 28) (and (not (reaches 0 19 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 28) (and (not (reaches 1 19 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 29) DROP))
(assert (=> (matches-rule 0 19 29) (and (not (reaches 0 19 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 29) (and (not (reaches 1 19 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 30) DROP))
(assert (=> (matches-rule 0 19 30) (and (not (reaches 0 19 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 30) (and (not (reaches 1 19 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 31) DROP))
(assert (=> (matches-rule 0 19 31) (and (not (reaches 0 19 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 31) (and (not (reaches 1 19 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 32) DROP))
(assert (=> (matches-rule 0 19 32) (and (not (reaches 0 19 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 32) (and (not (reaches 1 19 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 33) DROP))
(assert (=> (matches-rule 0 19 33) (and (not (reaches 0 19 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 33) (and (not (reaches 1 19 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 34) DROP))
(assert (=> (matches-rule 0 19 34) (and (not (reaches 0 19 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 34) (and (not (reaches 1 19 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 35) DROP))
(assert (=> (matches-rule 0 19 35) (and (not (reaches 0 19 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 35) (and (not (reaches 1 19 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 36) DROP))
(assert (=> (matches-rule 0 19 36) (and (not (reaches 0 19 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 36) (and (not (reaches 1 19 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 37) DROP))
(assert (=> (matches-rule 0 19 37) (and (not (reaches 0 19 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 37) (and (not (reaches 1 19 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 38) DROP))
(assert (=> (matches-rule 0 19 38) (and (not (reaches 0 19 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 38) (and (not (reaches 1 19 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 39) DROP))
(assert (=> (matches-rule 0 19 39) (and (not (reaches 0 19 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 39) (and (not (reaches 1 19 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 40) DROP))
(assert (=> (matches-rule 0 19 40) (and (not (reaches 0 19 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 40) (and (not (reaches 1 19 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 41) DROP))
(assert (=> (matches-rule 0 19 41) (and (not (reaches 0 19 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 41) (and (not (reaches 1 19 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 42) DROP))
(assert (=> (matches-rule 0 19 42) (and (not (reaches 0 19 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 42) (and (not (reaches 1 19 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 43) DROP))
(assert (=> (matches-rule 0 19 43) (and (not (reaches 0 19 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 43) (and (not (reaches 1 19 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 44) DROP))
(assert (=> (matches-rule 0 19 44) (and (not (reaches 0 19 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 44) (and (not (reaches 1 19 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 45) DROP))
(assert (=> (matches-rule 0 19 45) (and (not (reaches 0 19 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 45) (and (not (reaches 1 19 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 46) DROP))
(assert (=> (matches-rule 0 19 46) (and (not (reaches 0 19 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 46) (and (not (reaches 1 19 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 47) DROP))
(assert (=> (matches-rule 0 19 47) (and (not (reaches 0 19 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 47) (and (not (reaches 1 19 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 48) DROP))
(assert (=> (matches-rule 0 19 48) (and (not (reaches 0 19 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 48) (and (not (reaches 1 19 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 49) DROP))
(assert (=> (matches-rule 0 19 49) (and (not (reaches 0 19 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 49) (and (not (reaches 1 19 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 50) DROP))
(assert (=> (matches-rule 0 19 50) (and (not (reaches 0 19 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 50) (and (not (reaches 1 19 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 51) DROP))
(assert (=> (matches-rule 0 19 51) (and (not (reaches 0 19 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 51) (and (not (reaches 1 19 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 52) DROP))
(assert (=> (matches-rule 0 19 52) (and (not (reaches 0 19 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 52) (and (not (reaches 1 19 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 53) DROP))
(assert (=> (matches-rule 0 19 53) (and (not (reaches 0 19 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 53) (and (not (reaches 1 19 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 54) DROP))
(assert (=> (matches-rule 0 19 54) (and (not (reaches 0 19 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 54) (and (not (reaches 1 19 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 55) DROP))
(assert (=> (matches-rule 0 19 55) (and (not (reaches 0 19 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 55) (and (not (reaches 1 19 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 56) DROP))
(assert (=> (matches-rule 0 19 56) (and (not (reaches 0 19 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 56) (and (not (reaches 1 19 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 57) DROP))
(assert (=> (matches-rule 0 19 57) (and (not (reaches 0 19 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 57) (and (not (reaches 1 19 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 58) DROP))
(assert (=> (matches-rule 0 19 58) (and (not (reaches 0 19 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 58) (and (not (reaches 1 19 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 59) DROP))
(assert (=> (matches-rule 0 19 59) (and (not (reaches 0 19 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 59) (and (not (reaches 1 19 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 60) DROP))
(assert (=> (matches-rule 0 19 60) (and (not (reaches 0 19 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 60) (and (not (reaches 1 19 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 61) DROP))
(assert (=> (matches-rule 0 19 61) (and (not (reaches 0 19 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 61) (and (not (reaches 1 19 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 62) DROP))
(assert (=> (matches-rule 0 19 62) (and (not (reaches 0 19 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 62) (and (not (reaches 1 19 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 63) DROP))
(assert (=> (matches-rule 0 19 63) (and (not (reaches 0 19 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 63) (and (not (reaches 1 19 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 19 64) DROP))
(assert (=> (matches-rule 0 19 64) (and (not (reaches 0 19 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 19 64) (and (not (reaches 1 19 65))(= (terminates-with 1) DROP))))


(assert (= (rule-target 36 0) ACCEPT))
(assert (=> (matches-rule 0 36 0) (and (not (reaches 0 36 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 0) (and (not (reaches 1 36 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 1) ACCEPT))
(assert (=> (matches-rule 0 36 1) (and (not (reaches 0 36 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 1) (and (not (reaches 1 36 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 2) ACCEPT))
(assert (=> (matches-rule 0 36 2) (and (not (reaches 0 36 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 2) (and (not (reaches 1 36 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 3) ACCEPT))
(assert (=> (matches-rule 0 36 3) (and (not (reaches 0 36 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 3) (and (not (reaches 1 36 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 4) ACCEPT))
(assert (=> (matches-rule 0 36 4) (and (not (reaches 0 36 5))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 4) (and (not (reaches 1 36 5))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 5) ACCEPT))
(assert (=> (matches-rule 0 36 5) (and (not (reaches 0 36 6))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 5) (and (not (reaches 1 36 6))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 6) ACCEPT))
(assert (=> (matches-rule 0 36 6) (and (not (reaches 0 36 7))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 6) (and (not (reaches 1 36 7))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 7) ACCEPT))
(assert (=> (matches-rule 0 36 7) (and (not (reaches 0 36 8))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 7) (and (not (reaches 1 36 8))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 8) ACCEPT))
(assert (=> (matches-rule 0 36 8) (and (not (reaches 0 36 9))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 8) (and (not (reaches 1 36 9))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 9) ACCEPT))
(assert (=> (matches-rule 0 36 9) (and (not (reaches 0 36 10))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 9) (and (not (reaches 1 36 10))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 10) ACCEPT))
(assert (=> (matches-rule 0 36 10) (and (not (reaches 0 36 11))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 10) (and (not (reaches 1 36 11))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 11) ACCEPT))
(assert (=> (matches-rule 0 36 11) (and (not (reaches 0 36 12))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 11) (and (not (reaches 1 36 12))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 12) ACCEPT))
(assert (=> (matches-rule 0 36 12) (and (not (reaches 0 36 13))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 12) (and (not (reaches 1 36 13))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 13) ACCEPT))
(assert (=> (matches-rule 0 36 13) (and (not (reaches 0 36 14))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 13) (and (not (reaches 1 36 14))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 14) ACCEPT))
(assert (=> (matches-rule 0 36 14) (and (not (reaches 0 36 15))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 14) (and (not (reaches 1 36 15))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 15) ACCEPT))
(assert (=> (matches-rule 0 36 15) (and (not (reaches 0 36 16))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 15) (and (not (reaches 1 36 16))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 16) ACCEPT))
(assert (=> (matches-rule 0 36 16) (and (not (reaches 0 36 17))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 16) (and (not (reaches 1 36 17))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 17) ACCEPT))
(assert (=> (matches-rule 0 36 17) (and (not (reaches 0 36 18))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 17) (and (not (reaches 1 36 18))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 18) ACCEPT))
(assert (=> (matches-rule 0 36 18) (and (not (reaches 0 36 19))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 18) (and (not (reaches 1 36 19))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 19) ACCEPT))
(assert (=> (matches-rule 0 36 19) (and (not (reaches 0 36 20))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 19) (and (not (reaches 1 36 20))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 20) ACCEPT))
(assert (=> (matches-rule 0 36 20) (and (not (reaches 0 36 21))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 20) (and (not (reaches 1 36 21))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 21) ACCEPT))
(assert (=> (matches-rule 0 36 21) (and (not (reaches 0 36 22))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 21) (and (not (reaches 1 36 22))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 22) ACCEPT))
(assert (=> (matches-rule 0 36 22) (and (not (reaches 0 36 23))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 22) (and (not (reaches 1 36 23))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 23) ACCEPT))
(assert (=> (matches-rule 0 36 23) (and (not (reaches 0 36 24))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 23) (and (not (reaches 1 36 24))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 24) ACCEPT))
(assert (=> (matches-rule 0 36 24) (and (not (reaches 0 36 25))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 24) (and (not (reaches 1 36 25))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 25) ACCEPT))
(assert (=> (matches-rule 0 36 25) (and (not (reaches 0 36 26))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 25) (and (not (reaches 1 36 26))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 26) ACCEPT))
(assert (=> (matches-rule 0 36 26) (and (not (reaches 0 36 27))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 26) (and (not (reaches 1 36 27))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 27) ACCEPT))
(assert (=> (matches-rule 0 36 27) (and (not (reaches 0 36 28))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 27) (and (not (reaches 1 36 28))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 28) ACCEPT))
(assert (=> (matches-rule 0 36 28) (and (not (reaches 0 36 29))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 28) (and (not (reaches 1 36 29))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 29) ACCEPT))
(assert (=> (matches-rule 0 36 29) (and (not (reaches 0 36 30))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 29) (and (not (reaches 1 36 30))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 30) ACCEPT))
(assert (=> (matches-rule 0 36 30) (and (not (reaches 0 36 31))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 30) (and (not (reaches 1 36 31))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 31) ACCEPT))
(assert (=> (matches-rule 0 36 31) (and (not (reaches 0 36 32))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 31) (and (not (reaches 1 36 32))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 32) ACCEPT))
(assert (=> (matches-rule 0 36 32) (and (not (reaches 0 36 33))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 32) (and (not (reaches 1 36 33))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 33) ACCEPT))
(assert (=> (matches-rule 0 36 33) (and (not (reaches 0 36 34))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 33) (and (not (reaches 1 36 34))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 34) ACCEPT))
(assert (=> (matches-rule 0 36 34) (and (not (reaches 0 36 35))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 34) (and (not (reaches 1 36 35))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 35) ACCEPT))
(assert (=> (matches-rule 0 36 35) (and (not (reaches 0 36 36))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 35) (and (not (reaches 1 36 36))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 36) ACCEPT))
(assert (=> (matches-rule 0 36 36) (and (not (reaches 0 36 37))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 36) (and (not (reaches 1 36 37))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 37) ACCEPT))
(assert (=> (matches-rule 0 36 37) (and (not (reaches 0 36 38))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 37) (and (not (reaches 1 36 38))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 38) ACCEPT))
(assert (=> (matches-rule 0 36 38) (and (not (reaches 0 36 39))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 38) (and (not (reaches 1 36 39))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 39) ACCEPT))
(assert (=> (matches-rule 0 36 39) (and (not (reaches 0 36 40))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 39) (and (not (reaches 1 36 40))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 40) ACCEPT))
(assert (=> (matches-rule 0 36 40) (and (not (reaches 0 36 41))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 40) (and (not (reaches 1 36 41))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 41) ACCEPT))
(assert (=> (matches-rule 0 36 41) (and (not (reaches 0 36 42))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 41) (and (not (reaches 1 36 42))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 42) ACCEPT))
(assert (=> (matches-rule 0 36 42) (and (not (reaches 0 36 43))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 42) (and (not (reaches 1 36 43))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 43) ACCEPT))
(assert (=> (matches-rule 0 36 43) (and (not (reaches 0 36 44))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 43) (and (not (reaches 1 36 44))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 44) ACCEPT))
(assert (=> (matches-rule 0 36 44) (and (not (reaches 0 36 45))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 44) (and (not (reaches 1 36 45))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 45) ACCEPT))
(assert (=> (matches-rule 0 36 45) (and (not (reaches 0 36 46))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 45) (and (not (reaches 1 36 46))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 46) ACCEPT))
(assert (=> (matches-rule 0 36 46) (and (not (reaches 0 36 47))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 46) (and (not (reaches 1 36 47))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 47) ACCEPT))
(assert (=> (matches-rule 0 36 47) (and (not (reaches 0 36 48))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 47) (and (not (reaches 1 36 48))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 48) ACCEPT))
(assert (=> (matches-rule 0 36 48) (and (not (reaches 0 36 49))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 48) (and (not (reaches 1 36 49))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 49) ACCEPT))
(assert (=> (matches-rule 0 36 49) (and (not (reaches 0 36 50))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 49) (and (not (reaches 1 36 50))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 50) ACCEPT))
(assert (=> (matches-rule 0 36 50) (and (not (reaches 0 36 51))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 50) (and (not (reaches 1 36 51))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 51) ACCEPT))
(assert (=> (matches-rule 0 36 51) (and (not (reaches 0 36 52))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 51) (and (not (reaches 1 36 52))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 52) ACCEPT))
(assert (=> (matches-rule 0 36 52) (and (not (reaches 0 36 53))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 52) (and (not (reaches 1 36 53))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 53) ACCEPT))
(assert (=> (matches-rule 0 36 53) (and (not (reaches 0 36 54))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 53) (and (not (reaches 1 36 54))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 54) ACCEPT))
(assert (=> (matches-rule 0 36 54) (and (not (reaches 0 36 55))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 54) (and (not (reaches 1 36 55))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 55) DROP))
(assert (=> (matches-rule 0 36 55) (and (not (reaches 0 36 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 36 55) (and (not (reaches 1 36 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 36 56) ACCEPT))
(assert (=> (matches-rule 0 36 56) (and (not (reaches 0 36 57))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 56) (and (not (reaches 1 36 57))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 57) ACCEPT))
(assert (=> (matches-rule 0 36 57) (and (not (reaches 0 36 58))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 57) (and (not (reaches 1 36 58))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 58) ACCEPT))
(assert (=> (matches-rule 0 36 58) (and (not (reaches 0 36 59))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 58) (and (not (reaches 1 36 59))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 59) ACCEPT))
(assert (=> (matches-rule 0 36 59) (and (not (reaches 0 36 60))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 59) (and (not (reaches 1 36 60))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 60) ACCEPT))
(assert (=> (matches-rule 0 36 60) (and (not (reaches 0 36 61))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 36 60) (and (not (reaches 1 36 61))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 36 61) DROP))
(assert (=> (matches-rule 0 36 61) (and (not (reaches 0 36 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 36 61) (and (not (reaches 1 36 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 36 62) (GO 39 0)))
(assert (=> (matches-rule 0 36 62) (and (reaches 0 39 0)(= (returns-from 0 39) (reaches 0 36 63)))))
(assert (=> (matches-rule 1 36 62) (and (reaches 1 39 0)(= (returns-from 1 39) (reaches 1 36 63)))))
(assert (=> (not (matches-rule 0 36 62)) (not (reaches 0 39 0))))
(assert (=> (not (matches-rule 1 36 62)) (not (reaches 1 39 0))))


(assert (= (rule-target 36 63) (GO 38 0)))
(assert (=> (matches-rule 0 36 63) (and (reaches 0 38 0)(= (returns-from 0 38) (reaches 0 36 64)))))
(assert (=> (matches-rule 1 36 63) (and (reaches 1 38 0)(= (returns-from 1 38) (reaches 1 36 64)))))
(assert (=> (not (matches-rule 0 36 63)) (not (reaches 0 38 0))))
(assert (=> (not (matches-rule 1 36 63)) (not (reaches 1 38 0))))


(assert (= (rule-target 36 64) (GO 37 0)))
(assert (=> (matches-rule 0 36 64) (and (reaches 0 37 0)(= (returns-from 0 37) (reaches 0 36 65)))))
(assert (=> (matches-rule 1 36 64) (and (reaches 1 37 0)(= (returns-from 1 37) (reaches 1 36 65)))))
(assert (=> (not (matches-rule 0 36 64)) (not (reaches 0 37 0))))
(assert (=> (not (matches-rule 1 36 64)) (not (reaches 1 37 0))))

(assert (= (rule-target 37 0) ACCEPT))
(assert (=> (matches-rule 0 37 0) (and (not (reaches 0 37 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 37 0) (and (not (reaches 1 37 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 37 1) ACCEPT))
(assert (=> (matches-rule 0 37 1) (and (not (reaches 0 37 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 37 1) (and (not (reaches 1 37 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 37 2) ACCEPT))
(assert (=> (matches-rule 0 37 2) (and (not (reaches 0 37 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 37 2) (and (not (reaches 1 37 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 37 3) ACCEPT))
(assert (=> (matches-rule 0 37 3) (and (not (reaches 0 37 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 37 3) (and (not (reaches 1 37 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 37 4) DROP))
(assert (=> (matches-rule 0 37 4) (and (not (reaches 0 37 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 4) (and (not (reaches 1 37 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 5) DROP))
(assert (=> (matches-rule 0 37 5) (and (not (reaches 0 37 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 5) (and (not (reaches 1 37 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 6) DROP))
(assert (=> (matches-rule 0 37 6) (and (not (reaches 0 37 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 6) (and (not (reaches 1 37 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 7) DROP))
(assert (=> (matches-rule 0 37 7) (and (not (reaches 0 37 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 7) (and (not (reaches 1 37 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 8) DROP))
(assert (=> (matches-rule 0 37 8) (and (not (reaches 0 37 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 8) (and (not (reaches 1 37 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 9) DROP))
(assert (=> (matches-rule 0 37 9) (and (not (reaches 0 37 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 9) (and (not (reaches 1 37 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 10) DROP))
(assert (=> (matches-rule 0 37 10) (and (not (reaches 0 37 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 10) (and (not (reaches 1 37 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 11) DROP))
(assert (=> (matches-rule 0 37 11) (and (not (reaches 0 37 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 11) (and (not (reaches 1 37 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 12) DROP))
(assert (=> (matches-rule 0 37 12) (and (not (reaches 0 37 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 12) (and (not (reaches 1 37 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 13) DROP))
(assert (=> (matches-rule 0 37 13) (and (not (reaches 0 37 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 13) (and (not (reaches 1 37 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 14) DROP))
(assert (=> (matches-rule 0 37 14) (and (not (reaches 0 37 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 14) (and (not (reaches 1 37 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 15) DROP))
(assert (=> (matches-rule 0 37 15) (and (not (reaches 0 37 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 15) (and (not (reaches 1 37 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 16) DROP))
(assert (=> (matches-rule 0 37 16) (and (not (reaches 0 37 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 16) (and (not (reaches 1 37 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 17) DROP))
(assert (=> (matches-rule 0 37 17) (and (not (reaches 0 37 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 17) (and (not (reaches 1 37 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 18) DROP))
(assert (=> (matches-rule 0 37 18) (and (not (reaches 0 37 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 18) (and (not (reaches 1 37 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 19) DROP))
(assert (=> (matches-rule 0 37 19) (and (not (reaches 0 37 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 19) (and (not (reaches 1 37 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 20) DROP))
(assert (=> (matches-rule 0 37 20) (and (not (reaches 0 37 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 20) (and (not (reaches 1 37 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 21) DROP))
(assert (=> (matches-rule 0 37 21) (and (not (reaches 0 37 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 21) (and (not (reaches 1 37 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 22) DROP))
(assert (=> (matches-rule 0 37 22) (and (not (reaches 0 37 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 22) (and (not (reaches 1 37 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 23) DROP))
(assert (=> (matches-rule 0 37 23) (and (not (reaches 0 37 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 23) (and (not (reaches 1 37 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 24) DROP))
(assert (=> (matches-rule 0 37 24) (and (not (reaches 0 37 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 24) (and (not (reaches 1 37 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 25) DROP))
(assert (=> (matches-rule 0 37 25) (and (not (reaches 0 37 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 25) (and (not (reaches 1 37 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 26) DROP))
(assert (=> (matches-rule 0 37 26) (and (not (reaches 0 37 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 26) (and (not (reaches 1 37 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 27) DROP))
(assert (=> (matches-rule 0 37 27) (and (not (reaches 0 37 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 27) (and (not (reaches 1 37 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 28) DROP))
(assert (=> (matches-rule 0 37 28) (and (not (reaches 0 37 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 28) (and (not (reaches 1 37 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 29) DROP))
(assert (=> (matches-rule 0 37 29) (and (not (reaches 0 37 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 29) (and (not (reaches 1 37 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 30) DROP))
(assert (=> (matches-rule 0 37 30) (and (not (reaches 0 37 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 30) (and (not (reaches 1 37 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 31) DROP))
(assert (=> (matches-rule 0 37 31) (and (not (reaches 0 37 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 31) (and (not (reaches 1 37 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 32) DROP))
(assert (=> (matches-rule 0 37 32) (and (not (reaches 0 37 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 32) (and (not (reaches 1 37 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 33) DROP))
(assert (=> (matches-rule 0 37 33) (and (not (reaches 0 37 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 33) (and (not (reaches 1 37 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 34) DROP))
(assert (=> (matches-rule 0 37 34) (and (not (reaches 0 37 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 34) (and (not (reaches 1 37 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 35) DROP))
(assert (=> (matches-rule 0 37 35) (and (not (reaches 0 37 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 35) (and (not (reaches 1 37 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 36) DROP))
(assert (=> (matches-rule 0 37 36) (and (not (reaches 0 37 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 36) (and (not (reaches 1 37 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 37) DROP))
(assert (=> (matches-rule 0 37 37) (and (not (reaches 0 37 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 37) (and (not (reaches 1 37 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 38) DROP))
(assert (=> (matches-rule 0 37 38) (and (not (reaches 0 37 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 38) (and (not (reaches 1 37 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 39) DROP))
(assert (=> (matches-rule 0 37 39) (and (not (reaches 0 37 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 39) (and (not (reaches 1 37 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 40) DROP))
(assert (=> (matches-rule 0 37 40) (and (not (reaches 0 37 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 40) (and (not (reaches 1 37 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 41) DROP))
(assert (=> (matches-rule 0 37 41) (and (not (reaches 0 37 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 41) (and (not (reaches 1 37 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 42) DROP))
(assert (=> (matches-rule 0 37 42) (and (not (reaches 0 37 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 42) (and (not (reaches 1 37 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 43) DROP))
(assert (=> (matches-rule 0 37 43) (and (not (reaches 0 37 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 43) (and (not (reaches 1 37 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 44) DROP))
(assert (=> (matches-rule 0 37 44) (and (not (reaches 0 37 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 44) (and (not (reaches 1 37 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 45) DROP))
(assert (=> (matches-rule 0 37 45) (and (not (reaches 0 37 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 45) (and (not (reaches 1 37 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 46) DROP))
(assert (=> (matches-rule 0 37 46) (and (not (reaches 0 37 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 46) (and (not (reaches 1 37 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 47) DROP))
(assert (=> (matches-rule 0 37 47) (and (not (reaches 0 37 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 47) (and (not (reaches 1 37 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 48) DROP))
(assert (=> (matches-rule 0 37 48) (and (not (reaches 0 37 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 48) (and (not (reaches 1 37 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 49) DROP))
(assert (=> (matches-rule 0 37 49) (and (not (reaches 0 37 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 49) (and (not (reaches 1 37 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 50) DROP))
(assert (=> (matches-rule 0 37 50) (and (not (reaches 0 37 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 50) (and (not (reaches 1 37 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 51) DROP))
(assert (=> (matches-rule 0 37 51) (and (not (reaches 0 37 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 51) (and (not (reaches 1 37 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 52) DROP))
(assert (=> (matches-rule 0 37 52) (and (not (reaches 0 37 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 52) (and (not (reaches 1 37 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 53) DROP))
(assert (=> (matches-rule 0 37 53) (and (not (reaches 0 37 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 53) (and (not (reaches 1 37 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 54) DROP))
(assert (=> (matches-rule 0 37 54) (and (not (reaches 0 37 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 54) (and (not (reaches 1 37 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 55) DROP))
(assert (=> (matches-rule 0 37 55) (and (not (reaches 0 37 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 55) (and (not (reaches 1 37 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 56) DROP))
(assert (=> (matches-rule 0 37 56) (and (not (reaches 0 37 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 56) (and (not (reaches 1 37 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 57) DROP))
(assert (=> (matches-rule 0 37 57) (and (not (reaches 0 37 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 57) (and (not (reaches 1 37 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 58) DROP))
(assert (=> (matches-rule 0 37 58) (and (not (reaches 0 37 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 58) (and (not (reaches 1 37 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 59) DROP))
(assert (=> (matches-rule 0 37 59) (and (not (reaches 0 37 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 59) (and (not (reaches 1 37 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 60) DROP))
(assert (=> (matches-rule 0 37 60) (and (not (reaches 0 37 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 60) (and (not (reaches 1 37 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 61) DROP))
(assert (=> (matches-rule 0 37 61) (and (not (reaches 0 37 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 61) (and (not (reaches 1 37 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 62) DROP))
(assert (=> (matches-rule 0 37 62) (and (not (reaches 0 37 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 62) (and (not (reaches 1 37 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 63) DROP))
(assert (=> (matches-rule 0 37 63) (and (not (reaches 0 37 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 63) (and (not (reaches 1 37 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 64) DROP))
(assert (=> (matches-rule 0 37 64) (and (not (reaches 0 37 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 64) (and (not (reaches 1 37 65))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 65) DROP))
(assert (=> (matches-rule 0 37 65) (and (not (reaches 0 37 66))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 65) (and (not (reaches 1 37 66))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 66) DROP))
(assert (=> (matches-rule 0 37 66) (and (not (reaches 0 37 67))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 66) (and (not (reaches 1 37 67))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 67) DROP))
(assert (=> (matches-rule 0 37 67) (and (not (reaches 0 37 68))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 67) (and (not (reaches 1 37 68))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 68) DROP))
(assert (=> (matches-rule 0 37 68) (and (not (reaches 0 37 69))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 68) (and (not (reaches 1 37 69))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 69) DROP))
(assert (=> (matches-rule 0 37 69) (and (not (reaches 0 37 70))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 69) (and (not (reaches 1 37 70))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 70) DROP))
(assert (=> (matches-rule 0 37 70) (and (not (reaches 0 37 71))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 70) (and (not (reaches 1 37 71))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 71) DROP))
(assert (=> (matches-rule 0 37 71) (and (not (reaches 0 37 72))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 71) (and (not (reaches 1 37 72))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 72) DROP))
(assert (=> (matches-rule 0 37 72) (and (not (reaches 0 37 73))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 72) (and (not (reaches 1 37 73))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 73) DROP))
(assert (=> (matches-rule 0 37 73) (and (not (reaches 0 37 74))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 73) (and (not (reaches 1 37 74))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 74) DROP))
(assert (=> (matches-rule 0 37 74) (and (not (reaches 0 37 75))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 74) (and (not (reaches 1 37 75))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 75) DROP))
(assert (=> (matches-rule 0 37 75) (and (not (reaches 0 37 76))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 75) (and (not (reaches 1 37 76))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 76) DROP))
(assert (=> (matches-rule 0 37 76) (and (not (reaches 0 37 77))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 76) (and (not (reaches 1 37 77))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 77) DROP))
(assert (=> (matches-rule 0 37 77) (and (not (reaches 0 37 78))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 77) (and (not (reaches 1 37 78))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 78) DROP))
(assert (=> (matches-rule 0 37 78) (and (not (reaches 0 37 79))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 78) (and (not (reaches 1 37 79))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 79) DROP))
(assert (=> (matches-rule 0 37 79) (and (not (reaches 0 37 80))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 79) (and (not (reaches 1 37 80))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 80) DROP))
(assert (=> (matches-rule 0 37 80) (and (not (reaches 0 37 81))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 80) (and (not (reaches 1 37 81))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 81) DROP))
(assert (=> (matches-rule 0 37 81) (and (not (reaches 0 37 82))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 81) (and (not (reaches 1 37 82))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 82) DROP))
(assert (=> (matches-rule 0 37 82) (and (not (reaches 0 37 83))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 82) (and (not (reaches 1 37 83))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 83) DROP))
(assert (=> (matches-rule 0 37 83) (and (not (reaches 0 37 84))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 83) (and (not (reaches 1 37 84))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 84) DROP))
(assert (=> (matches-rule 0 37 84) (and (not (reaches 0 37 85))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 84) (and (not (reaches 1 37 85))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 85) DROP))
(assert (=> (matches-rule 0 37 85) (and (not (reaches 0 37 86))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 85) (and (not (reaches 1 37 86))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 86) DROP))
(assert (=> (matches-rule 0 37 86) (and (not (reaches 0 37 87))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 86) (and (not (reaches 1 37 87))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 87) DROP))
(assert (=> (matches-rule 0 37 87) (and (not (reaches 0 37 88))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 87) (and (not (reaches 1 37 88))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 88) DROP))
(assert (=> (matches-rule 0 37 88) (and (not (reaches 0 37 89))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 88) (and (not (reaches 1 37 89))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 89) DROP))
(assert (=> (matches-rule 0 37 89) (and (not (reaches 0 37 90))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 89) (and (not (reaches 1 37 90))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 90) DROP))
(assert (=> (matches-rule 0 37 90) (and (not (reaches 0 37 91))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 90) (and (not (reaches 1 37 91))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 91) DROP))
(assert (=> (matches-rule 0 37 91) (and (not (reaches 0 37 92))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 91) (and (not (reaches 1 37 92))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 92) DROP))
(assert (=> (matches-rule 0 37 92) (and (not (reaches 0 37 93))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 92) (and (not (reaches 1 37 93))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 93) DROP))
(assert (=> (matches-rule 0 37 93) (and (not (reaches 0 37 94))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 93) (and (not (reaches 1 37 94))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 94) DROP))
(assert (=> (matches-rule 0 37 94) (and (not (reaches 0 37 95))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 94) (and (not (reaches 1 37 95))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 95) DROP))
(assert (=> (matches-rule 0 37 95) (and (not (reaches 0 37 96))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 95) (and (not (reaches 1 37 96))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 96) DROP))
(assert (=> (matches-rule 0 37 96) (and (not (reaches 0 37 97))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 96) (and (not (reaches 1 37 97))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 97) DROP))
(assert (=> (matches-rule 0 37 97) (and (not (reaches 0 37 98))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 97) (and (not (reaches 1 37 98))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 98) DROP))
(assert (=> (matches-rule 0 37 98) (and (not (reaches 0 37 99))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 98) (and (not (reaches 1 37 99))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 99) DROP))
(assert (=> (matches-rule 0 37 99) (and (not (reaches 0 37 100))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 99) (and (not (reaches 1 37 100))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 100) DROP))
(assert (=> (matches-rule 0 37 100) (and (not (reaches 0 37 101))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 100) (and (not (reaches 1 37 101))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 101) DROP))
(assert (=> (matches-rule 0 37 101) (and (not (reaches 0 37 102))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 101) (and (not (reaches 1 37 102))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 102) DROP))
(assert (=> (matches-rule 0 37 102) (and (not (reaches 0 37 103))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 102) (and (not (reaches 1 37 103))(= (terminates-with 1) DROP))))


(assert (= (rule-target 37 103) DROP))
(assert (=> (matches-rule 0 37 103) (and (not (reaches 0 37 104))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 37 103) (and (not (reaches 1 37 104))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 0) DROP))
(assert (=> (matches-rule 0 38 0) (and (not (reaches 0 38 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 0) (and (not (reaches 1 38 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 1) DROP))
(assert (=> (matches-rule 0 38 1) (and (not (reaches 0 38 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 1) (and (not (reaches 1 38 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 2) DROP))
(assert (=> (matches-rule 0 38 2) (and (not (reaches 0 38 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 2) (and (not (reaches 1 38 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 3) DROP))
(assert (=> (matches-rule 0 38 3) (and (not (reaches 0 38 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 3) (and (not (reaches 1 38 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 4) DROP))
(assert (=> (matches-rule 0 38 4) (and (not (reaches 0 38 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 4) (and (not (reaches 1 38 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 5) DROP))
(assert (=> (matches-rule 0 38 5) (and (not (reaches 0 38 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 5) (and (not (reaches 1 38 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 6) DROP))
(assert (=> (matches-rule 0 38 6) (and (not (reaches 0 38 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 6) (and (not (reaches 1 38 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 7) DROP))
(assert (=> (matches-rule 0 38 7) (and (not (reaches 0 38 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 7) (and (not (reaches 1 38 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 8) DROP))
(assert (=> (matches-rule 0 38 8) (and (not (reaches 0 38 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 8) (and (not (reaches 1 38 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 9) DROP))
(assert (=> (matches-rule 0 38 9) (and (not (reaches 0 38 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 9) (and (not (reaches 1 38 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 10) DROP))
(assert (=> (matches-rule 0 38 10) (and (not (reaches 0 38 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 10) (and (not (reaches 1 38 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 11) DROP))
(assert (=> (matches-rule 0 38 11) (and (not (reaches 0 38 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 11) (and (not (reaches 1 38 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 12) DROP))
(assert (=> (matches-rule 0 38 12) (and (not (reaches 0 38 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 12) (and (not (reaches 1 38 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 13) DROP))
(assert (=> (matches-rule 0 38 13) (and (not (reaches 0 38 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 13) (and (not (reaches 1 38 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 14) DROP))
(assert (=> (matches-rule 0 38 14) (and (not (reaches 0 38 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 14) (and (not (reaches 1 38 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 15) DROP))
(assert (=> (matches-rule 0 38 15) (and (not (reaches 0 38 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 15) (and (not (reaches 1 38 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 16) DROP))
(assert (=> (matches-rule 0 38 16) (and (not (reaches 0 38 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 16) (and (not (reaches 1 38 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 17) DROP))
(assert (=> (matches-rule 0 38 17) (and (not (reaches 0 38 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 17) (and (not (reaches 1 38 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 18) DROP))
(assert (=> (matches-rule 0 38 18) (and (not (reaches 0 38 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 18) (and (not (reaches 1 38 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 19) DROP))
(assert (=> (matches-rule 0 38 19) (and (not (reaches 0 38 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 19) (and (not (reaches 1 38 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 20) DROP))
(assert (=> (matches-rule 0 38 20) (and (not (reaches 0 38 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 20) (and (not (reaches 1 38 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 21) DROP))
(assert (=> (matches-rule 0 38 21) (and (not (reaches 0 38 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 21) (and (not (reaches 1 38 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 22) DROP))
(assert (=> (matches-rule 0 38 22) (and (not (reaches 0 38 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 22) (and (not (reaches 1 38 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 23) DROP))
(assert (=> (matches-rule 0 38 23) (and (not (reaches 0 38 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 23) (and (not (reaches 1 38 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 24) DROP))
(assert (=> (matches-rule 0 38 24) (and (not (reaches 0 38 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 24) (and (not (reaches 1 38 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 25) DROP))
(assert (=> (matches-rule 0 38 25) (and (not (reaches 0 38 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 25) (and (not (reaches 1 38 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 26) DROP))
(assert (=> (matches-rule 0 38 26) (and (not (reaches 0 38 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 26) (and (not (reaches 1 38 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 27) DROP))
(assert (=> (matches-rule 0 38 27) (and (not (reaches 0 38 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 27) (and (not (reaches 1 38 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 28) DROP))
(assert (=> (matches-rule 0 38 28) (and (not (reaches 0 38 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 28) (and (not (reaches 1 38 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 29) DROP))
(assert (=> (matches-rule 0 38 29) (and (not (reaches 0 38 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 29) (and (not (reaches 1 38 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 30) DROP))
(assert (=> (matches-rule 0 38 30) (and (not (reaches 0 38 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 30) (and (not (reaches 1 38 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 31) DROP))
(assert (=> (matches-rule 0 38 31) (and (not (reaches 0 38 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 31) (and (not (reaches 1 38 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 32) DROP))
(assert (=> (matches-rule 0 38 32) (and (not (reaches 0 38 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 32) (and (not (reaches 1 38 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 33) DROP))
(assert (=> (matches-rule 0 38 33) (and (not (reaches 0 38 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 33) (and (not (reaches 1 38 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 34) DROP))
(assert (=> (matches-rule 0 38 34) (and (not (reaches 0 38 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 34) (and (not (reaches 1 38 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 35) DROP))
(assert (=> (matches-rule 0 38 35) (and (not (reaches 0 38 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 35) (and (not (reaches 1 38 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 36) DROP))
(assert (=> (matches-rule 0 38 36) (and (not (reaches 0 38 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 36) (and (not (reaches 1 38 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 37) DROP))
(assert (=> (matches-rule 0 38 37) (and (not (reaches 0 38 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 37) (and (not (reaches 1 38 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 38) DROP))
(assert (=> (matches-rule 0 38 38) (and (not (reaches 0 38 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 38) (and (not (reaches 1 38 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 39) DROP))
(assert (=> (matches-rule 0 38 39) (and (not (reaches 0 38 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 39) (and (not (reaches 1 38 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 40) DROP))
(assert (=> (matches-rule 0 38 40) (and (not (reaches 0 38 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 40) (and (not (reaches 1 38 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 41) DROP))
(assert (=> (matches-rule 0 38 41) (and (not (reaches 0 38 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 41) (and (not (reaches 1 38 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 42) DROP))
(assert (=> (matches-rule 0 38 42) (and (not (reaches 0 38 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 42) (and (not (reaches 1 38 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 43) DROP))
(assert (=> (matches-rule 0 38 43) (and (not (reaches 0 38 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 43) (and (not (reaches 1 38 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 44) DROP))
(assert (=> (matches-rule 0 38 44) (and (not (reaches 0 38 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 44) (and (not (reaches 1 38 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 45) DROP))
(assert (=> (matches-rule 0 38 45) (and (not (reaches 0 38 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 45) (and (not (reaches 1 38 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 46) DROP))
(assert (=> (matches-rule 0 38 46) (and (not (reaches 0 38 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 46) (and (not (reaches 1 38 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 47) DROP))
(assert (=> (matches-rule 0 38 47) (and (not (reaches 0 38 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 47) (and (not (reaches 1 38 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 48) DROP))
(assert (=> (matches-rule 0 38 48) (and (not (reaches 0 38 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 48) (and (not (reaches 1 38 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 49) DROP))
(assert (=> (matches-rule 0 38 49) (and (not (reaches 0 38 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 49) (and (not (reaches 1 38 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 50) DROP))
(assert (=> (matches-rule 0 38 50) (and (not (reaches 0 38 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 50) (and (not (reaches 1 38 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 51) DROP))
(assert (=> (matches-rule 0 38 51) (and (not (reaches 0 38 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 51) (and (not (reaches 1 38 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 52) DROP))
(assert (=> (matches-rule 0 38 52) (and (not (reaches 0 38 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 52) (and (not (reaches 1 38 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 53) DROP))
(assert (=> (matches-rule 0 38 53) (and (not (reaches 0 38 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 53) (and (not (reaches 1 38 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 54) DROP))
(assert (=> (matches-rule 0 38 54) (and (not (reaches 0 38 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 54) (and (not (reaches 1 38 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 55) DROP))
(assert (=> (matches-rule 0 38 55) (and (not (reaches 0 38 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 55) (and (not (reaches 1 38 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 56) DROP))
(assert (=> (matches-rule 0 38 56) (and (not (reaches 0 38 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 56) (and (not (reaches 1 38 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 57) DROP))
(assert (=> (matches-rule 0 38 57) (and (not (reaches 0 38 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 57) (and (not (reaches 1 38 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 58) DROP))
(assert (=> (matches-rule 0 38 58) (and (not (reaches 0 38 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 58) (and (not (reaches 1 38 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 59) DROP))
(assert (=> (matches-rule 0 38 59) (and (not (reaches 0 38 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 59) (and (not (reaches 1 38 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 60) DROP))
(assert (=> (matches-rule 0 38 60) (and (not (reaches 0 38 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 60) (and (not (reaches 1 38 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 61) DROP))
(assert (=> (matches-rule 0 38 61) (and (not (reaches 0 38 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 61) (and (not (reaches 1 38 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 62) DROP))
(assert (=> (matches-rule 0 38 62) (and (not (reaches 0 38 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 62) (and (not (reaches 1 38 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 63) DROP))
(assert (=> (matches-rule 0 38 63) (and (not (reaches 0 38 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 63) (and (not (reaches 1 38 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 38 64) DROP))
(assert (=> (matches-rule 0 38 64) (and (not (reaches 0 38 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 38 64) (and (not (reaches 1 38 65))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 0) DROP))
(assert (=> (matches-rule 0 39 0) (and (not (reaches 0 39 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 0) (and (not (reaches 1 39 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 1) DROP))
(assert (=> (matches-rule 0 39 1) (and (not (reaches 0 39 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 1) (and (not (reaches 1 39 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 2) DROP))
(assert (=> (matches-rule 0 39 2) (and (not (reaches 0 39 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 2) (and (not (reaches 1 39 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 3) DROP))
(assert (=> (matches-rule 0 39 3) (and (not (reaches 0 39 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 3) (and (not (reaches 1 39 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 4) DROP))
(assert (=> (matches-rule 0 39 4) (and (not (reaches 0 39 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 4) (and (not (reaches 1 39 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 5) DROP))
(assert (=> (matches-rule 0 39 5) (and (not (reaches 0 39 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 5) (and (not (reaches 1 39 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 6) DROP))
(assert (=> (matches-rule 0 39 6) (and (not (reaches 0 39 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 6) (and (not (reaches 1 39 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 7) DROP))
(assert (=> (matches-rule 0 39 7) (and (not (reaches 0 39 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 7) (and (not (reaches 1 39 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 8) DROP))
(assert (=> (matches-rule 0 39 8) (and (not (reaches 0 39 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 8) (and (not (reaches 1 39 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 9) DROP))
(assert (=> (matches-rule 0 39 9) (and (not (reaches 0 39 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 9) (and (not (reaches 1 39 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 10) DROP))
(assert (=> (matches-rule 0 39 10) (and (not (reaches 0 39 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 10) (and (not (reaches 1 39 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 11) DROP))
(assert (=> (matches-rule 0 39 11) (and (not (reaches 0 39 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 11) (and (not (reaches 1 39 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 12) DROP))
(assert (=> (matches-rule 0 39 12) (and (not (reaches 0 39 13))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 12) (and (not (reaches 1 39 13))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 13) DROP))
(assert (=> (matches-rule 0 39 13) (and (not (reaches 0 39 14))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 13) (and (not (reaches 1 39 14))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 14) DROP))
(assert (=> (matches-rule 0 39 14) (and (not (reaches 0 39 15))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 14) (and (not (reaches 1 39 15))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 15) DROP))
(assert (=> (matches-rule 0 39 15) (and (not (reaches 0 39 16))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 15) (and (not (reaches 1 39 16))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 16) DROP))
(assert (=> (matches-rule 0 39 16) (and (not (reaches 0 39 17))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 16) (and (not (reaches 1 39 17))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 17) DROP))
(assert (=> (matches-rule 0 39 17) (and (not (reaches 0 39 18))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 17) (and (not (reaches 1 39 18))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 18) DROP))
(assert (=> (matches-rule 0 39 18) (and (not (reaches 0 39 19))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 18) (and (not (reaches 1 39 19))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 19) DROP))
(assert (=> (matches-rule 0 39 19) (and (not (reaches 0 39 20))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 19) (and (not (reaches 1 39 20))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 20) DROP))
(assert (=> (matches-rule 0 39 20) (and (not (reaches 0 39 21))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 20) (and (not (reaches 1 39 21))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 21) DROP))
(assert (=> (matches-rule 0 39 21) (and (not (reaches 0 39 22))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 21) (and (not (reaches 1 39 22))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 22) DROP))
(assert (=> (matches-rule 0 39 22) (and (not (reaches 0 39 23))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 22) (and (not (reaches 1 39 23))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 23) DROP))
(assert (=> (matches-rule 0 39 23) (and (not (reaches 0 39 24))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 23) (and (not (reaches 1 39 24))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 24) DROP))
(assert (=> (matches-rule 0 39 24) (and (not (reaches 0 39 25))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 24) (and (not (reaches 1 39 25))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 25) DROP))
(assert (=> (matches-rule 0 39 25) (and (not (reaches 0 39 26))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 25) (and (not (reaches 1 39 26))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 26) DROP))
(assert (=> (matches-rule 0 39 26) (and (not (reaches 0 39 27))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 26) (and (not (reaches 1 39 27))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 27) DROP))
(assert (=> (matches-rule 0 39 27) (and (not (reaches 0 39 28))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 27) (and (not (reaches 1 39 28))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 28) DROP))
(assert (=> (matches-rule 0 39 28) (and (not (reaches 0 39 29))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 28) (and (not (reaches 1 39 29))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 29) DROP))
(assert (=> (matches-rule 0 39 29) (and (not (reaches 0 39 30))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 29) (and (not (reaches 1 39 30))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 30) DROP))
(assert (=> (matches-rule 0 39 30) (and (not (reaches 0 39 31))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 30) (and (not (reaches 1 39 31))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 31) DROP))
(assert (=> (matches-rule 0 39 31) (and (not (reaches 0 39 32))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 31) (and (not (reaches 1 39 32))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 32) DROP))
(assert (=> (matches-rule 0 39 32) (and (not (reaches 0 39 33))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 32) (and (not (reaches 1 39 33))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 33) DROP))
(assert (=> (matches-rule 0 39 33) (and (not (reaches 0 39 34))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 33) (and (not (reaches 1 39 34))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 34) DROP))
(assert (=> (matches-rule 0 39 34) (and (not (reaches 0 39 35))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 34) (and (not (reaches 1 39 35))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 35) DROP))
(assert (=> (matches-rule 0 39 35) (and (not (reaches 0 39 36))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 35) (and (not (reaches 1 39 36))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 36) DROP))
(assert (=> (matches-rule 0 39 36) (and (not (reaches 0 39 37))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 36) (and (not (reaches 1 39 37))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 37) DROP))
(assert (=> (matches-rule 0 39 37) (and (not (reaches 0 39 38))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 37) (and (not (reaches 1 39 38))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 38) DROP))
(assert (=> (matches-rule 0 39 38) (and (not (reaches 0 39 39))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 38) (and (not (reaches 1 39 39))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 39) DROP))
(assert (=> (matches-rule 0 39 39) (and (not (reaches 0 39 40))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 39) (and (not (reaches 1 39 40))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 40) DROP))
(assert (=> (matches-rule 0 39 40) (and (not (reaches 0 39 41))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 40) (and (not (reaches 1 39 41))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 41) DROP))
(assert (=> (matches-rule 0 39 41) (and (not (reaches 0 39 42))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 41) (and (not (reaches 1 39 42))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 42) DROP))
(assert (=> (matches-rule 0 39 42) (and (not (reaches 0 39 43))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 42) (and (not (reaches 1 39 43))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 43) DROP))
(assert (=> (matches-rule 0 39 43) (and (not (reaches 0 39 44))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 43) (and (not (reaches 1 39 44))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 44) DROP))
(assert (=> (matches-rule 0 39 44) (and (not (reaches 0 39 45))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 44) (and (not (reaches 1 39 45))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 45) DROP))
(assert (=> (matches-rule 0 39 45) (and (not (reaches 0 39 46))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 45) (and (not (reaches 1 39 46))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 46) DROP))
(assert (=> (matches-rule 0 39 46) (and (not (reaches 0 39 47))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 46) (and (not (reaches 1 39 47))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 47) DROP))
(assert (=> (matches-rule 0 39 47) (and (not (reaches 0 39 48))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 47) (and (not (reaches 1 39 48))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 48) DROP))
(assert (=> (matches-rule 0 39 48) (and (not (reaches 0 39 49))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 48) (and (not (reaches 1 39 49))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 49) DROP))
(assert (=> (matches-rule 0 39 49) (and (not (reaches 0 39 50))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 49) (and (not (reaches 1 39 50))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 50) DROP))
(assert (=> (matches-rule 0 39 50) (and (not (reaches 0 39 51))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 50) (and (not (reaches 1 39 51))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 51) DROP))
(assert (=> (matches-rule 0 39 51) (and (not (reaches 0 39 52))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 51) (and (not (reaches 1 39 52))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 52) DROP))
(assert (=> (matches-rule 0 39 52) (and (not (reaches 0 39 53))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 52) (and (not (reaches 1 39 53))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 53) DROP))
(assert (=> (matches-rule 0 39 53) (and (not (reaches 0 39 54))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 53) (and (not (reaches 1 39 54))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 54) DROP))
(assert (=> (matches-rule 0 39 54) (and (not (reaches 0 39 55))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 54) (and (not (reaches 1 39 55))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 55) DROP))
(assert (=> (matches-rule 0 39 55) (and (not (reaches 0 39 56))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 55) (and (not (reaches 1 39 56))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 56) DROP))
(assert (=> (matches-rule 0 39 56) (and (not (reaches 0 39 57))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 56) (and (not (reaches 1 39 57))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 57) DROP))
(assert (=> (matches-rule 0 39 57) (and (not (reaches 0 39 58))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 57) (and (not (reaches 1 39 58))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 58) DROP))
(assert (=> (matches-rule 0 39 58) (and (not (reaches 0 39 59))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 58) (and (not (reaches 1 39 59))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 59) DROP))
(assert (=> (matches-rule 0 39 59) (and (not (reaches 0 39 60))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 59) (and (not (reaches 1 39 60))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 60) DROP))
(assert (=> (matches-rule 0 39 60) (and (not (reaches 0 39 61))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 60) (and (not (reaches 1 39 61))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 61) DROP))
(assert (=> (matches-rule 0 39 61) (and (not (reaches 0 39 62))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 61) (and (not (reaches 1 39 62))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 62) DROP))
(assert (=> (matches-rule 0 39 62) (and (not (reaches 0 39 63))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 62) (and (not (reaches 1 39 63))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 63) DROP))
(assert (=> (matches-rule 0 39 63) (and (not (reaches 0 39 64))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 63) (and (not (reaches 1 39 64))(= (terminates-with 1) DROP))))


(assert (= (rule-target 39 64) DROP))
(assert (=> (matches-rule 0 39 64) (and (not (reaches 0 39 65))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 39 64) (and (not (reaches 1 39 65))(= (terminates-with 1) DROP))))



(assert (=> 
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
    (and (<= 1 17) (reaches 0 16 17))
    (reaches 0 16 (- 17 1))
))

(assert (=> 
    (and (reaches 0 16 17) (not (matches-criteria 0 16 17))) 
    (reaches 0 16 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 16 17) (= (rule-target 16 17) NONE)) 
    (reaches 0 16 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 16 18))
    (reaches 0 16 (- 18 1))
))

(assert (=> 
    (and (reaches 0 16 18) (not (matches-criteria 0 16 18))) 
    (reaches 0 16 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 16 18) (= (rule-target 16 18) NONE)) 
    (reaches 0 16 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 16 19))
    (reaches 0 16 (- 19 1))
))

(assert (=> 
    (and (reaches 0 16 19) (not (matches-criteria 0 16 19))) 
    (reaches 0 16 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 16 19) (= (rule-target 16 19) NONE)) 
    (reaches 0 16 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 16 20))
    (reaches 0 16 (- 20 1))
))

(assert (=> 
    (and (reaches 0 16 20) (not (matches-criteria 0 16 20))) 
    (reaches 0 16 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 16 20) (= (rule-target 16 20) NONE)) 
    (reaches 0 16 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 16 21))
    (reaches 0 16 (- 21 1))
))

(assert (=> 
    (and (reaches 0 16 21) (not (matches-criteria 0 16 21))) 
    (reaches 0 16 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 16 21) (= (rule-target 16 21) NONE)) 
    (reaches 0 16 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 16 22))
    (reaches 0 16 (- 22 1))
))

(assert (=> 
    (and (reaches 0 16 22) (not (matches-criteria 0 16 22))) 
    (reaches 0 16 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 16 22) (= (rule-target 16 22) NONE)) 
    (reaches 0 16 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 16 23))
    (reaches 0 16 (- 23 1))
))

(assert (=> 
    (and (reaches 0 16 23) (not (matches-criteria 0 16 23))) 
    (reaches 0 16 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 16 23) (= (rule-target 16 23) NONE)) 
    (reaches 0 16 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 16 24))
    (reaches 0 16 (- 24 1))
))

(assert (=> 
    (and (reaches 0 16 24) (not (matches-criteria 0 16 24))) 
    (reaches 0 16 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 16 24) (= (rule-target 16 24) NONE)) 
    (reaches 0 16 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 16 25))
    (reaches 0 16 (- 25 1))
))

(assert (=> 
    (and (reaches 0 16 25) (not (matches-criteria 0 16 25))) 
    (reaches 0 16 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 16 25) (= (rule-target 16 25) NONE)) 
    (reaches 0 16 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 16 26))
    (reaches 0 16 (- 26 1))
))

(assert (=> 
    (and (reaches 0 16 26) (not (matches-criteria 0 16 26))) 
    (reaches 0 16 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 16 26) (= (rule-target 16 26) NONE)) 
    (reaches 0 16 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 16 27))
    (reaches 0 16 (- 27 1))
))

(assert (=> 
    (and (reaches 0 16 27) (not (matches-criteria 0 16 27))) 
    (reaches 0 16 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 16 27) (= (rule-target 16 27) NONE)) 
    (reaches 0 16 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 16 28))
    (reaches 0 16 (- 28 1))
))

(assert (=> 
    (and (reaches 0 16 28) (not (matches-criteria 0 16 28))) 
    (reaches 0 16 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 16 28) (= (rule-target 16 28) NONE)) 
    (reaches 0 16 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 16 29))
    (reaches 0 16 (- 29 1))
))

(assert (=> 
    (and (reaches 0 16 29) (not (matches-criteria 0 16 29))) 
    (reaches 0 16 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 16 29) (= (rule-target 16 29) NONE)) 
    (reaches 0 16 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 16 30))
    (reaches 0 16 (- 30 1))
))

(assert (=> 
    (and (reaches 0 16 30) (not (matches-criteria 0 16 30))) 
    (reaches 0 16 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 16 30) (= (rule-target 16 30) NONE)) 
    (reaches 0 16 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 16 31))
    (reaches 0 16 (- 31 1))
))

(assert (=> 
    (and (reaches 0 16 31) (not (matches-criteria 0 16 31))) 
    (reaches 0 16 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 16 31) (= (rule-target 16 31) NONE)) 
    (reaches 0 16 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 16 32))
    (reaches 0 16 (- 32 1))
))

(assert (=> 
    (and (reaches 0 16 32) (not (matches-criteria 0 16 32))) 
    (reaches 0 16 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 16 32) (= (rule-target 16 32) NONE)) 
    (reaches 0 16 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 16 33))
    (reaches 0 16 (- 33 1))
))

(assert (=> 
    (and (reaches 0 16 33) (not (matches-criteria 0 16 33))) 
    (reaches 0 16 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 16 33) (= (rule-target 16 33) NONE)) 
    (reaches 0 16 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 16 34))
    (reaches 0 16 (- 34 1))
))

(assert (=> 
    (and (reaches 0 16 34) (not (matches-criteria 0 16 34))) 
    (reaches 0 16 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 16 34) (= (rule-target 16 34) NONE)) 
    (reaches 0 16 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 16 35))
    (reaches 0 16 (- 35 1))
))

(assert (=> 
    (and (reaches 0 16 35) (not (matches-criteria 0 16 35))) 
    (reaches 0 16 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 16 35) (= (rule-target 16 35) NONE)) 
    (reaches 0 16 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 16 36))
    (reaches 0 16 (- 36 1))
))

(assert (=> 
    (and (reaches 0 16 36) (not (matches-criteria 0 16 36))) 
    (reaches 0 16 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 16 36) (= (rule-target 16 36) NONE)) 
    (reaches 0 16 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 16 37))
    (reaches 0 16 (- 37 1))
))

(assert (=> 
    (and (reaches 0 16 37) (not (matches-criteria 0 16 37))) 
    (reaches 0 16 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 16 37) (= (rule-target 16 37) NONE)) 
    (reaches 0 16 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 16 38))
    (reaches 0 16 (- 38 1))
))

(assert (=> 
    (and (reaches 0 16 38) (not (matches-criteria 0 16 38))) 
    (reaches 0 16 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 16 38) (= (rule-target 16 38) NONE)) 
    (reaches 0 16 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 16 39))
    (reaches 0 16 (- 39 1))
))

(assert (=> 
    (and (reaches 0 16 39) (not (matches-criteria 0 16 39))) 
    (reaches 0 16 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 16 39) (= (rule-target 16 39) NONE)) 
    (reaches 0 16 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 16 40))
    (reaches 0 16 (- 40 1))
))

(assert (=> 
    (and (reaches 0 16 40) (not (matches-criteria 0 16 40))) 
    (reaches 0 16 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 16 40) (= (rule-target 16 40) NONE)) 
    (reaches 0 16 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 16 41))
    (reaches 0 16 (- 41 1))
))

(assert (=> 
    (and (reaches 0 16 41) (not (matches-criteria 0 16 41))) 
    (reaches 0 16 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 16 41) (= (rule-target 16 41) NONE)) 
    (reaches 0 16 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 16 42))
    (reaches 0 16 (- 42 1))
))

(assert (=> 
    (and (reaches 0 16 42) (not (matches-criteria 0 16 42))) 
    (reaches 0 16 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 16 42) (= (rule-target 16 42) NONE)) 
    (reaches 0 16 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 16 43))
    (reaches 0 16 (- 43 1))
))

(assert (=> 
    (and (reaches 0 16 43) (not (matches-criteria 0 16 43))) 
    (reaches 0 16 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 16 43) (= (rule-target 16 43) NONE)) 
    (reaches 0 16 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 16 44))
    (reaches 0 16 (- 44 1))
))

(assert (=> 
    (and (reaches 0 16 44) (not (matches-criteria 0 16 44))) 
    (reaches 0 16 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 16 44) (= (rule-target 16 44) NONE)) 
    (reaches 0 16 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 16 45))
    (reaches 0 16 (- 45 1))
))

(assert (=> 
    (and (reaches 0 16 45) (not (matches-criteria 0 16 45))) 
    (reaches 0 16 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 16 45) (= (rule-target 16 45) NONE)) 
    (reaches 0 16 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 16 46))
    (reaches 0 16 (- 46 1))
))

(assert (=> 
    (and (reaches 0 16 46) (not (matches-criteria 0 16 46))) 
    (reaches 0 16 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 16 46) (= (rule-target 16 46) NONE)) 
    (reaches 0 16 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 16 47))
    (reaches 0 16 (- 47 1))
))

(assert (=> 
    (and (reaches 0 16 47) (not (matches-criteria 0 16 47))) 
    (reaches 0 16 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 16 47) (= (rule-target 16 47) NONE)) 
    (reaches 0 16 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 16 48))
    (reaches 0 16 (- 48 1))
))

(assert (=> 
    (and (reaches 0 16 48) (not (matches-criteria 0 16 48))) 
    (reaches 0 16 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 16 48) (= (rule-target 16 48) NONE)) 
    (reaches 0 16 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 16 49))
    (reaches 0 16 (- 49 1))
))

(assert (=> 
    (and (reaches 0 16 49) (not (matches-criteria 0 16 49))) 
    (reaches 0 16 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 16 49) (= (rule-target 16 49) NONE)) 
    (reaches 0 16 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 16 50))
    (reaches 0 16 (- 50 1))
))

(assert (=> 
    (and (reaches 0 16 50) (not (matches-criteria 0 16 50))) 
    (reaches 0 16 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 16 50) (= (rule-target 16 50) NONE)) 
    (reaches 0 16 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 16 51))
    (reaches 0 16 (- 51 1))
))

(assert (=> 
    (and (reaches 0 16 51) (not (matches-criteria 0 16 51))) 
    (reaches 0 16 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 16 51) (= (rule-target 16 51) NONE)) 
    (reaches 0 16 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 16 52))
    (reaches 0 16 (- 52 1))
))

(assert (=> 
    (and (reaches 0 16 52) (not (matches-criteria 0 16 52))) 
    (reaches 0 16 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 16 52) (= (rule-target 16 52) NONE)) 
    (reaches 0 16 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 16 53))
    (reaches 0 16 (- 53 1))
))

(assert (=> 
    (and (reaches 0 16 53) (not (matches-criteria 0 16 53))) 
    (reaches 0 16 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 16 53) (= (rule-target 16 53) NONE)) 
    (reaches 0 16 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 16 54))
    (reaches 0 16 (- 54 1))
))

(assert (=> 
    (and (reaches 0 16 54) (not (matches-criteria 0 16 54))) 
    (reaches 0 16 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 16 54) (= (rule-target 16 54) NONE)) 
    (reaches 0 16 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 16 55))
    (reaches 0 16 (- 55 1))
))

(assert (=> 
    (and (reaches 0 16 55) (not (matches-criteria 0 16 55))) 
    (reaches 0 16 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 16 55) (= (rule-target 16 55) NONE)) 
    (reaches 0 16 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 16 56))
    (reaches 0 16 (- 56 1))
))

(assert (=> 
    (and (reaches 0 16 56) (not (matches-criteria 0 16 56))) 
    (reaches 0 16 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 16 56) (= (rule-target 16 56) NONE)) 
    (reaches 0 16 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 16 57))
    (reaches 0 16 (- 57 1))
))

(assert (=> 
    (and (reaches 0 16 57) (not (matches-criteria 0 16 57))) 
    (reaches 0 16 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 16 57) (= (rule-target 16 57) NONE)) 
    (reaches 0 16 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 16 58))
    (reaches 0 16 (- 58 1))
))

(assert (=> 
    (and (reaches 0 16 58) (not (matches-criteria 0 16 58))) 
    (reaches 0 16 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 16 58) (= (rule-target 16 58) NONE)) 
    (reaches 0 16 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 16 59))
    (reaches 0 16 (- 59 1))
))

(assert (=> 
    (and (reaches 0 16 59) (not (matches-criteria 0 16 59))) 
    (reaches 0 16 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 16 59) (= (rule-target 16 59) NONE)) 
    (reaches 0 16 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 16 60))
    (reaches 0 16 (- 60 1))
))

(assert (=> 
    (and (reaches 0 16 60) (not (matches-criteria 0 16 60))) 
    (reaches 0 16 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 16 60) (= (rule-target 16 60) NONE)) 
    (reaches 0 16 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 16 61))
    (reaches 0 16 (- 61 1))
))

(assert (=> 
    (and (reaches 0 16 61) (not (matches-criteria 0 16 61))) 
    (reaches 0 16 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 16 61) (= (rule-target 16 61) NONE)) 
    (reaches 0 16 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 16 62))
    (reaches 0 16 (- 62 1))
))

(assert (=> 
    (and (reaches 0 16 62) (not (matches-criteria 0 16 62))) 
    (reaches 0 16 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 16 62) (= (rule-target 16 62) NONE)) 
    (reaches 0 16 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 16 63))
    (reaches 0 16 (- 63 1))
))

(assert (=> 
    (and (reaches 0 16 63) (not (matches-criteria 0 16 63))) 
    (reaches 0 16 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 16 63) (= (rule-target 16 63) NONE)) 
    (reaches 0 16 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 16 64))
    (reaches 0 16 (- 64 1))
))

(assert (=> 
    (and (reaches 0 16 64) (not (matches-criteria 0 16 64))) 
    (reaches 0 16 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 16 64) (= (rule-target 16 64) NONE)) 
    (reaches 0 16 (+ 64 1))
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
    (and (<= 1 17) (reaches 1 16 17))
    (reaches 1 16 (- 17 1))
))

(assert (=> 
    (and (reaches 1 16 17) (not (matches-criteria 1 16 17))) 
    (reaches 1 16 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 16 17) (= (rule-target 16 17) NONE)) 
    (reaches 1 16 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 16 18))
    (reaches 1 16 (- 18 1))
))

(assert (=> 
    (and (reaches 1 16 18) (not (matches-criteria 1 16 18))) 
    (reaches 1 16 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 16 18) (= (rule-target 16 18) NONE)) 
    (reaches 1 16 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 16 19))
    (reaches 1 16 (- 19 1))
))

(assert (=> 
    (and (reaches 1 16 19) (not (matches-criteria 1 16 19))) 
    (reaches 1 16 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 16 19) (= (rule-target 16 19) NONE)) 
    (reaches 1 16 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 16 20))
    (reaches 1 16 (- 20 1))
))

(assert (=> 
    (and (reaches 1 16 20) (not (matches-criteria 1 16 20))) 
    (reaches 1 16 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 16 20) (= (rule-target 16 20) NONE)) 
    (reaches 1 16 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 16 21))
    (reaches 1 16 (- 21 1))
))

(assert (=> 
    (and (reaches 1 16 21) (not (matches-criteria 1 16 21))) 
    (reaches 1 16 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 16 21) (= (rule-target 16 21) NONE)) 
    (reaches 1 16 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 16 22))
    (reaches 1 16 (- 22 1))
))

(assert (=> 
    (and (reaches 1 16 22) (not (matches-criteria 1 16 22))) 
    (reaches 1 16 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 16 22) (= (rule-target 16 22) NONE)) 
    (reaches 1 16 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 16 23))
    (reaches 1 16 (- 23 1))
))

(assert (=> 
    (and (reaches 1 16 23) (not (matches-criteria 1 16 23))) 
    (reaches 1 16 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 16 23) (= (rule-target 16 23) NONE)) 
    (reaches 1 16 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 16 24))
    (reaches 1 16 (- 24 1))
))

(assert (=> 
    (and (reaches 1 16 24) (not (matches-criteria 1 16 24))) 
    (reaches 1 16 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 16 24) (= (rule-target 16 24) NONE)) 
    (reaches 1 16 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 16 25))
    (reaches 1 16 (- 25 1))
))

(assert (=> 
    (and (reaches 1 16 25) (not (matches-criteria 1 16 25))) 
    (reaches 1 16 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 16 25) (= (rule-target 16 25) NONE)) 
    (reaches 1 16 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 16 26))
    (reaches 1 16 (- 26 1))
))

(assert (=> 
    (and (reaches 1 16 26) (not (matches-criteria 1 16 26))) 
    (reaches 1 16 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 16 26) (= (rule-target 16 26) NONE)) 
    (reaches 1 16 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 16 27))
    (reaches 1 16 (- 27 1))
))

(assert (=> 
    (and (reaches 1 16 27) (not (matches-criteria 1 16 27))) 
    (reaches 1 16 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 16 27) (= (rule-target 16 27) NONE)) 
    (reaches 1 16 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 16 28))
    (reaches 1 16 (- 28 1))
))

(assert (=> 
    (and (reaches 1 16 28) (not (matches-criteria 1 16 28))) 
    (reaches 1 16 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 16 28) (= (rule-target 16 28) NONE)) 
    (reaches 1 16 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 16 29))
    (reaches 1 16 (- 29 1))
))

(assert (=> 
    (and (reaches 1 16 29) (not (matches-criteria 1 16 29))) 
    (reaches 1 16 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 16 29) (= (rule-target 16 29) NONE)) 
    (reaches 1 16 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 16 30))
    (reaches 1 16 (- 30 1))
))

(assert (=> 
    (and (reaches 1 16 30) (not (matches-criteria 1 16 30))) 
    (reaches 1 16 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 16 30) (= (rule-target 16 30) NONE)) 
    (reaches 1 16 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 16 31))
    (reaches 1 16 (- 31 1))
))

(assert (=> 
    (and (reaches 1 16 31) (not (matches-criteria 1 16 31))) 
    (reaches 1 16 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 16 31) (= (rule-target 16 31) NONE)) 
    (reaches 1 16 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 16 32))
    (reaches 1 16 (- 32 1))
))

(assert (=> 
    (and (reaches 1 16 32) (not (matches-criteria 1 16 32))) 
    (reaches 1 16 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 16 32) (= (rule-target 16 32) NONE)) 
    (reaches 1 16 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 16 33))
    (reaches 1 16 (- 33 1))
))

(assert (=> 
    (and (reaches 1 16 33) (not (matches-criteria 1 16 33))) 
    (reaches 1 16 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 16 33) (= (rule-target 16 33) NONE)) 
    (reaches 1 16 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 16 34))
    (reaches 1 16 (- 34 1))
))

(assert (=> 
    (and (reaches 1 16 34) (not (matches-criteria 1 16 34))) 
    (reaches 1 16 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 16 34) (= (rule-target 16 34) NONE)) 
    (reaches 1 16 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 16 35))
    (reaches 1 16 (- 35 1))
))

(assert (=> 
    (and (reaches 1 16 35) (not (matches-criteria 1 16 35))) 
    (reaches 1 16 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 16 35) (= (rule-target 16 35) NONE)) 
    (reaches 1 16 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 16 36))
    (reaches 1 16 (- 36 1))
))

(assert (=> 
    (and (reaches 1 16 36) (not (matches-criteria 1 16 36))) 
    (reaches 1 16 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 16 36) (= (rule-target 16 36) NONE)) 
    (reaches 1 16 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 16 37))
    (reaches 1 16 (- 37 1))
))

(assert (=> 
    (and (reaches 1 16 37) (not (matches-criteria 1 16 37))) 
    (reaches 1 16 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 16 37) (= (rule-target 16 37) NONE)) 
    (reaches 1 16 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 16 38))
    (reaches 1 16 (- 38 1))
))

(assert (=> 
    (and (reaches 1 16 38) (not (matches-criteria 1 16 38))) 
    (reaches 1 16 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 16 38) (= (rule-target 16 38) NONE)) 
    (reaches 1 16 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 16 39))
    (reaches 1 16 (- 39 1))
))

(assert (=> 
    (and (reaches 1 16 39) (not (matches-criteria 1 16 39))) 
    (reaches 1 16 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 16 39) (= (rule-target 16 39) NONE)) 
    (reaches 1 16 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 16 40))
    (reaches 1 16 (- 40 1))
))

(assert (=> 
    (and (reaches 1 16 40) (not (matches-criteria 1 16 40))) 
    (reaches 1 16 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 16 40) (= (rule-target 16 40) NONE)) 
    (reaches 1 16 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 16 41))
    (reaches 1 16 (- 41 1))
))

(assert (=> 
    (and (reaches 1 16 41) (not (matches-criteria 1 16 41))) 
    (reaches 1 16 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 16 41) (= (rule-target 16 41) NONE)) 
    (reaches 1 16 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 16 42))
    (reaches 1 16 (- 42 1))
))

(assert (=> 
    (and (reaches 1 16 42) (not (matches-criteria 1 16 42))) 
    (reaches 1 16 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 16 42) (= (rule-target 16 42) NONE)) 
    (reaches 1 16 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 16 43))
    (reaches 1 16 (- 43 1))
))

(assert (=> 
    (and (reaches 1 16 43) (not (matches-criteria 1 16 43))) 
    (reaches 1 16 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 16 43) (= (rule-target 16 43) NONE)) 
    (reaches 1 16 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 16 44))
    (reaches 1 16 (- 44 1))
))

(assert (=> 
    (and (reaches 1 16 44) (not (matches-criteria 1 16 44))) 
    (reaches 1 16 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 16 44) (= (rule-target 16 44) NONE)) 
    (reaches 1 16 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 16 45))
    (reaches 1 16 (- 45 1))
))

(assert (=> 
    (and (reaches 1 16 45) (not (matches-criteria 1 16 45))) 
    (reaches 1 16 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 16 45) (= (rule-target 16 45) NONE)) 
    (reaches 1 16 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 16 46))
    (reaches 1 16 (- 46 1))
))

(assert (=> 
    (and (reaches 1 16 46) (not (matches-criteria 1 16 46))) 
    (reaches 1 16 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 16 46) (= (rule-target 16 46) NONE)) 
    (reaches 1 16 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 16 47))
    (reaches 1 16 (- 47 1))
))

(assert (=> 
    (and (reaches 1 16 47) (not (matches-criteria 1 16 47))) 
    (reaches 1 16 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 16 47) (= (rule-target 16 47) NONE)) 
    (reaches 1 16 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 16 48))
    (reaches 1 16 (- 48 1))
))

(assert (=> 
    (and (reaches 1 16 48) (not (matches-criteria 1 16 48))) 
    (reaches 1 16 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 16 48) (= (rule-target 16 48) NONE)) 
    (reaches 1 16 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 16 49))
    (reaches 1 16 (- 49 1))
))

(assert (=> 
    (and (reaches 1 16 49) (not (matches-criteria 1 16 49))) 
    (reaches 1 16 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 16 49) (= (rule-target 16 49) NONE)) 
    (reaches 1 16 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 16 50))
    (reaches 1 16 (- 50 1))
))

(assert (=> 
    (and (reaches 1 16 50) (not (matches-criteria 1 16 50))) 
    (reaches 1 16 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 16 50) (= (rule-target 16 50) NONE)) 
    (reaches 1 16 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 16 51))
    (reaches 1 16 (- 51 1))
))

(assert (=> 
    (and (reaches 1 16 51) (not (matches-criteria 1 16 51))) 
    (reaches 1 16 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 16 51) (= (rule-target 16 51) NONE)) 
    (reaches 1 16 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 16 52))
    (reaches 1 16 (- 52 1))
))

(assert (=> 
    (and (reaches 1 16 52) (not (matches-criteria 1 16 52))) 
    (reaches 1 16 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 16 52) (= (rule-target 16 52) NONE)) 
    (reaches 1 16 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 16 53))
    (reaches 1 16 (- 53 1))
))

(assert (=> 
    (and (reaches 1 16 53) (not (matches-criteria 1 16 53))) 
    (reaches 1 16 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 16 53) (= (rule-target 16 53) NONE)) 
    (reaches 1 16 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 16 54))
    (reaches 1 16 (- 54 1))
))

(assert (=> 
    (and (reaches 1 16 54) (not (matches-criteria 1 16 54))) 
    (reaches 1 16 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 16 54) (= (rule-target 16 54) NONE)) 
    (reaches 1 16 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 16 55))
    (reaches 1 16 (- 55 1))
))

(assert (=> 
    (and (reaches 1 16 55) (not (matches-criteria 1 16 55))) 
    (reaches 1 16 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 16 55) (= (rule-target 16 55) NONE)) 
    (reaches 1 16 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 16 56))
    (reaches 1 16 (- 56 1))
))

(assert (=> 
    (and (reaches 1 16 56) (not (matches-criteria 1 16 56))) 
    (reaches 1 16 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 16 56) (= (rule-target 16 56) NONE)) 
    (reaches 1 16 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 16 57))
    (reaches 1 16 (- 57 1))
))

(assert (=> 
    (and (reaches 1 16 57) (not (matches-criteria 1 16 57))) 
    (reaches 1 16 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 16 57) (= (rule-target 16 57) NONE)) 
    (reaches 1 16 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 16 58))
    (reaches 1 16 (- 58 1))
))

(assert (=> 
    (and (reaches 1 16 58) (not (matches-criteria 1 16 58))) 
    (reaches 1 16 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 16 58) (= (rule-target 16 58) NONE)) 
    (reaches 1 16 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 16 59))
    (reaches 1 16 (- 59 1))
))

(assert (=> 
    (and (reaches 1 16 59) (not (matches-criteria 1 16 59))) 
    (reaches 1 16 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 16 59) (= (rule-target 16 59) NONE)) 
    (reaches 1 16 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 16 60))
    (reaches 1 16 (- 60 1))
))

(assert (=> 
    (and (reaches 1 16 60) (not (matches-criteria 1 16 60))) 
    (reaches 1 16 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 16 60) (= (rule-target 16 60) NONE)) 
    (reaches 1 16 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 16 61))
    (reaches 1 16 (- 61 1))
))

(assert (=> 
    (and (reaches 1 16 61) (not (matches-criteria 1 16 61))) 
    (reaches 1 16 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 16 61) (= (rule-target 16 61) NONE)) 
    (reaches 1 16 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 16 62))
    (reaches 1 16 (- 62 1))
))

(assert (=> 
    (and (reaches 1 16 62) (not (matches-criteria 1 16 62))) 
    (reaches 1 16 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 16 62) (= (rule-target 16 62) NONE)) 
    (reaches 1 16 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 16 63))
    (reaches 1 16 (- 63 1))
))

(assert (=> 
    (and (reaches 1 16 63) (not (matches-criteria 1 16 63))) 
    (reaches 1 16 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 16 63) (= (rule-target 16 63) NONE)) 
    (reaches 1 16 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 16 64))
    (reaches 1 16 (- 64 1))
))

(assert (=> 
    (and (reaches 1 16 64) (not (matches-criteria 1 16 64))) 
    (reaches 1 16 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 16 64) (= (rule-target 16 64) NONE)) 
    (reaches 1 16 (+ 64 1))
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
    (and (<= 1 6) (reaches 0 17 6))
    (reaches 0 17 (- 6 1))
))

(assert (=> 
    (and (reaches 0 17 6) (not (matches-criteria 0 17 6))) 
    (reaches 0 17 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 17 6) (= (rule-target 17 6) NONE)) 
    (reaches 0 17 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 17 7))
    (reaches 0 17 (- 7 1))
))

(assert (=> 
    (and (reaches 0 17 7) (not (matches-criteria 0 17 7))) 
    (reaches 0 17 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 17 7) (= (rule-target 17 7) NONE)) 
    (reaches 0 17 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 17 8))
    (reaches 0 17 (- 8 1))
))

(assert (=> 
    (and (reaches 0 17 8) (not (matches-criteria 0 17 8))) 
    (reaches 0 17 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 17 8) (= (rule-target 17 8) NONE)) 
    (reaches 0 17 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 17 9))
    (reaches 0 17 (- 9 1))
))

(assert (=> 
    (and (reaches 0 17 9) (not (matches-criteria 0 17 9))) 
    (reaches 0 17 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 17 9) (= (rule-target 17 9) NONE)) 
    (reaches 0 17 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 17 10))
    (reaches 0 17 (- 10 1))
))

(assert (=> 
    (and (reaches 0 17 10) (not (matches-criteria 0 17 10))) 
    (reaches 0 17 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 17 10) (= (rule-target 17 10) NONE)) 
    (reaches 0 17 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 17 11))
    (reaches 0 17 (- 11 1))
))

(assert (=> 
    (and (reaches 0 17 11) (not (matches-criteria 0 17 11))) 
    (reaches 0 17 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 17 11) (= (rule-target 17 11) NONE)) 
    (reaches 0 17 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 17 12))
    (reaches 0 17 (- 12 1))
))

(assert (=> 
    (and (reaches 0 17 12) (not (matches-criteria 0 17 12))) 
    (reaches 0 17 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 17 12) (= (rule-target 17 12) NONE)) 
    (reaches 0 17 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 17 13))
    (reaches 0 17 (- 13 1))
))

(assert (=> 
    (and (reaches 0 17 13) (not (matches-criteria 0 17 13))) 
    (reaches 0 17 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 17 13) (= (rule-target 17 13) NONE)) 
    (reaches 0 17 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 17 14))
    (reaches 0 17 (- 14 1))
))

(assert (=> 
    (and (reaches 0 17 14) (not (matches-criteria 0 17 14))) 
    (reaches 0 17 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 17 14) (= (rule-target 17 14) NONE)) 
    (reaches 0 17 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 17 15))
    (reaches 0 17 (- 15 1))
))

(assert (=> 
    (and (reaches 0 17 15) (not (matches-criteria 0 17 15))) 
    (reaches 0 17 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 17 15) (= (rule-target 17 15) NONE)) 
    (reaches 0 17 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 17 16))
    (reaches 0 17 (- 16 1))
))

(assert (=> 
    (and (reaches 0 17 16) (not (matches-criteria 0 17 16))) 
    (reaches 0 17 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 17 16) (= (rule-target 17 16) NONE)) 
    (reaches 0 17 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 17 17))
    (reaches 0 17 (- 17 1))
))

(assert (=> 
    (and (reaches 0 17 17) (not (matches-criteria 0 17 17))) 
    (reaches 0 17 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 17 17) (= (rule-target 17 17) NONE)) 
    (reaches 0 17 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 17 18))
    (reaches 0 17 (- 18 1))
))

(assert (=> 
    (and (reaches 0 17 18) (not (matches-criteria 0 17 18))) 
    (reaches 0 17 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 17 18) (= (rule-target 17 18) NONE)) 
    (reaches 0 17 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 17 19))
    (reaches 0 17 (- 19 1))
))

(assert (=> 
    (and (reaches 0 17 19) (not (matches-criteria 0 17 19))) 
    (reaches 0 17 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 17 19) (= (rule-target 17 19) NONE)) 
    (reaches 0 17 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 17 20))
    (reaches 0 17 (- 20 1))
))

(assert (=> 
    (and (reaches 0 17 20) (not (matches-criteria 0 17 20))) 
    (reaches 0 17 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 17 20) (= (rule-target 17 20) NONE)) 
    (reaches 0 17 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 17 21))
    (reaches 0 17 (- 21 1))
))

(assert (=> 
    (and (reaches 0 17 21) (not (matches-criteria 0 17 21))) 
    (reaches 0 17 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 17 21) (= (rule-target 17 21) NONE)) 
    (reaches 0 17 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 17 22))
    (reaches 0 17 (- 22 1))
))

(assert (=> 
    (and (reaches 0 17 22) (not (matches-criteria 0 17 22))) 
    (reaches 0 17 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 17 22) (= (rule-target 17 22) NONE)) 
    (reaches 0 17 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 17 23))
    (reaches 0 17 (- 23 1))
))

(assert (=> 
    (and (reaches 0 17 23) (not (matches-criteria 0 17 23))) 
    (reaches 0 17 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 17 23) (= (rule-target 17 23) NONE)) 
    (reaches 0 17 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 17 24))
    (reaches 0 17 (- 24 1))
))

(assert (=> 
    (and (reaches 0 17 24) (not (matches-criteria 0 17 24))) 
    (reaches 0 17 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 17 24) (= (rule-target 17 24) NONE)) 
    (reaches 0 17 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 17 25))
    (reaches 0 17 (- 25 1))
))

(assert (=> 
    (and (reaches 0 17 25) (not (matches-criteria 0 17 25))) 
    (reaches 0 17 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 17 25) (= (rule-target 17 25) NONE)) 
    (reaches 0 17 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 17 26))
    (reaches 0 17 (- 26 1))
))

(assert (=> 
    (and (reaches 0 17 26) (not (matches-criteria 0 17 26))) 
    (reaches 0 17 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 17 26) (= (rule-target 17 26) NONE)) 
    (reaches 0 17 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 17 27))
    (reaches 0 17 (- 27 1))
))

(assert (=> 
    (and (reaches 0 17 27) (not (matches-criteria 0 17 27))) 
    (reaches 0 17 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 17 27) (= (rule-target 17 27) NONE)) 
    (reaches 0 17 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 17 28))
    (reaches 0 17 (- 28 1))
))

(assert (=> 
    (and (reaches 0 17 28) (not (matches-criteria 0 17 28))) 
    (reaches 0 17 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 17 28) (= (rule-target 17 28) NONE)) 
    (reaches 0 17 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 17 29))
    (reaches 0 17 (- 29 1))
))

(assert (=> 
    (and (reaches 0 17 29) (not (matches-criteria 0 17 29))) 
    (reaches 0 17 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 17 29) (= (rule-target 17 29) NONE)) 
    (reaches 0 17 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 17 30))
    (reaches 0 17 (- 30 1))
))

(assert (=> 
    (and (reaches 0 17 30) (not (matches-criteria 0 17 30))) 
    (reaches 0 17 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 17 30) (= (rule-target 17 30) NONE)) 
    (reaches 0 17 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 17 31))
    (reaches 0 17 (- 31 1))
))

(assert (=> 
    (and (reaches 0 17 31) (not (matches-criteria 0 17 31))) 
    (reaches 0 17 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 17 31) (= (rule-target 17 31) NONE)) 
    (reaches 0 17 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 17 32))
    (reaches 0 17 (- 32 1))
))

(assert (=> 
    (and (reaches 0 17 32) (not (matches-criteria 0 17 32))) 
    (reaches 0 17 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 17 32) (= (rule-target 17 32) NONE)) 
    (reaches 0 17 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 17 33))
    (reaches 0 17 (- 33 1))
))

(assert (=> 
    (and (reaches 0 17 33) (not (matches-criteria 0 17 33))) 
    (reaches 0 17 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 17 33) (= (rule-target 17 33) NONE)) 
    (reaches 0 17 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 17 34))
    (reaches 0 17 (- 34 1))
))

(assert (=> 
    (and (reaches 0 17 34) (not (matches-criteria 0 17 34))) 
    (reaches 0 17 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 17 34) (= (rule-target 17 34) NONE)) 
    (reaches 0 17 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 17 35))
    (reaches 0 17 (- 35 1))
))

(assert (=> 
    (and (reaches 0 17 35) (not (matches-criteria 0 17 35))) 
    (reaches 0 17 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 17 35) (= (rule-target 17 35) NONE)) 
    (reaches 0 17 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 17 36))
    (reaches 0 17 (- 36 1))
))

(assert (=> 
    (and (reaches 0 17 36) (not (matches-criteria 0 17 36))) 
    (reaches 0 17 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 17 36) (= (rule-target 17 36) NONE)) 
    (reaches 0 17 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 17 37))
    (reaches 0 17 (- 37 1))
))

(assert (=> 
    (and (reaches 0 17 37) (not (matches-criteria 0 17 37))) 
    (reaches 0 17 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 17 37) (= (rule-target 17 37) NONE)) 
    (reaches 0 17 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 17 38))
    (reaches 0 17 (- 38 1))
))

(assert (=> 
    (and (reaches 0 17 38) (not (matches-criteria 0 17 38))) 
    (reaches 0 17 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 17 38) (= (rule-target 17 38) NONE)) 
    (reaches 0 17 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 17 39))
    (reaches 0 17 (- 39 1))
))

(assert (=> 
    (and (reaches 0 17 39) (not (matches-criteria 0 17 39))) 
    (reaches 0 17 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 17 39) (= (rule-target 17 39) NONE)) 
    (reaches 0 17 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 17 40))
    (reaches 0 17 (- 40 1))
))

(assert (=> 
    (and (reaches 0 17 40) (not (matches-criteria 0 17 40))) 
    (reaches 0 17 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 17 40) (= (rule-target 17 40) NONE)) 
    (reaches 0 17 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 17 41))
    (reaches 0 17 (- 41 1))
))

(assert (=> 
    (and (reaches 0 17 41) (not (matches-criteria 0 17 41))) 
    (reaches 0 17 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 17 41) (= (rule-target 17 41) NONE)) 
    (reaches 0 17 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 17 42))
    (reaches 0 17 (- 42 1))
))

(assert (=> 
    (and (reaches 0 17 42) (not (matches-criteria 0 17 42))) 
    (reaches 0 17 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 17 42) (= (rule-target 17 42) NONE)) 
    (reaches 0 17 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 17 43))
    (reaches 0 17 (- 43 1))
))

(assert (=> 
    (and (reaches 0 17 43) (not (matches-criteria 0 17 43))) 
    (reaches 0 17 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 17 43) (= (rule-target 17 43) NONE)) 
    (reaches 0 17 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 17 44))
    (reaches 0 17 (- 44 1))
))

(assert (=> 
    (and (reaches 0 17 44) (not (matches-criteria 0 17 44))) 
    (reaches 0 17 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 17 44) (= (rule-target 17 44) NONE)) 
    (reaches 0 17 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 17 45))
    (reaches 0 17 (- 45 1))
))

(assert (=> 
    (and (reaches 0 17 45) (not (matches-criteria 0 17 45))) 
    (reaches 0 17 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 17 45) (= (rule-target 17 45) NONE)) 
    (reaches 0 17 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 17 46))
    (reaches 0 17 (- 46 1))
))

(assert (=> 
    (and (reaches 0 17 46) (not (matches-criteria 0 17 46))) 
    (reaches 0 17 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 17 46) (= (rule-target 17 46) NONE)) 
    (reaches 0 17 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 17 47))
    (reaches 0 17 (- 47 1))
))

(assert (=> 
    (and (reaches 0 17 47) (not (matches-criteria 0 17 47))) 
    (reaches 0 17 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 17 47) (= (rule-target 17 47) NONE)) 
    (reaches 0 17 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 17 48))
    (reaches 0 17 (- 48 1))
))

(assert (=> 
    (and (reaches 0 17 48) (not (matches-criteria 0 17 48))) 
    (reaches 0 17 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 17 48) (= (rule-target 17 48) NONE)) 
    (reaches 0 17 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 17 49))
    (reaches 0 17 (- 49 1))
))

(assert (=> 
    (and (reaches 0 17 49) (not (matches-criteria 0 17 49))) 
    (reaches 0 17 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 17 49) (= (rule-target 17 49) NONE)) 
    (reaches 0 17 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 17 50))
    (reaches 0 17 (- 50 1))
))

(assert (=> 
    (and (reaches 0 17 50) (not (matches-criteria 0 17 50))) 
    (reaches 0 17 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 17 50) (= (rule-target 17 50) NONE)) 
    (reaches 0 17 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 17 51))
    (reaches 0 17 (- 51 1))
))

(assert (=> 
    (and (reaches 0 17 51) (not (matches-criteria 0 17 51))) 
    (reaches 0 17 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 17 51) (= (rule-target 17 51) NONE)) 
    (reaches 0 17 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 17 52))
    (reaches 0 17 (- 52 1))
))

(assert (=> 
    (and (reaches 0 17 52) (not (matches-criteria 0 17 52))) 
    (reaches 0 17 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 17 52) (= (rule-target 17 52) NONE)) 
    (reaches 0 17 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 17 53))
    (reaches 0 17 (- 53 1))
))

(assert (=> 
    (and (reaches 0 17 53) (not (matches-criteria 0 17 53))) 
    (reaches 0 17 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 17 53) (= (rule-target 17 53) NONE)) 
    (reaches 0 17 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 17 54))
    (reaches 0 17 (- 54 1))
))

(assert (=> 
    (and (reaches 0 17 54) (not (matches-criteria 0 17 54))) 
    (reaches 0 17 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 17 54) (= (rule-target 17 54) NONE)) 
    (reaches 0 17 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 17 55))
    (reaches 0 17 (- 55 1))
))

(assert (=> 
    (and (reaches 0 17 55) (not (matches-criteria 0 17 55))) 
    (reaches 0 17 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 17 55) (= (rule-target 17 55) NONE)) 
    (reaches 0 17 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 17 56))
    (reaches 0 17 (- 56 1))
))

(assert (=> 
    (and (reaches 0 17 56) (not (matches-criteria 0 17 56))) 
    (reaches 0 17 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 17 56) (= (rule-target 17 56) NONE)) 
    (reaches 0 17 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 17 57))
    (reaches 0 17 (- 57 1))
))

(assert (=> 
    (and (reaches 0 17 57) (not (matches-criteria 0 17 57))) 
    (reaches 0 17 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 17 57) (= (rule-target 17 57) NONE)) 
    (reaches 0 17 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 17 58))
    (reaches 0 17 (- 58 1))
))

(assert (=> 
    (and (reaches 0 17 58) (not (matches-criteria 0 17 58))) 
    (reaches 0 17 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 17 58) (= (rule-target 17 58) NONE)) 
    (reaches 0 17 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 17 59))
    (reaches 0 17 (- 59 1))
))

(assert (=> 
    (and (reaches 0 17 59) (not (matches-criteria 0 17 59))) 
    (reaches 0 17 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 17 59) (= (rule-target 17 59) NONE)) 
    (reaches 0 17 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 17 60))
    (reaches 0 17 (- 60 1))
))

(assert (=> 
    (and (reaches 0 17 60) (not (matches-criteria 0 17 60))) 
    (reaches 0 17 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 17 60) (= (rule-target 17 60) NONE)) 
    (reaches 0 17 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 17 61))
    (reaches 0 17 (- 61 1))
))

(assert (=> 
    (and (reaches 0 17 61) (not (matches-criteria 0 17 61))) 
    (reaches 0 17 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 17 61) (= (rule-target 17 61) NONE)) 
    (reaches 0 17 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 17 62))
    (reaches 0 17 (- 62 1))
))

(assert (=> 
    (and (reaches 0 17 62) (not (matches-criteria 0 17 62))) 
    (reaches 0 17 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 17 62) (= (rule-target 17 62) NONE)) 
    (reaches 0 17 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 17 63))
    (reaches 0 17 (- 63 1))
))

(assert (=> 
    (and (reaches 0 17 63) (not (matches-criteria 0 17 63))) 
    (reaches 0 17 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 17 63) (= (rule-target 17 63) NONE)) 
    (reaches 0 17 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 17 64))
    (reaches 0 17 (- 64 1))
))

(assert (=> 
    (and (reaches 0 17 64) (not (matches-criteria 0 17 64))) 
    (reaches 0 17 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 17 64) (= (rule-target 17 64) NONE)) 
    (reaches 0 17 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 17 65))
    (reaches 0 17 (- 65 1))
))

(assert (=> 
    (and (reaches 0 17 65) (not (matches-criteria 0 17 65))) 
    (reaches 0 17 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 17 65) (= (rule-target 17 65) NONE)) 
    (reaches 0 17 (+ 65 1))
))(assert (=> 
    (and (<= 1 66) (reaches 0 17 66))
    (reaches 0 17 (- 66 1))
))

(assert (=> 
    (and (reaches 0 17 66) (not (matches-criteria 0 17 66))) 
    (reaches 0 17 (+ 66 1))
))

(assert (=> 
   (and (reaches 0 17 66) (= (rule-target 17 66) NONE)) 
    (reaches 0 17 (+ 66 1))
))(assert (=> 
    (and (<= 1 67) (reaches 0 17 67))
    (reaches 0 17 (- 67 1))
))

(assert (=> 
    (and (reaches 0 17 67) (not (matches-criteria 0 17 67))) 
    (reaches 0 17 (+ 67 1))
))

(assert (=> 
   (and (reaches 0 17 67) (= (rule-target 17 67) NONE)) 
    (reaches 0 17 (+ 67 1))
))(assert (=> 
    (and (<= 1 68) (reaches 0 17 68))
    (reaches 0 17 (- 68 1))
))

(assert (=> 
    (and (reaches 0 17 68) (not (matches-criteria 0 17 68))) 
    (reaches 0 17 (+ 68 1))
))

(assert (=> 
   (and (reaches 0 17 68) (= (rule-target 17 68) NONE)) 
    (reaches 0 17 (+ 68 1))
))(assert (=> 
    (and (<= 1 69) (reaches 0 17 69))
    (reaches 0 17 (- 69 1))
))

(assert (=> 
    (and (reaches 0 17 69) (not (matches-criteria 0 17 69))) 
    (reaches 0 17 (+ 69 1))
))

(assert (=> 
   (and (reaches 0 17 69) (= (rule-target 17 69) NONE)) 
    (reaches 0 17 (+ 69 1))
))(assert (=> 
    (and (<= 1 70) (reaches 0 17 70))
    (reaches 0 17 (- 70 1))
))

(assert (=> 
    (and (reaches 0 17 70) (not (matches-criteria 0 17 70))) 
    (reaches 0 17 (+ 70 1))
))

(assert (=> 
   (and (reaches 0 17 70) (= (rule-target 17 70) NONE)) 
    (reaches 0 17 (+ 70 1))
))(assert (=> 
    (and (<= 1 71) (reaches 0 17 71))
    (reaches 0 17 (- 71 1))
))

(assert (=> 
    (and (reaches 0 17 71) (not (matches-criteria 0 17 71))) 
    (reaches 0 17 (+ 71 1))
))

(assert (=> 
   (and (reaches 0 17 71) (= (rule-target 17 71) NONE)) 
    (reaches 0 17 (+ 71 1))
))(assert (=> 
    (and (<= 1 72) (reaches 0 17 72))
    (reaches 0 17 (- 72 1))
))

(assert (=> 
    (and (reaches 0 17 72) (not (matches-criteria 0 17 72))) 
    (reaches 0 17 (+ 72 1))
))

(assert (=> 
   (and (reaches 0 17 72) (= (rule-target 17 72) NONE)) 
    (reaches 0 17 (+ 72 1))
))(assert (=> 
    (and (<= 1 73) (reaches 0 17 73))
    (reaches 0 17 (- 73 1))
))

(assert (=> 
    (and (reaches 0 17 73) (not (matches-criteria 0 17 73))) 
    (reaches 0 17 (+ 73 1))
))

(assert (=> 
   (and (reaches 0 17 73) (= (rule-target 17 73) NONE)) 
    (reaches 0 17 (+ 73 1))
))(assert (=> 
    (and (<= 1 74) (reaches 0 17 74))
    (reaches 0 17 (- 74 1))
))

(assert (=> 
    (and (reaches 0 17 74) (not (matches-criteria 0 17 74))) 
    (reaches 0 17 (+ 74 1))
))

(assert (=> 
   (and (reaches 0 17 74) (= (rule-target 17 74) NONE)) 
    (reaches 0 17 (+ 74 1))
))(assert (=> 
    (and (<= 1 75) (reaches 0 17 75))
    (reaches 0 17 (- 75 1))
))

(assert (=> 
    (and (reaches 0 17 75) (not (matches-criteria 0 17 75))) 
    (reaches 0 17 (+ 75 1))
))

(assert (=> 
   (and (reaches 0 17 75) (= (rule-target 17 75) NONE)) 
    (reaches 0 17 (+ 75 1))
))(assert (=> 
    (and (<= 1 76) (reaches 0 17 76))
    (reaches 0 17 (- 76 1))
))

(assert (=> 
    (and (reaches 0 17 76) (not (matches-criteria 0 17 76))) 
    (reaches 0 17 (+ 76 1))
))

(assert (=> 
   (and (reaches 0 17 76) (= (rule-target 17 76) NONE)) 
    (reaches 0 17 (+ 76 1))
))(assert (=> 
    (and (<= 1 77) (reaches 0 17 77))
    (reaches 0 17 (- 77 1))
))

(assert (=> 
    (and (reaches 0 17 77) (not (matches-criteria 0 17 77))) 
    (reaches 0 17 (+ 77 1))
))

(assert (=> 
   (and (reaches 0 17 77) (= (rule-target 17 77) NONE)) 
    (reaches 0 17 (+ 77 1))
))(assert (=> 
    (and (<= 1 78) (reaches 0 17 78))
    (reaches 0 17 (- 78 1))
))

(assert (=> 
    (and (reaches 0 17 78) (not (matches-criteria 0 17 78))) 
    (reaches 0 17 (+ 78 1))
))

(assert (=> 
   (and (reaches 0 17 78) (= (rule-target 17 78) NONE)) 
    (reaches 0 17 (+ 78 1))
))(assert (=> 
    (and (<= 1 79) (reaches 0 17 79))
    (reaches 0 17 (- 79 1))
))

(assert (=> 
    (and (reaches 0 17 79) (not (matches-criteria 0 17 79))) 
    (reaches 0 17 (+ 79 1))
))

(assert (=> 
   (and (reaches 0 17 79) (= (rule-target 17 79) NONE)) 
    (reaches 0 17 (+ 79 1))
))(assert (=> 
    (and (<= 1 80) (reaches 0 17 80))
    (reaches 0 17 (- 80 1))
))

(assert (=> 
    (and (reaches 0 17 80) (not (matches-criteria 0 17 80))) 
    (reaches 0 17 (+ 80 1))
))

(assert (=> 
   (and (reaches 0 17 80) (= (rule-target 17 80) NONE)) 
    (reaches 0 17 (+ 80 1))
))(assert (=> 
    (and (<= 1 81) (reaches 0 17 81))
    (reaches 0 17 (- 81 1))
))

(assert (=> 
    (and (reaches 0 17 81) (not (matches-criteria 0 17 81))) 
    (reaches 0 17 (+ 81 1))
))

(assert (=> 
   (and (reaches 0 17 81) (= (rule-target 17 81) NONE)) 
    (reaches 0 17 (+ 81 1))
))(assert (=> 
    (and (<= 1 82) (reaches 0 17 82))
    (reaches 0 17 (- 82 1))
))

(assert (=> 
    (and (reaches 0 17 82) (not (matches-criteria 0 17 82))) 
    (reaches 0 17 (+ 82 1))
))

(assert (=> 
   (and (reaches 0 17 82) (= (rule-target 17 82) NONE)) 
    (reaches 0 17 (+ 82 1))
))(assert (=> 
    (and (<= 1 83) (reaches 0 17 83))
    (reaches 0 17 (- 83 1))
))

(assert (=> 
    (and (reaches 0 17 83) (not (matches-criteria 0 17 83))) 
    (reaches 0 17 (+ 83 1))
))

(assert (=> 
   (and (reaches 0 17 83) (= (rule-target 17 83) NONE)) 
    (reaches 0 17 (+ 83 1))
))(assert (=> 
    (and (<= 1 84) (reaches 0 17 84))
    (reaches 0 17 (- 84 1))
))

(assert (=> 
    (and (reaches 0 17 84) (not (matches-criteria 0 17 84))) 
    (reaches 0 17 (+ 84 1))
))

(assert (=> 
   (and (reaches 0 17 84) (= (rule-target 17 84) NONE)) 
    (reaches 0 17 (+ 84 1))
))(assert (=> 
    (and (<= 1 85) (reaches 0 17 85))
    (reaches 0 17 (- 85 1))
))

(assert (=> 
    (and (reaches 0 17 85) (not (matches-criteria 0 17 85))) 
    (reaches 0 17 (+ 85 1))
))

(assert (=> 
   (and (reaches 0 17 85) (= (rule-target 17 85) NONE)) 
    (reaches 0 17 (+ 85 1))
))(assert (=> 
    (and (<= 1 86) (reaches 0 17 86))
    (reaches 0 17 (- 86 1))
))

(assert (=> 
    (and (reaches 0 17 86) (not (matches-criteria 0 17 86))) 
    (reaches 0 17 (+ 86 1))
))

(assert (=> 
   (and (reaches 0 17 86) (= (rule-target 17 86) NONE)) 
    (reaches 0 17 (+ 86 1))
))(assert (=> 
    (and (<= 1 87) (reaches 0 17 87))
    (reaches 0 17 (- 87 1))
))

(assert (=> 
    (and (reaches 0 17 87) (not (matches-criteria 0 17 87))) 
    (reaches 0 17 (+ 87 1))
))

(assert (=> 
   (and (reaches 0 17 87) (= (rule-target 17 87) NONE)) 
    (reaches 0 17 (+ 87 1))
))(assert (=> 
    (and (<= 1 88) (reaches 0 17 88))
    (reaches 0 17 (- 88 1))
))

(assert (=> 
    (and (reaches 0 17 88) (not (matches-criteria 0 17 88))) 
    (reaches 0 17 (+ 88 1))
))

(assert (=> 
   (and (reaches 0 17 88) (= (rule-target 17 88) NONE)) 
    (reaches 0 17 (+ 88 1))
))(assert (=> 
    (and (<= 1 89) (reaches 0 17 89))
    (reaches 0 17 (- 89 1))
))

(assert (=> 
    (and (reaches 0 17 89) (not (matches-criteria 0 17 89))) 
    (reaches 0 17 (+ 89 1))
))

(assert (=> 
   (and (reaches 0 17 89) (= (rule-target 17 89) NONE)) 
    (reaches 0 17 (+ 89 1))
))(assert (=> 
    (and (<= 1 90) (reaches 0 17 90))
    (reaches 0 17 (- 90 1))
))

(assert (=> 
    (and (reaches 0 17 90) (not (matches-criteria 0 17 90))) 
    (reaches 0 17 (+ 90 1))
))

(assert (=> 
   (and (reaches 0 17 90) (= (rule-target 17 90) NONE)) 
    (reaches 0 17 (+ 90 1))
))(assert (=> 
    (and (<= 1 91) (reaches 0 17 91))
    (reaches 0 17 (- 91 1))
))

(assert (=> 
    (and (reaches 0 17 91) (not (matches-criteria 0 17 91))) 
    (reaches 0 17 (+ 91 1))
))

(assert (=> 
   (and (reaches 0 17 91) (= (rule-target 17 91) NONE)) 
    (reaches 0 17 (+ 91 1))
))(assert (=> 
    (and (<= 1 92) (reaches 0 17 92))
    (reaches 0 17 (- 92 1))
))

(assert (=> 
    (and (reaches 0 17 92) (not (matches-criteria 0 17 92))) 
    (reaches 0 17 (+ 92 1))
))

(assert (=> 
   (and (reaches 0 17 92) (= (rule-target 17 92) NONE)) 
    (reaches 0 17 (+ 92 1))
))(assert (=> 
    (and (<= 1 93) (reaches 0 17 93))
    (reaches 0 17 (- 93 1))
))

(assert (=> 
    (and (reaches 0 17 93) (not (matches-criteria 0 17 93))) 
    (reaches 0 17 (+ 93 1))
))

(assert (=> 
   (and (reaches 0 17 93) (= (rule-target 17 93) NONE)) 
    (reaches 0 17 (+ 93 1))
))(assert (=> 
    (and (<= 1 94) (reaches 0 17 94))
    (reaches 0 17 (- 94 1))
))

(assert (=> 
    (and (reaches 0 17 94) (not (matches-criteria 0 17 94))) 
    (reaches 0 17 (+ 94 1))
))

(assert (=> 
   (and (reaches 0 17 94) (= (rule-target 17 94) NONE)) 
    (reaches 0 17 (+ 94 1))
))(assert (=> 
    (and (<= 1 95) (reaches 0 17 95))
    (reaches 0 17 (- 95 1))
))

(assert (=> 
    (and (reaches 0 17 95) (not (matches-criteria 0 17 95))) 
    (reaches 0 17 (+ 95 1))
))

(assert (=> 
   (and (reaches 0 17 95) (= (rule-target 17 95) NONE)) 
    (reaches 0 17 (+ 95 1))
))(assert (=> 
    (and (<= 1 96) (reaches 0 17 96))
    (reaches 0 17 (- 96 1))
))

(assert (=> 
    (and (reaches 0 17 96) (not (matches-criteria 0 17 96))) 
    (reaches 0 17 (+ 96 1))
))

(assert (=> 
   (and (reaches 0 17 96) (= (rule-target 17 96) NONE)) 
    (reaches 0 17 (+ 96 1))
))(assert (=> 
    (and (<= 1 97) (reaches 0 17 97))
    (reaches 0 17 (- 97 1))
))

(assert (=> 
    (and (reaches 0 17 97) (not (matches-criteria 0 17 97))) 
    (reaches 0 17 (+ 97 1))
))

(assert (=> 
   (and (reaches 0 17 97) (= (rule-target 17 97) NONE)) 
    (reaches 0 17 (+ 97 1))
))(assert (=> 
    (and (<= 1 98) (reaches 0 17 98))
    (reaches 0 17 (- 98 1))
))

(assert (=> 
    (and (reaches 0 17 98) (not (matches-criteria 0 17 98))) 
    (reaches 0 17 (+ 98 1))
))

(assert (=> 
   (and (reaches 0 17 98) (= (rule-target 17 98) NONE)) 
    (reaches 0 17 (+ 98 1))
))(assert (=> 
    (and (<= 1 99) (reaches 0 17 99))
    (reaches 0 17 (- 99 1))
))

(assert (=> 
    (and (reaches 0 17 99) (not (matches-criteria 0 17 99))) 
    (reaches 0 17 (+ 99 1))
))

(assert (=> 
   (and (reaches 0 17 99) (= (rule-target 17 99) NONE)) 
    (reaches 0 17 (+ 99 1))
))(assert (=> 
    (and (<= 1 100) (reaches 0 17 100))
    (reaches 0 17 (- 100 1))
))

(assert (=> 
    (and (reaches 0 17 100) (not (matches-criteria 0 17 100))) 
    (reaches 0 17 (+ 100 1))
))

(assert (=> 
   (and (reaches 0 17 100) (= (rule-target 17 100) NONE)) 
    (reaches 0 17 (+ 100 1))
))(assert (=> 
    (and (<= 1 101) (reaches 0 17 101))
    (reaches 0 17 (- 101 1))
))

(assert (=> 
    (and (reaches 0 17 101) (not (matches-criteria 0 17 101))) 
    (reaches 0 17 (+ 101 1))
))

(assert (=> 
   (and (reaches 0 17 101) (= (rule-target 17 101) NONE)) 
    (reaches 0 17 (+ 101 1))
))(assert (=> 
    (and (<= 1 102) (reaches 0 17 102))
    (reaches 0 17 (- 102 1))
))

(assert (=> 
    (and (reaches 0 17 102) (not (matches-criteria 0 17 102))) 
    (reaches 0 17 (+ 102 1))
))

(assert (=> 
   (and (reaches 0 17 102) (= (rule-target 17 102) NONE)) 
    (reaches 0 17 (+ 102 1))
))(assert (=> 
    (and (<= 1 103) (reaches 0 17 103))
    (reaches 0 17 (- 103 1))
))

(assert (=> 
    (and (reaches 0 17 103) (not (matches-criteria 0 17 103))) 
    (reaches 0 17 (+ 103 1))
))

(assert (=> 
   (and (reaches 0 17 103) (= (rule-target 17 103) NONE)) 
    (reaches 0 17 (+ 103 1))
))(assert (=> 
    (and (<= 1 104) (reaches 0 17 104))
    (reaches 0 17 (- 104 1))
))

(assert (=> 
    (and (reaches 0 17 104) (not (matches-criteria 0 17 104))) 
    (reaches 0 17 (+ 104 1))
))

(assert (=> 
   (and (reaches 0 17 104) (= (rule-target 17 104) NONE)) 
    (reaches 0 17 (+ 104 1))
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
    (and (<= 1 6) (reaches 1 17 6))
    (reaches 1 17 (- 6 1))
))

(assert (=> 
    (and (reaches 1 17 6) (not (matches-criteria 1 17 6))) 
    (reaches 1 17 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 17 6) (= (rule-target 17 6) NONE)) 
    (reaches 1 17 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 17 7))
    (reaches 1 17 (- 7 1))
))

(assert (=> 
    (and (reaches 1 17 7) (not (matches-criteria 1 17 7))) 
    (reaches 1 17 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 17 7) (= (rule-target 17 7) NONE)) 
    (reaches 1 17 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 17 8))
    (reaches 1 17 (- 8 1))
))

(assert (=> 
    (and (reaches 1 17 8) (not (matches-criteria 1 17 8))) 
    (reaches 1 17 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 17 8) (= (rule-target 17 8) NONE)) 
    (reaches 1 17 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 17 9))
    (reaches 1 17 (- 9 1))
))

(assert (=> 
    (and (reaches 1 17 9) (not (matches-criteria 1 17 9))) 
    (reaches 1 17 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 17 9) (= (rule-target 17 9) NONE)) 
    (reaches 1 17 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 17 10))
    (reaches 1 17 (- 10 1))
))

(assert (=> 
    (and (reaches 1 17 10) (not (matches-criteria 1 17 10))) 
    (reaches 1 17 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 17 10) (= (rule-target 17 10) NONE)) 
    (reaches 1 17 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 17 11))
    (reaches 1 17 (- 11 1))
))

(assert (=> 
    (and (reaches 1 17 11) (not (matches-criteria 1 17 11))) 
    (reaches 1 17 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 17 11) (= (rule-target 17 11) NONE)) 
    (reaches 1 17 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 17 12))
    (reaches 1 17 (- 12 1))
))

(assert (=> 
    (and (reaches 1 17 12) (not (matches-criteria 1 17 12))) 
    (reaches 1 17 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 17 12) (= (rule-target 17 12) NONE)) 
    (reaches 1 17 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 17 13))
    (reaches 1 17 (- 13 1))
))

(assert (=> 
    (and (reaches 1 17 13) (not (matches-criteria 1 17 13))) 
    (reaches 1 17 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 17 13) (= (rule-target 17 13) NONE)) 
    (reaches 1 17 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 17 14))
    (reaches 1 17 (- 14 1))
))

(assert (=> 
    (and (reaches 1 17 14) (not (matches-criteria 1 17 14))) 
    (reaches 1 17 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 17 14) (= (rule-target 17 14) NONE)) 
    (reaches 1 17 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 17 15))
    (reaches 1 17 (- 15 1))
))

(assert (=> 
    (and (reaches 1 17 15) (not (matches-criteria 1 17 15))) 
    (reaches 1 17 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 17 15) (= (rule-target 17 15) NONE)) 
    (reaches 1 17 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 17 16))
    (reaches 1 17 (- 16 1))
))

(assert (=> 
    (and (reaches 1 17 16) (not (matches-criteria 1 17 16))) 
    (reaches 1 17 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 17 16) (= (rule-target 17 16) NONE)) 
    (reaches 1 17 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 17 17))
    (reaches 1 17 (- 17 1))
))

(assert (=> 
    (and (reaches 1 17 17) (not (matches-criteria 1 17 17))) 
    (reaches 1 17 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 17 17) (= (rule-target 17 17) NONE)) 
    (reaches 1 17 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 17 18))
    (reaches 1 17 (- 18 1))
))

(assert (=> 
    (and (reaches 1 17 18) (not (matches-criteria 1 17 18))) 
    (reaches 1 17 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 17 18) (= (rule-target 17 18) NONE)) 
    (reaches 1 17 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 17 19))
    (reaches 1 17 (- 19 1))
))

(assert (=> 
    (and (reaches 1 17 19) (not (matches-criteria 1 17 19))) 
    (reaches 1 17 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 17 19) (= (rule-target 17 19) NONE)) 
    (reaches 1 17 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 17 20))
    (reaches 1 17 (- 20 1))
))

(assert (=> 
    (and (reaches 1 17 20) (not (matches-criteria 1 17 20))) 
    (reaches 1 17 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 17 20) (= (rule-target 17 20) NONE)) 
    (reaches 1 17 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 17 21))
    (reaches 1 17 (- 21 1))
))

(assert (=> 
    (and (reaches 1 17 21) (not (matches-criteria 1 17 21))) 
    (reaches 1 17 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 17 21) (= (rule-target 17 21) NONE)) 
    (reaches 1 17 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 17 22))
    (reaches 1 17 (- 22 1))
))

(assert (=> 
    (and (reaches 1 17 22) (not (matches-criteria 1 17 22))) 
    (reaches 1 17 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 17 22) (= (rule-target 17 22) NONE)) 
    (reaches 1 17 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 17 23))
    (reaches 1 17 (- 23 1))
))

(assert (=> 
    (and (reaches 1 17 23) (not (matches-criteria 1 17 23))) 
    (reaches 1 17 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 17 23) (= (rule-target 17 23) NONE)) 
    (reaches 1 17 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 17 24))
    (reaches 1 17 (- 24 1))
))

(assert (=> 
    (and (reaches 1 17 24) (not (matches-criteria 1 17 24))) 
    (reaches 1 17 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 17 24) (= (rule-target 17 24) NONE)) 
    (reaches 1 17 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 17 25))
    (reaches 1 17 (- 25 1))
))

(assert (=> 
    (and (reaches 1 17 25) (not (matches-criteria 1 17 25))) 
    (reaches 1 17 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 17 25) (= (rule-target 17 25) NONE)) 
    (reaches 1 17 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 17 26))
    (reaches 1 17 (- 26 1))
))

(assert (=> 
    (and (reaches 1 17 26) (not (matches-criteria 1 17 26))) 
    (reaches 1 17 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 17 26) (= (rule-target 17 26) NONE)) 
    (reaches 1 17 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 17 27))
    (reaches 1 17 (- 27 1))
))

(assert (=> 
    (and (reaches 1 17 27) (not (matches-criteria 1 17 27))) 
    (reaches 1 17 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 17 27) (= (rule-target 17 27) NONE)) 
    (reaches 1 17 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 17 28))
    (reaches 1 17 (- 28 1))
))

(assert (=> 
    (and (reaches 1 17 28) (not (matches-criteria 1 17 28))) 
    (reaches 1 17 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 17 28) (= (rule-target 17 28) NONE)) 
    (reaches 1 17 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 17 29))
    (reaches 1 17 (- 29 1))
))

(assert (=> 
    (and (reaches 1 17 29) (not (matches-criteria 1 17 29))) 
    (reaches 1 17 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 17 29) (= (rule-target 17 29) NONE)) 
    (reaches 1 17 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 17 30))
    (reaches 1 17 (- 30 1))
))

(assert (=> 
    (and (reaches 1 17 30) (not (matches-criteria 1 17 30))) 
    (reaches 1 17 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 17 30) (= (rule-target 17 30) NONE)) 
    (reaches 1 17 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 17 31))
    (reaches 1 17 (- 31 1))
))

(assert (=> 
    (and (reaches 1 17 31) (not (matches-criteria 1 17 31))) 
    (reaches 1 17 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 17 31) (= (rule-target 17 31) NONE)) 
    (reaches 1 17 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 17 32))
    (reaches 1 17 (- 32 1))
))

(assert (=> 
    (and (reaches 1 17 32) (not (matches-criteria 1 17 32))) 
    (reaches 1 17 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 17 32) (= (rule-target 17 32) NONE)) 
    (reaches 1 17 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 17 33))
    (reaches 1 17 (- 33 1))
))

(assert (=> 
    (and (reaches 1 17 33) (not (matches-criteria 1 17 33))) 
    (reaches 1 17 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 17 33) (= (rule-target 17 33) NONE)) 
    (reaches 1 17 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 17 34))
    (reaches 1 17 (- 34 1))
))

(assert (=> 
    (and (reaches 1 17 34) (not (matches-criteria 1 17 34))) 
    (reaches 1 17 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 17 34) (= (rule-target 17 34) NONE)) 
    (reaches 1 17 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 17 35))
    (reaches 1 17 (- 35 1))
))

(assert (=> 
    (and (reaches 1 17 35) (not (matches-criteria 1 17 35))) 
    (reaches 1 17 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 17 35) (= (rule-target 17 35) NONE)) 
    (reaches 1 17 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 17 36))
    (reaches 1 17 (- 36 1))
))

(assert (=> 
    (and (reaches 1 17 36) (not (matches-criteria 1 17 36))) 
    (reaches 1 17 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 17 36) (= (rule-target 17 36) NONE)) 
    (reaches 1 17 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 17 37))
    (reaches 1 17 (- 37 1))
))

(assert (=> 
    (and (reaches 1 17 37) (not (matches-criteria 1 17 37))) 
    (reaches 1 17 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 17 37) (= (rule-target 17 37) NONE)) 
    (reaches 1 17 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 17 38))
    (reaches 1 17 (- 38 1))
))

(assert (=> 
    (and (reaches 1 17 38) (not (matches-criteria 1 17 38))) 
    (reaches 1 17 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 17 38) (= (rule-target 17 38) NONE)) 
    (reaches 1 17 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 17 39))
    (reaches 1 17 (- 39 1))
))

(assert (=> 
    (and (reaches 1 17 39) (not (matches-criteria 1 17 39))) 
    (reaches 1 17 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 17 39) (= (rule-target 17 39) NONE)) 
    (reaches 1 17 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 17 40))
    (reaches 1 17 (- 40 1))
))

(assert (=> 
    (and (reaches 1 17 40) (not (matches-criteria 1 17 40))) 
    (reaches 1 17 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 17 40) (= (rule-target 17 40) NONE)) 
    (reaches 1 17 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 17 41))
    (reaches 1 17 (- 41 1))
))

(assert (=> 
    (and (reaches 1 17 41) (not (matches-criteria 1 17 41))) 
    (reaches 1 17 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 17 41) (= (rule-target 17 41) NONE)) 
    (reaches 1 17 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 17 42))
    (reaches 1 17 (- 42 1))
))

(assert (=> 
    (and (reaches 1 17 42) (not (matches-criteria 1 17 42))) 
    (reaches 1 17 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 17 42) (= (rule-target 17 42) NONE)) 
    (reaches 1 17 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 17 43))
    (reaches 1 17 (- 43 1))
))

(assert (=> 
    (and (reaches 1 17 43) (not (matches-criteria 1 17 43))) 
    (reaches 1 17 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 17 43) (= (rule-target 17 43) NONE)) 
    (reaches 1 17 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 17 44))
    (reaches 1 17 (- 44 1))
))

(assert (=> 
    (and (reaches 1 17 44) (not (matches-criteria 1 17 44))) 
    (reaches 1 17 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 17 44) (= (rule-target 17 44) NONE)) 
    (reaches 1 17 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 17 45))
    (reaches 1 17 (- 45 1))
))

(assert (=> 
    (and (reaches 1 17 45) (not (matches-criteria 1 17 45))) 
    (reaches 1 17 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 17 45) (= (rule-target 17 45) NONE)) 
    (reaches 1 17 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 17 46))
    (reaches 1 17 (- 46 1))
))

(assert (=> 
    (and (reaches 1 17 46) (not (matches-criteria 1 17 46))) 
    (reaches 1 17 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 17 46) (= (rule-target 17 46) NONE)) 
    (reaches 1 17 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 17 47))
    (reaches 1 17 (- 47 1))
))

(assert (=> 
    (and (reaches 1 17 47) (not (matches-criteria 1 17 47))) 
    (reaches 1 17 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 17 47) (= (rule-target 17 47) NONE)) 
    (reaches 1 17 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 17 48))
    (reaches 1 17 (- 48 1))
))

(assert (=> 
    (and (reaches 1 17 48) (not (matches-criteria 1 17 48))) 
    (reaches 1 17 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 17 48) (= (rule-target 17 48) NONE)) 
    (reaches 1 17 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 17 49))
    (reaches 1 17 (- 49 1))
))

(assert (=> 
    (and (reaches 1 17 49) (not (matches-criteria 1 17 49))) 
    (reaches 1 17 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 17 49) (= (rule-target 17 49) NONE)) 
    (reaches 1 17 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 17 50))
    (reaches 1 17 (- 50 1))
))

(assert (=> 
    (and (reaches 1 17 50) (not (matches-criteria 1 17 50))) 
    (reaches 1 17 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 17 50) (= (rule-target 17 50) NONE)) 
    (reaches 1 17 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 17 51))
    (reaches 1 17 (- 51 1))
))

(assert (=> 
    (and (reaches 1 17 51) (not (matches-criteria 1 17 51))) 
    (reaches 1 17 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 17 51) (= (rule-target 17 51) NONE)) 
    (reaches 1 17 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 17 52))
    (reaches 1 17 (- 52 1))
))

(assert (=> 
    (and (reaches 1 17 52) (not (matches-criteria 1 17 52))) 
    (reaches 1 17 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 17 52) (= (rule-target 17 52) NONE)) 
    (reaches 1 17 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 17 53))
    (reaches 1 17 (- 53 1))
))

(assert (=> 
    (and (reaches 1 17 53) (not (matches-criteria 1 17 53))) 
    (reaches 1 17 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 17 53) (= (rule-target 17 53) NONE)) 
    (reaches 1 17 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 17 54))
    (reaches 1 17 (- 54 1))
))

(assert (=> 
    (and (reaches 1 17 54) (not (matches-criteria 1 17 54))) 
    (reaches 1 17 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 17 54) (= (rule-target 17 54) NONE)) 
    (reaches 1 17 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 17 55))
    (reaches 1 17 (- 55 1))
))

(assert (=> 
    (and (reaches 1 17 55) (not (matches-criteria 1 17 55))) 
    (reaches 1 17 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 17 55) (= (rule-target 17 55) NONE)) 
    (reaches 1 17 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 17 56))
    (reaches 1 17 (- 56 1))
))

(assert (=> 
    (and (reaches 1 17 56) (not (matches-criteria 1 17 56))) 
    (reaches 1 17 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 17 56) (= (rule-target 17 56) NONE)) 
    (reaches 1 17 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 17 57))
    (reaches 1 17 (- 57 1))
))

(assert (=> 
    (and (reaches 1 17 57) (not (matches-criteria 1 17 57))) 
    (reaches 1 17 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 17 57) (= (rule-target 17 57) NONE)) 
    (reaches 1 17 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 17 58))
    (reaches 1 17 (- 58 1))
))

(assert (=> 
    (and (reaches 1 17 58) (not (matches-criteria 1 17 58))) 
    (reaches 1 17 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 17 58) (= (rule-target 17 58) NONE)) 
    (reaches 1 17 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 17 59))
    (reaches 1 17 (- 59 1))
))

(assert (=> 
    (and (reaches 1 17 59) (not (matches-criteria 1 17 59))) 
    (reaches 1 17 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 17 59) (= (rule-target 17 59) NONE)) 
    (reaches 1 17 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 17 60))
    (reaches 1 17 (- 60 1))
))

(assert (=> 
    (and (reaches 1 17 60) (not (matches-criteria 1 17 60))) 
    (reaches 1 17 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 17 60) (= (rule-target 17 60) NONE)) 
    (reaches 1 17 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 17 61))
    (reaches 1 17 (- 61 1))
))

(assert (=> 
    (and (reaches 1 17 61) (not (matches-criteria 1 17 61))) 
    (reaches 1 17 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 17 61) (= (rule-target 17 61) NONE)) 
    (reaches 1 17 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 17 62))
    (reaches 1 17 (- 62 1))
))

(assert (=> 
    (and (reaches 1 17 62) (not (matches-criteria 1 17 62))) 
    (reaches 1 17 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 17 62) (= (rule-target 17 62) NONE)) 
    (reaches 1 17 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 17 63))
    (reaches 1 17 (- 63 1))
))

(assert (=> 
    (and (reaches 1 17 63) (not (matches-criteria 1 17 63))) 
    (reaches 1 17 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 17 63) (= (rule-target 17 63) NONE)) 
    (reaches 1 17 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 17 64))
    (reaches 1 17 (- 64 1))
))

(assert (=> 
    (and (reaches 1 17 64) (not (matches-criteria 1 17 64))) 
    (reaches 1 17 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 17 64) (= (rule-target 17 64) NONE)) 
    (reaches 1 17 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 17 65))
    (reaches 1 17 (- 65 1))
))

(assert (=> 
    (and (reaches 1 17 65) (not (matches-criteria 1 17 65))) 
    (reaches 1 17 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 17 65) (= (rule-target 17 65) NONE)) 
    (reaches 1 17 (+ 65 1))
))(assert (=> 
    (and (<= 1 66) (reaches 1 17 66))
    (reaches 1 17 (- 66 1))
))

(assert (=> 
    (and (reaches 1 17 66) (not (matches-criteria 1 17 66))) 
    (reaches 1 17 (+ 66 1))
))

(assert (=> 
   (and (reaches 1 17 66) (= (rule-target 17 66) NONE)) 
    (reaches 1 17 (+ 66 1))
))(assert (=> 
    (and (<= 1 67) (reaches 1 17 67))
    (reaches 1 17 (- 67 1))
))

(assert (=> 
    (and (reaches 1 17 67) (not (matches-criteria 1 17 67))) 
    (reaches 1 17 (+ 67 1))
))

(assert (=> 
   (and (reaches 1 17 67) (= (rule-target 17 67) NONE)) 
    (reaches 1 17 (+ 67 1))
))(assert (=> 
    (and (<= 1 68) (reaches 1 17 68))
    (reaches 1 17 (- 68 1))
))

(assert (=> 
    (and (reaches 1 17 68) (not (matches-criteria 1 17 68))) 
    (reaches 1 17 (+ 68 1))
))

(assert (=> 
   (and (reaches 1 17 68) (= (rule-target 17 68) NONE)) 
    (reaches 1 17 (+ 68 1))
))(assert (=> 
    (and (<= 1 69) (reaches 1 17 69))
    (reaches 1 17 (- 69 1))
))

(assert (=> 
    (and (reaches 1 17 69) (not (matches-criteria 1 17 69))) 
    (reaches 1 17 (+ 69 1))
))

(assert (=> 
   (and (reaches 1 17 69) (= (rule-target 17 69) NONE)) 
    (reaches 1 17 (+ 69 1))
))(assert (=> 
    (and (<= 1 70) (reaches 1 17 70))
    (reaches 1 17 (- 70 1))
))

(assert (=> 
    (and (reaches 1 17 70) (not (matches-criteria 1 17 70))) 
    (reaches 1 17 (+ 70 1))
))

(assert (=> 
   (and (reaches 1 17 70) (= (rule-target 17 70) NONE)) 
    (reaches 1 17 (+ 70 1))
))(assert (=> 
    (and (<= 1 71) (reaches 1 17 71))
    (reaches 1 17 (- 71 1))
))

(assert (=> 
    (and (reaches 1 17 71) (not (matches-criteria 1 17 71))) 
    (reaches 1 17 (+ 71 1))
))

(assert (=> 
   (and (reaches 1 17 71) (= (rule-target 17 71) NONE)) 
    (reaches 1 17 (+ 71 1))
))(assert (=> 
    (and (<= 1 72) (reaches 1 17 72))
    (reaches 1 17 (- 72 1))
))

(assert (=> 
    (and (reaches 1 17 72) (not (matches-criteria 1 17 72))) 
    (reaches 1 17 (+ 72 1))
))

(assert (=> 
   (and (reaches 1 17 72) (= (rule-target 17 72) NONE)) 
    (reaches 1 17 (+ 72 1))
))(assert (=> 
    (and (<= 1 73) (reaches 1 17 73))
    (reaches 1 17 (- 73 1))
))

(assert (=> 
    (and (reaches 1 17 73) (not (matches-criteria 1 17 73))) 
    (reaches 1 17 (+ 73 1))
))

(assert (=> 
   (and (reaches 1 17 73) (= (rule-target 17 73) NONE)) 
    (reaches 1 17 (+ 73 1))
))(assert (=> 
    (and (<= 1 74) (reaches 1 17 74))
    (reaches 1 17 (- 74 1))
))

(assert (=> 
    (and (reaches 1 17 74) (not (matches-criteria 1 17 74))) 
    (reaches 1 17 (+ 74 1))
))

(assert (=> 
   (and (reaches 1 17 74) (= (rule-target 17 74) NONE)) 
    (reaches 1 17 (+ 74 1))
))(assert (=> 
    (and (<= 1 75) (reaches 1 17 75))
    (reaches 1 17 (- 75 1))
))

(assert (=> 
    (and (reaches 1 17 75) (not (matches-criteria 1 17 75))) 
    (reaches 1 17 (+ 75 1))
))

(assert (=> 
   (and (reaches 1 17 75) (= (rule-target 17 75) NONE)) 
    (reaches 1 17 (+ 75 1))
))(assert (=> 
    (and (<= 1 76) (reaches 1 17 76))
    (reaches 1 17 (- 76 1))
))

(assert (=> 
    (and (reaches 1 17 76) (not (matches-criteria 1 17 76))) 
    (reaches 1 17 (+ 76 1))
))

(assert (=> 
   (and (reaches 1 17 76) (= (rule-target 17 76) NONE)) 
    (reaches 1 17 (+ 76 1))
))(assert (=> 
    (and (<= 1 77) (reaches 1 17 77))
    (reaches 1 17 (- 77 1))
))

(assert (=> 
    (and (reaches 1 17 77) (not (matches-criteria 1 17 77))) 
    (reaches 1 17 (+ 77 1))
))

(assert (=> 
   (and (reaches 1 17 77) (= (rule-target 17 77) NONE)) 
    (reaches 1 17 (+ 77 1))
))(assert (=> 
    (and (<= 1 78) (reaches 1 17 78))
    (reaches 1 17 (- 78 1))
))

(assert (=> 
    (and (reaches 1 17 78) (not (matches-criteria 1 17 78))) 
    (reaches 1 17 (+ 78 1))
))

(assert (=> 
   (and (reaches 1 17 78) (= (rule-target 17 78) NONE)) 
    (reaches 1 17 (+ 78 1))
))(assert (=> 
    (and (<= 1 79) (reaches 1 17 79))
    (reaches 1 17 (- 79 1))
))

(assert (=> 
    (and (reaches 1 17 79) (not (matches-criteria 1 17 79))) 
    (reaches 1 17 (+ 79 1))
))

(assert (=> 
   (and (reaches 1 17 79) (= (rule-target 17 79) NONE)) 
    (reaches 1 17 (+ 79 1))
))(assert (=> 
    (and (<= 1 80) (reaches 1 17 80))
    (reaches 1 17 (- 80 1))
))

(assert (=> 
    (and (reaches 1 17 80) (not (matches-criteria 1 17 80))) 
    (reaches 1 17 (+ 80 1))
))

(assert (=> 
   (and (reaches 1 17 80) (= (rule-target 17 80) NONE)) 
    (reaches 1 17 (+ 80 1))
))(assert (=> 
    (and (<= 1 81) (reaches 1 17 81))
    (reaches 1 17 (- 81 1))
))

(assert (=> 
    (and (reaches 1 17 81) (not (matches-criteria 1 17 81))) 
    (reaches 1 17 (+ 81 1))
))

(assert (=> 
   (and (reaches 1 17 81) (= (rule-target 17 81) NONE)) 
    (reaches 1 17 (+ 81 1))
))(assert (=> 
    (and (<= 1 82) (reaches 1 17 82))
    (reaches 1 17 (- 82 1))
))

(assert (=> 
    (and (reaches 1 17 82) (not (matches-criteria 1 17 82))) 
    (reaches 1 17 (+ 82 1))
))

(assert (=> 
   (and (reaches 1 17 82) (= (rule-target 17 82) NONE)) 
    (reaches 1 17 (+ 82 1))
))(assert (=> 
    (and (<= 1 83) (reaches 1 17 83))
    (reaches 1 17 (- 83 1))
))

(assert (=> 
    (and (reaches 1 17 83) (not (matches-criteria 1 17 83))) 
    (reaches 1 17 (+ 83 1))
))

(assert (=> 
   (and (reaches 1 17 83) (= (rule-target 17 83) NONE)) 
    (reaches 1 17 (+ 83 1))
))(assert (=> 
    (and (<= 1 84) (reaches 1 17 84))
    (reaches 1 17 (- 84 1))
))

(assert (=> 
    (and (reaches 1 17 84) (not (matches-criteria 1 17 84))) 
    (reaches 1 17 (+ 84 1))
))

(assert (=> 
   (and (reaches 1 17 84) (= (rule-target 17 84) NONE)) 
    (reaches 1 17 (+ 84 1))
))(assert (=> 
    (and (<= 1 85) (reaches 1 17 85))
    (reaches 1 17 (- 85 1))
))

(assert (=> 
    (and (reaches 1 17 85) (not (matches-criteria 1 17 85))) 
    (reaches 1 17 (+ 85 1))
))

(assert (=> 
   (and (reaches 1 17 85) (= (rule-target 17 85) NONE)) 
    (reaches 1 17 (+ 85 1))
))(assert (=> 
    (and (<= 1 86) (reaches 1 17 86))
    (reaches 1 17 (- 86 1))
))

(assert (=> 
    (and (reaches 1 17 86) (not (matches-criteria 1 17 86))) 
    (reaches 1 17 (+ 86 1))
))

(assert (=> 
   (and (reaches 1 17 86) (= (rule-target 17 86) NONE)) 
    (reaches 1 17 (+ 86 1))
))(assert (=> 
    (and (<= 1 87) (reaches 1 17 87))
    (reaches 1 17 (- 87 1))
))

(assert (=> 
    (and (reaches 1 17 87) (not (matches-criteria 1 17 87))) 
    (reaches 1 17 (+ 87 1))
))

(assert (=> 
   (and (reaches 1 17 87) (= (rule-target 17 87) NONE)) 
    (reaches 1 17 (+ 87 1))
))(assert (=> 
    (and (<= 1 88) (reaches 1 17 88))
    (reaches 1 17 (- 88 1))
))

(assert (=> 
    (and (reaches 1 17 88) (not (matches-criteria 1 17 88))) 
    (reaches 1 17 (+ 88 1))
))

(assert (=> 
   (and (reaches 1 17 88) (= (rule-target 17 88) NONE)) 
    (reaches 1 17 (+ 88 1))
))(assert (=> 
    (and (<= 1 89) (reaches 1 17 89))
    (reaches 1 17 (- 89 1))
))

(assert (=> 
    (and (reaches 1 17 89) (not (matches-criteria 1 17 89))) 
    (reaches 1 17 (+ 89 1))
))

(assert (=> 
   (and (reaches 1 17 89) (= (rule-target 17 89) NONE)) 
    (reaches 1 17 (+ 89 1))
))(assert (=> 
    (and (<= 1 90) (reaches 1 17 90))
    (reaches 1 17 (- 90 1))
))

(assert (=> 
    (and (reaches 1 17 90) (not (matches-criteria 1 17 90))) 
    (reaches 1 17 (+ 90 1))
))

(assert (=> 
   (and (reaches 1 17 90) (= (rule-target 17 90) NONE)) 
    (reaches 1 17 (+ 90 1))
))(assert (=> 
    (and (<= 1 91) (reaches 1 17 91))
    (reaches 1 17 (- 91 1))
))

(assert (=> 
    (and (reaches 1 17 91) (not (matches-criteria 1 17 91))) 
    (reaches 1 17 (+ 91 1))
))

(assert (=> 
   (and (reaches 1 17 91) (= (rule-target 17 91) NONE)) 
    (reaches 1 17 (+ 91 1))
))(assert (=> 
    (and (<= 1 92) (reaches 1 17 92))
    (reaches 1 17 (- 92 1))
))

(assert (=> 
    (and (reaches 1 17 92) (not (matches-criteria 1 17 92))) 
    (reaches 1 17 (+ 92 1))
))

(assert (=> 
   (and (reaches 1 17 92) (= (rule-target 17 92) NONE)) 
    (reaches 1 17 (+ 92 1))
))(assert (=> 
    (and (<= 1 93) (reaches 1 17 93))
    (reaches 1 17 (- 93 1))
))

(assert (=> 
    (and (reaches 1 17 93) (not (matches-criteria 1 17 93))) 
    (reaches 1 17 (+ 93 1))
))

(assert (=> 
   (and (reaches 1 17 93) (= (rule-target 17 93) NONE)) 
    (reaches 1 17 (+ 93 1))
))(assert (=> 
    (and (<= 1 94) (reaches 1 17 94))
    (reaches 1 17 (- 94 1))
))

(assert (=> 
    (and (reaches 1 17 94) (not (matches-criteria 1 17 94))) 
    (reaches 1 17 (+ 94 1))
))

(assert (=> 
   (and (reaches 1 17 94) (= (rule-target 17 94) NONE)) 
    (reaches 1 17 (+ 94 1))
))(assert (=> 
    (and (<= 1 95) (reaches 1 17 95))
    (reaches 1 17 (- 95 1))
))

(assert (=> 
    (and (reaches 1 17 95) (not (matches-criteria 1 17 95))) 
    (reaches 1 17 (+ 95 1))
))

(assert (=> 
   (and (reaches 1 17 95) (= (rule-target 17 95) NONE)) 
    (reaches 1 17 (+ 95 1))
))(assert (=> 
    (and (<= 1 96) (reaches 1 17 96))
    (reaches 1 17 (- 96 1))
))

(assert (=> 
    (and (reaches 1 17 96) (not (matches-criteria 1 17 96))) 
    (reaches 1 17 (+ 96 1))
))

(assert (=> 
   (and (reaches 1 17 96) (= (rule-target 17 96) NONE)) 
    (reaches 1 17 (+ 96 1))
))(assert (=> 
    (and (<= 1 97) (reaches 1 17 97))
    (reaches 1 17 (- 97 1))
))

(assert (=> 
    (and (reaches 1 17 97) (not (matches-criteria 1 17 97))) 
    (reaches 1 17 (+ 97 1))
))

(assert (=> 
   (and (reaches 1 17 97) (= (rule-target 17 97) NONE)) 
    (reaches 1 17 (+ 97 1))
))(assert (=> 
    (and (<= 1 98) (reaches 1 17 98))
    (reaches 1 17 (- 98 1))
))

(assert (=> 
    (and (reaches 1 17 98) (not (matches-criteria 1 17 98))) 
    (reaches 1 17 (+ 98 1))
))

(assert (=> 
   (and (reaches 1 17 98) (= (rule-target 17 98) NONE)) 
    (reaches 1 17 (+ 98 1))
))(assert (=> 
    (and (<= 1 99) (reaches 1 17 99))
    (reaches 1 17 (- 99 1))
))

(assert (=> 
    (and (reaches 1 17 99) (not (matches-criteria 1 17 99))) 
    (reaches 1 17 (+ 99 1))
))

(assert (=> 
   (and (reaches 1 17 99) (= (rule-target 17 99) NONE)) 
    (reaches 1 17 (+ 99 1))
))(assert (=> 
    (and (<= 1 100) (reaches 1 17 100))
    (reaches 1 17 (- 100 1))
))

(assert (=> 
    (and (reaches 1 17 100) (not (matches-criteria 1 17 100))) 
    (reaches 1 17 (+ 100 1))
))

(assert (=> 
   (and (reaches 1 17 100) (= (rule-target 17 100) NONE)) 
    (reaches 1 17 (+ 100 1))
))(assert (=> 
    (and (<= 1 101) (reaches 1 17 101))
    (reaches 1 17 (- 101 1))
))

(assert (=> 
    (and (reaches 1 17 101) (not (matches-criteria 1 17 101))) 
    (reaches 1 17 (+ 101 1))
))

(assert (=> 
   (and (reaches 1 17 101) (= (rule-target 17 101) NONE)) 
    (reaches 1 17 (+ 101 1))
))(assert (=> 
    (and (<= 1 102) (reaches 1 17 102))
    (reaches 1 17 (- 102 1))
))

(assert (=> 
    (and (reaches 1 17 102) (not (matches-criteria 1 17 102))) 
    (reaches 1 17 (+ 102 1))
))

(assert (=> 
   (and (reaches 1 17 102) (= (rule-target 17 102) NONE)) 
    (reaches 1 17 (+ 102 1))
))(assert (=> 
    (and (<= 1 103) (reaches 1 17 103))
    (reaches 1 17 (- 103 1))
))

(assert (=> 
    (and (reaches 1 17 103) (not (matches-criteria 1 17 103))) 
    (reaches 1 17 (+ 103 1))
))

(assert (=> 
   (and (reaches 1 17 103) (= (rule-target 17 103) NONE)) 
    (reaches 1 17 (+ 103 1))
))(assert (=> 
    (and (<= 1 104) (reaches 1 17 104))
    (reaches 1 17 (- 104 1))
))

(assert (=> 
    (and (reaches 1 17 104) (not (matches-criteria 1 17 104))) 
    (reaches 1 17 (+ 104 1))
))

(assert (=> 
   (and (reaches 1 17 104) (= (rule-target 17 104) NONE)) 
    (reaches 1 17 (+ 104 1))
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
    (and (<= 1 6) (reaches 0 18 6))
    (reaches 0 18 (- 6 1))
))

(assert (=> 
    (and (reaches 0 18 6) (not (matches-criteria 0 18 6))) 
    (reaches 0 18 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 18 6) (= (rule-target 18 6) NONE)) 
    (reaches 0 18 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 18 7))
    (reaches 0 18 (- 7 1))
))

(assert (=> 
    (and (reaches 0 18 7) (not (matches-criteria 0 18 7))) 
    (reaches 0 18 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 18 7) (= (rule-target 18 7) NONE)) 
    (reaches 0 18 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 18 8))
    (reaches 0 18 (- 8 1))
))

(assert (=> 
    (and (reaches 0 18 8) (not (matches-criteria 0 18 8))) 
    (reaches 0 18 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 18 8) (= (rule-target 18 8) NONE)) 
    (reaches 0 18 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 18 9))
    (reaches 0 18 (- 9 1))
))

(assert (=> 
    (and (reaches 0 18 9) (not (matches-criteria 0 18 9))) 
    (reaches 0 18 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 18 9) (= (rule-target 18 9) NONE)) 
    (reaches 0 18 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 18 10))
    (reaches 0 18 (- 10 1))
))

(assert (=> 
    (and (reaches 0 18 10) (not (matches-criteria 0 18 10))) 
    (reaches 0 18 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 18 10) (= (rule-target 18 10) NONE)) 
    (reaches 0 18 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 18 11))
    (reaches 0 18 (- 11 1))
))

(assert (=> 
    (and (reaches 0 18 11) (not (matches-criteria 0 18 11))) 
    (reaches 0 18 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 18 11) (= (rule-target 18 11) NONE)) 
    (reaches 0 18 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 18 12))
    (reaches 0 18 (- 12 1))
))

(assert (=> 
    (and (reaches 0 18 12) (not (matches-criteria 0 18 12))) 
    (reaches 0 18 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 18 12) (= (rule-target 18 12) NONE)) 
    (reaches 0 18 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 18 13))
    (reaches 0 18 (- 13 1))
))

(assert (=> 
    (and (reaches 0 18 13) (not (matches-criteria 0 18 13))) 
    (reaches 0 18 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 18 13) (= (rule-target 18 13) NONE)) 
    (reaches 0 18 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 18 14))
    (reaches 0 18 (- 14 1))
))

(assert (=> 
    (and (reaches 0 18 14) (not (matches-criteria 0 18 14))) 
    (reaches 0 18 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 18 14) (= (rule-target 18 14) NONE)) 
    (reaches 0 18 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 18 15))
    (reaches 0 18 (- 15 1))
))

(assert (=> 
    (and (reaches 0 18 15) (not (matches-criteria 0 18 15))) 
    (reaches 0 18 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 18 15) (= (rule-target 18 15) NONE)) 
    (reaches 0 18 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 18 16))
    (reaches 0 18 (- 16 1))
))

(assert (=> 
    (and (reaches 0 18 16) (not (matches-criteria 0 18 16))) 
    (reaches 0 18 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 18 16) (= (rule-target 18 16) NONE)) 
    (reaches 0 18 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 18 17))
    (reaches 0 18 (- 17 1))
))

(assert (=> 
    (and (reaches 0 18 17) (not (matches-criteria 0 18 17))) 
    (reaches 0 18 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 18 17) (= (rule-target 18 17) NONE)) 
    (reaches 0 18 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 18 18))
    (reaches 0 18 (- 18 1))
))

(assert (=> 
    (and (reaches 0 18 18) (not (matches-criteria 0 18 18))) 
    (reaches 0 18 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 18 18) (= (rule-target 18 18) NONE)) 
    (reaches 0 18 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 18 19))
    (reaches 0 18 (- 19 1))
))

(assert (=> 
    (and (reaches 0 18 19) (not (matches-criteria 0 18 19))) 
    (reaches 0 18 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 18 19) (= (rule-target 18 19) NONE)) 
    (reaches 0 18 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 18 20))
    (reaches 0 18 (- 20 1))
))

(assert (=> 
    (and (reaches 0 18 20) (not (matches-criteria 0 18 20))) 
    (reaches 0 18 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 18 20) (= (rule-target 18 20) NONE)) 
    (reaches 0 18 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 18 21))
    (reaches 0 18 (- 21 1))
))

(assert (=> 
    (and (reaches 0 18 21) (not (matches-criteria 0 18 21))) 
    (reaches 0 18 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 18 21) (= (rule-target 18 21) NONE)) 
    (reaches 0 18 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 18 22))
    (reaches 0 18 (- 22 1))
))

(assert (=> 
    (and (reaches 0 18 22) (not (matches-criteria 0 18 22))) 
    (reaches 0 18 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 18 22) (= (rule-target 18 22) NONE)) 
    (reaches 0 18 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 18 23))
    (reaches 0 18 (- 23 1))
))

(assert (=> 
    (and (reaches 0 18 23) (not (matches-criteria 0 18 23))) 
    (reaches 0 18 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 18 23) (= (rule-target 18 23) NONE)) 
    (reaches 0 18 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 18 24))
    (reaches 0 18 (- 24 1))
))

(assert (=> 
    (and (reaches 0 18 24) (not (matches-criteria 0 18 24))) 
    (reaches 0 18 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 18 24) (= (rule-target 18 24) NONE)) 
    (reaches 0 18 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 18 25))
    (reaches 0 18 (- 25 1))
))

(assert (=> 
    (and (reaches 0 18 25) (not (matches-criteria 0 18 25))) 
    (reaches 0 18 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 18 25) (= (rule-target 18 25) NONE)) 
    (reaches 0 18 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 18 26))
    (reaches 0 18 (- 26 1))
))

(assert (=> 
    (and (reaches 0 18 26) (not (matches-criteria 0 18 26))) 
    (reaches 0 18 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 18 26) (= (rule-target 18 26) NONE)) 
    (reaches 0 18 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 18 27))
    (reaches 0 18 (- 27 1))
))

(assert (=> 
    (and (reaches 0 18 27) (not (matches-criteria 0 18 27))) 
    (reaches 0 18 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 18 27) (= (rule-target 18 27) NONE)) 
    (reaches 0 18 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 18 28))
    (reaches 0 18 (- 28 1))
))

(assert (=> 
    (and (reaches 0 18 28) (not (matches-criteria 0 18 28))) 
    (reaches 0 18 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 18 28) (= (rule-target 18 28) NONE)) 
    (reaches 0 18 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 18 29))
    (reaches 0 18 (- 29 1))
))

(assert (=> 
    (and (reaches 0 18 29) (not (matches-criteria 0 18 29))) 
    (reaches 0 18 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 18 29) (= (rule-target 18 29) NONE)) 
    (reaches 0 18 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 18 30))
    (reaches 0 18 (- 30 1))
))

(assert (=> 
    (and (reaches 0 18 30) (not (matches-criteria 0 18 30))) 
    (reaches 0 18 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 18 30) (= (rule-target 18 30) NONE)) 
    (reaches 0 18 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 18 31))
    (reaches 0 18 (- 31 1))
))

(assert (=> 
    (and (reaches 0 18 31) (not (matches-criteria 0 18 31))) 
    (reaches 0 18 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 18 31) (= (rule-target 18 31) NONE)) 
    (reaches 0 18 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 18 32))
    (reaches 0 18 (- 32 1))
))

(assert (=> 
    (and (reaches 0 18 32) (not (matches-criteria 0 18 32))) 
    (reaches 0 18 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 18 32) (= (rule-target 18 32) NONE)) 
    (reaches 0 18 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 18 33))
    (reaches 0 18 (- 33 1))
))

(assert (=> 
    (and (reaches 0 18 33) (not (matches-criteria 0 18 33))) 
    (reaches 0 18 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 18 33) (= (rule-target 18 33) NONE)) 
    (reaches 0 18 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 18 34))
    (reaches 0 18 (- 34 1))
))

(assert (=> 
    (and (reaches 0 18 34) (not (matches-criteria 0 18 34))) 
    (reaches 0 18 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 18 34) (= (rule-target 18 34) NONE)) 
    (reaches 0 18 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 18 35))
    (reaches 0 18 (- 35 1))
))

(assert (=> 
    (and (reaches 0 18 35) (not (matches-criteria 0 18 35))) 
    (reaches 0 18 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 18 35) (= (rule-target 18 35) NONE)) 
    (reaches 0 18 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 18 36))
    (reaches 0 18 (- 36 1))
))

(assert (=> 
    (and (reaches 0 18 36) (not (matches-criteria 0 18 36))) 
    (reaches 0 18 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 18 36) (= (rule-target 18 36) NONE)) 
    (reaches 0 18 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 18 37))
    (reaches 0 18 (- 37 1))
))

(assert (=> 
    (and (reaches 0 18 37) (not (matches-criteria 0 18 37))) 
    (reaches 0 18 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 18 37) (= (rule-target 18 37) NONE)) 
    (reaches 0 18 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 18 38))
    (reaches 0 18 (- 38 1))
))

(assert (=> 
    (and (reaches 0 18 38) (not (matches-criteria 0 18 38))) 
    (reaches 0 18 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 18 38) (= (rule-target 18 38) NONE)) 
    (reaches 0 18 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 18 39))
    (reaches 0 18 (- 39 1))
))

(assert (=> 
    (and (reaches 0 18 39) (not (matches-criteria 0 18 39))) 
    (reaches 0 18 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 18 39) (= (rule-target 18 39) NONE)) 
    (reaches 0 18 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 18 40))
    (reaches 0 18 (- 40 1))
))

(assert (=> 
    (and (reaches 0 18 40) (not (matches-criteria 0 18 40))) 
    (reaches 0 18 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 18 40) (= (rule-target 18 40) NONE)) 
    (reaches 0 18 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 18 41))
    (reaches 0 18 (- 41 1))
))

(assert (=> 
    (and (reaches 0 18 41) (not (matches-criteria 0 18 41))) 
    (reaches 0 18 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 18 41) (= (rule-target 18 41) NONE)) 
    (reaches 0 18 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 18 42))
    (reaches 0 18 (- 42 1))
))

(assert (=> 
    (and (reaches 0 18 42) (not (matches-criteria 0 18 42))) 
    (reaches 0 18 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 18 42) (= (rule-target 18 42) NONE)) 
    (reaches 0 18 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 18 43))
    (reaches 0 18 (- 43 1))
))

(assert (=> 
    (and (reaches 0 18 43) (not (matches-criteria 0 18 43))) 
    (reaches 0 18 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 18 43) (= (rule-target 18 43) NONE)) 
    (reaches 0 18 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 18 44))
    (reaches 0 18 (- 44 1))
))

(assert (=> 
    (and (reaches 0 18 44) (not (matches-criteria 0 18 44))) 
    (reaches 0 18 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 18 44) (= (rule-target 18 44) NONE)) 
    (reaches 0 18 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 18 45))
    (reaches 0 18 (- 45 1))
))

(assert (=> 
    (and (reaches 0 18 45) (not (matches-criteria 0 18 45))) 
    (reaches 0 18 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 18 45) (= (rule-target 18 45) NONE)) 
    (reaches 0 18 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 18 46))
    (reaches 0 18 (- 46 1))
))

(assert (=> 
    (and (reaches 0 18 46) (not (matches-criteria 0 18 46))) 
    (reaches 0 18 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 18 46) (= (rule-target 18 46) NONE)) 
    (reaches 0 18 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 18 47))
    (reaches 0 18 (- 47 1))
))

(assert (=> 
    (and (reaches 0 18 47) (not (matches-criteria 0 18 47))) 
    (reaches 0 18 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 18 47) (= (rule-target 18 47) NONE)) 
    (reaches 0 18 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 18 48))
    (reaches 0 18 (- 48 1))
))

(assert (=> 
    (and (reaches 0 18 48) (not (matches-criteria 0 18 48))) 
    (reaches 0 18 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 18 48) (= (rule-target 18 48) NONE)) 
    (reaches 0 18 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 18 49))
    (reaches 0 18 (- 49 1))
))

(assert (=> 
    (and (reaches 0 18 49) (not (matches-criteria 0 18 49))) 
    (reaches 0 18 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 18 49) (= (rule-target 18 49) NONE)) 
    (reaches 0 18 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 18 50))
    (reaches 0 18 (- 50 1))
))

(assert (=> 
    (and (reaches 0 18 50) (not (matches-criteria 0 18 50))) 
    (reaches 0 18 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 18 50) (= (rule-target 18 50) NONE)) 
    (reaches 0 18 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 18 51))
    (reaches 0 18 (- 51 1))
))

(assert (=> 
    (and (reaches 0 18 51) (not (matches-criteria 0 18 51))) 
    (reaches 0 18 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 18 51) (= (rule-target 18 51) NONE)) 
    (reaches 0 18 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 18 52))
    (reaches 0 18 (- 52 1))
))

(assert (=> 
    (and (reaches 0 18 52) (not (matches-criteria 0 18 52))) 
    (reaches 0 18 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 18 52) (= (rule-target 18 52) NONE)) 
    (reaches 0 18 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 18 53))
    (reaches 0 18 (- 53 1))
))

(assert (=> 
    (and (reaches 0 18 53) (not (matches-criteria 0 18 53))) 
    (reaches 0 18 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 18 53) (= (rule-target 18 53) NONE)) 
    (reaches 0 18 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 18 54))
    (reaches 0 18 (- 54 1))
))

(assert (=> 
    (and (reaches 0 18 54) (not (matches-criteria 0 18 54))) 
    (reaches 0 18 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 18 54) (= (rule-target 18 54) NONE)) 
    (reaches 0 18 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 18 55))
    (reaches 0 18 (- 55 1))
))

(assert (=> 
    (and (reaches 0 18 55) (not (matches-criteria 0 18 55))) 
    (reaches 0 18 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 18 55) (= (rule-target 18 55) NONE)) 
    (reaches 0 18 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 18 56))
    (reaches 0 18 (- 56 1))
))

(assert (=> 
    (and (reaches 0 18 56) (not (matches-criteria 0 18 56))) 
    (reaches 0 18 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 18 56) (= (rule-target 18 56) NONE)) 
    (reaches 0 18 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 18 57))
    (reaches 0 18 (- 57 1))
))

(assert (=> 
    (and (reaches 0 18 57) (not (matches-criteria 0 18 57))) 
    (reaches 0 18 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 18 57) (= (rule-target 18 57) NONE)) 
    (reaches 0 18 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 18 58))
    (reaches 0 18 (- 58 1))
))

(assert (=> 
    (and (reaches 0 18 58) (not (matches-criteria 0 18 58))) 
    (reaches 0 18 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 18 58) (= (rule-target 18 58) NONE)) 
    (reaches 0 18 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 18 59))
    (reaches 0 18 (- 59 1))
))

(assert (=> 
    (and (reaches 0 18 59) (not (matches-criteria 0 18 59))) 
    (reaches 0 18 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 18 59) (= (rule-target 18 59) NONE)) 
    (reaches 0 18 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 18 60))
    (reaches 0 18 (- 60 1))
))

(assert (=> 
    (and (reaches 0 18 60) (not (matches-criteria 0 18 60))) 
    (reaches 0 18 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 18 60) (= (rule-target 18 60) NONE)) 
    (reaches 0 18 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 18 61))
    (reaches 0 18 (- 61 1))
))

(assert (=> 
    (and (reaches 0 18 61) (not (matches-criteria 0 18 61))) 
    (reaches 0 18 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 18 61) (= (rule-target 18 61) NONE)) 
    (reaches 0 18 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 18 62))
    (reaches 0 18 (- 62 1))
))

(assert (=> 
    (and (reaches 0 18 62) (not (matches-criteria 0 18 62))) 
    (reaches 0 18 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 18 62) (= (rule-target 18 62) NONE)) 
    (reaches 0 18 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 18 63))
    (reaches 0 18 (- 63 1))
))

(assert (=> 
    (and (reaches 0 18 63) (not (matches-criteria 0 18 63))) 
    (reaches 0 18 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 18 63) (= (rule-target 18 63) NONE)) 
    (reaches 0 18 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 18 64))
    (reaches 0 18 (- 64 1))
))

(assert (=> 
    (and (reaches 0 18 64) (not (matches-criteria 0 18 64))) 
    (reaches 0 18 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 18 64) (= (rule-target 18 64) NONE)) 
    (reaches 0 18 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 18 65))
    (reaches 0 18 (- 65 1))
))

(assert (=> 
    (and (reaches 0 18 65) (not (matches-criteria 0 18 65))) 
    (reaches 0 18 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 18 65) (= (rule-target 18 65) NONE)) 
    (reaches 0 18 (+ 65 1))
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
    (and (<= 1 6) (reaches 1 18 6))
    (reaches 1 18 (- 6 1))
))

(assert (=> 
    (and (reaches 1 18 6) (not (matches-criteria 1 18 6))) 
    (reaches 1 18 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 18 6) (= (rule-target 18 6) NONE)) 
    (reaches 1 18 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 18 7))
    (reaches 1 18 (- 7 1))
))

(assert (=> 
    (and (reaches 1 18 7) (not (matches-criteria 1 18 7))) 
    (reaches 1 18 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 18 7) (= (rule-target 18 7) NONE)) 
    (reaches 1 18 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 18 8))
    (reaches 1 18 (- 8 1))
))

(assert (=> 
    (and (reaches 1 18 8) (not (matches-criteria 1 18 8))) 
    (reaches 1 18 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 18 8) (= (rule-target 18 8) NONE)) 
    (reaches 1 18 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 18 9))
    (reaches 1 18 (- 9 1))
))

(assert (=> 
    (and (reaches 1 18 9) (not (matches-criteria 1 18 9))) 
    (reaches 1 18 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 18 9) (= (rule-target 18 9) NONE)) 
    (reaches 1 18 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 18 10))
    (reaches 1 18 (- 10 1))
))

(assert (=> 
    (and (reaches 1 18 10) (not (matches-criteria 1 18 10))) 
    (reaches 1 18 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 18 10) (= (rule-target 18 10) NONE)) 
    (reaches 1 18 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 18 11))
    (reaches 1 18 (- 11 1))
))

(assert (=> 
    (and (reaches 1 18 11) (not (matches-criteria 1 18 11))) 
    (reaches 1 18 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 18 11) (= (rule-target 18 11) NONE)) 
    (reaches 1 18 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 18 12))
    (reaches 1 18 (- 12 1))
))

(assert (=> 
    (and (reaches 1 18 12) (not (matches-criteria 1 18 12))) 
    (reaches 1 18 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 18 12) (= (rule-target 18 12) NONE)) 
    (reaches 1 18 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 18 13))
    (reaches 1 18 (- 13 1))
))

(assert (=> 
    (and (reaches 1 18 13) (not (matches-criteria 1 18 13))) 
    (reaches 1 18 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 18 13) (= (rule-target 18 13) NONE)) 
    (reaches 1 18 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 18 14))
    (reaches 1 18 (- 14 1))
))

(assert (=> 
    (and (reaches 1 18 14) (not (matches-criteria 1 18 14))) 
    (reaches 1 18 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 18 14) (= (rule-target 18 14) NONE)) 
    (reaches 1 18 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 18 15))
    (reaches 1 18 (- 15 1))
))

(assert (=> 
    (and (reaches 1 18 15) (not (matches-criteria 1 18 15))) 
    (reaches 1 18 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 18 15) (= (rule-target 18 15) NONE)) 
    (reaches 1 18 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 18 16))
    (reaches 1 18 (- 16 1))
))

(assert (=> 
    (and (reaches 1 18 16) (not (matches-criteria 1 18 16))) 
    (reaches 1 18 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 18 16) (= (rule-target 18 16) NONE)) 
    (reaches 1 18 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 18 17))
    (reaches 1 18 (- 17 1))
))

(assert (=> 
    (and (reaches 1 18 17) (not (matches-criteria 1 18 17))) 
    (reaches 1 18 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 18 17) (= (rule-target 18 17) NONE)) 
    (reaches 1 18 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 18 18))
    (reaches 1 18 (- 18 1))
))

(assert (=> 
    (and (reaches 1 18 18) (not (matches-criteria 1 18 18))) 
    (reaches 1 18 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 18 18) (= (rule-target 18 18) NONE)) 
    (reaches 1 18 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 18 19))
    (reaches 1 18 (- 19 1))
))

(assert (=> 
    (and (reaches 1 18 19) (not (matches-criteria 1 18 19))) 
    (reaches 1 18 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 18 19) (= (rule-target 18 19) NONE)) 
    (reaches 1 18 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 18 20))
    (reaches 1 18 (- 20 1))
))

(assert (=> 
    (and (reaches 1 18 20) (not (matches-criteria 1 18 20))) 
    (reaches 1 18 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 18 20) (= (rule-target 18 20) NONE)) 
    (reaches 1 18 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 18 21))
    (reaches 1 18 (- 21 1))
))

(assert (=> 
    (and (reaches 1 18 21) (not (matches-criteria 1 18 21))) 
    (reaches 1 18 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 18 21) (= (rule-target 18 21) NONE)) 
    (reaches 1 18 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 18 22))
    (reaches 1 18 (- 22 1))
))

(assert (=> 
    (and (reaches 1 18 22) (not (matches-criteria 1 18 22))) 
    (reaches 1 18 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 18 22) (= (rule-target 18 22) NONE)) 
    (reaches 1 18 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 18 23))
    (reaches 1 18 (- 23 1))
))

(assert (=> 
    (and (reaches 1 18 23) (not (matches-criteria 1 18 23))) 
    (reaches 1 18 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 18 23) (= (rule-target 18 23) NONE)) 
    (reaches 1 18 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 18 24))
    (reaches 1 18 (- 24 1))
))

(assert (=> 
    (and (reaches 1 18 24) (not (matches-criteria 1 18 24))) 
    (reaches 1 18 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 18 24) (= (rule-target 18 24) NONE)) 
    (reaches 1 18 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 18 25))
    (reaches 1 18 (- 25 1))
))

(assert (=> 
    (and (reaches 1 18 25) (not (matches-criteria 1 18 25))) 
    (reaches 1 18 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 18 25) (= (rule-target 18 25) NONE)) 
    (reaches 1 18 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 18 26))
    (reaches 1 18 (- 26 1))
))

(assert (=> 
    (and (reaches 1 18 26) (not (matches-criteria 1 18 26))) 
    (reaches 1 18 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 18 26) (= (rule-target 18 26) NONE)) 
    (reaches 1 18 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 18 27))
    (reaches 1 18 (- 27 1))
))

(assert (=> 
    (and (reaches 1 18 27) (not (matches-criteria 1 18 27))) 
    (reaches 1 18 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 18 27) (= (rule-target 18 27) NONE)) 
    (reaches 1 18 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 18 28))
    (reaches 1 18 (- 28 1))
))

(assert (=> 
    (and (reaches 1 18 28) (not (matches-criteria 1 18 28))) 
    (reaches 1 18 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 18 28) (= (rule-target 18 28) NONE)) 
    (reaches 1 18 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 18 29))
    (reaches 1 18 (- 29 1))
))

(assert (=> 
    (and (reaches 1 18 29) (not (matches-criteria 1 18 29))) 
    (reaches 1 18 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 18 29) (= (rule-target 18 29) NONE)) 
    (reaches 1 18 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 18 30))
    (reaches 1 18 (- 30 1))
))

(assert (=> 
    (and (reaches 1 18 30) (not (matches-criteria 1 18 30))) 
    (reaches 1 18 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 18 30) (= (rule-target 18 30) NONE)) 
    (reaches 1 18 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 18 31))
    (reaches 1 18 (- 31 1))
))

(assert (=> 
    (and (reaches 1 18 31) (not (matches-criteria 1 18 31))) 
    (reaches 1 18 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 18 31) (= (rule-target 18 31) NONE)) 
    (reaches 1 18 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 18 32))
    (reaches 1 18 (- 32 1))
))

(assert (=> 
    (and (reaches 1 18 32) (not (matches-criteria 1 18 32))) 
    (reaches 1 18 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 18 32) (= (rule-target 18 32) NONE)) 
    (reaches 1 18 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 18 33))
    (reaches 1 18 (- 33 1))
))

(assert (=> 
    (and (reaches 1 18 33) (not (matches-criteria 1 18 33))) 
    (reaches 1 18 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 18 33) (= (rule-target 18 33) NONE)) 
    (reaches 1 18 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 18 34))
    (reaches 1 18 (- 34 1))
))

(assert (=> 
    (and (reaches 1 18 34) (not (matches-criteria 1 18 34))) 
    (reaches 1 18 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 18 34) (= (rule-target 18 34) NONE)) 
    (reaches 1 18 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 18 35))
    (reaches 1 18 (- 35 1))
))

(assert (=> 
    (and (reaches 1 18 35) (not (matches-criteria 1 18 35))) 
    (reaches 1 18 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 18 35) (= (rule-target 18 35) NONE)) 
    (reaches 1 18 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 18 36))
    (reaches 1 18 (- 36 1))
))

(assert (=> 
    (and (reaches 1 18 36) (not (matches-criteria 1 18 36))) 
    (reaches 1 18 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 18 36) (= (rule-target 18 36) NONE)) 
    (reaches 1 18 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 18 37))
    (reaches 1 18 (- 37 1))
))

(assert (=> 
    (and (reaches 1 18 37) (not (matches-criteria 1 18 37))) 
    (reaches 1 18 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 18 37) (= (rule-target 18 37) NONE)) 
    (reaches 1 18 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 18 38))
    (reaches 1 18 (- 38 1))
))

(assert (=> 
    (and (reaches 1 18 38) (not (matches-criteria 1 18 38))) 
    (reaches 1 18 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 18 38) (= (rule-target 18 38) NONE)) 
    (reaches 1 18 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 18 39))
    (reaches 1 18 (- 39 1))
))

(assert (=> 
    (and (reaches 1 18 39) (not (matches-criteria 1 18 39))) 
    (reaches 1 18 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 18 39) (= (rule-target 18 39) NONE)) 
    (reaches 1 18 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 18 40))
    (reaches 1 18 (- 40 1))
))

(assert (=> 
    (and (reaches 1 18 40) (not (matches-criteria 1 18 40))) 
    (reaches 1 18 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 18 40) (= (rule-target 18 40) NONE)) 
    (reaches 1 18 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 18 41))
    (reaches 1 18 (- 41 1))
))

(assert (=> 
    (and (reaches 1 18 41) (not (matches-criteria 1 18 41))) 
    (reaches 1 18 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 18 41) (= (rule-target 18 41) NONE)) 
    (reaches 1 18 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 18 42))
    (reaches 1 18 (- 42 1))
))

(assert (=> 
    (and (reaches 1 18 42) (not (matches-criteria 1 18 42))) 
    (reaches 1 18 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 18 42) (= (rule-target 18 42) NONE)) 
    (reaches 1 18 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 18 43))
    (reaches 1 18 (- 43 1))
))

(assert (=> 
    (and (reaches 1 18 43) (not (matches-criteria 1 18 43))) 
    (reaches 1 18 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 18 43) (= (rule-target 18 43) NONE)) 
    (reaches 1 18 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 18 44))
    (reaches 1 18 (- 44 1))
))

(assert (=> 
    (and (reaches 1 18 44) (not (matches-criteria 1 18 44))) 
    (reaches 1 18 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 18 44) (= (rule-target 18 44) NONE)) 
    (reaches 1 18 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 18 45))
    (reaches 1 18 (- 45 1))
))

(assert (=> 
    (and (reaches 1 18 45) (not (matches-criteria 1 18 45))) 
    (reaches 1 18 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 18 45) (= (rule-target 18 45) NONE)) 
    (reaches 1 18 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 18 46))
    (reaches 1 18 (- 46 1))
))

(assert (=> 
    (and (reaches 1 18 46) (not (matches-criteria 1 18 46))) 
    (reaches 1 18 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 18 46) (= (rule-target 18 46) NONE)) 
    (reaches 1 18 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 18 47))
    (reaches 1 18 (- 47 1))
))

(assert (=> 
    (and (reaches 1 18 47) (not (matches-criteria 1 18 47))) 
    (reaches 1 18 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 18 47) (= (rule-target 18 47) NONE)) 
    (reaches 1 18 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 18 48))
    (reaches 1 18 (- 48 1))
))

(assert (=> 
    (and (reaches 1 18 48) (not (matches-criteria 1 18 48))) 
    (reaches 1 18 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 18 48) (= (rule-target 18 48) NONE)) 
    (reaches 1 18 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 18 49))
    (reaches 1 18 (- 49 1))
))

(assert (=> 
    (and (reaches 1 18 49) (not (matches-criteria 1 18 49))) 
    (reaches 1 18 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 18 49) (= (rule-target 18 49) NONE)) 
    (reaches 1 18 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 18 50))
    (reaches 1 18 (- 50 1))
))

(assert (=> 
    (and (reaches 1 18 50) (not (matches-criteria 1 18 50))) 
    (reaches 1 18 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 18 50) (= (rule-target 18 50) NONE)) 
    (reaches 1 18 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 18 51))
    (reaches 1 18 (- 51 1))
))

(assert (=> 
    (and (reaches 1 18 51) (not (matches-criteria 1 18 51))) 
    (reaches 1 18 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 18 51) (= (rule-target 18 51) NONE)) 
    (reaches 1 18 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 18 52))
    (reaches 1 18 (- 52 1))
))

(assert (=> 
    (and (reaches 1 18 52) (not (matches-criteria 1 18 52))) 
    (reaches 1 18 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 18 52) (= (rule-target 18 52) NONE)) 
    (reaches 1 18 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 18 53))
    (reaches 1 18 (- 53 1))
))

(assert (=> 
    (and (reaches 1 18 53) (not (matches-criteria 1 18 53))) 
    (reaches 1 18 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 18 53) (= (rule-target 18 53) NONE)) 
    (reaches 1 18 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 18 54))
    (reaches 1 18 (- 54 1))
))

(assert (=> 
    (and (reaches 1 18 54) (not (matches-criteria 1 18 54))) 
    (reaches 1 18 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 18 54) (= (rule-target 18 54) NONE)) 
    (reaches 1 18 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 18 55))
    (reaches 1 18 (- 55 1))
))

(assert (=> 
    (and (reaches 1 18 55) (not (matches-criteria 1 18 55))) 
    (reaches 1 18 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 18 55) (= (rule-target 18 55) NONE)) 
    (reaches 1 18 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 18 56))
    (reaches 1 18 (- 56 1))
))

(assert (=> 
    (and (reaches 1 18 56) (not (matches-criteria 1 18 56))) 
    (reaches 1 18 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 18 56) (= (rule-target 18 56) NONE)) 
    (reaches 1 18 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 18 57))
    (reaches 1 18 (- 57 1))
))

(assert (=> 
    (and (reaches 1 18 57) (not (matches-criteria 1 18 57))) 
    (reaches 1 18 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 18 57) (= (rule-target 18 57) NONE)) 
    (reaches 1 18 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 18 58))
    (reaches 1 18 (- 58 1))
))

(assert (=> 
    (and (reaches 1 18 58) (not (matches-criteria 1 18 58))) 
    (reaches 1 18 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 18 58) (= (rule-target 18 58) NONE)) 
    (reaches 1 18 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 18 59))
    (reaches 1 18 (- 59 1))
))

(assert (=> 
    (and (reaches 1 18 59) (not (matches-criteria 1 18 59))) 
    (reaches 1 18 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 18 59) (= (rule-target 18 59) NONE)) 
    (reaches 1 18 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 18 60))
    (reaches 1 18 (- 60 1))
))

(assert (=> 
    (and (reaches 1 18 60) (not (matches-criteria 1 18 60))) 
    (reaches 1 18 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 18 60) (= (rule-target 18 60) NONE)) 
    (reaches 1 18 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 18 61))
    (reaches 1 18 (- 61 1))
))

(assert (=> 
    (and (reaches 1 18 61) (not (matches-criteria 1 18 61))) 
    (reaches 1 18 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 18 61) (= (rule-target 18 61) NONE)) 
    (reaches 1 18 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 18 62))
    (reaches 1 18 (- 62 1))
))

(assert (=> 
    (and (reaches 1 18 62) (not (matches-criteria 1 18 62))) 
    (reaches 1 18 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 18 62) (= (rule-target 18 62) NONE)) 
    (reaches 1 18 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 18 63))
    (reaches 1 18 (- 63 1))
))

(assert (=> 
    (and (reaches 1 18 63) (not (matches-criteria 1 18 63))) 
    (reaches 1 18 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 18 63) (= (rule-target 18 63) NONE)) 
    (reaches 1 18 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 18 64))
    (reaches 1 18 (- 64 1))
))

(assert (=> 
    (and (reaches 1 18 64) (not (matches-criteria 1 18 64))) 
    (reaches 1 18 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 18 64) (= (rule-target 18 64) NONE)) 
    (reaches 1 18 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 18 65))
    (reaches 1 18 (- 65 1))
))

(assert (=> 
    (and (reaches 1 18 65) (not (matches-criteria 1 18 65))) 
    (reaches 1 18 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 18 65) (= (rule-target 18 65) NONE)) 
    (reaches 1 18 (+ 65 1))
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
    (and (<= 1 6) (reaches 0 19 6))
    (reaches 0 19 (- 6 1))
))

(assert (=> 
    (and (reaches 0 19 6) (not (matches-criteria 0 19 6))) 
    (reaches 0 19 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 19 6) (= (rule-target 19 6) NONE)) 
    (reaches 0 19 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 19 7))
    (reaches 0 19 (- 7 1))
))

(assert (=> 
    (and (reaches 0 19 7) (not (matches-criteria 0 19 7))) 
    (reaches 0 19 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 19 7) (= (rule-target 19 7) NONE)) 
    (reaches 0 19 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 19 8))
    (reaches 0 19 (- 8 1))
))

(assert (=> 
    (and (reaches 0 19 8) (not (matches-criteria 0 19 8))) 
    (reaches 0 19 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 19 8) (= (rule-target 19 8) NONE)) 
    (reaches 0 19 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 19 9))
    (reaches 0 19 (- 9 1))
))

(assert (=> 
    (and (reaches 0 19 9) (not (matches-criteria 0 19 9))) 
    (reaches 0 19 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 19 9) (= (rule-target 19 9) NONE)) 
    (reaches 0 19 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 19 10))
    (reaches 0 19 (- 10 1))
))

(assert (=> 
    (and (reaches 0 19 10) (not (matches-criteria 0 19 10))) 
    (reaches 0 19 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 19 10) (= (rule-target 19 10) NONE)) 
    (reaches 0 19 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 19 11))
    (reaches 0 19 (- 11 1))
))

(assert (=> 
    (and (reaches 0 19 11) (not (matches-criteria 0 19 11))) 
    (reaches 0 19 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 19 11) (= (rule-target 19 11) NONE)) 
    (reaches 0 19 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 19 12))
    (reaches 0 19 (- 12 1))
))

(assert (=> 
    (and (reaches 0 19 12) (not (matches-criteria 0 19 12))) 
    (reaches 0 19 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 19 12) (= (rule-target 19 12) NONE)) 
    (reaches 0 19 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 19 13))
    (reaches 0 19 (- 13 1))
))

(assert (=> 
    (and (reaches 0 19 13) (not (matches-criteria 0 19 13))) 
    (reaches 0 19 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 19 13) (= (rule-target 19 13) NONE)) 
    (reaches 0 19 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 19 14))
    (reaches 0 19 (- 14 1))
))

(assert (=> 
    (and (reaches 0 19 14) (not (matches-criteria 0 19 14))) 
    (reaches 0 19 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 19 14) (= (rule-target 19 14) NONE)) 
    (reaches 0 19 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 19 15))
    (reaches 0 19 (- 15 1))
))

(assert (=> 
    (and (reaches 0 19 15) (not (matches-criteria 0 19 15))) 
    (reaches 0 19 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 19 15) (= (rule-target 19 15) NONE)) 
    (reaches 0 19 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 19 16))
    (reaches 0 19 (- 16 1))
))

(assert (=> 
    (and (reaches 0 19 16) (not (matches-criteria 0 19 16))) 
    (reaches 0 19 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 19 16) (= (rule-target 19 16) NONE)) 
    (reaches 0 19 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 19 17))
    (reaches 0 19 (- 17 1))
))

(assert (=> 
    (and (reaches 0 19 17) (not (matches-criteria 0 19 17))) 
    (reaches 0 19 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 19 17) (= (rule-target 19 17) NONE)) 
    (reaches 0 19 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 19 18))
    (reaches 0 19 (- 18 1))
))

(assert (=> 
    (and (reaches 0 19 18) (not (matches-criteria 0 19 18))) 
    (reaches 0 19 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 19 18) (= (rule-target 19 18) NONE)) 
    (reaches 0 19 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 19 19))
    (reaches 0 19 (- 19 1))
))

(assert (=> 
    (and (reaches 0 19 19) (not (matches-criteria 0 19 19))) 
    (reaches 0 19 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 19 19) (= (rule-target 19 19) NONE)) 
    (reaches 0 19 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 19 20))
    (reaches 0 19 (- 20 1))
))

(assert (=> 
    (and (reaches 0 19 20) (not (matches-criteria 0 19 20))) 
    (reaches 0 19 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 19 20) (= (rule-target 19 20) NONE)) 
    (reaches 0 19 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 19 21))
    (reaches 0 19 (- 21 1))
))

(assert (=> 
    (and (reaches 0 19 21) (not (matches-criteria 0 19 21))) 
    (reaches 0 19 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 19 21) (= (rule-target 19 21) NONE)) 
    (reaches 0 19 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 19 22))
    (reaches 0 19 (- 22 1))
))

(assert (=> 
    (and (reaches 0 19 22) (not (matches-criteria 0 19 22))) 
    (reaches 0 19 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 19 22) (= (rule-target 19 22) NONE)) 
    (reaches 0 19 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 19 23))
    (reaches 0 19 (- 23 1))
))

(assert (=> 
    (and (reaches 0 19 23) (not (matches-criteria 0 19 23))) 
    (reaches 0 19 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 19 23) (= (rule-target 19 23) NONE)) 
    (reaches 0 19 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 19 24))
    (reaches 0 19 (- 24 1))
))

(assert (=> 
    (and (reaches 0 19 24) (not (matches-criteria 0 19 24))) 
    (reaches 0 19 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 19 24) (= (rule-target 19 24) NONE)) 
    (reaches 0 19 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 19 25))
    (reaches 0 19 (- 25 1))
))

(assert (=> 
    (and (reaches 0 19 25) (not (matches-criteria 0 19 25))) 
    (reaches 0 19 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 19 25) (= (rule-target 19 25) NONE)) 
    (reaches 0 19 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 19 26))
    (reaches 0 19 (- 26 1))
))

(assert (=> 
    (and (reaches 0 19 26) (not (matches-criteria 0 19 26))) 
    (reaches 0 19 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 19 26) (= (rule-target 19 26) NONE)) 
    (reaches 0 19 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 19 27))
    (reaches 0 19 (- 27 1))
))

(assert (=> 
    (and (reaches 0 19 27) (not (matches-criteria 0 19 27))) 
    (reaches 0 19 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 19 27) (= (rule-target 19 27) NONE)) 
    (reaches 0 19 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 19 28))
    (reaches 0 19 (- 28 1))
))

(assert (=> 
    (and (reaches 0 19 28) (not (matches-criteria 0 19 28))) 
    (reaches 0 19 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 19 28) (= (rule-target 19 28) NONE)) 
    (reaches 0 19 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 19 29))
    (reaches 0 19 (- 29 1))
))

(assert (=> 
    (and (reaches 0 19 29) (not (matches-criteria 0 19 29))) 
    (reaches 0 19 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 19 29) (= (rule-target 19 29) NONE)) 
    (reaches 0 19 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 19 30))
    (reaches 0 19 (- 30 1))
))

(assert (=> 
    (and (reaches 0 19 30) (not (matches-criteria 0 19 30))) 
    (reaches 0 19 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 19 30) (= (rule-target 19 30) NONE)) 
    (reaches 0 19 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 19 31))
    (reaches 0 19 (- 31 1))
))

(assert (=> 
    (and (reaches 0 19 31) (not (matches-criteria 0 19 31))) 
    (reaches 0 19 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 19 31) (= (rule-target 19 31) NONE)) 
    (reaches 0 19 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 19 32))
    (reaches 0 19 (- 32 1))
))

(assert (=> 
    (and (reaches 0 19 32) (not (matches-criteria 0 19 32))) 
    (reaches 0 19 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 19 32) (= (rule-target 19 32) NONE)) 
    (reaches 0 19 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 19 33))
    (reaches 0 19 (- 33 1))
))

(assert (=> 
    (and (reaches 0 19 33) (not (matches-criteria 0 19 33))) 
    (reaches 0 19 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 19 33) (= (rule-target 19 33) NONE)) 
    (reaches 0 19 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 19 34))
    (reaches 0 19 (- 34 1))
))

(assert (=> 
    (and (reaches 0 19 34) (not (matches-criteria 0 19 34))) 
    (reaches 0 19 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 19 34) (= (rule-target 19 34) NONE)) 
    (reaches 0 19 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 19 35))
    (reaches 0 19 (- 35 1))
))

(assert (=> 
    (and (reaches 0 19 35) (not (matches-criteria 0 19 35))) 
    (reaches 0 19 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 19 35) (= (rule-target 19 35) NONE)) 
    (reaches 0 19 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 19 36))
    (reaches 0 19 (- 36 1))
))

(assert (=> 
    (and (reaches 0 19 36) (not (matches-criteria 0 19 36))) 
    (reaches 0 19 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 19 36) (= (rule-target 19 36) NONE)) 
    (reaches 0 19 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 19 37))
    (reaches 0 19 (- 37 1))
))

(assert (=> 
    (and (reaches 0 19 37) (not (matches-criteria 0 19 37))) 
    (reaches 0 19 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 19 37) (= (rule-target 19 37) NONE)) 
    (reaches 0 19 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 19 38))
    (reaches 0 19 (- 38 1))
))

(assert (=> 
    (and (reaches 0 19 38) (not (matches-criteria 0 19 38))) 
    (reaches 0 19 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 19 38) (= (rule-target 19 38) NONE)) 
    (reaches 0 19 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 19 39))
    (reaches 0 19 (- 39 1))
))

(assert (=> 
    (and (reaches 0 19 39) (not (matches-criteria 0 19 39))) 
    (reaches 0 19 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 19 39) (= (rule-target 19 39) NONE)) 
    (reaches 0 19 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 19 40))
    (reaches 0 19 (- 40 1))
))

(assert (=> 
    (and (reaches 0 19 40) (not (matches-criteria 0 19 40))) 
    (reaches 0 19 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 19 40) (= (rule-target 19 40) NONE)) 
    (reaches 0 19 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 19 41))
    (reaches 0 19 (- 41 1))
))

(assert (=> 
    (and (reaches 0 19 41) (not (matches-criteria 0 19 41))) 
    (reaches 0 19 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 19 41) (= (rule-target 19 41) NONE)) 
    (reaches 0 19 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 19 42))
    (reaches 0 19 (- 42 1))
))

(assert (=> 
    (and (reaches 0 19 42) (not (matches-criteria 0 19 42))) 
    (reaches 0 19 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 19 42) (= (rule-target 19 42) NONE)) 
    (reaches 0 19 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 19 43))
    (reaches 0 19 (- 43 1))
))

(assert (=> 
    (and (reaches 0 19 43) (not (matches-criteria 0 19 43))) 
    (reaches 0 19 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 19 43) (= (rule-target 19 43) NONE)) 
    (reaches 0 19 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 19 44))
    (reaches 0 19 (- 44 1))
))

(assert (=> 
    (and (reaches 0 19 44) (not (matches-criteria 0 19 44))) 
    (reaches 0 19 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 19 44) (= (rule-target 19 44) NONE)) 
    (reaches 0 19 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 19 45))
    (reaches 0 19 (- 45 1))
))

(assert (=> 
    (and (reaches 0 19 45) (not (matches-criteria 0 19 45))) 
    (reaches 0 19 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 19 45) (= (rule-target 19 45) NONE)) 
    (reaches 0 19 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 19 46))
    (reaches 0 19 (- 46 1))
))

(assert (=> 
    (and (reaches 0 19 46) (not (matches-criteria 0 19 46))) 
    (reaches 0 19 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 19 46) (= (rule-target 19 46) NONE)) 
    (reaches 0 19 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 19 47))
    (reaches 0 19 (- 47 1))
))

(assert (=> 
    (and (reaches 0 19 47) (not (matches-criteria 0 19 47))) 
    (reaches 0 19 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 19 47) (= (rule-target 19 47) NONE)) 
    (reaches 0 19 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 19 48))
    (reaches 0 19 (- 48 1))
))

(assert (=> 
    (and (reaches 0 19 48) (not (matches-criteria 0 19 48))) 
    (reaches 0 19 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 19 48) (= (rule-target 19 48) NONE)) 
    (reaches 0 19 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 19 49))
    (reaches 0 19 (- 49 1))
))

(assert (=> 
    (and (reaches 0 19 49) (not (matches-criteria 0 19 49))) 
    (reaches 0 19 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 19 49) (= (rule-target 19 49) NONE)) 
    (reaches 0 19 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 19 50))
    (reaches 0 19 (- 50 1))
))

(assert (=> 
    (and (reaches 0 19 50) (not (matches-criteria 0 19 50))) 
    (reaches 0 19 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 19 50) (= (rule-target 19 50) NONE)) 
    (reaches 0 19 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 19 51))
    (reaches 0 19 (- 51 1))
))

(assert (=> 
    (and (reaches 0 19 51) (not (matches-criteria 0 19 51))) 
    (reaches 0 19 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 19 51) (= (rule-target 19 51) NONE)) 
    (reaches 0 19 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 19 52))
    (reaches 0 19 (- 52 1))
))

(assert (=> 
    (and (reaches 0 19 52) (not (matches-criteria 0 19 52))) 
    (reaches 0 19 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 19 52) (= (rule-target 19 52) NONE)) 
    (reaches 0 19 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 19 53))
    (reaches 0 19 (- 53 1))
))

(assert (=> 
    (and (reaches 0 19 53) (not (matches-criteria 0 19 53))) 
    (reaches 0 19 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 19 53) (= (rule-target 19 53) NONE)) 
    (reaches 0 19 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 19 54))
    (reaches 0 19 (- 54 1))
))

(assert (=> 
    (and (reaches 0 19 54) (not (matches-criteria 0 19 54))) 
    (reaches 0 19 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 19 54) (= (rule-target 19 54) NONE)) 
    (reaches 0 19 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 19 55))
    (reaches 0 19 (- 55 1))
))

(assert (=> 
    (and (reaches 0 19 55) (not (matches-criteria 0 19 55))) 
    (reaches 0 19 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 19 55) (= (rule-target 19 55) NONE)) 
    (reaches 0 19 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 19 56))
    (reaches 0 19 (- 56 1))
))

(assert (=> 
    (and (reaches 0 19 56) (not (matches-criteria 0 19 56))) 
    (reaches 0 19 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 19 56) (= (rule-target 19 56) NONE)) 
    (reaches 0 19 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 19 57))
    (reaches 0 19 (- 57 1))
))

(assert (=> 
    (and (reaches 0 19 57) (not (matches-criteria 0 19 57))) 
    (reaches 0 19 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 19 57) (= (rule-target 19 57) NONE)) 
    (reaches 0 19 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 19 58))
    (reaches 0 19 (- 58 1))
))

(assert (=> 
    (and (reaches 0 19 58) (not (matches-criteria 0 19 58))) 
    (reaches 0 19 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 19 58) (= (rule-target 19 58) NONE)) 
    (reaches 0 19 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 19 59))
    (reaches 0 19 (- 59 1))
))

(assert (=> 
    (and (reaches 0 19 59) (not (matches-criteria 0 19 59))) 
    (reaches 0 19 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 19 59) (= (rule-target 19 59) NONE)) 
    (reaches 0 19 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 19 60))
    (reaches 0 19 (- 60 1))
))

(assert (=> 
    (and (reaches 0 19 60) (not (matches-criteria 0 19 60))) 
    (reaches 0 19 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 19 60) (= (rule-target 19 60) NONE)) 
    (reaches 0 19 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 19 61))
    (reaches 0 19 (- 61 1))
))

(assert (=> 
    (and (reaches 0 19 61) (not (matches-criteria 0 19 61))) 
    (reaches 0 19 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 19 61) (= (rule-target 19 61) NONE)) 
    (reaches 0 19 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 19 62))
    (reaches 0 19 (- 62 1))
))

(assert (=> 
    (and (reaches 0 19 62) (not (matches-criteria 0 19 62))) 
    (reaches 0 19 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 19 62) (= (rule-target 19 62) NONE)) 
    (reaches 0 19 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 19 63))
    (reaches 0 19 (- 63 1))
))

(assert (=> 
    (and (reaches 0 19 63) (not (matches-criteria 0 19 63))) 
    (reaches 0 19 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 19 63) (= (rule-target 19 63) NONE)) 
    (reaches 0 19 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 19 64))
    (reaches 0 19 (- 64 1))
))

(assert (=> 
    (and (reaches 0 19 64) (not (matches-criteria 0 19 64))) 
    (reaches 0 19 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 19 64) (= (rule-target 19 64) NONE)) 
    (reaches 0 19 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 19 65))
    (reaches 0 19 (- 65 1))
))

(assert (=> 
    (and (reaches 0 19 65) (not (matches-criteria 0 19 65))) 
    (reaches 0 19 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 19 65) (= (rule-target 19 65) NONE)) 
    (reaches 0 19 (+ 65 1))
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
    (and (<= 1 6) (reaches 1 19 6))
    (reaches 1 19 (- 6 1))
))

(assert (=> 
    (and (reaches 1 19 6) (not (matches-criteria 1 19 6))) 
    (reaches 1 19 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 19 6) (= (rule-target 19 6) NONE)) 
    (reaches 1 19 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 19 7))
    (reaches 1 19 (- 7 1))
))

(assert (=> 
    (and (reaches 1 19 7) (not (matches-criteria 1 19 7))) 
    (reaches 1 19 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 19 7) (= (rule-target 19 7) NONE)) 
    (reaches 1 19 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 19 8))
    (reaches 1 19 (- 8 1))
))

(assert (=> 
    (and (reaches 1 19 8) (not (matches-criteria 1 19 8))) 
    (reaches 1 19 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 19 8) (= (rule-target 19 8) NONE)) 
    (reaches 1 19 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 19 9))
    (reaches 1 19 (- 9 1))
))

(assert (=> 
    (and (reaches 1 19 9) (not (matches-criteria 1 19 9))) 
    (reaches 1 19 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 19 9) (= (rule-target 19 9) NONE)) 
    (reaches 1 19 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 19 10))
    (reaches 1 19 (- 10 1))
))

(assert (=> 
    (and (reaches 1 19 10) (not (matches-criteria 1 19 10))) 
    (reaches 1 19 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 19 10) (= (rule-target 19 10) NONE)) 
    (reaches 1 19 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 19 11))
    (reaches 1 19 (- 11 1))
))

(assert (=> 
    (and (reaches 1 19 11) (not (matches-criteria 1 19 11))) 
    (reaches 1 19 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 19 11) (= (rule-target 19 11) NONE)) 
    (reaches 1 19 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 19 12))
    (reaches 1 19 (- 12 1))
))

(assert (=> 
    (and (reaches 1 19 12) (not (matches-criteria 1 19 12))) 
    (reaches 1 19 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 19 12) (= (rule-target 19 12) NONE)) 
    (reaches 1 19 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 19 13))
    (reaches 1 19 (- 13 1))
))

(assert (=> 
    (and (reaches 1 19 13) (not (matches-criteria 1 19 13))) 
    (reaches 1 19 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 19 13) (= (rule-target 19 13) NONE)) 
    (reaches 1 19 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 19 14))
    (reaches 1 19 (- 14 1))
))

(assert (=> 
    (and (reaches 1 19 14) (not (matches-criteria 1 19 14))) 
    (reaches 1 19 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 19 14) (= (rule-target 19 14) NONE)) 
    (reaches 1 19 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 19 15))
    (reaches 1 19 (- 15 1))
))

(assert (=> 
    (and (reaches 1 19 15) (not (matches-criteria 1 19 15))) 
    (reaches 1 19 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 19 15) (= (rule-target 19 15) NONE)) 
    (reaches 1 19 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 19 16))
    (reaches 1 19 (- 16 1))
))

(assert (=> 
    (and (reaches 1 19 16) (not (matches-criteria 1 19 16))) 
    (reaches 1 19 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 19 16) (= (rule-target 19 16) NONE)) 
    (reaches 1 19 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 19 17))
    (reaches 1 19 (- 17 1))
))

(assert (=> 
    (and (reaches 1 19 17) (not (matches-criteria 1 19 17))) 
    (reaches 1 19 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 19 17) (= (rule-target 19 17) NONE)) 
    (reaches 1 19 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 19 18))
    (reaches 1 19 (- 18 1))
))

(assert (=> 
    (and (reaches 1 19 18) (not (matches-criteria 1 19 18))) 
    (reaches 1 19 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 19 18) (= (rule-target 19 18) NONE)) 
    (reaches 1 19 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 19 19))
    (reaches 1 19 (- 19 1))
))

(assert (=> 
    (and (reaches 1 19 19) (not (matches-criteria 1 19 19))) 
    (reaches 1 19 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 19 19) (= (rule-target 19 19) NONE)) 
    (reaches 1 19 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 19 20))
    (reaches 1 19 (- 20 1))
))

(assert (=> 
    (and (reaches 1 19 20) (not (matches-criteria 1 19 20))) 
    (reaches 1 19 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 19 20) (= (rule-target 19 20) NONE)) 
    (reaches 1 19 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 19 21))
    (reaches 1 19 (- 21 1))
))

(assert (=> 
    (and (reaches 1 19 21) (not (matches-criteria 1 19 21))) 
    (reaches 1 19 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 19 21) (= (rule-target 19 21) NONE)) 
    (reaches 1 19 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 19 22))
    (reaches 1 19 (- 22 1))
))

(assert (=> 
    (and (reaches 1 19 22) (not (matches-criteria 1 19 22))) 
    (reaches 1 19 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 19 22) (= (rule-target 19 22) NONE)) 
    (reaches 1 19 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 19 23))
    (reaches 1 19 (- 23 1))
))

(assert (=> 
    (and (reaches 1 19 23) (not (matches-criteria 1 19 23))) 
    (reaches 1 19 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 19 23) (= (rule-target 19 23) NONE)) 
    (reaches 1 19 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 19 24))
    (reaches 1 19 (- 24 1))
))

(assert (=> 
    (and (reaches 1 19 24) (not (matches-criteria 1 19 24))) 
    (reaches 1 19 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 19 24) (= (rule-target 19 24) NONE)) 
    (reaches 1 19 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 19 25))
    (reaches 1 19 (- 25 1))
))

(assert (=> 
    (and (reaches 1 19 25) (not (matches-criteria 1 19 25))) 
    (reaches 1 19 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 19 25) (= (rule-target 19 25) NONE)) 
    (reaches 1 19 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 19 26))
    (reaches 1 19 (- 26 1))
))

(assert (=> 
    (and (reaches 1 19 26) (not (matches-criteria 1 19 26))) 
    (reaches 1 19 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 19 26) (= (rule-target 19 26) NONE)) 
    (reaches 1 19 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 19 27))
    (reaches 1 19 (- 27 1))
))

(assert (=> 
    (and (reaches 1 19 27) (not (matches-criteria 1 19 27))) 
    (reaches 1 19 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 19 27) (= (rule-target 19 27) NONE)) 
    (reaches 1 19 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 19 28))
    (reaches 1 19 (- 28 1))
))

(assert (=> 
    (and (reaches 1 19 28) (not (matches-criteria 1 19 28))) 
    (reaches 1 19 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 19 28) (= (rule-target 19 28) NONE)) 
    (reaches 1 19 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 19 29))
    (reaches 1 19 (- 29 1))
))

(assert (=> 
    (and (reaches 1 19 29) (not (matches-criteria 1 19 29))) 
    (reaches 1 19 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 19 29) (= (rule-target 19 29) NONE)) 
    (reaches 1 19 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 19 30))
    (reaches 1 19 (- 30 1))
))

(assert (=> 
    (and (reaches 1 19 30) (not (matches-criteria 1 19 30))) 
    (reaches 1 19 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 19 30) (= (rule-target 19 30) NONE)) 
    (reaches 1 19 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 19 31))
    (reaches 1 19 (- 31 1))
))

(assert (=> 
    (and (reaches 1 19 31) (not (matches-criteria 1 19 31))) 
    (reaches 1 19 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 19 31) (= (rule-target 19 31) NONE)) 
    (reaches 1 19 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 19 32))
    (reaches 1 19 (- 32 1))
))

(assert (=> 
    (and (reaches 1 19 32) (not (matches-criteria 1 19 32))) 
    (reaches 1 19 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 19 32) (= (rule-target 19 32) NONE)) 
    (reaches 1 19 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 19 33))
    (reaches 1 19 (- 33 1))
))

(assert (=> 
    (and (reaches 1 19 33) (not (matches-criteria 1 19 33))) 
    (reaches 1 19 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 19 33) (= (rule-target 19 33) NONE)) 
    (reaches 1 19 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 19 34))
    (reaches 1 19 (- 34 1))
))

(assert (=> 
    (and (reaches 1 19 34) (not (matches-criteria 1 19 34))) 
    (reaches 1 19 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 19 34) (= (rule-target 19 34) NONE)) 
    (reaches 1 19 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 19 35))
    (reaches 1 19 (- 35 1))
))

(assert (=> 
    (and (reaches 1 19 35) (not (matches-criteria 1 19 35))) 
    (reaches 1 19 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 19 35) (= (rule-target 19 35) NONE)) 
    (reaches 1 19 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 19 36))
    (reaches 1 19 (- 36 1))
))

(assert (=> 
    (and (reaches 1 19 36) (not (matches-criteria 1 19 36))) 
    (reaches 1 19 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 19 36) (= (rule-target 19 36) NONE)) 
    (reaches 1 19 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 19 37))
    (reaches 1 19 (- 37 1))
))

(assert (=> 
    (and (reaches 1 19 37) (not (matches-criteria 1 19 37))) 
    (reaches 1 19 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 19 37) (= (rule-target 19 37) NONE)) 
    (reaches 1 19 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 19 38))
    (reaches 1 19 (- 38 1))
))

(assert (=> 
    (and (reaches 1 19 38) (not (matches-criteria 1 19 38))) 
    (reaches 1 19 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 19 38) (= (rule-target 19 38) NONE)) 
    (reaches 1 19 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 19 39))
    (reaches 1 19 (- 39 1))
))

(assert (=> 
    (and (reaches 1 19 39) (not (matches-criteria 1 19 39))) 
    (reaches 1 19 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 19 39) (= (rule-target 19 39) NONE)) 
    (reaches 1 19 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 19 40))
    (reaches 1 19 (- 40 1))
))

(assert (=> 
    (and (reaches 1 19 40) (not (matches-criteria 1 19 40))) 
    (reaches 1 19 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 19 40) (= (rule-target 19 40) NONE)) 
    (reaches 1 19 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 19 41))
    (reaches 1 19 (- 41 1))
))

(assert (=> 
    (and (reaches 1 19 41) (not (matches-criteria 1 19 41))) 
    (reaches 1 19 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 19 41) (= (rule-target 19 41) NONE)) 
    (reaches 1 19 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 19 42))
    (reaches 1 19 (- 42 1))
))

(assert (=> 
    (and (reaches 1 19 42) (not (matches-criteria 1 19 42))) 
    (reaches 1 19 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 19 42) (= (rule-target 19 42) NONE)) 
    (reaches 1 19 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 19 43))
    (reaches 1 19 (- 43 1))
))

(assert (=> 
    (and (reaches 1 19 43) (not (matches-criteria 1 19 43))) 
    (reaches 1 19 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 19 43) (= (rule-target 19 43) NONE)) 
    (reaches 1 19 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 19 44))
    (reaches 1 19 (- 44 1))
))

(assert (=> 
    (and (reaches 1 19 44) (not (matches-criteria 1 19 44))) 
    (reaches 1 19 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 19 44) (= (rule-target 19 44) NONE)) 
    (reaches 1 19 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 19 45))
    (reaches 1 19 (- 45 1))
))

(assert (=> 
    (and (reaches 1 19 45) (not (matches-criteria 1 19 45))) 
    (reaches 1 19 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 19 45) (= (rule-target 19 45) NONE)) 
    (reaches 1 19 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 19 46))
    (reaches 1 19 (- 46 1))
))

(assert (=> 
    (and (reaches 1 19 46) (not (matches-criteria 1 19 46))) 
    (reaches 1 19 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 19 46) (= (rule-target 19 46) NONE)) 
    (reaches 1 19 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 19 47))
    (reaches 1 19 (- 47 1))
))

(assert (=> 
    (and (reaches 1 19 47) (not (matches-criteria 1 19 47))) 
    (reaches 1 19 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 19 47) (= (rule-target 19 47) NONE)) 
    (reaches 1 19 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 19 48))
    (reaches 1 19 (- 48 1))
))

(assert (=> 
    (and (reaches 1 19 48) (not (matches-criteria 1 19 48))) 
    (reaches 1 19 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 19 48) (= (rule-target 19 48) NONE)) 
    (reaches 1 19 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 19 49))
    (reaches 1 19 (- 49 1))
))

(assert (=> 
    (and (reaches 1 19 49) (not (matches-criteria 1 19 49))) 
    (reaches 1 19 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 19 49) (= (rule-target 19 49) NONE)) 
    (reaches 1 19 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 19 50))
    (reaches 1 19 (- 50 1))
))

(assert (=> 
    (and (reaches 1 19 50) (not (matches-criteria 1 19 50))) 
    (reaches 1 19 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 19 50) (= (rule-target 19 50) NONE)) 
    (reaches 1 19 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 19 51))
    (reaches 1 19 (- 51 1))
))

(assert (=> 
    (and (reaches 1 19 51) (not (matches-criteria 1 19 51))) 
    (reaches 1 19 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 19 51) (= (rule-target 19 51) NONE)) 
    (reaches 1 19 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 19 52))
    (reaches 1 19 (- 52 1))
))

(assert (=> 
    (and (reaches 1 19 52) (not (matches-criteria 1 19 52))) 
    (reaches 1 19 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 19 52) (= (rule-target 19 52) NONE)) 
    (reaches 1 19 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 19 53))
    (reaches 1 19 (- 53 1))
))

(assert (=> 
    (and (reaches 1 19 53) (not (matches-criteria 1 19 53))) 
    (reaches 1 19 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 19 53) (= (rule-target 19 53) NONE)) 
    (reaches 1 19 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 19 54))
    (reaches 1 19 (- 54 1))
))

(assert (=> 
    (and (reaches 1 19 54) (not (matches-criteria 1 19 54))) 
    (reaches 1 19 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 19 54) (= (rule-target 19 54) NONE)) 
    (reaches 1 19 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 19 55))
    (reaches 1 19 (- 55 1))
))

(assert (=> 
    (and (reaches 1 19 55) (not (matches-criteria 1 19 55))) 
    (reaches 1 19 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 19 55) (= (rule-target 19 55) NONE)) 
    (reaches 1 19 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 19 56))
    (reaches 1 19 (- 56 1))
))

(assert (=> 
    (and (reaches 1 19 56) (not (matches-criteria 1 19 56))) 
    (reaches 1 19 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 19 56) (= (rule-target 19 56) NONE)) 
    (reaches 1 19 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 19 57))
    (reaches 1 19 (- 57 1))
))

(assert (=> 
    (and (reaches 1 19 57) (not (matches-criteria 1 19 57))) 
    (reaches 1 19 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 19 57) (= (rule-target 19 57) NONE)) 
    (reaches 1 19 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 19 58))
    (reaches 1 19 (- 58 1))
))

(assert (=> 
    (and (reaches 1 19 58) (not (matches-criteria 1 19 58))) 
    (reaches 1 19 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 19 58) (= (rule-target 19 58) NONE)) 
    (reaches 1 19 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 19 59))
    (reaches 1 19 (- 59 1))
))

(assert (=> 
    (and (reaches 1 19 59) (not (matches-criteria 1 19 59))) 
    (reaches 1 19 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 19 59) (= (rule-target 19 59) NONE)) 
    (reaches 1 19 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 19 60))
    (reaches 1 19 (- 60 1))
))

(assert (=> 
    (and (reaches 1 19 60) (not (matches-criteria 1 19 60))) 
    (reaches 1 19 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 19 60) (= (rule-target 19 60) NONE)) 
    (reaches 1 19 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 19 61))
    (reaches 1 19 (- 61 1))
))

(assert (=> 
    (and (reaches 1 19 61) (not (matches-criteria 1 19 61))) 
    (reaches 1 19 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 19 61) (= (rule-target 19 61) NONE)) 
    (reaches 1 19 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 19 62))
    (reaches 1 19 (- 62 1))
))

(assert (=> 
    (and (reaches 1 19 62) (not (matches-criteria 1 19 62))) 
    (reaches 1 19 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 19 62) (= (rule-target 19 62) NONE)) 
    (reaches 1 19 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 19 63))
    (reaches 1 19 (- 63 1))
))

(assert (=> 
    (and (reaches 1 19 63) (not (matches-criteria 1 19 63))) 
    (reaches 1 19 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 19 63) (= (rule-target 19 63) NONE)) 
    (reaches 1 19 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 19 64))
    (reaches 1 19 (- 64 1))
))

(assert (=> 
    (and (reaches 1 19 64) (not (matches-criteria 1 19 64))) 
    (reaches 1 19 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 19 64) (= (rule-target 19 64) NONE)) 
    (reaches 1 19 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 19 65))
    (reaches 1 19 (- 65 1))
))

(assert (=> 
    (and (reaches 1 19 65) (not (matches-criteria 1 19 65))) 
    (reaches 1 19 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 19 65) (= (rule-target 19 65) NONE)) 
    (reaches 1 19 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 36 0))
    (reaches 0 36 (- 0 1))
))

(assert (=> 
    (and (reaches 0 36 0) (not (matches-criteria 0 36 0))) 
    (reaches 0 36 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 36 0) (= (rule-target 36 0) NONE)) 
    (reaches 0 36 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 36 1))
    (reaches 0 36 (- 1 1))
))

(assert (=> 
    (and (reaches 0 36 1) (not (matches-criteria 0 36 1))) 
    (reaches 0 36 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 36 1) (= (rule-target 36 1) NONE)) 
    (reaches 0 36 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 36 2))
    (reaches 0 36 (- 2 1))
))

(assert (=> 
    (and (reaches 0 36 2) (not (matches-criteria 0 36 2))) 
    (reaches 0 36 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 36 2) (= (rule-target 36 2) NONE)) 
    (reaches 0 36 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 36 3))
    (reaches 0 36 (- 3 1))
))

(assert (=> 
    (and (reaches 0 36 3) (not (matches-criteria 0 36 3))) 
    (reaches 0 36 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 36 3) (= (rule-target 36 3) NONE)) 
    (reaches 0 36 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 36 4))
    (reaches 0 36 (- 4 1))
))

(assert (=> 
    (and (reaches 0 36 4) (not (matches-criteria 0 36 4))) 
    (reaches 0 36 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 36 4) (= (rule-target 36 4) NONE)) 
    (reaches 0 36 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 36 5))
    (reaches 0 36 (- 5 1))
))

(assert (=> 
    (and (reaches 0 36 5) (not (matches-criteria 0 36 5))) 
    (reaches 0 36 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 36 5) (= (rule-target 36 5) NONE)) 
    (reaches 0 36 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 36 6))
    (reaches 0 36 (- 6 1))
))

(assert (=> 
    (and (reaches 0 36 6) (not (matches-criteria 0 36 6))) 
    (reaches 0 36 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 36 6) (= (rule-target 36 6) NONE)) 
    (reaches 0 36 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 36 7))
    (reaches 0 36 (- 7 1))
))

(assert (=> 
    (and (reaches 0 36 7) (not (matches-criteria 0 36 7))) 
    (reaches 0 36 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 36 7) (= (rule-target 36 7) NONE)) 
    (reaches 0 36 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 36 8))
    (reaches 0 36 (- 8 1))
))

(assert (=> 
    (and (reaches 0 36 8) (not (matches-criteria 0 36 8))) 
    (reaches 0 36 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 36 8) (= (rule-target 36 8) NONE)) 
    (reaches 0 36 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 36 9))
    (reaches 0 36 (- 9 1))
))

(assert (=> 
    (and (reaches 0 36 9) (not (matches-criteria 0 36 9))) 
    (reaches 0 36 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 36 9) (= (rule-target 36 9) NONE)) 
    (reaches 0 36 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 36 10))
    (reaches 0 36 (- 10 1))
))

(assert (=> 
    (and (reaches 0 36 10) (not (matches-criteria 0 36 10))) 
    (reaches 0 36 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 36 10) (= (rule-target 36 10) NONE)) 
    (reaches 0 36 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 36 11))
    (reaches 0 36 (- 11 1))
))

(assert (=> 
    (and (reaches 0 36 11) (not (matches-criteria 0 36 11))) 
    (reaches 0 36 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 36 11) (= (rule-target 36 11) NONE)) 
    (reaches 0 36 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 36 12))
    (reaches 0 36 (- 12 1))
))

(assert (=> 
    (and (reaches 0 36 12) (not (matches-criteria 0 36 12))) 
    (reaches 0 36 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 36 12) (= (rule-target 36 12) NONE)) 
    (reaches 0 36 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 36 13))
    (reaches 0 36 (- 13 1))
))

(assert (=> 
    (and (reaches 0 36 13) (not (matches-criteria 0 36 13))) 
    (reaches 0 36 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 36 13) (= (rule-target 36 13) NONE)) 
    (reaches 0 36 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 36 14))
    (reaches 0 36 (- 14 1))
))

(assert (=> 
    (and (reaches 0 36 14) (not (matches-criteria 0 36 14))) 
    (reaches 0 36 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 36 14) (= (rule-target 36 14) NONE)) 
    (reaches 0 36 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 36 15))
    (reaches 0 36 (- 15 1))
))

(assert (=> 
    (and (reaches 0 36 15) (not (matches-criteria 0 36 15))) 
    (reaches 0 36 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 36 15) (= (rule-target 36 15) NONE)) 
    (reaches 0 36 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 36 16))
    (reaches 0 36 (- 16 1))
))

(assert (=> 
    (and (reaches 0 36 16) (not (matches-criteria 0 36 16))) 
    (reaches 0 36 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 36 16) (= (rule-target 36 16) NONE)) 
    (reaches 0 36 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 36 17))
    (reaches 0 36 (- 17 1))
))

(assert (=> 
    (and (reaches 0 36 17) (not (matches-criteria 0 36 17))) 
    (reaches 0 36 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 36 17) (= (rule-target 36 17) NONE)) 
    (reaches 0 36 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 36 18))
    (reaches 0 36 (- 18 1))
))

(assert (=> 
    (and (reaches 0 36 18) (not (matches-criteria 0 36 18))) 
    (reaches 0 36 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 36 18) (= (rule-target 36 18) NONE)) 
    (reaches 0 36 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 36 19))
    (reaches 0 36 (- 19 1))
))

(assert (=> 
    (and (reaches 0 36 19) (not (matches-criteria 0 36 19))) 
    (reaches 0 36 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 36 19) (= (rule-target 36 19) NONE)) 
    (reaches 0 36 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 36 20))
    (reaches 0 36 (- 20 1))
))

(assert (=> 
    (and (reaches 0 36 20) (not (matches-criteria 0 36 20))) 
    (reaches 0 36 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 36 20) (= (rule-target 36 20) NONE)) 
    (reaches 0 36 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 36 21))
    (reaches 0 36 (- 21 1))
))

(assert (=> 
    (and (reaches 0 36 21) (not (matches-criteria 0 36 21))) 
    (reaches 0 36 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 36 21) (= (rule-target 36 21) NONE)) 
    (reaches 0 36 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 36 22))
    (reaches 0 36 (- 22 1))
))

(assert (=> 
    (and (reaches 0 36 22) (not (matches-criteria 0 36 22))) 
    (reaches 0 36 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 36 22) (= (rule-target 36 22) NONE)) 
    (reaches 0 36 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 36 23))
    (reaches 0 36 (- 23 1))
))

(assert (=> 
    (and (reaches 0 36 23) (not (matches-criteria 0 36 23))) 
    (reaches 0 36 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 36 23) (= (rule-target 36 23) NONE)) 
    (reaches 0 36 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 36 24))
    (reaches 0 36 (- 24 1))
))

(assert (=> 
    (and (reaches 0 36 24) (not (matches-criteria 0 36 24))) 
    (reaches 0 36 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 36 24) (= (rule-target 36 24) NONE)) 
    (reaches 0 36 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 36 25))
    (reaches 0 36 (- 25 1))
))

(assert (=> 
    (and (reaches 0 36 25) (not (matches-criteria 0 36 25))) 
    (reaches 0 36 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 36 25) (= (rule-target 36 25) NONE)) 
    (reaches 0 36 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 36 26))
    (reaches 0 36 (- 26 1))
))

(assert (=> 
    (and (reaches 0 36 26) (not (matches-criteria 0 36 26))) 
    (reaches 0 36 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 36 26) (= (rule-target 36 26) NONE)) 
    (reaches 0 36 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 36 27))
    (reaches 0 36 (- 27 1))
))

(assert (=> 
    (and (reaches 0 36 27) (not (matches-criteria 0 36 27))) 
    (reaches 0 36 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 36 27) (= (rule-target 36 27) NONE)) 
    (reaches 0 36 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 36 28))
    (reaches 0 36 (- 28 1))
))

(assert (=> 
    (and (reaches 0 36 28) (not (matches-criteria 0 36 28))) 
    (reaches 0 36 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 36 28) (= (rule-target 36 28) NONE)) 
    (reaches 0 36 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 36 29))
    (reaches 0 36 (- 29 1))
))

(assert (=> 
    (and (reaches 0 36 29) (not (matches-criteria 0 36 29))) 
    (reaches 0 36 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 36 29) (= (rule-target 36 29) NONE)) 
    (reaches 0 36 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 36 30))
    (reaches 0 36 (- 30 1))
))

(assert (=> 
    (and (reaches 0 36 30) (not (matches-criteria 0 36 30))) 
    (reaches 0 36 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 36 30) (= (rule-target 36 30) NONE)) 
    (reaches 0 36 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 36 31))
    (reaches 0 36 (- 31 1))
))

(assert (=> 
    (and (reaches 0 36 31) (not (matches-criteria 0 36 31))) 
    (reaches 0 36 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 36 31) (= (rule-target 36 31) NONE)) 
    (reaches 0 36 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 36 32))
    (reaches 0 36 (- 32 1))
))

(assert (=> 
    (and (reaches 0 36 32) (not (matches-criteria 0 36 32))) 
    (reaches 0 36 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 36 32) (= (rule-target 36 32) NONE)) 
    (reaches 0 36 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 36 33))
    (reaches 0 36 (- 33 1))
))

(assert (=> 
    (and (reaches 0 36 33) (not (matches-criteria 0 36 33))) 
    (reaches 0 36 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 36 33) (= (rule-target 36 33) NONE)) 
    (reaches 0 36 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 36 34))
    (reaches 0 36 (- 34 1))
))

(assert (=> 
    (and (reaches 0 36 34) (not (matches-criteria 0 36 34))) 
    (reaches 0 36 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 36 34) (= (rule-target 36 34) NONE)) 
    (reaches 0 36 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 36 35))
    (reaches 0 36 (- 35 1))
))

(assert (=> 
    (and (reaches 0 36 35) (not (matches-criteria 0 36 35))) 
    (reaches 0 36 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 36 35) (= (rule-target 36 35) NONE)) 
    (reaches 0 36 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 36 36))
    (reaches 0 36 (- 36 1))
))

(assert (=> 
    (and (reaches 0 36 36) (not (matches-criteria 0 36 36))) 
    (reaches 0 36 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 36 36) (= (rule-target 36 36) NONE)) 
    (reaches 0 36 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 36 37))
    (reaches 0 36 (- 37 1))
))

(assert (=> 
    (and (reaches 0 36 37) (not (matches-criteria 0 36 37))) 
    (reaches 0 36 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 36 37) (= (rule-target 36 37) NONE)) 
    (reaches 0 36 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 36 38))
    (reaches 0 36 (- 38 1))
))

(assert (=> 
    (and (reaches 0 36 38) (not (matches-criteria 0 36 38))) 
    (reaches 0 36 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 36 38) (= (rule-target 36 38) NONE)) 
    (reaches 0 36 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 36 39))
    (reaches 0 36 (- 39 1))
))

(assert (=> 
    (and (reaches 0 36 39) (not (matches-criteria 0 36 39))) 
    (reaches 0 36 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 36 39) (= (rule-target 36 39) NONE)) 
    (reaches 0 36 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 36 40))
    (reaches 0 36 (- 40 1))
))

(assert (=> 
    (and (reaches 0 36 40) (not (matches-criteria 0 36 40))) 
    (reaches 0 36 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 36 40) (= (rule-target 36 40) NONE)) 
    (reaches 0 36 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 36 41))
    (reaches 0 36 (- 41 1))
))

(assert (=> 
    (and (reaches 0 36 41) (not (matches-criteria 0 36 41))) 
    (reaches 0 36 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 36 41) (= (rule-target 36 41) NONE)) 
    (reaches 0 36 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 36 42))
    (reaches 0 36 (- 42 1))
))

(assert (=> 
    (and (reaches 0 36 42) (not (matches-criteria 0 36 42))) 
    (reaches 0 36 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 36 42) (= (rule-target 36 42) NONE)) 
    (reaches 0 36 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 36 43))
    (reaches 0 36 (- 43 1))
))

(assert (=> 
    (and (reaches 0 36 43) (not (matches-criteria 0 36 43))) 
    (reaches 0 36 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 36 43) (= (rule-target 36 43) NONE)) 
    (reaches 0 36 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 36 44))
    (reaches 0 36 (- 44 1))
))

(assert (=> 
    (and (reaches 0 36 44) (not (matches-criteria 0 36 44))) 
    (reaches 0 36 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 36 44) (= (rule-target 36 44) NONE)) 
    (reaches 0 36 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 36 45))
    (reaches 0 36 (- 45 1))
))

(assert (=> 
    (and (reaches 0 36 45) (not (matches-criteria 0 36 45))) 
    (reaches 0 36 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 36 45) (= (rule-target 36 45) NONE)) 
    (reaches 0 36 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 36 46))
    (reaches 0 36 (- 46 1))
))

(assert (=> 
    (and (reaches 0 36 46) (not (matches-criteria 0 36 46))) 
    (reaches 0 36 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 36 46) (= (rule-target 36 46) NONE)) 
    (reaches 0 36 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 36 47))
    (reaches 0 36 (- 47 1))
))

(assert (=> 
    (and (reaches 0 36 47) (not (matches-criteria 0 36 47))) 
    (reaches 0 36 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 36 47) (= (rule-target 36 47) NONE)) 
    (reaches 0 36 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 36 48))
    (reaches 0 36 (- 48 1))
))

(assert (=> 
    (and (reaches 0 36 48) (not (matches-criteria 0 36 48))) 
    (reaches 0 36 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 36 48) (= (rule-target 36 48) NONE)) 
    (reaches 0 36 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 36 49))
    (reaches 0 36 (- 49 1))
))

(assert (=> 
    (and (reaches 0 36 49) (not (matches-criteria 0 36 49))) 
    (reaches 0 36 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 36 49) (= (rule-target 36 49) NONE)) 
    (reaches 0 36 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 36 50))
    (reaches 0 36 (- 50 1))
))

(assert (=> 
    (and (reaches 0 36 50) (not (matches-criteria 0 36 50))) 
    (reaches 0 36 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 36 50) (= (rule-target 36 50) NONE)) 
    (reaches 0 36 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 36 51))
    (reaches 0 36 (- 51 1))
))

(assert (=> 
    (and (reaches 0 36 51) (not (matches-criteria 0 36 51))) 
    (reaches 0 36 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 36 51) (= (rule-target 36 51) NONE)) 
    (reaches 0 36 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 36 52))
    (reaches 0 36 (- 52 1))
))

(assert (=> 
    (and (reaches 0 36 52) (not (matches-criteria 0 36 52))) 
    (reaches 0 36 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 36 52) (= (rule-target 36 52) NONE)) 
    (reaches 0 36 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 36 53))
    (reaches 0 36 (- 53 1))
))

(assert (=> 
    (and (reaches 0 36 53) (not (matches-criteria 0 36 53))) 
    (reaches 0 36 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 36 53) (= (rule-target 36 53) NONE)) 
    (reaches 0 36 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 36 54))
    (reaches 0 36 (- 54 1))
))

(assert (=> 
    (and (reaches 0 36 54) (not (matches-criteria 0 36 54))) 
    (reaches 0 36 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 36 54) (= (rule-target 36 54) NONE)) 
    (reaches 0 36 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 36 55))
    (reaches 0 36 (- 55 1))
))

(assert (=> 
    (and (reaches 0 36 55) (not (matches-criteria 0 36 55))) 
    (reaches 0 36 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 36 55) (= (rule-target 36 55) NONE)) 
    (reaches 0 36 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 36 56))
    (reaches 0 36 (- 56 1))
))

(assert (=> 
    (and (reaches 0 36 56) (not (matches-criteria 0 36 56))) 
    (reaches 0 36 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 36 56) (= (rule-target 36 56) NONE)) 
    (reaches 0 36 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 36 57))
    (reaches 0 36 (- 57 1))
))

(assert (=> 
    (and (reaches 0 36 57) (not (matches-criteria 0 36 57))) 
    (reaches 0 36 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 36 57) (= (rule-target 36 57) NONE)) 
    (reaches 0 36 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 36 58))
    (reaches 0 36 (- 58 1))
))

(assert (=> 
    (and (reaches 0 36 58) (not (matches-criteria 0 36 58))) 
    (reaches 0 36 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 36 58) (= (rule-target 36 58) NONE)) 
    (reaches 0 36 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 36 59))
    (reaches 0 36 (- 59 1))
))

(assert (=> 
    (and (reaches 0 36 59) (not (matches-criteria 0 36 59))) 
    (reaches 0 36 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 36 59) (= (rule-target 36 59) NONE)) 
    (reaches 0 36 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 36 60))
    (reaches 0 36 (- 60 1))
))

(assert (=> 
    (and (reaches 0 36 60) (not (matches-criteria 0 36 60))) 
    (reaches 0 36 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 36 60) (= (rule-target 36 60) NONE)) 
    (reaches 0 36 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 36 61))
    (reaches 0 36 (- 61 1))
))

(assert (=> 
    (and (reaches 0 36 61) (not (matches-criteria 0 36 61))) 
    (reaches 0 36 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 36 61) (= (rule-target 36 61) NONE)) 
    (reaches 0 36 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 36 62))
    (reaches 0 36 (- 62 1))
))

(assert (=> 
    (and (reaches 0 36 62) (not (matches-criteria 0 36 62))) 
    (reaches 0 36 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 36 62) (= (rule-target 36 62) NONE)) 
    (reaches 0 36 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 36 63))
    (reaches 0 36 (- 63 1))
))

(assert (=> 
    (and (reaches 0 36 63) (not (matches-criteria 0 36 63))) 
    (reaches 0 36 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 36 63) (= (rule-target 36 63) NONE)) 
    (reaches 0 36 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 36 64))
    (reaches 0 36 (- 64 1))
))

(assert (=> 
    (and (reaches 0 36 64) (not (matches-criteria 0 36 64))) 
    (reaches 0 36 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 36 64) (= (rule-target 36 64) NONE)) 
    (reaches 0 36 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 36 65))
    (reaches 0 36 (- 65 1))
))

(assert (=> 
    (and (reaches 0 36 65) (not (matches-criteria 0 36 65))) 
    (reaches 0 36 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 36 65) (= (rule-target 36 65) NONE)) 
    (reaches 0 36 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 36 0))
    (reaches 1 36 (- 0 1))
))

(assert (=> 
    (and (reaches 1 36 0) (not (matches-criteria 1 36 0))) 
    (reaches 1 36 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 36 0) (= (rule-target 36 0) NONE)) 
    (reaches 1 36 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 36 1))
    (reaches 1 36 (- 1 1))
))

(assert (=> 
    (and (reaches 1 36 1) (not (matches-criteria 1 36 1))) 
    (reaches 1 36 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 36 1) (= (rule-target 36 1) NONE)) 
    (reaches 1 36 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 36 2))
    (reaches 1 36 (- 2 1))
))

(assert (=> 
    (and (reaches 1 36 2) (not (matches-criteria 1 36 2))) 
    (reaches 1 36 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 36 2) (= (rule-target 36 2) NONE)) 
    (reaches 1 36 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 36 3))
    (reaches 1 36 (- 3 1))
))

(assert (=> 
    (and (reaches 1 36 3) (not (matches-criteria 1 36 3))) 
    (reaches 1 36 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 36 3) (= (rule-target 36 3) NONE)) 
    (reaches 1 36 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 36 4))
    (reaches 1 36 (- 4 1))
))

(assert (=> 
    (and (reaches 1 36 4) (not (matches-criteria 1 36 4))) 
    (reaches 1 36 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 36 4) (= (rule-target 36 4) NONE)) 
    (reaches 1 36 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 36 5))
    (reaches 1 36 (- 5 1))
))

(assert (=> 
    (and (reaches 1 36 5) (not (matches-criteria 1 36 5))) 
    (reaches 1 36 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 36 5) (= (rule-target 36 5) NONE)) 
    (reaches 1 36 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 36 6))
    (reaches 1 36 (- 6 1))
))

(assert (=> 
    (and (reaches 1 36 6) (not (matches-criteria 1 36 6))) 
    (reaches 1 36 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 36 6) (= (rule-target 36 6) NONE)) 
    (reaches 1 36 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 36 7))
    (reaches 1 36 (- 7 1))
))

(assert (=> 
    (and (reaches 1 36 7) (not (matches-criteria 1 36 7))) 
    (reaches 1 36 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 36 7) (= (rule-target 36 7) NONE)) 
    (reaches 1 36 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 36 8))
    (reaches 1 36 (- 8 1))
))

(assert (=> 
    (and (reaches 1 36 8) (not (matches-criteria 1 36 8))) 
    (reaches 1 36 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 36 8) (= (rule-target 36 8) NONE)) 
    (reaches 1 36 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 36 9))
    (reaches 1 36 (- 9 1))
))

(assert (=> 
    (and (reaches 1 36 9) (not (matches-criteria 1 36 9))) 
    (reaches 1 36 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 36 9) (= (rule-target 36 9) NONE)) 
    (reaches 1 36 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 36 10))
    (reaches 1 36 (- 10 1))
))

(assert (=> 
    (and (reaches 1 36 10) (not (matches-criteria 1 36 10))) 
    (reaches 1 36 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 36 10) (= (rule-target 36 10) NONE)) 
    (reaches 1 36 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 36 11))
    (reaches 1 36 (- 11 1))
))

(assert (=> 
    (and (reaches 1 36 11) (not (matches-criteria 1 36 11))) 
    (reaches 1 36 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 36 11) (= (rule-target 36 11) NONE)) 
    (reaches 1 36 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 36 12))
    (reaches 1 36 (- 12 1))
))

(assert (=> 
    (and (reaches 1 36 12) (not (matches-criteria 1 36 12))) 
    (reaches 1 36 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 36 12) (= (rule-target 36 12) NONE)) 
    (reaches 1 36 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 36 13))
    (reaches 1 36 (- 13 1))
))

(assert (=> 
    (and (reaches 1 36 13) (not (matches-criteria 1 36 13))) 
    (reaches 1 36 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 36 13) (= (rule-target 36 13) NONE)) 
    (reaches 1 36 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 36 14))
    (reaches 1 36 (- 14 1))
))

(assert (=> 
    (and (reaches 1 36 14) (not (matches-criteria 1 36 14))) 
    (reaches 1 36 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 36 14) (= (rule-target 36 14) NONE)) 
    (reaches 1 36 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 36 15))
    (reaches 1 36 (- 15 1))
))

(assert (=> 
    (and (reaches 1 36 15) (not (matches-criteria 1 36 15))) 
    (reaches 1 36 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 36 15) (= (rule-target 36 15) NONE)) 
    (reaches 1 36 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 36 16))
    (reaches 1 36 (- 16 1))
))

(assert (=> 
    (and (reaches 1 36 16) (not (matches-criteria 1 36 16))) 
    (reaches 1 36 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 36 16) (= (rule-target 36 16) NONE)) 
    (reaches 1 36 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 36 17))
    (reaches 1 36 (- 17 1))
))

(assert (=> 
    (and (reaches 1 36 17) (not (matches-criteria 1 36 17))) 
    (reaches 1 36 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 36 17) (= (rule-target 36 17) NONE)) 
    (reaches 1 36 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 36 18))
    (reaches 1 36 (- 18 1))
))

(assert (=> 
    (and (reaches 1 36 18) (not (matches-criteria 1 36 18))) 
    (reaches 1 36 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 36 18) (= (rule-target 36 18) NONE)) 
    (reaches 1 36 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 36 19))
    (reaches 1 36 (- 19 1))
))

(assert (=> 
    (and (reaches 1 36 19) (not (matches-criteria 1 36 19))) 
    (reaches 1 36 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 36 19) (= (rule-target 36 19) NONE)) 
    (reaches 1 36 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 36 20))
    (reaches 1 36 (- 20 1))
))

(assert (=> 
    (and (reaches 1 36 20) (not (matches-criteria 1 36 20))) 
    (reaches 1 36 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 36 20) (= (rule-target 36 20) NONE)) 
    (reaches 1 36 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 36 21))
    (reaches 1 36 (- 21 1))
))

(assert (=> 
    (and (reaches 1 36 21) (not (matches-criteria 1 36 21))) 
    (reaches 1 36 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 36 21) (= (rule-target 36 21) NONE)) 
    (reaches 1 36 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 36 22))
    (reaches 1 36 (- 22 1))
))

(assert (=> 
    (and (reaches 1 36 22) (not (matches-criteria 1 36 22))) 
    (reaches 1 36 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 36 22) (= (rule-target 36 22) NONE)) 
    (reaches 1 36 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 36 23))
    (reaches 1 36 (- 23 1))
))

(assert (=> 
    (and (reaches 1 36 23) (not (matches-criteria 1 36 23))) 
    (reaches 1 36 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 36 23) (= (rule-target 36 23) NONE)) 
    (reaches 1 36 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 36 24))
    (reaches 1 36 (- 24 1))
))

(assert (=> 
    (and (reaches 1 36 24) (not (matches-criteria 1 36 24))) 
    (reaches 1 36 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 36 24) (= (rule-target 36 24) NONE)) 
    (reaches 1 36 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 36 25))
    (reaches 1 36 (- 25 1))
))

(assert (=> 
    (and (reaches 1 36 25) (not (matches-criteria 1 36 25))) 
    (reaches 1 36 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 36 25) (= (rule-target 36 25) NONE)) 
    (reaches 1 36 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 36 26))
    (reaches 1 36 (- 26 1))
))

(assert (=> 
    (and (reaches 1 36 26) (not (matches-criteria 1 36 26))) 
    (reaches 1 36 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 36 26) (= (rule-target 36 26) NONE)) 
    (reaches 1 36 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 36 27))
    (reaches 1 36 (- 27 1))
))

(assert (=> 
    (and (reaches 1 36 27) (not (matches-criteria 1 36 27))) 
    (reaches 1 36 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 36 27) (= (rule-target 36 27) NONE)) 
    (reaches 1 36 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 36 28))
    (reaches 1 36 (- 28 1))
))

(assert (=> 
    (and (reaches 1 36 28) (not (matches-criteria 1 36 28))) 
    (reaches 1 36 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 36 28) (= (rule-target 36 28) NONE)) 
    (reaches 1 36 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 36 29))
    (reaches 1 36 (- 29 1))
))

(assert (=> 
    (and (reaches 1 36 29) (not (matches-criteria 1 36 29))) 
    (reaches 1 36 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 36 29) (= (rule-target 36 29) NONE)) 
    (reaches 1 36 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 36 30))
    (reaches 1 36 (- 30 1))
))

(assert (=> 
    (and (reaches 1 36 30) (not (matches-criteria 1 36 30))) 
    (reaches 1 36 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 36 30) (= (rule-target 36 30) NONE)) 
    (reaches 1 36 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 36 31))
    (reaches 1 36 (- 31 1))
))

(assert (=> 
    (and (reaches 1 36 31) (not (matches-criteria 1 36 31))) 
    (reaches 1 36 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 36 31) (= (rule-target 36 31) NONE)) 
    (reaches 1 36 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 36 32))
    (reaches 1 36 (- 32 1))
))

(assert (=> 
    (and (reaches 1 36 32) (not (matches-criteria 1 36 32))) 
    (reaches 1 36 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 36 32) (= (rule-target 36 32) NONE)) 
    (reaches 1 36 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 36 33))
    (reaches 1 36 (- 33 1))
))

(assert (=> 
    (and (reaches 1 36 33) (not (matches-criteria 1 36 33))) 
    (reaches 1 36 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 36 33) (= (rule-target 36 33) NONE)) 
    (reaches 1 36 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 36 34))
    (reaches 1 36 (- 34 1))
))

(assert (=> 
    (and (reaches 1 36 34) (not (matches-criteria 1 36 34))) 
    (reaches 1 36 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 36 34) (= (rule-target 36 34) NONE)) 
    (reaches 1 36 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 36 35))
    (reaches 1 36 (- 35 1))
))

(assert (=> 
    (and (reaches 1 36 35) (not (matches-criteria 1 36 35))) 
    (reaches 1 36 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 36 35) (= (rule-target 36 35) NONE)) 
    (reaches 1 36 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 36 36))
    (reaches 1 36 (- 36 1))
))

(assert (=> 
    (and (reaches 1 36 36) (not (matches-criteria 1 36 36))) 
    (reaches 1 36 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 36 36) (= (rule-target 36 36) NONE)) 
    (reaches 1 36 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 36 37))
    (reaches 1 36 (- 37 1))
))

(assert (=> 
    (and (reaches 1 36 37) (not (matches-criteria 1 36 37))) 
    (reaches 1 36 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 36 37) (= (rule-target 36 37) NONE)) 
    (reaches 1 36 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 36 38))
    (reaches 1 36 (- 38 1))
))

(assert (=> 
    (and (reaches 1 36 38) (not (matches-criteria 1 36 38))) 
    (reaches 1 36 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 36 38) (= (rule-target 36 38) NONE)) 
    (reaches 1 36 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 36 39))
    (reaches 1 36 (- 39 1))
))

(assert (=> 
    (and (reaches 1 36 39) (not (matches-criteria 1 36 39))) 
    (reaches 1 36 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 36 39) (= (rule-target 36 39) NONE)) 
    (reaches 1 36 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 36 40))
    (reaches 1 36 (- 40 1))
))

(assert (=> 
    (and (reaches 1 36 40) (not (matches-criteria 1 36 40))) 
    (reaches 1 36 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 36 40) (= (rule-target 36 40) NONE)) 
    (reaches 1 36 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 36 41))
    (reaches 1 36 (- 41 1))
))

(assert (=> 
    (and (reaches 1 36 41) (not (matches-criteria 1 36 41))) 
    (reaches 1 36 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 36 41) (= (rule-target 36 41) NONE)) 
    (reaches 1 36 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 36 42))
    (reaches 1 36 (- 42 1))
))

(assert (=> 
    (and (reaches 1 36 42) (not (matches-criteria 1 36 42))) 
    (reaches 1 36 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 36 42) (= (rule-target 36 42) NONE)) 
    (reaches 1 36 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 36 43))
    (reaches 1 36 (- 43 1))
))

(assert (=> 
    (and (reaches 1 36 43) (not (matches-criteria 1 36 43))) 
    (reaches 1 36 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 36 43) (= (rule-target 36 43) NONE)) 
    (reaches 1 36 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 36 44))
    (reaches 1 36 (- 44 1))
))

(assert (=> 
    (and (reaches 1 36 44) (not (matches-criteria 1 36 44))) 
    (reaches 1 36 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 36 44) (= (rule-target 36 44) NONE)) 
    (reaches 1 36 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 36 45))
    (reaches 1 36 (- 45 1))
))

(assert (=> 
    (and (reaches 1 36 45) (not (matches-criteria 1 36 45))) 
    (reaches 1 36 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 36 45) (= (rule-target 36 45) NONE)) 
    (reaches 1 36 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 36 46))
    (reaches 1 36 (- 46 1))
))

(assert (=> 
    (and (reaches 1 36 46) (not (matches-criteria 1 36 46))) 
    (reaches 1 36 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 36 46) (= (rule-target 36 46) NONE)) 
    (reaches 1 36 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 36 47))
    (reaches 1 36 (- 47 1))
))

(assert (=> 
    (and (reaches 1 36 47) (not (matches-criteria 1 36 47))) 
    (reaches 1 36 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 36 47) (= (rule-target 36 47) NONE)) 
    (reaches 1 36 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 36 48))
    (reaches 1 36 (- 48 1))
))

(assert (=> 
    (and (reaches 1 36 48) (not (matches-criteria 1 36 48))) 
    (reaches 1 36 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 36 48) (= (rule-target 36 48) NONE)) 
    (reaches 1 36 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 36 49))
    (reaches 1 36 (- 49 1))
))

(assert (=> 
    (and (reaches 1 36 49) (not (matches-criteria 1 36 49))) 
    (reaches 1 36 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 36 49) (= (rule-target 36 49) NONE)) 
    (reaches 1 36 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 36 50))
    (reaches 1 36 (- 50 1))
))

(assert (=> 
    (and (reaches 1 36 50) (not (matches-criteria 1 36 50))) 
    (reaches 1 36 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 36 50) (= (rule-target 36 50) NONE)) 
    (reaches 1 36 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 36 51))
    (reaches 1 36 (- 51 1))
))

(assert (=> 
    (and (reaches 1 36 51) (not (matches-criteria 1 36 51))) 
    (reaches 1 36 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 36 51) (= (rule-target 36 51) NONE)) 
    (reaches 1 36 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 36 52))
    (reaches 1 36 (- 52 1))
))

(assert (=> 
    (and (reaches 1 36 52) (not (matches-criteria 1 36 52))) 
    (reaches 1 36 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 36 52) (= (rule-target 36 52) NONE)) 
    (reaches 1 36 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 36 53))
    (reaches 1 36 (- 53 1))
))

(assert (=> 
    (and (reaches 1 36 53) (not (matches-criteria 1 36 53))) 
    (reaches 1 36 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 36 53) (= (rule-target 36 53) NONE)) 
    (reaches 1 36 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 36 54))
    (reaches 1 36 (- 54 1))
))

(assert (=> 
    (and (reaches 1 36 54) (not (matches-criteria 1 36 54))) 
    (reaches 1 36 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 36 54) (= (rule-target 36 54) NONE)) 
    (reaches 1 36 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 36 55))
    (reaches 1 36 (- 55 1))
))

(assert (=> 
    (and (reaches 1 36 55) (not (matches-criteria 1 36 55))) 
    (reaches 1 36 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 36 55) (= (rule-target 36 55) NONE)) 
    (reaches 1 36 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 36 56))
    (reaches 1 36 (- 56 1))
))

(assert (=> 
    (and (reaches 1 36 56) (not (matches-criteria 1 36 56))) 
    (reaches 1 36 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 36 56) (= (rule-target 36 56) NONE)) 
    (reaches 1 36 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 36 57))
    (reaches 1 36 (- 57 1))
))

(assert (=> 
    (and (reaches 1 36 57) (not (matches-criteria 1 36 57))) 
    (reaches 1 36 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 36 57) (= (rule-target 36 57) NONE)) 
    (reaches 1 36 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 36 58))
    (reaches 1 36 (- 58 1))
))

(assert (=> 
    (and (reaches 1 36 58) (not (matches-criteria 1 36 58))) 
    (reaches 1 36 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 36 58) (= (rule-target 36 58) NONE)) 
    (reaches 1 36 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 36 59))
    (reaches 1 36 (- 59 1))
))

(assert (=> 
    (and (reaches 1 36 59) (not (matches-criteria 1 36 59))) 
    (reaches 1 36 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 36 59) (= (rule-target 36 59) NONE)) 
    (reaches 1 36 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 36 60))
    (reaches 1 36 (- 60 1))
))

(assert (=> 
    (and (reaches 1 36 60) (not (matches-criteria 1 36 60))) 
    (reaches 1 36 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 36 60) (= (rule-target 36 60) NONE)) 
    (reaches 1 36 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 36 61))
    (reaches 1 36 (- 61 1))
))

(assert (=> 
    (and (reaches 1 36 61) (not (matches-criteria 1 36 61))) 
    (reaches 1 36 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 36 61) (= (rule-target 36 61) NONE)) 
    (reaches 1 36 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 36 62))
    (reaches 1 36 (- 62 1))
))

(assert (=> 
    (and (reaches 1 36 62) (not (matches-criteria 1 36 62))) 
    (reaches 1 36 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 36 62) (= (rule-target 36 62) NONE)) 
    (reaches 1 36 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 36 63))
    (reaches 1 36 (- 63 1))
))

(assert (=> 
    (and (reaches 1 36 63) (not (matches-criteria 1 36 63))) 
    (reaches 1 36 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 36 63) (= (rule-target 36 63) NONE)) 
    (reaches 1 36 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 36 64))
    (reaches 1 36 (- 64 1))
))

(assert (=> 
    (and (reaches 1 36 64) (not (matches-criteria 1 36 64))) 
    (reaches 1 36 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 36 64) (= (rule-target 36 64) NONE)) 
    (reaches 1 36 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 36 65))
    (reaches 1 36 (- 65 1))
))

(assert (=> 
    (and (reaches 1 36 65) (not (matches-criteria 1 36 65))) 
    (reaches 1 36 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 36 65) (= (rule-target 36 65) NONE)) 
    (reaches 1 36 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 37 0))
    (reaches 0 37 (- 0 1))
))

(assert (=> 
    (and (reaches 0 37 0) (not (matches-criteria 0 37 0))) 
    (reaches 0 37 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 37 0) (= (rule-target 37 0) NONE)) 
    (reaches 0 37 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 37 1))
    (reaches 0 37 (- 1 1))
))

(assert (=> 
    (and (reaches 0 37 1) (not (matches-criteria 0 37 1))) 
    (reaches 0 37 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 37 1) (= (rule-target 37 1) NONE)) 
    (reaches 0 37 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 37 2))
    (reaches 0 37 (- 2 1))
))

(assert (=> 
    (and (reaches 0 37 2) (not (matches-criteria 0 37 2))) 
    (reaches 0 37 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 37 2) (= (rule-target 37 2) NONE)) 
    (reaches 0 37 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 37 3))
    (reaches 0 37 (- 3 1))
))

(assert (=> 
    (and (reaches 0 37 3) (not (matches-criteria 0 37 3))) 
    (reaches 0 37 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 37 3) (= (rule-target 37 3) NONE)) 
    (reaches 0 37 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 37 4))
    (reaches 0 37 (- 4 1))
))

(assert (=> 
    (and (reaches 0 37 4) (not (matches-criteria 0 37 4))) 
    (reaches 0 37 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 37 4) (= (rule-target 37 4) NONE)) 
    (reaches 0 37 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 37 5))
    (reaches 0 37 (- 5 1))
))

(assert (=> 
    (and (reaches 0 37 5) (not (matches-criteria 0 37 5))) 
    (reaches 0 37 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 37 5) (= (rule-target 37 5) NONE)) 
    (reaches 0 37 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 37 6))
    (reaches 0 37 (- 6 1))
))

(assert (=> 
    (and (reaches 0 37 6) (not (matches-criteria 0 37 6))) 
    (reaches 0 37 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 37 6) (= (rule-target 37 6) NONE)) 
    (reaches 0 37 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 37 7))
    (reaches 0 37 (- 7 1))
))

(assert (=> 
    (and (reaches 0 37 7) (not (matches-criteria 0 37 7))) 
    (reaches 0 37 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 37 7) (= (rule-target 37 7) NONE)) 
    (reaches 0 37 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 37 8))
    (reaches 0 37 (- 8 1))
))

(assert (=> 
    (and (reaches 0 37 8) (not (matches-criteria 0 37 8))) 
    (reaches 0 37 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 37 8) (= (rule-target 37 8) NONE)) 
    (reaches 0 37 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 37 9))
    (reaches 0 37 (- 9 1))
))

(assert (=> 
    (and (reaches 0 37 9) (not (matches-criteria 0 37 9))) 
    (reaches 0 37 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 37 9) (= (rule-target 37 9) NONE)) 
    (reaches 0 37 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 37 10))
    (reaches 0 37 (- 10 1))
))

(assert (=> 
    (and (reaches 0 37 10) (not (matches-criteria 0 37 10))) 
    (reaches 0 37 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 37 10) (= (rule-target 37 10) NONE)) 
    (reaches 0 37 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 37 11))
    (reaches 0 37 (- 11 1))
))

(assert (=> 
    (and (reaches 0 37 11) (not (matches-criteria 0 37 11))) 
    (reaches 0 37 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 37 11) (= (rule-target 37 11) NONE)) 
    (reaches 0 37 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 37 12))
    (reaches 0 37 (- 12 1))
))

(assert (=> 
    (and (reaches 0 37 12) (not (matches-criteria 0 37 12))) 
    (reaches 0 37 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 37 12) (= (rule-target 37 12) NONE)) 
    (reaches 0 37 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 37 13))
    (reaches 0 37 (- 13 1))
))

(assert (=> 
    (and (reaches 0 37 13) (not (matches-criteria 0 37 13))) 
    (reaches 0 37 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 37 13) (= (rule-target 37 13) NONE)) 
    (reaches 0 37 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 37 14))
    (reaches 0 37 (- 14 1))
))

(assert (=> 
    (and (reaches 0 37 14) (not (matches-criteria 0 37 14))) 
    (reaches 0 37 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 37 14) (= (rule-target 37 14) NONE)) 
    (reaches 0 37 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 37 15))
    (reaches 0 37 (- 15 1))
))

(assert (=> 
    (and (reaches 0 37 15) (not (matches-criteria 0 37 15))) 
    (reaches 0 37 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 37 15) (= (rule-target 37 15) NONE)) 
    (reaches 0 37 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 37 16))
    (reaches 0 37 (- 16 1))
))

(assert (=> 
    (and (reaches 0 37 16) (not (matches-criteria 0 37 16))) 
    (reaches 0 37 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 37 16) (= (rule-target 37 16) NONE)) 
    (reaches 0 37 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 37 17))
    (reaches 0 37 (- 17 1))
))

(assert (=> 
    (and (reaches 0 37 17) (not (matches-criteria 0 37 17))) 
    (reaches 0 37 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 37 17) (= (rule-target 37 17) NONE)) 
    (reaches 0 37 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 37 18))
    (reaches 0 37 (- 18 1))
))

(assert (=> 
    (and (reaches 0 37 18) (not (matches-criteria 0 37 18))) 
    (reaches 0 37 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 37 18) (= (rule-target 37 18) NONE)) 
    (reaches 0 37 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 37 19))
    (reaches 0 37 (- 19 1))
))

(assert (=> 
    (and (reaches 0 37 19) (not (matches-criteria 0 37 19))) 
    (reaches 0 37 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 37 19) (= (rule-target 37 19) NONE)) 
    (reaches 0 37 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 37 20))
    (reaches 0 37 (- 20 1))
))

(assert (=> 
    (and (reaches 0 37 20) (not (matches-criteria 0 37 20))) 
    (reaches 0 37 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 37 20) (= (rule-target 37 20) NONE)) 
    (reaches 0 37 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 37 21))
    (reaches 0 37 (- 21 1))
))

(assert (=> 
    (and (reaches 0 37 21) (not (matches-criteria 0 37 21))) 
    (reaches 0 37 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 37 21) (= (rule-target 37 21) NONE)) 
    (reaches 0 37 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 37 22))
    (reaches 0 37 (- 22 1))
))

(assert (=> 
    (and (reaches 0 37 22) (not (matches-criteria 0 37 22))) 
    (reaches 0 37 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 37 22) (= (rule-target 37 22) NONE)) 
    (reaches 0 37 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 37 23))
    (reaches 0 37 (- 23 1))
))

(assert (=> 
    (and (reaches 0 37 23) (not (matches-criteria 0 37 23))) 
    (reaches 0 37 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 37 23) (= (rule-target 37 23) NONE)) 
    (reaches 0 37 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 37 24))
    (reaches 0 37 (- 24 1))
))

(assert (=> 
    (and (reaches 0 37 24) (not (matches-criteria 0 37 24))) 
    (reaches 0 37 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 37 24) (= (rule-target 37 24) NONE)) 
    (reaches 0 37 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 37 25))
    (reaches 0 37 (- 25 1))
))

(assert (=> 
    (and (reaches 0 37 25) (not (matches-criteria 0 37 25))) 
    (reaches 0 37 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 37 25) (= (rule-target 37 25) NONE)) 
    (reaches 0 37 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 37 26))
    (reaches 0 37 (- 26 1))
))

(assert (=> 
    (and (reaches 0 37 26) (not (matches-criteria 0 37 26))) 
    (reaches 0 37 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 37 26) (= (rule-target 37 26) NONE)) 
    (reaches 0 37 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 37 27))
    (reaches 0 37 (- 27 1))
))

(assert (=> 
    (and (reaches 0 37 27) (not (matches-criteria 0 37 27))) 
    (reaches 0 37 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 37 27) (= (rule-target 37 27) NONE)) 
    (reaches 0 37 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 37 28))
    (reaches 0 37 (- 28 1))
))

(assert (=> 
    (and (reaches 0 37 28) (not (matches-criteria 0 37 28))) 
    (reaches 0 37 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 37 28) (= (rule-target 37 28) NONE)) 
    (reaches 0 37 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 37 29))
    (reaches 0 37 (- 29 1))
))

(assert (=> 
    (and (reaches 0 37 29) (not (matches-criteria 0 37 29))) 
    (reaches 0 37 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 37 29) (= (rule-target 37 29) NONE)) 
    (reaches 0 37 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 37 30))
    (reaches 0 37 (- 30 1))
))

(assert (=> 
    (and (reaches 0 37 30) (not (matches-criteria 0 37 30))) 
    (reaches 0 37 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 37 30) (= (rule-target 37 30) NONE)) 
    (reaches 0 37 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 37 31))
    (reaches 0 37 (- 31 1))
))

(assert (=> 
    (and (reaches 0 37 31) (not (matches-criteria 0 37 31))) 
    (reaches 0 37 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 37 31) (= (rule-target 37 31) NONE)) 
    (reaches 0 37 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 37 32))
    (reaches 0 37 (- 32 1))
))

(assert (=> 
    (and (reaches 0 37 32) (not (matches-criteria 0 37 32))) 
    (reaches 0 37 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 37 32) (= (rule-target 37 32) NONE)) 
    (reaches 0 37 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 37 33))
    (reaches 0 37 (- 33 1))
))

(assert (=> 
    (and (reaches 0 37 33) (not (matches-criteria 0 37 33))) 
    (reaches 0 37 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 37 33) (= (rule-target 37 33) NONE)) 
    (reaches 0 37 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 37 34))
    (reaches 0 37 (- 34 1))
))

(assert (=> 
    (and (reaches 0 37 34) (not (matches-criteria 0 37 34))) 
    (reaches 0 37 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 37 34) (= (rule-target 37 34) NONE)) 
    (reaches 0 37 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 37 35))
    (reaches 0 37 (- 35 1))
))

(assert (=> 
    (and (reaches 0 37 35) (not (matches-criteria 0 37 35))) 
    (reaches 0 37 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 37 35) (= (rule-target 37 35) NONE)) 
    (reaches 0 37 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 37 36))
    (reaches 0 37 (- 36 1))
))

(assert (=> 
    (and (reaches 0 37 36) (not (matches-criteria 0 37 36))) 
    (reaches 0 37 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 37 36) (= (rule-target 37 36) NONE)) 
    (reaches 0 37 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 37 37))
    (reaches 0 37 (- 37 1))
))

(assert (=> 
    (and (reaches 0 37 37) (not (matches-criteria 0 37 37))) 
    (reaches 0 37 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 37 37) (= (rule-target 37 37) NONE)) 
    (reaches 0 37 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 37 38))
    (reaches 0 37 (- 38 1))
))

(assert (=> 
    (and (reaches 0 37 38) (not (matches-criteria 0 37 38))) 
    (reaches 0 37 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 37 38) (= (rule-target 37 38) NONE)) 
    (reaches 0 37 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 37 39))
    (reaches 0 37 (- 39 1))
))

(assert (=> 
    (and (reaches 0 37 39) (not (matches-criteria 0 37 39))) 
    (reaches 0 37 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 37 39) (= (rule-target 37 39) NONE)) 
    (reaches 0 37 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 37 40))
    (reaches 0 37 (- 40 1))
))

(assert (=> 
    (and (reaches 0 37 40) (not (matches-criteria 0 37 40))) 
    (reaches 0 37 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 37 40) (= (rule-target 37 40) NONE)) 
    (reaches 0 37 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 37 41))
    (reaches 0 37 (- 41 1))
))

(assert (=> 
    (and (reaches 0 37 41) (not (matches-criteria 0 37 41))) 
    (reaches 0 37 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 37 41) (= (rule-target 37 41) NONE)) 
    (reaches 0 37 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 37 42))
    (reaches 0 37 (- 42 1))
))

(assert (=> 
    (and (reaches 0 37 42) (not (matches-criteria 0 37 42))) 
    (reaches 0 37 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 37 42) (= (rule-target 37 42) NONE)) 
    (reaches 0 37 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 37 43))
    (reaches 0 37 (- 43 1))
))

(assert (=> 
    (and (reaches 0 37 43) (not (matches-criteria 0 37 43))) 
    (reaches 0 37 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 37 43) (= (rule-target 37 43) NONE)) 
    (reaches 0 37 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 37 44))
    (reaches 0 37 (- 44 1))
))

(assert (=> 
    (and (reaches 0 37 44) (not (matches-criteria 0 37 44))) 
    (reaches 0 37 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 37 44) (= (rule-target 37 44) NONE)) 
    (reaches 0 37 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 37 45))
    (reaches 0 37 (- 45 1))
))

(assert (=> 
    (and (reaches 0 37 45) (not (matches-criteria 0 37 45))) 
    (reaches 0 37 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 37 45) (= (rule-target 37 45) NONE)) 
    (reaches 0 37 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 37 46))
    (reaches 0 37 (- 46 1))
))

(assert (=> 
    (and (reaches 0 37 46) (not (matches-criteria 0 37 46))) 
    (reaches 0 37 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 37 46) (= (rule-target 37 46) NONE)) 
    (reaches 0 37 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 37 47))
    (reaches 0 37 (- 47 1))
))

(assert (=> 
    (and (reaches 0 37 47) (not (matches-criteria 0 37 47))) 
    (reaches 0 37 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 37 47) (= (rule-target 37 47) NONE)) 
    (reaches 0 37 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 37 48))
    (reaches 0 37 (- 48 1))
))

(assert (=> 
    (and (reaches 0 37 48) (not (matches-criteria 0 37 48))) 
    (reaches 0 37 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 37 48) (= (rule-target 37 48) NONE)) 
    (reaches 0 37 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 37 49))
    (reaches 0 37 (- 49 1))
))

(assert (=> 
    (and (reaches 0 37 49) (not (matches-criteria 0 37 49))) 
    (reaches 0 37 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 37 49) (= (rule-target 37 49) NONE)) 
    (reaches 0 37 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 37 50))
    (reaches 0 37 (- 50 1))
))

(assert (=> 
    (and (reaches 0 37 50) (not (matches-criteria 0 37 50))) 
    (reaches 0 37 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 37 50) (= (rule-target 37 50) NONE)) 
    (reaches 0 37 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 37 51))
    (reaches 0 37 (- 51 1))
))

(assert (=> 
    (and (reaches 0 37 51) (not (matches-criteria 0 37 51))) 
    (reaches 0 37 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 37 51) (= (rule-target 37 51) NONE)) 
    (reaches 0 37 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 37 52))
    (reaches 0 37 (- 52 1))
))

(assert (=> 
    (and (reaches 0 37 52) (not (matches-criteria 0 37 52))) 
    (reaches 0 37 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 37 52) (= (rule-target 37 52) NONE)) 
    (reaches 0 37 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 37 53))
    (reaches 0 37 (- 53 1))
))

(assert (=> 
    (and (reaches 0 37 53) (not (matches-criteria 0 37 53))) 
    (reaches 0 37 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 37 53) (= (rule-target 37 53) NONE)) 
    (reaches 0 37 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 37 54))
    (reaches 0 37 (- 54 1))
))

(assert (=> 
    (and (reaches 0 37 54) (not (matches-criteria 0 37 54))) 
    (reaches 0 37 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 37 54) (= (rule-target 37 54) NONE)) 
    (reaches 0 37 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 37 55))
    (reaches 0 37 (- 55 1))
))

(assert (=> 
    (and (reaches 0 37 55) (not (matches-criteria 0 37 55))) 
    (reaches 0 37 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 37 55) (= (rule-target 37 55) NONE)) 
    (reaches 0 37 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 37 56))
    (reaches 0 37 (- 56 1))
))

(assert (=> 
    (and (reaches 0 37 56) (not (matches-criteria 0 37 56))) 
    (reaches 0 37 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 37 56) (= (rule-target 37 56) NONE)) 
    (reaches 0 37 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 37 57))
    (reaches 0 37 (- 57 1))
))

(assert (=> 
    (and (reaches 0 37 57) (not (matches-criteria 0 37 57))) 
    (reaches 0 37 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 37 57) (= (rule-target 37 57) NONE)) 
    (reaches 0 37 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 37 58))
    (reaches 0 37 (- 58 1))
))

(assert (=> 
    (and (reaches 0 37 58) (not (matches-criteria 0 37 58))) 
    (reaches 0 37 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 37 58) (= (rule-target 37 58) NONE)) 
    (reaches 0 37 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 37 59))
    (reaches 0 37 (- 59 1))
))

(assert (=> 
    (and (reaches 0 37 59) (not (matches-criteria 0 37 59))) 
    (reaches 0 37 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 37 59) (= (rule-target 37 59) NONE)) 
    (reaches 0 37 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 37 60))
    (reaches 0 37 (- 60 1))
))

(assert (=> 
    (and (reaches 0 37 60) (not (matches-criteria 0 37 60))) 
    (reaches 0 37 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 37 60) (= (rule-target 37 60) NONE)) 
    (reaches 0 37 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 37 61))
    (reaches 0 37 (- 61 1))
))

(assert (=> 
    (and (reaches 0 37 61) (not (matches-criteria 0 37 61))) 
    (reaches 0 37 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 37 61) (= (rule-target 37 61) NONE)) 
    (reaches 0 37 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 37 62))
    (reaches 0 37 (- 62 1))
))

(assert (=> 
    (and (reaches 0 37 62) (not (matches-criteria 0 37 62))) 
    (reaches 0 37 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 37 62) (= (rule-target 37 62) NONE)) 
    (reaches 0 37 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 37 63))
    (reaches 0 37 (- 63 1))
))

(assert (=> 
    (and (reaches 0 37 63) (not (matches-criteria 0 37 63))) 
    (reaches 0 37 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 37 63) (= (rule-target 37 63) NONE)) 
    (reaches 0 37 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 37 64))
    (reaches 0 37 (- 64 1))
))

(assert (=> 
    (and (reaches 0 37 64) (not (matches-criteria 0 37 64))) 
    (reaches 0 37 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 37 64) (= (rule-target 37 64) NONE)) 
    (reaches 0 37 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 37 65))
    (reaches 0 37 (- 65 1))
))

(assert (=> 
    (and (reaches 0 37 65) (not (matches-criteria 0 37 65))) 
    (reaches 0 37 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 37 65) (= (rule-target 37 65) NONE)) 
    (reaches 0 37 (+ 65 1))
))(assert (=> 
    (and (<= 1 66) (reaches 0 37 66))
    (reaches 0 37 (- 66 1))
))

(assert (=> 
    (and (reaches 0 37 66) (not (matches-criteria 0 37 66))) 
    (reaches 0 37 (+ 66 1))
))

(assert (=> 
   (and (reaches 0 37 66) (= (rule-target 37 66) NONE)) 
    (reaches 0 37 (+ 66 1))
))(assert (=> 
    (and (<= 1 67) (reaches 0 37 67))
    (reaches 0 37 (- 67 1))
))

(assert (=> 
    (and (reaches 0 37 67) (not (matches-criteria 0 37 67))) 
    (reaches 0 37 (+ 67 1))
))

(assert (=> 
   (and (reaches 0 37 67) (= (rule-target 37 67) NONE)) 
    (reaches 0 37 (+ 67 1))
))(assert (=> 
    (and (<= 1 68) (reaches 0 37 68))
    (reaches 0 37 (- 68 1))
))

(assert (=> 
    (and (reaches 0 37 68) (not (matches-criteria 0 37 68))) 
    (reaches 0 37 (+ 68 1))
))

(assert (=> 
   (and (reaches 0 37 68) (= (rule-target 37 68) NONE)) 
    (reaches 0 37 (+ 68 1))
))(assert (=> 
    (and (<= 1 69) (reaches 0 37 69))
    (reaches 0 37 (- 69 1))
))

(assert (=> 
    (and (reaches 0 37 69) (not (matches-criteria 0 37 69))) 
    (reaches 0 37 (+ 69 1))
))

(assert (=> 
   (and (reaches 0 37 69) (= (rule-target 37 69) NONE)) 
    (reaches 0 37 (+ 69 1))
))(assert (=> 
    (and (<= 1 70) (reaches 0 37 70))
    (reaches 0 37 (- 70 1))
))

(assert (=> 
    (and (reaches 0 37 70) (not (matches-criteria 0 37 70))) 
    (reaches 0 37 (+ 70 1))
))

(assert (=> 
   (and (reaches 0 37 70) (= (rule-target 37 70) NONE)) 
    (reaches 0 37 (+ 70 1))
))(assert (=> 
    (and (<= 1 71) (reaches 0 37 71))
    (reaches 0 37 (- 71 1))
))

(assert (=> 
    (and (reaches 0 37 71) (not (matches-criteria 0 37 71))) 
    (reaches 0 37 (+ 71 1))
))

(assert (=> 
   (and (reaches 0 37 71) (= (rule-target 37 71) NONE)) 
    (reaches 0 37 (+ 71 1))
))(assert (=> 
    (and (<= 1 72) (reaches 0 37 72))
    (reaches 0 37 (- 72 1))
))

(assert (=> 
    (and (reaches 0 37 72) (not (matches-criteria 0 37 72))) 
    (reaches 0 37 (+ 72 1))
))

(assert (=> 
   (and (reaches 0 37 72) (= (rule-target 37 72) NONE)) 
    (reaches 0 37 (+ 72 1))
))(assert (=> 
    (and (<= 1 73) (reaches 0 37 73))
    (reaches 0 37 (- 73 1))
))

(assert (=> 
    (and (reaches 0 37 73) (not (matches-criteria 0 37 73))) 
    (reaches 0 37 (+ 73 1))
))

(assert (=> 
   (and (reaches 0 37 73) (= (rule-target 37 73) NONE)) 
    (reaches 0 37 (+ 73 1))
))(assert (=> 
    (and (<= 1 74) (reaches 0 37 74))
    (reaches 0 37 (- 74 1))
))

(assert (=> 
    (and (reaches 0 37 74) (not (matches-criteria 0 37 74))) 
    (reaches 0 37 (+ 74 1))
))

(assert (=> 
   (and (reaches 0 37 74) (= (rule-target 37 74) NONE)) 
    (reaches 0 37 (+ 74 1))
))(assert (=> 
    (and (<= 1 75) (reaches 0 37 75))
    (reaches 0 37 (- 75 1))
))

(assert (=> 
    (and (reaches 0 37 75) (not (matches-criteria 0 37 75))) 
    (reaches 0 37 (+ 75 1))
))

(assert (=> 
   (and (reaches 0 37 75) (= (rule-target 37 75) NONE)) 
    (reaches 0 37 (+ 75 1))
))(assert (=> 
    (and (<= 1 76) (reaches 0 37 76))
    (reaches 0 37 (- 76 1))
))

(assert (=> 
    (and (reaches 0 37 76) (not (matches-criteria 0 37 76))) 
    (reaches 0 37 (+ 76 1))
))

(assert (=> 
   (and (reaches 0 37 76) (= (rule-target 37 76) NONE)) 
    (reaches 0 37 (+ 76 1))
))(assert (=> 
    (and (<= 1 77) (reaches 0 37 77))
    (reaches 0 37 (- 77 1))
))

(assert (=> 
    (and (reaches 0 37 77) (not (matches-criteria 0 37 77))) 
    (reaches 0 37 (+ 77 1))
))

(assert (=> 
   (and (reaches 0 37 77) (= (rule-target 37 77) NONE)) 
    (reaches 0 37 (+ 77 1))
))(assert (=> 
    (and (<= 1 78) (reaches 0 37 78))
    (reaches 0 37 (- 78 1))
))

(assert (=> 
    (and (reaches 0 37 78) (not (matches-criteria 0 37 78))) 
    (reaches 0 37 (+ 78 1))
))

(assert (=> 
   (and (reaches 0 37 78) (= (rule-target 37 78) NONE)) 
    (reaches 0 37 (+ 78 1))
))(assert (=> 
    (and (<= 1 79) (reaches 0 37 79))
    (reaches 0 37 (- 79 1))
))

(assert (=> 
    (and (reaches 0 37 79) (not (matches-criteria 0 37 79))) 
    (reaches 0 37 (+ 79 1))
))

(assert (=> 
   (and (reaches 0 37 79) (= (rule-target 37 79) NONE)) 
    (reaches 0 37 (+ 79 1))
))(assert (=> 
    (and (<= 1 80) (reaches 0 37 80))
    (reaches 0 37 (- 80 1))
))

(assert (=> 
    (and (reaches 0 37 80) (not (matches-criteria 0 37 80))) 
    (reaches 0 37 (+ 80 1))
))

(assert (=> 
   (and (reaches 0 37 80) (= (rule-target 37 80) NONE)) 
    (reaches 0 37 (+ 80 1))
))(assert (=> 
    (and (<= 1 81) (reaches 0 37 81))
    (reaches 0 37 (- 81 1))
))

(assert (=> 
    (and (reaches 0 37 81) (not (matches-criteria 0 37 81))) 
    (reaches 0 37 (+ 81 1))
))

(assert (=> 
   (and (reaches 0 37 81) (= (rule-target 37 81) NONE)) 
    (reaches 0 37 (+ 81 1))
))(assert (=> 
    (and (<= 1 82) (reaches 0 37 82))
    (reaches 0 37 (- 82 1))
))

(assert (=> 
    (and (reaches 0 37 82) (not (matches-criteria 0 37 82))) 
    (reaches 0 37 (+ 82 1))
))

(assert (=> 
   (and (reaches 0 37 82) (= (rule-target 37 82) NONE)) 
    (reaches 0 37 (+ 82 1))
))(assert (=> 
    (and (<= 1 83) (reaches 0 37 83))
    (reaches 0 37 (- 83 1))
))

(assert (=> 
    (and (reaches 0 37 83) (not (matches-criteria 0 37 83))) 
    (reaches 0 37 (+ 83 1))
))

(assert (=> 
   (and (reaches 0 37 83) (= (rule-target 37 83) NONE)) 
    (reaches 0 37 (+ 83 1))
))(assert (=> 
    (and (<= 1 84) (reaches 0 37 84))
    (reaches 0 37 (- 84 1))
))

(assert (=> 
    (and (reaches 0 37 84) (not (matches-criteria 0 37 84))) 
    (reaches 0 37 (+ 84 1))
))

(assert (=> 
   (and (reaches 0 37 84) (= (rule-target 37 84) NONE)) 
    (reaches 0 37 (+ 84 1))
))(assert (=> 
    (and (<= 1 85) (reaches 0 37 85))
    (reaches 0 37 (- 85 1))
))

(assert (=> 
    (and (reaches 0 37 85) (not (matches-criteria 0 37 85))) 
    (reaches 0 37 (+ 85 1))
))

(assert (=> 
   (and (reaches 0 37 85) (= (rule-target 37 85) NONE)) 
    (reaches 0 37 (+ 85 1))
))(assert (=> 
    (and (<= 1 86) (reaches 0 37 86))
    (reaches 0 37 (- 86 1))
))

(assert (=> 
    (and (reaches 0 37 86) (not (matches-criteria 0 37 86))) 
    (reaches 0 37 (+ 86 1))
))

(assert (=> 
   (and (reaches 0 37 86) (= (rule-target 37 86) NONE)) 
    (reaches 0 37 (+ 86 1))
))(assert (=> 
    (and (<= 1 87) (reaches 0 37 87))
    (reaches 0 37 (- 87 1))
))

(assert (=> 
    (and (reaches 0 37 87) (not (matches-criteria 0 37 87))) 
    (reaches 0 37 (+ 87 1))
))

(assert (=> 
   (and (reaches 0 37 87) (= (rule-target 37 87) NONE)) 
    (reaches 0 37 (+ 87 1))
))(assert (=> 
    (and (<= 1 88) (reaches 0 37 88))
    (reaches 0 37 (- 88 1))
))

(assert (=> 
    (and (reaches 0 37 88) (not (matches-criteria 0 37 88))) 
    (reaches 0 37 (+ 88 1))
))

(assert (=> 
   (and (reaches 0 37 88) (= (rule-target 37 88) NONE)) 
    (reaches 0 37 (+ 88 1))
))(assert (=> 
    (and (<= 1 89) (reaches 0 37 89))
    (reaches 0 37 (- 89 1))
))

(assert (=> 
    (and (reaches 0 37 89) (not (matches-criteria 0 37 89))) 
    (reaches 0 37 (+ 89 1))
))

(assert (=> 
   (and (reaches 0 37 89) (= (rule-target 37 89) NONE)) 
    (reaches 0 37 (+ 89 1))
))(assert (=> 
    (and (<= 1 90) (reaches 0 37 90))
    (reaches 0 37 (- 90 1))
))

(assert (=> 
    (and (reaches 0 37 90) (not (matches-criteria 0 37 90))) 
    (reaches 0 37 (+ 90 1))
))

(assert (=> 
   (and (reaches 0 37 90) (= (rule-target 37 90) NONE)) 
    (reaches 0 37 (+ 90 1))
))(assert (=> 
    (and (<= 1 91) (reaches 0 37 91))
    (reaches 0 37 (- 91 1))
))

(assert (=> 
    (and (reaches 0 37 91) (not (matches-criteria 0 37 91))) 
    (reaches 0 37 (+ 91 1))
))

(assert (=> 
   (and (reaches 0 37 91) (= (rule-target 37 91) NONE)) 
    (reaches 0 37 (+ 91 1))
))(assert (=> 
    (and (<= 1 92) (reaches 0 37 92))
    (reaches 0 37 (- 92 1))
))

(assert (=> 
    (and (reaches 0 37 92) (not (matches-criteria 0 37 92))) 
    (reaches 0 37 (+ 92 1))
))

(assert (=> 
   (and (reaches 0 37 92) (= (rule-target 37 92) NONE)) 
    (reaches 0 37 (+ 92 1))
))(assert (=> 
    (and (<= 1 93) (reaches 0 37 93))
    (reaches 0 37 (- 93 1))
))

(assert (=> 
    (and (reaches 0 37 93) (not (matches-criteria 0 37 93))) 
    (reaches 0 37 (+ 93 1))
))

(assert (=> 
   (and (reaches 0 37 93) (= (rule-target 37 93) NONE)) 
    (reaches 0 37 (+ 93 1))
))(assert (=> 
    (and (<= 1 94) (reaches 0 37 94))
    (reaches 0 37 (- 94 1))
))

(assert (=> 
    (and (reaches 0 37 94) (not (matches-criteria 0 37 94))) 
    (reaches 0 37 (+ 94 1))
))

(assert (=> 
   (and (reaches 0 37 94) (= (rule-target 37 94) NONE)) 
    (reaches 0 37 (+ 94 1))
))(assert (=> 
    (and (<= 1 95) (reaches 0 37 95))
    (reaches 0 37 (- 95 1))
))

(assert (=> 
    (and (reaches 0 37 95) (not (matches-criteria 0 37 95))) 
    (reaches 0 37 (+ 95 1))
))

(assert (=> 
   (and (reaches 0 37 95) (= (rule-target 37 95) NONE)) 
    (reaches 0 37 (+ 95 1))
))(assert (=> 
    (and (<= 1 96) (reaches 0 37 96))
    (reaches 0 37 (- 96 1))
))

(assert (=> 
    (and (reaches 0 37 96) (not (matches-criteria 0 37 96))) 
    (reaches 0 37 (+ 96 1))
))

(assert (=> 
   (and (reaches 0 37 96) (= (rule-target 37 96) NONE)) 
    (reaches 0 37 (+ 96 1))
))(assert (=> 
    (and (<= 1 97) (reaches 0 37 97))
    (reaches 0 37 (- 97 1))
))

(assert (=> 
    (and (reaches 0 37 97) (not (matches-criteria 0 37 97))) 
    (reaches 0 37 (+ 97 1))
))

(assert (=> 
   (and (reaches 0 37 97) (= (rule-target 37 97) NONE)) 
    (reaches 0 37 (+ 97 1))
))(assert (=> 
    (and (<= 1 98) (reaches 0 37 98))
    (reaches 0 37 (- 98 1))
))

(assert (=> 
    (and (reaches 0 37 98) (not (matches-criteria 0 37 98))) 
    (reaches 0 37 (+ 98 1))
))

(assert (=> 
   (and (reaches 0 37 98) (= (rule-target 37 98) NONE)) 
    (reaches 0 37 (+ 98 1))
))(assert (=> 
    (and (<= 1 99) (reaches 0 37 99))
    (reaches 0 37 (- 99 1))
))

(assert (=> 
    (and (reaches 0 37 99) (not (matches-criteria 0 37 99))) 
    (reaches 0 37 (+ 99 1))
))

(assert (=> 
   (and (reaches 0 37 99) (= (rule-target 37 99) NONE)) 
    (reaches 0 37 (+ 99 1))
))(assert (=> 
    (and (<= 1 100) (reaches 0 37 100))
    (reaches 0 37 (- 100 1))
))

(assert (=> 
    (and (reaches 0 37 100) (not (matches-criteria 0 37 100))) 
    (reaches 0 37 (+ 100 1))
))

(assert (=> 
   (and (reaches 0 37 100) (= (rule-target 37 100) NONE)) 
    (reaches 0 37 (+ 100 1))
))(assert (=> 
    (and (<= 1 101) (reaches 0 37 101))
    (reaches 0 37 (- 101 1))
))

(assert (=> 
    (and (reaches 0 37 101) (not (matches-criteria 0 37 101))) 
    (reaches 0 37 (+ 101 1))
))

(assert (=> 
   (and (reaches 0 37 101) (= (rule-target 37 101) NONE)) 
    (reaches 0 37 (+ 101 1))
))(assert (=> 
    (and (<= 1 102) (reaches 0 37 102))
    (reaches 0 37 (- 102 1))
))

(assert (=> 
    (and (reaches 0 37 102) (not (matches-criteria 0 37 102))) 
    (reaches 0 37 (+ 102 1))
))

(assert (=> 
   (and (reaches 0 37 102) (= (rule-target 37 102) NONE)) 
    (reaches 0 37 (+ 102 1))
))(assert (=> 
    (and (<= 1 103) (reaches 0 37 103))
    (reaches 0 37 (- 103 1))
))

(assert (=> 
    (and (reaches 0 37 103) (not (matches-criteria 0 37 103))) 
    (reaches 0 37 (+ 103 1))
))

(assert (=> 
   (and (reaches 0 37 103) (= (rule-target 37 103) NONE)) 
    (reaches 0 37 (+ 103 1))
))(assert (=> 
    (and (<= 1 104) (reaches 0 37 104))
    (reaches 0 37 (- 104 1))
))

(assert (=> 
    (and (reaches 0 37 104) (not (matches-criteria 0 37 104))) 
    (reaches 0 37 (+ 104 1))
))

(assert (=> 
   (and (reaches 0 37 104) (= (rule-target 37 104) NONE)) 
    (reaches 0 37 (+ 104 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 37 0))
    (reaches 1 37 (- 0 1))
))

(assert (=> 
    (and (reaches 1 37 0) (not (matches-criteria 1 37 0))) 
    (reaches 1 37 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 37 0) (= (rule-target 37 0) NONE)) 
    (reaches 1 37 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 37 1))
    (reaches 1 37 (- 1 1))
))

(assert (=> 
    (and (reaches 1 37 1) (not (matches-criteria 1 37 1))) 
    (reaches 1 37 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 37 1) (= (rule-target 37 1) NONE)) 
    (reaches 1 37 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 37 2))
    (reaches 1 37 (- 2 1))
))

(assert (=> 
    (and (reaches 1 37 2) (not (matches-criteria 1 37 2))) 
    (reaches 1 37 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 37 2) (= (rule-target 37 2) NONE)) 
    (reaches 1 37 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 37 3))
    (reaches 1 37 (- 3 1))
))

(assert (=> 
    (and (reaches 1 37 3) (not (matches-criteria 1 37 3))) 
    (reaches 1 37 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 37 3) (= (rule-target 37 3) NONE)) 
    (reaches 1 37 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 37 4))
    (reaches 1 37 (- 4 1))
))

(assert (=> 
    (and (reaches 1 37 4) (not (matches-criteria 1 37 4))) 
    (reaches 1 37 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 37 4) (= (rule-target 37 4) NONE)) 
    (reaches 1 37 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 37 5))
    (reaches 1 37 (- 5 1))
))

(assert (=> 
    (and (reaches 1 37 5) (not (matches-criteria 1 37 5))) 
    (reaches 1 37 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 37 5) (= (rule-target 37 5) NONE)) 
    (reaches 1 37 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 37 6))
    (reaches 1 37 (- 6 1))
))

(assert (=> 
    (and (reaches 1 37 6) (not (matches-criteria 1 37 6))) 
    (reaches 1 37 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 37 6) (= (rule-target 37 6) NONE)) 
    (reaches 1 37 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 37 7))
    (reaches 1 37 (- 7 1))
))

(assert (=> 
    (and (reaches 1 37 7) (not (matches-criteria 1 37 7))) 
    (reaches 1 37 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 37 7) (= (rule-target 37 7) NONE)) 
    (reaches 1 37 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 37 8))
    (reaches 1 37 (- 8 1))
))

(assert (=> 
    (and (reaches 1 37 8) (not (matches-criteria 1 37 8))) 
    (reaches 1 37 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 37 8) (= (rule-target 37 8) NONE)) 
    (reaches 1 37 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 37 9))
    (reaches 1 37 (- 9 1))
))

(assert (=> 
    (and (reaches 1 37 9) (not (matches-criteria 1 37 9))) 
    (reaches 1 37 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 37 9) (= (rule-target 37 9) NONE)) 
    (reaches 1 37 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 37 10))
    (reaches 1 37 (- 10 1))
))

(assert (=> 
    (and (reaches 1 37 10) (not (matches-criteria 1 37 10))) 
    (reaches 1 37 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 37 10) (= (rule-target 37 10) NONE)) 
    (reaches 1 37 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 37 11))
    (reaches 1 37 (- 11 1))
))

(assert (=> 
    (and (reaches 1 37 11) (not (matches-criteria 1 37 11))) 
    (reaches 1 37 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 37 11) (= (rule-target 37 11) NONE)) 
    (reaches 1 37 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 37 12))
    (reaches 1 37 (- 12 1))
))

(assert (=> 
    (and (reaches 1 37 12) (not (matches-criteria 1 37 12))) 
    (reaches 1 37 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 37 12) (= (rule-target 37 12) NONE)) 
    (reaches 1 37 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 37 13))
    (reaches 1 37 (- 13 1))
))

(assert (=> 
    (and (reaches 1 37 13) (not (matches-criteria 1 37 13))) 
    (reaches 1 37 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 37 13) (= (rule-target 37 13) NONE)) 
    (reaches 1 37 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 37 14))
    (reaches 1 37 (- 14 1))
))

(assert (=> 
    (and (reaches 1 37 14) (not (matches-criteria 1 37 14))) 
    (reaches 1 37 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 37 14) (= (rule-target 37 14) NONE)) 
    (reaches 1 37 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 37 15))
    (reaches 1 37 (- 15 1))
))

(assert (=> 
    (and (reaches 1 37 15) (not (matches-criteria 1 37 15))) 
    (reaches 1 37 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 37 15) (= (rule-target 37 15) NONE)) 
    (reaches 1 37 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 37 16))
    (reaches 1 37 (- 16 1))
))

(assert (=> 
    (and (reaches 1 37 16) (not (matches-criteria 1 37 16))) 
    (reaches 1 37 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 37 16) (= (rule-target 37 16) NONE)) 
    (reaches 1 37 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 37 17))
    (reaches 1 37 (- 17 1))
))

(assert (=> 
    (and (reaches 1 37 17) (not (matches-criteria 1 37 17))) 
    (reaches 1 37 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 37 17) (= (rule-target 37 17) NONE)) 
    (reaches 1 37 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 37 18))
    (reaches 1 37 (- 18 1))
))

(assert (=> 
    (and (reaches 1 37 18) (not (matches-criteria 1 37 18))) 
    (reaches 1 37 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 37 18) (= (rule-target 37 18) NONE)) 
    (reaches 1 37 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 37 19))
    (reaches 1 37 (- 19 1))
))

(assert (=> 
    (and (reaches 1 37 19) (not (matches-criteria 1 37 19))) 
    (reaches 1 37 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 37 19) (= (rule-target 37 19) NONE)) 
    (reaches 1 37 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 37 20))
    (reaches 1 37 (- 20 1))
))

(assert (=> 
    (and (reaches 1 37 20) (not (matches-criteria 1 37 20))) 
    (reaches 1 37 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 37 20) (= (rule-target 37 20) NONE)) 
    (reaches 1 37 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 37 21))
    (reaches 1 37 (- 21 1))
))

(assert (=> 
    (and (reaches 1 37 21) (not (matches-criteria 1 37 21))) 
    (reaches 1 37 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 37 21) (= (rule-target 37 21) NONE)) 
    (reaches 1 37 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 37 22))
    (reaches 1 37 (- 22 1))
))

(assert (=> 
    (and (reaches 1 37 22) (not (matches-criteria 1 37 22))) 
    (reaches 1 37 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 37 22) (= (rule-target 37 22) NONE)) 
    (reaches 1 37 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 37 23))
    (reaches 1 37 (- 23 1))
))

(assert (=> 
    (and (reaches 1 37 23) (not (matches-criteria 1 37 23))) 
    (reaches 1 37 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 37 23) (= (rule-target 37 23) NONE)) 
    (reaches 1 37 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 37 24))
    (reaches 1 37 (- 24 1))
))

(assert (=> 
    (and (reaches 1 37 24) (not (matches-criteria 1 37 24))) 
    (reaches 1 37 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 37 24) (= (rule-target 37 24) NONE)) 
    (reaches 1 37 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 37 25))
    (reaches 1 37 (- 25 1))
))

(assert (=> 
    (and (reaches 1 37 25) (not (matches-criteria 1 37 25))) 
    (reaches 1 37 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 37 25) (= (rule-target 37 25) NONE)) 
    (reaches 1 37 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 37 26))
    (reaches 1 37 (- 26 1))
))

(assert (=> 
    (and (reaches 1 37 26) (not (matches-criteria 1 37 26))) 
    (reaches 1 37 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 37 26) (= (rule-target 37 26) NONE)) 
    (reaches 1 37 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 37 27))
    (reaches 1 37 (- 27 1))
))

(assert (=> 
    (and (reaches 1 37 27) (not (matches-criteria 1 37 27))) 
    (reaches 1 37 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 37 27) (= (rule-target 37 27) NONE)) 
    (reaches 1 37 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 37 28))
    (reaches 1 37 (- 28 1))
))

(assert (=> 
    (and (reaches 1 37 28) (not (matches-criteria 1 37 28))) 
    (reaches 1 37 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 37 28) (= (rule-target 37 28) NONE)) 
    (reaches 1 37 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 37 29))
    (reaches 1 37 (- 29 1))
))

(assert (=> 
    (and (reaches 1 37 29) (not (matches-criteria 1 37 29))) 
    (reaches 1 37 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 37 29) (= (rule-target 37 29) NONE)) 
    (reaches 1 37 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 37 30))
    (reaches 1 37 (- 30 1))
))

(assert (=> 
    (and (reaches 1 37 30) (not (matches-criteria 1 37 30))) 
    (reaches 1 37 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 37 30) (= (rule-target 37 30) NONE)) 
    (reaches 1 37 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 37 31))
    (reaches 1 37 (- 31 1))
))

(assert (=> 
    (and (reaches 1 37 31) (not (matches-criteria 1 37 31))) 
    (reaches 1 37 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 37 31) (= (rule-target 37 31) NONE)) 
    (reaches 1 37 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 37 32))
    (reaches 1 37 (- 32 1))
))

(assert (=> 
    (and (reaches 1 37 32) (not (matches-criteria 1 37 32))) 
    (reaches 1 37 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 37 32) (= (rule-target 37 32) NONE)) 
    (reaches 1 37 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 37 33))
    (reaches 1 37 (- 33 1))
))

(assert (=> 
    (and (reaches 1 37 33) (not (matches-criteria 1 37 33))) 
    (reaches 1 37 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 37 33) (= (rule-target 37 33) NONE)) 
    (reaches 1 37 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 37 34))
    (reaches 1 37 (- 34 1))
))

(assert (=> 
    (and (reaches 1 37 34) (not (matches-criteria 1 37 34))) 
    (reaches 1 37 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 37 34) (= (rule-target 37 34) NONE)) 
    (reaches 1 37 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 37 35))
    (reaches 1 37 (- 35 1))
))

(assert (=> 
    (and (reaches 1 37 35) (not (matches-criteria 1 37 35))) 
    (reaches 1 37 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 37 35) (= (rule-target 37 35) NONE)) 
    (reaches 1 37 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 37 36))
    (reaches 1 37 (- 36 1))
))

(assert (=> 
    (and (reaches 1 37 36) (not (matches-criteria 1 37 36))) 
    (reaches 1 37 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 37 36) (= (rule-target 37 36) NONE)) 
    (reaches 1 37 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 37 37))
    (reaches 1 37 (- 37 1))
))

(assert (=> 
    (and (reaches 1 37 37) (not (matches-criteria 1 37 37))) 
    (reaches 1 37 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 37 37) (= (rule-target 37 37) NONE)) 
    (reaches 1 37 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 37 38))
    (reaches 1 37 (- 38 1))
))

(assert (=> 
    (and (reaches 1 37 38) (not (matches-criteria 1 37 38))) 
    (reaches 1 37 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 37 38) (= (rule-target 37 38) NONE)) 
    (reaches 1 37 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 37 39))
    (reaches 1 37 (- 39 1))
))

(assert (=> 
    (and (reaches 1 37 39) (not (matches-criteria 1 37 39))) 
    (reaches 1 37 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 37 39) (= (rule-target 37 39) NONE)) 
    (reaches 1 37 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 37 40))
    (reaches 1 37 (- 40 1))
))

(assert (=> 
    (and (reaches 1 37 40) (not (matches-criteria 1 37 40))) 
    (reaches 1 37 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 37 40) (= (rule-target 37 40) NONE)) 
    (reaches 1 37 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 37 41))
    (reaches 1 37 (- 41 1))
))

(assert (=> 
    (and (reaches 1 37 41) (not (matches-criteria 1 37 41))) 
    (reaches 1 37 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 37 41) (= (rule-target 37 41) NONE)) 
    (reaches 1 37 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 37 42))
    (reaches 1 37 (- 42 1))
))

(assert (=> 
    (and (reaches 1 37 42) (not (matches-criteria 1 37 42))) 
    (reaches 1 37 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 37 42) (= (rule-target 37 42) NONE)) 
    (reaches 1 37 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 37 43))
    (reaches 1 37 (- 43 1))
))

(assert (=> 
    (and (reaches 1 37 43) (not (matches-criteria 1 37 43))) 
    (reaches 1 37 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 37 43) (= (rule-target 37 43) NONE)) 
    (reaches 1 37 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 37 44))
    (reaches 1 37 (- 44 1))
))

(assert (=> 
    (and (reaches 1 37 44) (not (matches-criteria 1 37 44))) 
    (reaches 1 37 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 37 44) (= (rule-target 37 44) NONE)) 
    (reaches 1 37 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 37 45))
    (reaches 1 37 (- 45 1))
))

(assert (=> 
    (and (reaches 1 37 45) (not (matches-criteria 1 37 45))) 
    (reaches 1 37 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 37 45) (= (rule-target 37 45) NONE)) 
    (reaches 1 37 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 37 46))
    (reaches 1 37 (- 46 1))
))

(assert (=> 
    (and (reaches 1 37 46) (not (matches-criteria 1 37 46))) 
    (reaches 1 37 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 37 46) (= (rule-target 37 46) NONE)) 
    (reaches 1 37 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 37 47))
    (reaches 1 37 (- 47 1))
))

(assert (=> 
    (and (reaches 1 37 47) (not (matches-criteria 1 37 47))) 
    (reaches 1 37 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 37 47) (= (rule-target 37 47) NONE)) 
    (reaches 1 37 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 37 48))
    (reaches 1 37 (- 48 1))
))

(assert (=> 
    (and (reaches 1 37 48) (not (matches-criteria 1 37 48))) 
    (reaches 1 37 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 37 48) (= (rule-target 37 48) NONE)) 
    (reaches 1 37 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 37 49))
    (reaches 1 37 (- 49 1))
))

(assert (=> 
    (and (reaches 1 37 49) (not (matches-criteria 1 37 49))) 
    (reaches 1 37 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 37 49) (= (rule-target 37 49) NONE)) 
    (reaches 1 37 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 37 50))
    (reaches 1 37 (- 50 1))
))

(assert (=> 
    (and (reaches 1 37 50) (not (matches-criteria 1 37 50))) 
    (reaches 1 37 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 37 50) (= (rule-target 37 50) NONE)) 
    (reaches 1 37 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 37 51))
    (reaches 1 37 (- 51 1))
))

(assert (=> 
    (and (reaches 1 37 51) (not (matches-criteria 1 37 51))) 
    (reaches 1 37 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 37 51) (= (rule-target 37 51) NONE)) 
    (reaches 1 37 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 37 52))
    (reaches 1 37 (- 52 1))
))

(assert (=> 
    (and (reaches 1 37 52) (not (matches-criteria 1 37 52))) 
    (reaches 1 37 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 37 52) (= (rule-target 37 52) NONE)) 
    (reaches 1 37 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 37 53))
    (reaches 1 37 (- 53 1))
))

(assert (=> 
    (and (reaches 1 37 53) (not (matches-criteria 1 37 53))) 
    (reaches 1 37 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 37 53) (= (rule-target 37 53) NONE)) 
    (reaches 1 37 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 37 54))
    (reaches 1 37 (- 54 1))
))

(assert (=> 
    (and (reaches 1 37 54) (not (matches-criteria 1 37 54))) 
    (reaches 1 37 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 37 54) (= (rule-target 37 54) NONE)) 
    (reaches 1 37 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 37 55))
    (reaches 1 37 (- 55 1))
))

(assert (=> 
    (and (reaches 1 37 55) (not (matches-criteria 1 37 55))) 
    (reaches 1 37 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 37 55) (= (rule-target 37 55) NONE)) 
    (reaches 1 37 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 37 56))
    (reaches 1 37 (- 56 1))
))

(assert (=> 
    (and (reaches 1 37 56) (not (matches-criteria 1 37 56))) 
    (reaches 1 37 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 37 56) (= (rule-target 37 56) NONE)) 
    (reaches 1 37 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 37 57))
    (reaches 1 37 (- 57 1))
))

(assert (=> 
    (and (reaches 1 37 57) (not (matches-criteria 1 37 57))) 
    (reaches 1 37 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 37 57) (= (rule-target 37 57) NONE)) 
    (reaches 1 37 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 37 58))
    (reaches 1 37 (- 58 1))
))

(assert (=> 
    (and (reaches 1 37 58) (not (matches-criteria 1 37 58))) 
    (reaches 1 37 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 37 58) (= (rule-target 37 58) NONE)) 
    (reaches 1 37 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 37 59))
    (reaches 1 37 (- 59 1))
))

(assert (=> 
    (and (reaches 1 37 59) (not (matches-criteria 1 37 59))) 
    (reaches 1 37 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 37 59) (= (rule-target 37 59) NONE)) 
    (reaches 1 37 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 37 60))
    (reaches 1 37 (- 60 1))
))

(assert (=> 
    (and (reaches 1 37 60) (not (matches-criteria 1 37 60))) 
    (reaches 1 37 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 37 60) (= (rule-target 37 60) NONE)) 
    (reaches 1 37 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 37 61))
    (reaches 1 37 (- 61 1))
))

(assert (=> 
    (and (reaches 1 37 61) (not (matches-criteria 1 37 61))) 
    (reaches 1 37 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 37 61) (= (rule-target 37 61) NONE)) 
    (reaches 1 37 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 37 62))
    (reaches 1 37 (- 62 1))
))

(assert (=> 
    (and (reaches 1 37 62) (not (matches-criteria 1 37 62))) 
    (reaches 1 37 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 37 62) (= (rule-target 37 62) NONE)) 
    (reaches 1 37 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 37 63))
    (reaches 1 37 (- 63 1))
))

(assert (=> 
    (and (reaches 1 37 63) (not (matches-criteria 1 37 63))) 
    (reaches 1 37 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 37 63) (= (rule-target 37 63) NONE)) 
    (reaches 1 37 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 37 64))
    (reaches 1 37 (- 64 1))
))

(assert (=> 
    (and (reaches 1 37 64) (not (matches-criteria 1 37 64))) 
    (reaches 1 37 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 37 64) (= (rule-target 37 64) NONE)) 
    (reaches 1 37 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 37 65))
    (reaches 1 37 (- 65 1))
))

(assert (=> 
    (and (reaches 1 37 65) (not (matches-criteria 1 37 65))) 
    (reaches 1 37 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 37 65) (= (rule-target 37 65) NONE)) 
    (reaches 1 37 (+ 65 1))
))(assert (=> 
    (and (<= 1 66) (reaches 1 37 66))
    (reaches 1 37 (- 66 1))
))

(assert (=> 
    (and (reaches 1 37 66) (not (matches-criteria 1 37 66))) 
    (reaches 1 37 (+ 66 1))
))

(assert (=> 
   (and (reaches 1 37 66) (= (rule-target 37 66) NONE)) 
    (reaches 1 37 (+ 66 1))
))(assert (=> 
    (and (<= 1 67) (reaches 1 37 67))
    (reaches 1 37 (- 67 1))
))

(assert (=> 
    (and (reaches 1 37 67) (not (matches-criteria 1 37 67))) 
    (reaches 1 37 (+ 67 1))
))

(assert (=> 
   (and (reaches 1 37 67) (= (rule-target 37 67) NONE)) 
    (reaches 1 37 (+ 67 1))
))(assert (=> 
    (and (<= 1 68) (reaches 1 37 68))
    (reaches 1 37 (- 68 1))
))

(assert (=> 
    (and (reaches 1 37 68) (not (matches-criteria 1 37 68))) 
    (reaches 1 37 (+ 68 1))
))

(assert (=> 
   (and (reaches 1 37 68) (= (rule-target 37 68) NONE)) 
    (reaches 1 37 (+ 68 1))
))(assert (=> 
    (and (<= 1 69) (reaches 1 37 69))
    (reaches 1 37 (- 69 1))
))

(assert (=> 
    (and (reaches 1 37 69) (not (matches-criteria 1 37 69))) 
    (reaches 1 37 (+ 69 1))
))

(assert (=> 
   (and (reaches 1 37 69) (= (rule-target 37 69) NONE)) 
    (reaches 1 37 (+ 69 1))
))(assert (=> 
    (and (<= 1 70) (reaches 1 37 70))
    (reaches 1 37 (- 70 1))
))

(assert (=> 
    (and (reaches 1 37 70) (not (matches-criteria 1 37 70))) 
    (reaches 1 37 (+ 70 1))
))

(assert (=> 
   (and (reaches 1 37 70) (= (rule-target 37 70) NONE)) 
    (reaches 1 37 (+ 70 1))
))(assert (=> 
    (and (<= 1 71) (reaches 1 37 71))
    (reaches 1 37 (- 71 1))
))

(assert (=> 
    (and (reaches 1 37 71) (not (matches-criteria 1 37 71))) 
    (reaches 1 37 (+ 71 1))
))

(assert (=> 
   (and (reaches 1 37 71) (= (rule-target 37 71) NONE)) 
    (reaches 1 37 (+ 71 1))
))(assert (=> 
    (and (<= 1 72) (reaches 1 37 72))
    (reaches 1 37 (- 72 1))
))

(assert (=> 
    (and (reaches 1 37 72) (not (matches-criteria 1 37 72))) 
    (reaches 1 37 (+ 72 1))
))

(assert (=> 
   (and (reaches 1 37 72) (= (rule-target 37 72) NONE)) 
    (reaches 1 37 (+ 72 1))
))(assert (=> 
    (and (<= 1 73) (reaches 1 37 73))
    (reaches 1 37 (- 73 1))
))

(assert (=> 
    (and (reaches 1 37 73) (not (matches-criteria 1 37 73))) 
    (reaches 1 37 (+ 73 1))
))

(assert (=> 
   (and (reaches 1 37 73) (= (rule-target 37 73) NONE)) 
    (reaches 1 37 (+ 73 1))
))(assert (=> 
    (and (<= 1 74) (reaches 1 37 74))
    (reaches 1 37 (- 74 1))
))

(assert (=> 
    (and (reaches 1 37 74) (not (matches-criteria 1 37 74))) 
    (reaches 1 37 (+ 74 1))
))

(assert (=> 
   (and (reaches 1 37 74) (= (rule-target 37 74) NONE)) 
    (reaches 1 37 (+ 74 1))
))(assert (=> 
    (and (<= 1 75) (reaches 1 37 75))
    (reaches 1 37 (- 75 1))
))

(assert (=> 
    (and (reaches 1 37 75) (not (matches-criteria 1 37 75))) 
    (reaches 1 37 (+ 75 1))
))

(assert (=> 
   (and (reaches 1 37 75) (= (rule-target 37 75) NONE)) 
    (reaches 1 37 (+ 75 1))
))(assert (=> 
    (and (<= 1 76) (reaches 1 37 76))
    (reaches 1 37 (- 76 1))
))

(assert (=> 
    (and (reaches 1 37 76) (not (matches-criteria 1 37 76))) 
    (reaches 1 37 (+ 76 1))
))

(assert (=> 
   (and (reaches 1 37 76) (= (rule-target 37 76) NONE)) 
    (reaches 1 37 (+ 76 1))
))(assert (=> 
    (and (<= 1 77) (reaches 1 37 77))
    (reaches 1 37 (- 77 1))
))

(assert (=> 
    (and (reaches 1 37 77) (not (matches-criteria 1 37 77))) 
    (reaches 1 37 (+ 77 1))
))

(assert (=> 
   (and (reaches 1 37 77) (= (rule-target 37 77) NONE)) 
    (reaches 1 37 (+ 77 1))
))(assert (=> 
    (and (<= 1 78) (reaches 1 37 78))
    (reaches 1 37 (- 78 1))
))

(assert (=> 
    (and (reaches 1 37 78) (not (matches-criteria 1 37 78))) 
    (reaches 1 37 (+ 78 1))
))

(assert (=> 
   (and (reaches 1 37 78) (= (rule-target 37 78) NONE)) 
    (reaches 1 37 (+ 78 1))
))(assert (=> 
    (and (<= 1 79) (reaches 1 37 79))
    (reaches 1 37 (- 79 1))
))

(assert (=> 
    (and (reaches 1 37 79) (not (matches-criteria 1 37 79))) 
    (reaches 1 37 (+ 79 1))
))

(assert (=> 
   (and (reaches 1 37 79) (= (rule-target 37 79) NONE)) 
    (reaches 1 37 (+ 79 1))
))(assert (=> 
    (and (<= 1 80) (reaches 1 37 80))
    (reaches 1 37 (- 80 1))
))

(assert (=> 
    (and (reaches 1 37 80) (not (matches-criteria 1 37 80))) 
    (reaches 1 37 (+ 80 1))
))

(assert (=> 
   (and (reaches 1 37 80) (= (rule-target 37 80) NONE)) 
    (reaches 1 37 (+ 80 1))
))(assert (=> 
    (and (<= 1 81) (reaches 1 37 81))
    (reaches 1 37 (- 81 1))
))

(assert (=> 
    (and (reaches 1 37 81) (not (matches-criteria 1 37 81))) 
    (reaches 1 37 (+ 81 1))
))

(assert (=> 
   (and (reaches 1 37 81) (= (rule-target 37 81) NONE)) 
    (reaches 1 37 (+ 81 1))
))(assert (=> 
    (and (<= 1 82) (reaches 1 37 82))
    (reaches 1 37 (- 82 1))
))

(assert (=> 
    (and (reaches 1 37 82) (not (matches-criteria 1 37 82))) 
    (reaches 1 37 (+ 82 1))
))

(assert (=> 
   (and (reaches 1 37 82) (= (rule-target 37 82) NONE)) 
    (reaches 1 37 (+ 82 1))
))(assert (=> 
    (and (<= 1 83) (reaches 1 37 83))
    (reaches 1 37 (- 83 1))
))

(assert (=> 
    (and (reaches 1 37 83) (not (matches-criteria 1 37 83))) 
    (reaches 1 37 (+ 83 1))
))

(assert (=> 
   (and (reaches 1 37 83) (= (rule-target 37 83) NONE)) 
    (reaches 1 37 (+ 83 1))
))(assert (=> 
    (and (<= 1 84) (reaches 1 37 84))
    (reaches 1 37 (- 84 1))
))

(assert (=> 
    (and (reaches 1 37 84) (not (matches-criteria 1 37 84))) 
    (reaches 1 37 (+ 84 1))
))

(assert (=> 
   (and (reaches 1 37 84) (= (rule-target 37 84) NONE)) 
    (reaches 1 37 (+ 84 1))
))(assert (=> 
    (and (<= 1 85) (reaches 1 37 85))
    (reaches 1 37 (- 85 1))
))

(assert (=> 
    (and (reaches 1 37 85) (not (matches-criteria 1 37 85))) 
    (reaches 1 37 (+ 85 1))
))

(assert (=> 
   (and (reaches 1 37 85) (= (rule-target 37 85) NONE)) 
    (reaches 1 37 (+ 85 1))
))(assert (=> 
    (and (<= 1 86) (reaches 1 37 86))
    (reaches 1 37 (- 86 1))
))

(assert (=> 
    (and (reaches 1 37 86) (not (matches-criteria 1 37 86))) 
    (reaches 1 37 (+ 86 1))
))

(assert (=> 
   (and (reaches 1 37 86) (= (rule-target 37 86) NONE)) 
    (reaches 1 37 (+ 86 1))
))(assert (=> 
    (and (<= 1 87) (reaches 1 37 87))
    (reaches 1 37 (- 87 1))
))

(assert (=> 
    (and (reaches 1 37 87) (not (matches-criteria 1 37 87))) 
    (reaches 1 37 (+ 87 1))
))

(assert (=> 
   (and (reaches 1 37 87) (= (rule-target 37 87) NONE)) 
    (reaches 1 37 (+ 87 1))
))(assert (=> 
    (and (<= 1 88) (reaches 1 37 88))
    (reaches 1 37 (- 88 1))
))

(assert (=> 
    (and (reaches 1 37 88) (not (matches-criteria 1 37 88))) 
    (reaches 1 37 (+ 88 1))
))

(assert (=> 
   (and (reaches 1 37 88) (= (rule-target 37 88) NONE)) 
    (reaches 1 37 (+ 88 1))
))(assert (=> 
    (and (<= 1 89) (reaches 1 37 89))
    (reaches 1 37 (- 89 1))
))

(assert (=> 
    (and (reaches 1 37 89) (not (matches-criteria 1 37 89))) 
    (reaches 1 37 (+ 89 1))
))

(assert (=> 
   (and (reaches 1 37 89) (= (rule-target 37 89) NONE)) 
    (reaches 1 37 (+ 89 1))
))(assert (=> 
    (and (<= 1 90) (reaches 1 37 90))
    (reaches 1 37 (- 90 1))
))

(assert (=> 
    (and (reaches 1 37 90) (not (matches-criteria 1 37 90))) 
    (reaches 1 37 (+ 90 1))
))

(assert (=> 
   (and (reaches 1 37 90) (= (rule-target 37 90) NONE)) 
    (reaches 1 37 (+ 90 1))
))(assert (=> 
    (and (<= 1 91) (reaches 1 37 91))
    (reaches 1 37 (- 91 1))
))

(assert (=> 
    (and (reaches 1 37 91) (not (matches-criteria 1 37 91))) 
    (reaches 1 37 (+ 91 1))
))

(assert (=> 
   (and (reaches 1 37 91) (= (rule-target 37 91) NONE)) 
    (reaches 1 37 (+ 91 1))
))(assert (=> 
    (and (<= 1 92) (reaches 1 37 92))
    (reaches 1 37 (- 92 1))
))

(assert (=> 
    (and (reaches 1 37 92) (not (matches-criteria 1 37 92))) 
    (reaches 1 37 (+ 92 1))
))

(assert (=> 
   (and (reaches 1 37 92) (= (rule-target 37 92) NONE)) 
    (reaches 1 37 (+ 92 1))
))(assert (=> 
    (and (<= 1 93) (reaches 1 37 93))
    (reaches 1 37 (- 93 1))
))

(assert (=> 
    (and (reaches 1 37 93) (not (matches-criteria 1 37 93))) 
    (reaches 1 37 (+ 93 1))
))

(assert (=> 
   (and (reaches 1 37 93) (= (rule-target 37 93) NONE)) 
    (reaches 1 37 (+ 93 1))
))(assert (=> 
    (and (<= 1 94) (reaches 1 37 94))
    (reaches 1 37 (- 94 1))
))

(assert (=> 
    (and (reaches 1 37 94) (not (matches-criteria 1 37 94))) 
    (reaches 1 37 (+ 94 1))
))

(assert (=> 
   (and (reaches 1 37 94) (= (rule-target 37 94) NONE)) 
    (reaches 1 37 (+ 94 1))
))(assert (=> 
    (and (<= 1 95) (reaches 1 37 95))
    (reaches 1 37 (- 95 1))
))

(assert (=> 
    (and (reaches 1 37 95) (not (matches-criteria 1 37 95))) 
    (reaches 1 37 (+ 95 1))
))

(assert (=> 
   (and (reaches 1 37 95) (= (rule-target 37 95) NONE)) 
    (reaches 1 37 (+ 95 1))
))(assert (=> 
    (and (<= 1 96) (reaches 1 37 96))
    (reaches 1 37 (- 96 1))
))

(assert (=> 
    (and (reaches 1 37 96) (not (matches-criteria 1 37 96))) 
    (reaches 1 37 (+ 96 1))
))

(assert (=> 
   (and (reaches 1 37 96) (= (rule-target 37 96) NONE)) 
    (reaches 1 37 (+ 96 1))
))(assert (=> 
    (and (<= 1 97) (reaches 1 37 97))
    (reaches 1 37 (- 97 1))
))

(assert (=> 
    (and (reaches 1 37 97) (not (matches-criteria 1 37 97))) 
    (reaches 1 37 (+ 97 1))
))

(assert (=> 
   (and (reaches 1 37 97) (= (rule-target 37 97) NONE)) 
    (reaches 1 37 (+ 97 1))
))(assert (=> 
    (and (<= 1 98) (reaches 1 37 98))
    (reaches 1 37 (- 98 1))
))

(assert (=> 
    (and (reaches 1 37 98) (not (matches-criteria 1 37 98))) 
    (reaches 1 37 (+ 98 1))
))

(assert (=> 
   (and (reaches 1 37 98) (= (rule-target 37 98) NONE)) 
    (reaches 1 37 (+ 98 1))
))(assert (=> 
    (and (<= 1 99) (reaches 1 37 99))
    (reaches 1 37 (- 99 1))
))

(assert (=> 
    (and (reaches 1 37 99) (not (matches-criteria 1 37 99))) 
    (reaches 1 37 (+ 99 1))
))

(assert (=> 
   (and (reaches 1 37 99) (= (rule-target 37 99) NONE)) 
    (reaches 1 37 (+ 99 1))
))(assert (=> 
    (and (<= 1 100) (reaches 1 37 100))
    (reaches 1 37 (- 100 1))
))

(assert (=> 
    (and (reaches 1 37 100) (not (matches-criteria 1 37 100))) 
    (reaches 1 37 (+ 100 1))
))

(assert (=> 
   (and (reaches 1 37 100) (= (rule-target 37 100) NONE)) 
    (reaches 1 37 (+ 100 1))
))(assert (=> 
    (and (<= 1 101) (reaches 1 37 101))
    (reaches 1 37 (- 101 1))
))

(assert (=> 
    (and (reaches 1 37 101) (not (matches-criteria 1 37 101))) 
    (reaches 1 37 (+ 101 1))
))

(assert (=> 
   (and (reaches 1 37 101) (= (rule-target 37 101) NONE)) 
    (reaches 1 37 (+ 101 1))
))(assert (=> 
    (and (<= 1 102) (reaches 1 37 102))
    (reaches 1 37 (- 102 1))
))

(assert (=> 
    (and (reaches 1 37 102) (not (matches-criteria 1 37 102))) 
    (reaches 1 37 (+ 102 1))
))

(assert (=> 
   (and (reaches 1 37 102) (= (rule-target 37 102) NONE)) 
    (reaches 1 37 (+ 102 1))
))(assert (=> 
    (and (<= 1 103) (reaches 1 37 103))
    (reaches 1 37 (- 103 1))
))

(assert (=> 
    (and (reaches 1 37 103) (not (matches-criteria 1 37 103))) 
    (reaches 1 37 (+ 103 1))
))

(assert (=> 
   (and (reaches 1 37 103) (= (rule-target 37 103) NONE)) 
    (reaches 1 37 (+ 103 1))
))(assert (=> 
    (and (<= 1 104) (reaches 1 37 104))
    (reaches 1 37 (- 104 1))
))

(assert (=> 
    (and (reaches 1 37 104) (not (matches-criteria 1 37 104))) 
    (reaches 1 37 (+ 104 1))
))

(assert (=> 
   (and (reaches 1 37 104) (= (rule-target 37 104) NONE)) 
    (reaches 1 37 (+ 104 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 38 0))
    (reaches 0 38 (- 0 1))
))

(assert (=> 
    (and (reaches 0 38 0) (not (matches-criteria 0 38 0))) 
    (reaches 0 38 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 38 0) (= (rule-target 38 0) NONE)) 
    (reaches 0 38 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 38 1))
    (reaches 0 38 (- 1 1))
))

(assert (=> 
    (and (reaches 0 38 1) (not (matches-criteria 0 38 1))) 
    (reaches 0 38 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 38 1) (= (rule-target 38 1) NONE)) 
    (reaches 0 38 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 38 2))
    (reaches 0 38 (- 2 1))
))

(assert (=> 
    (and (reaches 0 38 2) (not (matches-criteria 0 38 2))) 
    (reaches 0 38 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 38 2) (= (rule-target 38 2) NONE)) 
    (reaches 0 38 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 38 3))
    (reaches 0 38 (- 3 1))
))

(assert (=> 
    (and (reaches 0 38 3) (not (matches-criteria 0 38 3))) 
    (reaches 0 38 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 38 3) (= (rule-target 38 3) NONE)) 
    (reaches 0 38 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 38 4))
    (reaches 0 38 (- 4 1))
))

(assert (=> 
    (and (reaches 0 38 4) (not (matches-criteria 0 38 4))) 
    (reaches 0 38 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 38 4) (= (rule-target 38 4) NONE)) 
    (reaches 0 38 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 38 5))
    (reaches 0 38 (- 5 1))
))

(assert (=> 
    (and (reaches 0 38 5) (not (matches-criteria 0 38 5))) 
    (reaches 0 38 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 38 5) (= (rule-target 38 5) NONE)) 
    (reaches 0 38 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 38 6))
    (reaches 0 38 (- 6 1))
))

(assert (=> 
    (and (reaches 0 38 6) (not (matches-criteria 0 38 6))) 
    (reaches 0 38 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 38 6) (= (rule-target 38 6) NONE)) 
    (reaches 0 38 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 38 7))
    (reaches 0 38 (- 7 1))
))

(assert (=> 
    (and (reaches 0 38 7) (not (matches-criteria 0 38 7))) 
    (reaches 0 38 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 38 7) (= (rule-target 38 7) NONE)) 
    (reaches 0 38 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 38 8))
    (reaches 0 38 (- 8 1))
))

(assert (=> 
    (and (reaches 0 38 8) (not (matches-criteria 0 38 8))) 
    (reaches 0 38 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 38 8) (= (rule-target 38 8) NONE)) 
    (reaches 0 38 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 38 9))
    (reaches 0 38 (- 9 1))
))

(assert (=> 
    (and (reaches 0 38 9) (not (matches-criteria 0 38 9))) 
    (reaches 0 38 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 38 9) (= (rule-target 38 9) NONE)) 
    (reaches 0 38 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 38 10))
    (reaches 0 38 (- 10 1))
))

(assert (=> 
    (and (reaches 0 38 10) (not (matches-criteria 0 38 10))) 
    (reaches 0 38 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 38 10) (= (rule-target 38 10) NONE)) 
    (reaches 0 38 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 38 11))
    (reaches 0 38 (- 11 1))
))

(assert (=> 
    (and (reaches 0 38 11) (not (matches-criteria 0 38 11))) 
    (reaches 0 38 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 38 11) (= (rule-target 38 11) NONE)) 
    (reaches 0 38 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 38 12))
    (reaches 0 38 (- 12 1))
))

(assert (=> 
    (and (reaches 0 38 12) (not (matches-criteria 0 38 12))) 
    (reaches 0 38 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 38 12) (= (rule-target 38 12) NONE)) 
    (reaches 0 38 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 38 13))
    (reaches 0 38 (- 13 1))
))

(assert (=> 
    (and (reaches 0 38 13) (not (matches-criteria 0 38 13))) 
    (reaches 0 38 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 38 13) (= (rule-target 38 13) NONE)) 
    (reaches 0 38 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 38 14))
    (reaches 0 38 (- 14 1))
))

(assert (=> 
    (and (reaches 0 38 14) (not (matches-criteria 0 38 14))) 
    (reaches 0 38 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 38 14) (= (rule-target 38 14) NONE)) 
    (reaches 0 38 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 38 15))
    (reaches 0 38 (- 15 1))
))

(assert (=> 
    (and (reaches 0 38 15) (not (matches-criteria 0 38 15))) 
    (reaches 0 38 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 38 15) (= (rule-target 38 15) NONE)) 
    (reaches 0 38 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 38 16))
    (reaches 0 38 (- 16 1))
))

(assert (=> 
    (and (reaches 0 38 16) (not (matches-criteria 0 38 16))) 
    (reaches 0 38 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 38 16) (= (rule-target 38 16) NONE)) 
    (reaches 0 38 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 38 17))
    (reaches 0 38 (- 17 1))
))

(assert (=> 
    (and (reaches 0 38 17) (not (matches-criteria 0 38 17))) 
    (reaches 0 38 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 38 17) (= (rule-target 38 17) NONE)) 
    (reaches 0 38 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 38 18))
    (reaches 0 38 (- 18 1))
))

(assert (=> 
    (and (reaches 0 38 18) (not (matches-criteria 0 38 18))) 
    (reaches 0 38 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 38 18) (= (rule-target 38 18) NONE)) 
    (reaches 0 38 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 38 19))
    (reaches 0 38 (- 19 1))
))

(assert (=> 
    (and (reaches 0 38 19) (not (matches-criteria 0 38 19))) 
    (reaches 0 38 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 38 19) (= (rule-target 38 19) NONE)) 
    (reaches 0 38 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 38 20))
    (reaches 0 38 (- 20 1))
))

(assert (=> 
    (and (reaches 0 38 20) (not (matches-criteria 0 38 20))) 
    (reaches 0 38 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 38 20) (= (rule-target 38 20) NONE)) 
    (reaches 0 38 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 38 21))
    (reaches 0 38 (- 21 1))
))

(assert (=> 
    (and (reaches 0 38 21) (not (matches-criteria 0 38 21))) 
    (reaches 0 38 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 38 21) (= (rule-target 38 21) NONE)) 
    (reaches 0 38 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 38 22))
    (reaches 0 38 (- 22 1))
))

(assert (=> 
    (and (reaches 0 38 22) (not (matches-criteria 0 38 22))) 
    (reaches 0 38 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 38 22) (= (rule-target 38 22) NONE)) 
    (reaches 0 38 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 38 23))
    (reaches 0 38 (- 23 1))
))

(assert (=> 
    (and (reaches 0 38 23) (not (matches-criteria 0 38 23))) 
    (reaches 0 38 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 38 23) (= (rule-target 38 23) NONE)) 
    (reaches 0 38 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 38 24))
    (reaches 0 38 (- 24 1))
))

(assert (=> 
    (and (reaches 0 38 24) (not (matches-criteria 0 38 24))) 
    (reaches 0 38 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 38 24) (= (rule-target 38 24) NONE)) 
    (reaches 0 38 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 38 25))
    (reaches 0 38 (- 25 1))
))

(assert (=> 
    (and (reaches 0 38 25) (not (matches-criteria 0 38 25))) 
    (reaches 0 38 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 38 25) (= (rule-target 38 25) NONE)) 
    (reaches 0 38 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 38 26))
    (reaches 0 38 (- 26 1))
))

(assert (=> 
    (and (reaches 0 38 26) (not (matches-criteria 0 38 26))) 
    (reaches 0 38 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 38 26) (= (rule-target 38 26) NONE)) 
    (reaches 0 38 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 38 27))
    (reaches 0 38 (- 27 1))
))

(assert (=> 
    (and (reaches 0 38 27) (not (matches-criteria 0 38 27))) 
    (reaches 0 38 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 38 27) (= (rule-target 38 27) NONE)) 
    (reaches 0 38 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 38 28))
    (reaches 0 38 (- 28 1))
))

(assert (=> 
    (and (reaches 0 38 28) (not (matches-criteria 0 38 28))) 
    (reaches 0 38 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 38 28) (= (rule-target 38 28) NONE)) 
    (reaches 0 38 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 38 29))
    (reaches 0 38 (- 29 1))
))

(assert (=> 
    (and (reaches 0 38 29) (not (matches-criteria 0 38 29))) 
    (reaches 0 38 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 38 29) (= (rule-target 38 29) NONE)) 
    (reaches 0 38 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 38 30))
    (reaches 0 38 (- 30 1))
))

(assert (=> 
    (and (reaches 0 38 30) (not (matches-criteria 0 38 30))) 
    (reaches 0 38 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 38 30) (= (rule-target 38 30) NONE)) 
    (reaches 0 38 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 38 31))
    (reaches 0 38 (- 31 1))
))

(assert (=> 
    (and (reaches 0 38 31) (not (matches-criteria 0 38 31))) 
    (reaches 0 38 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 38 31) (= (rule-target 38 31) NONE)) 
    (reaches 0 38 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 38 32))
    (reaches 0 38 (- 32 1))
))

(assert (=> 
    (and (reaches 0 38 32) (not (matches-criteria 0 38 32))) 
    (reaches 0 38 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 38 32) (= (rule-target 38 32) NONE)) 
    (reaches 0 38 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 38 33))
    (reaches 0 38 (- 33 1))
))

(assert (=> 
    (and (reaches 0 38 33) (not (matches-criteria 0 38 33))) 
    (reaches 0 38 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 38 33) (= (rule-target 38 33) NONE)) 
    (reaches 0 38 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 38 34))
    (reaches 0 38 (- 34 1))
))

(assert (=> 
    (and (reaches 0 38 34) (not (matches-criteria 0 38 34))) 
    (reaches 0 38 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 38 34) (= (rule-target 38 34) NONE)) 
    (reaches 0 38 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 38 35))
    (reaches 0 38 (- 35 1))
))

(assert (=> 
    (and (reaches 0 38 35) (not (matches-criteria 0 38 35))) 
    (reaches 0 38 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 38 35) (= (rule-target 38 35) NONE)) 
    (reaches 0 38 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 38 36))
    (reaches 0 38 (- 36 1))
))

(assert (=> 
    (and (reaches 0 38 36) (not (matches-criteria 0 38 36))) 
    (reaches 0 38 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 38 36) (= (rule-target 38 36) NONE)) 
    (reaches 0 38 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 38 37))
    (reaches 0 38 (- 37 1))
))

(assert (=> 
    (and (reaches 0 38 37) (not (matches-criteria 0 38 37))) 
    (reaches 0 38 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 38 37) (= (rule-target 38 37) NONE)) 
    (reaches 0 38 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 38 38))
    (reaches 0 38 (- 38 1))
))

(assert (=> 
    (and (reaches 0 38 38) (not (matches-criteria 0 38 38))) 
    (reaches 0 38 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 38 38) (= (rule-target 38 38) NONE)) 
    (reaches 0 38 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 38 39))
    (reaches 0 38 (- 39 1))
))

(assert (=> 
    (and (reaches 0 38 39) (not (matches-criteria 0 38 39))) 
    (reaches 0 38 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 38 39) (= (rule-target 38 39) NONE)) 
    (reaches 0 38 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 38 40))
    (reaches 0 38 (- 40 1))
))

(assert (=> 
    (and (reaches 0 38 40) (not (matches-criteria 0 38 40))) 
    (reaches 0 38 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 38 40) (= (rule-target 38 40) NONE)) 
    (reaches 0 38 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 38 41))
    (reaches 0 38 (- 41 1))
))

(assert (=> 
    (and (reaches 0 38 41) (not (matches-criteria 0 38 41))) 
    (reaches 0 38 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 38 41) (= (rule-target 38 41) NONE)) 
    (reaches 0 38 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 38 42))
    (reaches 0 38 (- 42 1))
))

(assert (=> 
    (and (reaches 0 38 42) (not (matches-criteria 0 38 42))) 
    (reaches 0 38 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 38 42) (= (rule-target 38 42) NONE)) 
    (reaches 0 38 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 38 43))
    (reaches 0 38 (- 43 1))
))

(assert (=> 
    (and (reaches 0 38 43) (not (matches-criteria 0 38 43))) 
    (reaches 0 38 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 38 43) (= (rule-target 38 43) NONE)) 
    (reaches 0 38 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 38 44))
    (reaches 0 38 (- 44 1))
))

(assert (=> 
    (and (reaches 0 38 44) (not (matches-criteria 0 38 44))) 
    (reaches 0 38 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 38 44) (= (rule-target 38 44) NONE)) 
    (reaches 0 38 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 38 45))
    (reaches 0 38 (- 45 1))
))

(assert (=> 
    (and (reaches 0 38 45) (not (matches-criteria 0 38 45))) 
    (reaches 0 38 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 38 45) (= (rule-target 38 45) NONE)) 
    (reaches 0 38 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 38 46))
    (reaches 0 38 (- 46 1))
))

(assert (=> 
    (and (reaches 0 38 46) (not (matches-criteria 0 38 46))) 
    (reaches 0 38 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 38 46) (= (rule-target 38 46) NONE)) 
    (reaches 0 38 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 38 47))
    (reaches 0 38 (- 47 1))
))

(assert (=> 
    (and (reaches 0 38 47) (not (matches-criteria 0 38 47))) 
    (reaches 0 38 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 38 47) (= (rule-target 38 47) NONE)) 
    (reaches 0 38 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 38 48))
    (reaches 0 38 (- 48 1))
))

(assert (=> 
    (and (reaches 0 38 48) (not (matches-criteria 0 38 48))) 
    (reaches 0 38 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 38 48) (= (rule-target 38 48) NONE)) 
    (reaches 0 38 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 38 49))
    (reaches 0 38 (- 49 1))
))

(assert (=> 
    (and (reaches 0 38 49) (not (matches-criteria 0 38 49))) 
    (reaches 0 38 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 38 49) (= (rule-target 38 49) NONE)) 
    (reaches 0 38 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 38 50))
    (reaches 0 38 (- 50 1))
))

(assert (=> 
    (and (reaches 0 38 50) (not (matches-criteria 0 38 50))) 
    (reaches 0 38 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 38 50) (= (rule-target 38 50) NONE)) 
    (reaches 0 38 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 38 51))
    (reaches 0 38 (- 51 1))
))

(assert (=> 
    (and (reaches 0 38 51) (not (matches-criteria 0 38 51))) 
    (reaches 0 38 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 38 51) (= (rule-target 38 51) NONE)) 
    (reaches 0 38 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 38 52))
    (reaches 0 38 (- 52 1))
))

(assert (=> 
    (and (reaches 0 38 52) (not (matches-criteria 0 38 52))) 
    (reaches 0 38 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 38 52) (= (rule-target 38 52) NONE)) 
    (reaches 0 38 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 38 53))
    (reaches 0 38 (- 53 1))
))

(assert (=> 
    (and (reaches 0 38 53) (not (matches-criteria 0 38 53))) 
    (reaches 0 38 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 38 53) (= (rule-target 38 53) NONE)) 
    (reaches 0 38 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 38 54))
    (reaches 0 38 (- 54 1))
))

(assert (=> 
    (and (reaches 0 38 54) (not (matches-criteria 0 38 54))) 
    (reaches 0 38 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 38 54) (= (rule-target 38 54) NONE)) 
    (reaches 0 38 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 38 55))
    (reaches 0 38 (- 55 1))
))

(assert (=> 
    (and (reaches 0 38 55) (not (matches-criteria 0 38 55))) 
    (reaches 0 38 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 38 55) (= (rule-target 38 55) NONE)) 
    (reaches 0 38 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 38 56))
    (reaches 0 38 (- 56 1))
))

(assert (=> 
    (and (reaches 0 38 56) (not (matches-criteria 0 38 56))) 
    (reaches 0 38 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 38 56) (= (rule-target 38 56) NONE)) 
    (reaches 0 38 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 38 57))
    (reaches 0 38 (- 57 1))
))

(assert (=> 
    (and (reaches 0 38 57) (not (matches-criteria 0 38 57))) 
    (reaches 0 38 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 38 57) (= (rule-target 38 57) NONE)) 
    (reaches 0 38 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 38 58))
    (reaches 0 38 (- 58 1))
))

(assert (=> 
    (and (reaches 0 38 58) (not (matches-criteria 0 38 58))) 
    (reaches 0 38 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 38 58) (= (rule-target 38 58) NONE)) 
    (reaches 0 38 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 38 59))
    (reaches 0 38 (- 59 1))
))

(assert (=> 
    (and (reaches 0 38 59) (not (matches-criteria 0 38 59))) 
    (reaches 0 38 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 38 59) (= (rule-target 38 59) NONE)) 
    (reaches 0 38 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 38 60))
    (reaches 0 38 (- 60 1))
))

(assert (=> 
    (and (reaches 0 38 60) (not (matches-criteria 0 38 60))) 
    (reaches 0 38 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 38 60) (= (rule-target 38 60) NONE)) 
    (reaches 0 38 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 38 61))
    (reaches 0 38 (- 61 1))
))

(assert (=> 
    (and (reaches 0 38 61) (not (matches-criteria 0 38 61))) 
    (reaches 0 38 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 38 61) (= (rule-target 38 61) NONE)) 
    (reaches 0 38 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 38 62))
    (reaches 0 38 (- 62 1))
))

(assert (=> 
    (and (reaches 0 38 62) (not (matches-criteria 0 38 62))) 
    (reaches 0 38 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 38 62) (= (rule-target 38 62) NONE)) 
    (reaches 0 38 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 38 63))
    (reaches 0 38 (- 63 1))
))

(assert (=> 
    (and (reaches 0 38 63) (not (matches-criteria 0 38 63))) 
    (reaches 0 38 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 38 63) (= (rule-target 38 63) NONE)) 
    (reaches 0 38 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 38 64))
    (reaches 0 38 (- 64 1))
))

(assert (=> 
    (and (reaches 0 38 64) (not (matches-criteria 0 38 64))) 
    (reaches 0 38 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 38 64) (= (rule-target 38 64) NONE)) 
    (reaches 0 38 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 38 65))
    (reaches 0 38 (- 65 1))
))

(assert (=> 
    (and (reaches 0 38 65) (not (matches-criteria 0 38 65))) 
    (reaches 0 38 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 38 65) (= (rule-target 38 65) NONE)) 
    (reaches 0 38 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 38 0))
    (reaches 1 38 (- 0 1))
))

(assert (=> 
    (and (reaches 1 38 0) (not (matches-criteria 1 38 0))) 
    (reaches 1 38 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 38 0) (= (rule-target 38 0) NONE)) 
    (reaches 1 38 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 38 1))
    (reaches 1 38 (- 1 1))
))

(assert (=> 
    (and (reaches 1 38 1) (not (matches-criteria 1 38 1))) 
    (reaches 1 38 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 38 1) (= (rule-target 38 1) NONE)) 
    (reaches 1 38 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 38 2))
    (reaches 1 38 (- 2 1))
))

(assert (=> 
    (and (reaches 1 38 2) (not (matches-criteria 1 38 2))) 
    (reaches 1 38 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 38 2) (= (rule-target 38 2) NONE)) 
    (reaches 1 38 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 38 3))
    (reaches 1 38 (- 3 1))
))

(assert (=> 
    (and (reaches 1 38 3) (not (matches-criteria 1 38 3))) 
    (reaches 1 38 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 38 3) (= (rule-target 38 3) NONE)) 
    (reaches 1 38 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 38 4))
    (reaches 1 38 (- 4 1))
))

(assert (=> 
    (and (reaches 1 38 4) (not (matches-criteria 1 38 4))) 
    (reaches 1 38 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 38 4) (= (rule-target 38 4) NONE)) 
    (reaches 1 38 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 38 5))
    (reaches 1 38 (- 5 1))
))

(assert (=> 
    (and (reaches 1 38 5) (not (matches-criteria 1 38 5))) 
    (reaches 1 38 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 38 5) (= (rule-target 38 5) NONE)) 
    (reaches 1 38 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 38 6))
    (reaches 1 38 (- 6 1))
))

(assert (=> 
    (and (reaches 1 38 6) (not (matches-criteria 1 38 6))) 
    (reaches 1 38 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 38 6) (= (rule-target 38 6) NONE)) 
    (reaches 1 38 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 38 7))
    (reaches 1 38 (- 7 1))
))

(assert (=> 
    (and (reaches 1 38 7) (not (matches-criteria 1 38 7))) 
    (reaches 1 38 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 38 7) (= (rule-target 38 7) NONE)) 
    (reaches 1 38 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 38 8))
    (reaches 1 38 (- 8 1))
))

(assert (=> 
    (and (reaches 1 38 8) (not (matches-criteria 1 38 8))) 
    (reaches 1 38 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 38 8) (= (rule-target 38 8) NONE)) 
    (reaches 1 38 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 38 9))
    (reaches 1 38 (- 9 1))
))

(assert (=> 
    (and (reaches 1 38 9) (not (matches-criteria 1 38 9))) 
    (reaches 1 38 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 38 9) (= (rule-target 38 9) NONE)) 
    (reaches 1 38 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 38 10))
    (reaches 1 38 (- 10 1))
))

(assert (=> 
    (and (reaches 1 38 10) (not (matches-criteria 1 38 10))) 
    (reaches 1 38 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 38 10) (= (rule-target 38 10) NONE)) 
    (reaches 1 38 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 38 11))
    (reaches 1 38 (- 11 1))
))

(assert (=> 
    (and (reaches 1 38 11) (not (matches-criteria 1 38 11))) 
    (reaches 1 38 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 38 11) (= (rule-target 38 11) NONE)) 
    (reaches 1 38 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 38 12))
    (reaches 1 38 (- 12 1))
))

(assert (=> 
    (and (reaches 1 38 12) (not (matches-criteria 1 38 12))) 
    (reaches 1 38 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 38 12) (= (rule-target 38 12) NONE)) 
    (reaches 1 38 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 38 13))
    (reaches 1 38 (- 13 1))
))

(assert (=> 
    (and (reaches 1 38 13) (not (matches-criteria 1 38 13))) 
    (reaches 1 38 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 38 13) (= (rule-target 38 13) NONE)) 
    (reaches 1 38 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 38 14))
    (reaches 1 38 (- 14 1))
))

(assert (=> 
    (and (reaches 1 38 14) (not (matches-criteria 1 38 14))) 
    (reaches 1 38 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 38 14) (= (rule-target 38 14) NONE)) 
    (reaches 1 38 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 38 15))
    (reaches 1 38 (- 15 1))
))

(assert (=> 
    (and (reaches 1 38 15) (not (matches-criteria 1 38 15))) 
    (reaches 1 38 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 38 15) (= (rule-target 38 15) NONE)) 
    (reaches 1 38 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 38 16))
    (reaches 1 38 (- 16 1))
))

(assert (=> 
    (and (reaches 1 38 16) (not (matches-criteria 1 38 16))) 
    (reaches 1 38 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 38 16) (= (rule-target 38 16) NONE)) 
    (reaches 1 38 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 38 17))
    (reaches 1 38 (- 17 1))
))

(assert (=> 
    (and (reaches 1 38 17) (not (matches-criteria 1 38 17))) 
    (reaches 1 38 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 38 17) (= (rule-target 38 17) NONE)) 
    (reaches 1 38 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 38 18))
    (reaches 1 38 (- 18 1))
))

(assert (=> 
    (and (reaches 1 38 18) (not (matches-criteria 1 38 18))) 
    (reaches 1 38 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 38 18) (= (rule-target 38 18) NONE)) 
    (reaches 1 38 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 38 19))
    (reaches 1 38 (- 19 1))
))

(assert (=> 
    (and (reaches 1 38 19) (not (matches-criteria 1 38 19))) 
    (reaches 1 38 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 38 19) (= (rule-target 38 19) NONE)) 
    (reaches 1 38 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 38 20))
    (reaches 1 38 (- 20 1))
))

(assert (=> 
    (and (reaches 1 38 20) (not (matches-criteria 1 38 20))) 
    (reaches 1 38 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 38 20) (= (rule-target 38 20) NONE)) 
    (reaches 1 38 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 38 21))
    (reaches 1 38 (- 21 1))
))

(assert (=> 
    (and (reaches 1 38 21) (not (matches-criteria 1 38 21))) 
    (reaches 1 38 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 38 21) (= (rule-target 38 21) NONE)) 
    (reaches 1 38 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 38 22))
    (reaches 1 38 (- 22 1))
))

(assert (=> 
    (and (reaches 1 38 22) (not (matches-criteria 1 38 22))) 
    (reaches 1 38 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 38 22) (= (rule-target 38 22) NONE)) 
    (reaches 1 38 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 38 23))
    (reaches 1 38 (- 23 1))
))

(assert (=> 
    (and (reaches 1 38 23) (not (matches-criteria 1 38 23))) 
    (reaches 1 38 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 38 23) (= (rule-target 38 23) NONE)) 
    (reaches 1 38 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 38 24))
    (reaches 1 38 (- 24 1))
))

(assert (=> 
    (and (reaches 1 38 24) (not (matches-criteria 1 38 24))) 
    (reaches 1 38 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 38 24) (= (rule-target 38 24) NONE)) 
    (reaches 1 38 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 38 25))
    (reaches 1 38 (- 25 1))
))

(assert (=> 
    (and (reaches 1 38 25) (not (matches-criteria 1 38 25))) 
    (reaches 1 38 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 38 25) (= (rule-target 38 25) NONE)) 
    (reaches 1 38 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 38 26))
    (reaches 1 38 (- 26 1))
))

(assert (=> 
    (and (reaches 1 38 26) (not (matches-criteria 1 38 26))) 
    (reaches 1 38 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 38 26) (= (rule-target 38 26) NONE)) 
    (reaches 1 38 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 38 27))
    (reaches 1 38 (- 27 1))
))

(assert (=> 
    (and (reaches 1 38 27) (not (matches-criteria 1 38 27))) 
    (reaches 1 38 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 38 27) (= (rule-target 38 27) NONE)) 
    (reaches 1 38 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 38 28))
    (reaches 1 38 (- 28 1))
))

(assert (=> 
    (and (reaches 1 38 28) (not (matches-criteria 1 38 28))) 
    (reaches 1 38 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 38 28) (= (rule-target 38 28) NONE)) 
    (reaches 1 38 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 38 29))
    (reaches 1 38 (- 29 1))
))

(assert (=> 
    (and (reaches 1 38 29) (not (matches-criteria 1 38 29))) 
    (reaches 1 38 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 38 29) (= (rule-target 38 29) NONE)) 
    (reaches 1 38 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 38 30))
    (reaches 1 38 (- 30 1))
))

(assert (=> 
    (and (reaches 1 38 30) (not (matches-criteria 1 38 30))) 
    (reaches 1 38 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 38 30) (= (rule-target 38 30) NONE)) 
    (reaches 1 38 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 38 31))
    (reaches 1 38 (- 31 1))
))

(assert (=> 
    (and (reaches 1 38 31) (not (matches-criteria 1 38 31))) 
    (reaches 1 38 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 38 31) (= (rule-target 38 31) NONE)) 
    (reaches 1 38 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 38 32))
    (reaches 1 38 (- 32 1))
))

(assert (=> 
    (and (reaches 1 38 32) (not (matches-criteria 1 38 32))) 
    (reaches 1 38 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 38 32) (= (rule-target 38 32) NONE)) 
    (reaches 1 38 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 38 33))
    (reaches 1 38 (- 33 1))
))

(assert (=> 
    (and (reaches 1 38 33) (not (matches-criteria 1 38 33))) 
    (reaches 1 38 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 38 33) (= (rule-target 38 33) NONE)) 
    (reaches 1 38 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 38 34))
    (reaches 1 38 (- 34 1))
))

(assert (=> 
    (and (reaches 1 38 34) (not (matches-criteria 1 38 34))) 
    (reaches 1 38 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 38 34) (= (rule-target 38 34) NONE)) 
    (reaches 1 38 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 38 35))
    (reaches 1 38 (- 35 1))
))

(assert (=> 
    (and (reaches 1 38 35) (not (matches-criteria 1 38 35))) 
    (reaches 1 38 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 38 35) (= (rule-target 38 35) NONE)) 
    (reaches 1 38 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 38 36))
    (reaches 1 38 (- 36 1))
))

(assert (=> 
    (and (reaches 1 38 36) (not (matches-criteria 1 38 36))) 
    (reaches 1 38 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 38 36) (= (rule-target 38 36) NONE)) 
    (reaches 1 38 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 38 37))
    (reaches 1 38 (- 37 1))
))

(assert (=> 
    (and (reaches 1 38 37) (not (matches-criteria 1 38 37))) 
    (reaches 1 38 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 38 37) (= (rule-target 38 37) NONE)) 
    (reaches 1 38 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 38 38))
    (reaches 1 38 (- 38 1))
))

(assert (=> 
    (and (reaches 1 38 38) (not (matches-criteria 1 38 38))) 
    (reaches 1 38 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 38 38) (= (rule-target 38 38) NONE)) 
    (reaches 1 38 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 38 39))
    (reaches 1 38 (- 39 1))
))

(assert (=> 
    (and (reaches 1 38 39) (not (matches-criteria 1 38 39))) 
    (reaches 1 38 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 38 39) (= (rule-target 38 39) NONE)) 
    (reaches 1 38 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 38 40))
    (reaches 1 38 (- 40 1))
))

(assert (=> 
    (and (reaches 1 38 40) (not (matches-criteria 1 38 40))) 
    (reaches 1 38 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 38 40) (= (rule-target 38 40) NONE)) 
    (reaches 1 38 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 38 41))
    (reaches 1 38 (- 41 1))
))

(assert (=> 
    (and (reaches 1 38 41) (not (matches-criteria 1 38 41))) 
    (reaches 1 38 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 38 41) (= (rule-target 38 41) NONE)) 
    (reaches 1 38 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 38 42))
    (reaches 1 38 (- 42 1))
))

(assert (=> 
    (and (reaches 1 38 42) (not (matches-criteria 1 38 42))) 
    (reaches 1 38 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 38 42) (= (rule-target 38 42) NONE)) 
    (reaches 1 38 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 38 43))
    (reaches 1 38 (- 43 1))
))

(assert (=> 
    (and (reaches 1 38 43) (not (matches-criteria 1 38 43))) 
    (reaches 1 38 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 38 43) (= (rule-target 38 43) NONE)) 
    (reaches 1 38 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 38 44))
    (reaches 1 38 (- 44 1))
))

(assert (=> 
    (and (reaches 1 38 44) (not (matches-criteria 1 38 44))) 
    (reaches 1 38 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 38 44) (= (rule-target 38 44) NONE)) 
    (reaches 1 38 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 38 45))
    (reaches 1 38 (- 45 1))
))

(assert (=> 
    (and (reaches 1 38 45) (not (matches-criteria 1 38 45))) 
    (reaches 1 38 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 38 45) (= (rule-target 38 45) NONE)) 
    (reaches 1 38 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 38 46))
    (reaches 1 38 (- 46 1))
))

(assert (=> 
    (and (reaches 1 38 46) (not (matches-criteria 1 38 46))) 
    (reaches 1 38 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 38 46) (= (rule-target 38 46) NONE)) 
    (reaches 1 38 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 38 47))
    (reaches 1 38 (- 47 1))
))

(assert (=> 
    (and (reaches 1 38 47) (not (matches-criteria 1 38 47))) 
    (reaches 1 38 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 38 47) (= (rule-target 38 47) NONE)) 
    (reaches 1 38 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 38 48))
    (reaches 1 38 (- 48 1))
))

(assert (=> 
    (and (reaches 1 38 48) (not (matches-criteria 1 38 48))) 
    (reaches 1 38 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 38 48) (= (rule-target 38 48) NONE)) 
    (reaches 1 38 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 38 49))
    (reaches 1 38 (- 49 1))
))

(assert (=> 
    (and (reaches 1 38 49) (not (matches-criteria 1 38 49))) 
    (reaches 1 38 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 38 49) (= (rule-target 38 49) NONE)) 
    (reaches 1 38 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 38 50))
    (reaches 1 38 (- 50 1))
))

(assert (=> 
    (and (reaches 1 38 50) (not (matches-criteria 1 38 50))) 
    (reaches 1 38 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 38 50) (= (rule-target 38 50) NONE)) 
    (reaches 1 38 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 38 51))
    (reaches 1 38 (- 51 1))
))

(assert (=> 
    (and (reaches 1 38 51) (not (matches-criteria 1 38 51))) 
    (reaches 1 38 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 38 51) (= (rule-target 38 51) NONE)) 
    (reaches 1 38 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 38 52))
    (reaches 1 38 (- 52 1))
))

(assert (=> 
    (and (reaches 1 38 52) (not (matches-criteria 1 38 52))) 
    (reaches 1 38 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 38 52) (= (rule-target 38 52) NONE)) 
    (reaches 1 38 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 38 53))
    (reaches 1 38 (- 53 1))
))

(assert (=> 
    (and (reaches 1 38 53) (not (matches-criteria 1 38 53))) 
    (reaches 1 38 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 38 53) (= (rule-target 38 53) NONE)) 
    (reaches 1 38 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 38 54))
    (reaches 1 38 (- 54 1))
))

(assert (=> 
    (and (reaches 1 38 54) (not (matches-criteria 1 38 54))) 
    (reaches 1 38 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 38 54) (= (rule-target 38 54) NONE)) 
    (reaches 1 38 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 38 55))
    (reaches 1 38 (- 55 1))
))

(assert (=> 
    (and (reaches 1 38 55) (not (matches-criteria 1 38 55))) 
    (reaches 1 38 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 38 55) (= (rule-target 38 55) NONE)) 
    (reaches 1 38 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 38 56))
    (reaches 1 38 (- 56 1))
))

(assert (=> 
    (and (reaches 1 38 56) (not (matches-criteria 1 38 56))) 
    (reaches 1 38 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 38 56) (= (rule-target 38 56) NONE)) 
    (reaches 1 38 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 38 57))
    (reaches 1 38 (- 57 1))
))

(assert (=> 
    (and (reaches 1 38 57) (not (matches-criteria 1 38 57))) 
    (reaches 1 38 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 38 57) (= (rule-target 38 57) NONE)) 
    (reaches 1 38 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 38 58))
    (reaches 1 38 (- 58 1))
))

(assert (=> 
    (and (reaches 1 38 58) (not (matches-criteria 1 38 58))) 
    (reaches 1 38 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 38 58) (= (rule-target 38 58) NONE)) 
    (reaches 1 38 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 38 59))
    (reaches 1 38 (- 59 1))
))

(assert (=> 
    (and (reaches 1 38 59) (not (matches-criteria 1 38 59))) 
    (reaches 1 38 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 38 59) (= (rule-target 38 59) NONE)) 
    (reaches 1 38 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 38 60))
    (reaches 1 38 (- 60 1))
))

(assert (=> 
    (and (reaches 1 38 60) (not (matches-criteria 1 38 60))) 
    (reaches 1 38 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 38 60) (= (rule-target 38 60) NONE)) 
    (reaches 1 38 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 38 61))
    (reaches 1 38 (- 61 1))
))

(assert (=> 
    (and (reaches 1 38 61) (not (matches-criteria 1 38 61))) 
    (reaches 1 38 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 38 61) (= (rule-target 38 61) NONE)) 
    (reaches 1 38 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 38 62))
    (reaches 1 38 (- 62 1))
))

(assert (=> 
    (and (reaches 1 38 62) (not (matches-criteria 1 38 62))) 
    (reaches 1 38 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 38 62) (= (rule-target 38 62) NONE)) 
    (reaches 1 38 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 38 63))
    (reaches 1 38 (- 63 1))
))

(assert (=> 
    (and (reaches 1 38 63) (not (matches-criteria 1 38 63))) 
    (reaches 1 38 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 38 63) (= (rule-target 38 63) NONE)) 
    (reaches 1 38 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 38 64))
    (reaches 1 38 (- 64 1))
))

(assert (=> 
    (and (reaches 1 38 64) (not (matches-criteria 1 38 64))) 
    (reaches 1 38 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 38 64) (= (rule-target 38 64) NONE)) 
    (reaches 1 38 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 38 65))
    (reaches 1 38 (- 65 1))
))

(assert (=> 
    (and (reaches 1 38 65) (not (matches-criteria 1 38 65))) 
    (reaches 1 38 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 38 65) (= (rule-target 38 65) NONE)) 
    (reaches 1 38 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 0 39 0))
    (reaches 0 39 (- 0 1))
))

(assert (=> 
    (and (reaches 0 39 0) (not (matches-criteria 0 39 0))) 
    (reaches 0 39 (+ 0 1))
))

(assert (=> 
   (and (reaches 0 39 0) (= (rule-target 39 0) NONE)) 
    (reaches 0 39 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 0 39 1))
    (reaches 0 39 (- 1 1))
))

(assert (=> 
    (and (reaches 0 39 1) (not (matches-criteria 0 39 1))) 
    (reaches 0 39 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 39 1) (= (rule-target 39 1) NONE)) 
    (reaches 0 39 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 0 39 2))
    (reaches 0 39 (- 2 1))
))

(assert (=> 
    (and (reaches 0 39 2) (not (matches-criteria 0 39 2))) 
    (reaches 0 39 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 39 2) (= (rule-target 39 2) NONE)) 
    (reaches 0 39 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 0 39 3))
    (reaches 0 39 (- 3 1))
))

(assert (=> 
    (and (reaches 0 39 3) (not (matches-criteria 0 39 3))) 
    (reaches 0 39 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 39 3) (= (rule-target 39 3) NONE)) 
    (reaches 0 39 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 39 4))
    (reaches 0 39 (- 4 1))
))

(assert (=> 
    (and (reaches 0 39 4) (not (matches-criteria 0 39 4))) 
    (reaches 0 39 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 39 4) (= (rule-target 39 4) NONE)) 
    (reaches 0 39 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 39 5))
    (reaches 0 39 (- 5 1))
))

(assert (=> 
    (and (reaches 0 39 5) (not (matches-criteria 0 39 5))) 
    (reaches 0 39 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 39 5) (= (rule-target 39 5) NONE)) 
    (reaches 0 39 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 39 6))
    (reaches 0 39 (- 6 1))
))

(assert (=> 
    (and (reaches 0 39 6) (not (matches-criteria 0 39 6))) 
    (reaches 0 39 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 39 6) (= (rule-target 39 6) NONE)) 
    (reaches 0 39 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 39 7))
    (reaches 0 39 (- 7 1))
))

(assert (=> 
    (and (reaches 0 39 7) (not (matches-criteria 0 39 7))) 
    (reaches 0 39 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 39 7) (= (rule-target 39 7) NONE)) 
    (reaches 0 39 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 39 8))
    (reaches 0 39 (- 8 1))
))

(assert (=> 
    (and (reaches 0 39 8) (not (matches-criteria 0 39 8))) 
    (reaches 0 39 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 39 8) (= (rule-target 39 8) NONE)) 
    (reaches 0 39 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 39 9))
    (reaches 0 39 (- 9 1))
))

(assert (=> 
    (and (reaches 0 39 9) (not (matches-criteria 0 39 9))) 
    (reaches 0 39 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 39 9) (= (rule-target 39 9) NONE)) 
    (reaches 0 39 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 39 10))
    (reaches 0 39 (- 10 1))
))

(assert (=> 
    (and (reaches 0 39 10) (not (matches-criteria 0 39 10))) 
    (reaches 0 39 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 39 10) (= (rule-target 39 10) NONE)) 
    (reaches 0 39 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 39 11))
    (reaches 0 39 (- 11 1))
))

(assert (=> 
    (and (reaches 0 39 11) (not (matches-criteria 0 39 11))) 
    (reaches 0 39 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 39 11) (= (rule-target 39 11) NONE)) 
    (reaches 0 39 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 39 12))
    (reaches 0 39 (- 12 1))
))

(assert (=> 
    (and (reaches 0 39 12) (not (matches-criteria 0 39 12))) 
    (reaches 0 39 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 39 12) (= (rule-target 39 12) NONE)) 
    (reaches 0 39 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 0 39 13))
    (reaches 0 39 (- 13 1))
))

(assert (=> 
    (and (reaches 0 39 13) (not (matches-criteria 0 39 13))) 
    (reaches 0 39 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 39 13) (= (rule-target 39 13) NONE)) 
    (reaches 0 39 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 0 39 14))
    (reaches 0 39 (- 14 1))
))

(assert (=> 
    (and (reaches 0 39 14) (not (matches-criteria 0 39 14))) 
    (reaches 0 39 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 39 14) (= (rule-target 39 14) NONE)) 
    (reaches 0 39 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 0 39 15))
    (reaches 0 39 (- 15 1))
))

(assert (=> 
    (and (reaches 0 39 15) (not (matches-criteria 0 39 15))) 
    (reaches 0 39 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 39 15) (= (rule-target 39 15) NONE)) 
    (reaches 0 39 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 0 39 16))
    (reaches 0 39 (- 16 1))
))

(assert (=> 
    (and (reaches 0 39 16) (not (matches-criteria 0 39 16))) 
    (reaches 0 39 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 39 16) (= (rule-target 39 16) NONE)) 
    (reaches 0 39 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 0 39 17))
    (reaches 0 39 (- 17 1))
))

(assert (=> 
    (and (reaches 0 39 17) (not (matches-criteria 0 39 17))) 
    (reaches 0 39 (+ 17 1))
))

(assert (=> 
   (and (reaches 0 39 17) (= (rule-target 39 17) NONE)) 
    (reaches 0 39 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 0 39 18))
    (reaches 0 39 (- 18 1))
))

(assert (=> 
    (and (reaches 0 39 18) (not (matches-criteria 0 39 18))) 
    (reaches 0 39 (+ 18 1))
))

(assert (=> 
   (and (reaches 0 39 18) (= (rule-target 39 18) NONE)) 
    (reaches 0 39 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 0 39 19))
    (reaches 0 39 (- 19 1))
))

(assert (=> 
    (and (reaches 0 39 19) (not (matches-criteria 0 39 19))) 
    (reaches 0 39 (+ 19 1))
))

(assert (=> 
   (and (reaches 0 39 19) (= (rule-target 39 19) NONE)) 
    (reaches 0 39 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 0 39 20))
    (reaches 0 39 (- 20 1))
))

(assert (=> 
    (and (reaches 0 39 20) (not (matches-criteria 0 39 20))) 
    (reaches 0 39 (+ 20 1))
))

(assert (=> 
   (and (reaches 0 39 20) (= (rule-target 39 20) NONE)) 
    (reaches 0 39 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 0 39 21))
    (reaches 0 39 (- 21 1))
))

(assert (=> 
    (and (reaches 0 39 21) (not (matches-criteria 0 39 21))) 
    (reaches 0 39 (+ 21 1))
))

(assert (=> 
   (and (reaches 0 39 21) (= (rule-target 39 21) NONE)) 
    (reaches 0 39 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 0 39 22))
    (reaches 0 39 (- 22 1))
))

(assert (=> 
    (and (reaches 0 39 22) (not (matches-criteria 0 39 22))) 
    (reaches 0 39 (+ 22 1))
))

(assert (=> 
   (and (reaches 0 39 22) (= (rule-target 39 22) NONE)) 
    (reaches 0 39 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 0 39 23))
    (reaches 0 39 (- 23 1))
))

(assert (=> 
    (and (reaches 0 39 23) (not (matches-criteria 0 39 23))) 
    (reaches 0 39 (+ 23 1))
))

(assert (=> 
   (and (reaches 0 39 23) (= (rule-target 39 23) NONE)) 
    (reaches 0 39 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 0 39 24))
    (reaches 0 39 (- 24 1))
))

(assert (=> 
    (and (reaches 0 39 24) (not (matches-criteria 0 39 24))) 
    (reaches 0 39 (+ 24 1))
))

(assert (=> 
   (and (reaches 0 39 24) (= (rule-target 39 24) NONE)) 
    (reaches 0 39 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 0 39 25))
    (reaches 0 39 (- 25 1))
))

(assert (=> 
    (and (reaches 0 39 25) (not (matches-criteria 0 39 25))) 
    (reaches 0 39 (+ 25 1))
))

(assert (=> 
   (and (reaches 0 39 25) (= (rule-target 39 25) NONE)) 
    (reaches 0 39 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 0 39 26))
    (reaches 0 39 (- 26 1))
))

(assert (=> 
    (and (reaches 0 39 26) (not (matches-criteria 0 39 26))) 
    (reaches 0 39 (+ 26 1))
))

(assert (=> 
   (and (reaches 0 39 26) (= (rule-target 39 26) NONE)) 
    (reaches 0 39 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 0 39 27))
    (reaches 0 39 (- 27 1))
))

(assert (=> 
    (and (reaches 0 39 27) (not (matches-criteria 0 39 27))) 
    (reaches 0 39 (+ 27 1))
))

(assert (=> 
   (and (reaches 0 39 27) (= (rule-target 39 27) NONE)) 
    (reaches 0 39 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 0 39 28))
    (reaches 0 39 (- 28 1))
))

(assert (=> 
    (and (reaches 0 39 28) (not (matches-criteria 0 39 28))) 
    (reaches 0 39 (+ 28 1))
))

(assert (=> 
   (and (reaches 0 39 28) (= (rule-target 39 28) NONE)) 
    (reaches 0 39 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 0 39 29))
    (reaches 0 39 (- 29 1))
))

(assert (=> 
    (and (reaches 0 39 29) (not (matches-criteria 0 39 29))) 
    (reaches 0 39 (+ 29 1))
))

(assert (=> 
   (and (reaches 0 39 29) (= (rule-target 39 29) NONE)) 
    (reaches 0 39 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 0 39 30))
    (reaches 0 39 (- 30 1))
))

(assert (=> 
    (and (reaches 0 39 30) (not (matches-criteria 0 39 30))) 
    (reaches 0 39 (+ 30 1))
))

(assert (=> 
   (and (reaches 0 39 30) (= (rule-target 39 30) NONE)) 
    (reaches 0 39 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 0 39 31))
    (reaches 0 39 (- 31 1))
))

(assert (=> 
    (and (reaches 0 39 31) (not (matches-criteria 0 39 31))) 
    (reaches 0 39 (+ 31 1))
))

(assert (=> 
   (and (reaches 0 39 31) (= (rule-target 39 31) NONE)) 
    (reaches 0 39 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 0 39 32))
    (reaches 0 39 (- 32 1))
))

(assert (=> 
    (and (reaches 0 39 32) (not (matches-criteria 0 39 32))) 
    (reaches 0 39 (+ 32 1))
))

(assert (=> 
   (and (reaches 0 39 32) (= (rule-target 39 32) NONE)) 
    (reaches 0 39 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 0 39 33))
    (reaches 0 39 (- 33 1))
))

(assert (=> 
    (and (reaches 0 39 33) (not (matches-criteria 0 39 33))) 
    (reaches 0 39 (+ 33 1))
))

(assert (=> 
   (and (reaches 0 39 33) (= (rule-target 39 33) NONE)) 
    (reaches 0 39 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 0 39 34))
    (reaches 0 39 (- 34 1))
))

(assert (=> 
    (and (reaches 0 39 34) (not (matches-criteria 0 39 34))) 
    (reaches 0 39 (+ 34 1))
))

(assert (=> 
   (and (reaches 0 39 34) (= (rule-target 39 34) NONE)) 
    (reaches 0 39 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 0 39 35))
    (reaches 0 39 (- 35 1))
))

(assert (=> 
    (and (reaches 0 39 35) (not (matches-criteria 0 39 35))) 
    (reaches 0 39 (+ 35 1))
))

(assert (=> 
   (and (reaches 0 39 35) (= (rule-target 39 35) NONE)) 
    (reaches 0 39 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 0 39 36))
    (reaches 0 39 (- 36 1))
))

(assert (=> 
    (and (reaches 0 39 36) (not (matches-criteria 0 39 36))) 
    (reaches 0 39 (+ 36 1))
))

(assert (=> 
   (and (reaches 0 39 36) (= (rule-target 39 36) NONE)) 
    (reaches 0 39 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 0 39 37))
    (reaches 0 39 (- 37 1))
))

(assert (=> 
    (and (reaches 0 39 37) (not (matches-criteria 0 39 37))) 
    (reaches 0 39 (+ 37 1))
))

(assert (=> 
   (and (reaches 0 39 37) (= (rule-target 39 37) NONE)) 
    (reaches 0 39 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 0 39 38))
    (reaches 0 39 (- 38 1))
))

(assert (=> 
    (and (reaches 0 39 38) (not (matches-criteria 0 39 38))) 
    (reaches 0 39 (+ 38 1))
))

(assert (=> 
   (and (reaches 0 39 38) (= (rule-target 39 38) NONE)) 
    (reaches 0 39 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 0 39 39))
    (reaches 0 39 (- 39 1))
))

(assert (=> 
    (and (reaches 0 39 39) (not (matches-criteria 0 39 39))) 
    (reaches 0 39 (+ 39 1))
))

(assert (=> 
   (and (reaches 0 39 39) (= (rule-target 39 39) NONE)) 
    (reaches 0 39 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 0 39 40))
    (reaches 0 39 (- 40 1))
))

(assert (=> 
    (and (reaches 0 39 40) (not (matches-criteria 0 39 40))) 
    (reaches 0 39 (+ 40 1))
))

(assert (=> 
   (and (reaches 0 39 40) (= (rule-target 39 40) NONE)) 
    (reaches 0 39 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 0 39 41))
    (reaches 0 39 (- 41 1))
))

(assert (=> 
    (and (reaches 0 39 41) (not (matches-criteria 0 39 41))) 
    (reaches 0 39 (+ 41 1))
))

(assert (=> 
   (and (reaches 0 39 41) (= (rule-target 39 41) NONE)) 
    (reaches 0 39 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 0 39 42))
    (reaches 0 39 (- 42 1))
))

(assert (=> 
    (and (reaches 0 39 42) (not (matches-criteria 0 39 42))) 
    (reaches 0 39 (+ 42 1))
))

(assert (=> 
   (and (reaches 0 39 42) (= (rule-target 39 42) NONE)) 
    (reaches 0 39 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 0 39 43))
    (reaches 0 39 (- 43 1))
))

(assert (=> 
    (and (reaches 0 39 43) (not (matches-criteria 0 39 43))) 
    (reaches 0 39 (+ 43 1))
))

(assert (=> 
   (and (reaches 0 39 43) (= (rule-target 39 43) NONE)) 
    (reaches 0 39 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 0 39 44))
    (reaches 0 39 (- 44 1))
))

(assert (=> 
    (and (reaches 0 39 44) (not (matches-criteria 0 39 44))) 
    (reaches 0 39 (+ 44 1))
))

(assert (=> 
   (and (reaches 0 39 44) (= (rule-target 39 44) NONE)) 
    (reaches 0 39 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 0 39 45))
    (reaches 0 39 (- 45 1))
))

(assert (=> 
    (and (reaches 0 39 45) (not (matches-criteria 0 39 45))) 
    (reaches 0 39 (+ 45 1))
))

(assert (=> 
   (and (reaches 0 39 45) (= (rule-target 39 45) NONE)) 
    (reaches 0 39 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 0 39 46))
    (reaches 0 39 (- 46 1))
))

(assert (=> 
    (and (reaches 0 39 46) (not (matches-criteria 0 39 46))) 
    (reaches 0 39 (+ 46 1))
))

(assert (=> 
   (and (reaches 0 39 46) (= (rule-target 39 46) NONE)) 
    (reaches 0 39 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 0 39 47))
    (reaches 0 39 (- 47 1))
))

(assert (=> 
    (and (reaches 0 39 47) (not (matches-criteria 0 39 47))) 
    (reaches 0 39 (+ 47 1))
))

(assert (=> 
   (and (reaches 0 39 47) (= (rule-target 39 47) NONE)) 
    (reaches 0 39 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 0 39 48))
    (reaches 0 39 (- 48 1))
))

(assert (=> 
    (and (reaches 0 39 48) (not (matches-criteria 0 39 48))) 
    (reaches 0 39 (+ 48 1))
))

(assert (=> 
   (and (reaches 0 39 48) (= (rule-target 39 48) NONE)) 
    (reaches 0 39 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 0 39 49))
    (reaches 0 39 (- 49 1))
))

(assert (=> 
    (and (reaches 0 39 49) (not (matches-criteria 0 39 49))) 
    (reaches 0 39 (+ 49 1))
))

(assert (=> 
   (and (reaches 0 39 49) (= (rule-target 39 49) NONE)) 
    (reaches 0 39 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 0 39 50))
    (reaches 0 39 (- 50 1))
))

(assert (=> 
    (and (reaches 0 39 50) (not (matches-criteria 0 39 50))) 
    (reaches 0 39 (+ 50 1))
))

(assert (=> 
   (and (reaches 0 39 50) (= (rule-target 39 50) NONE)) 
    (reaches 0 39 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 0 39 51))
    (reaches 0 39 (- 51 1))
))

(assert (=> 
    (and (reaches 0 39 51) (not (matches-criteria 0 39 51))) 
    (reaches 0 39 (+ 51 1))
))

(assert (=> 
   (and (reaches 0 39 51) (= (rule-target 39 51) NONE)) 
    (reaches 0 39 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 0 39 52))
    (reaches 0 39 (- 52 1))
))

(assert (=> 
    (and (reaches 0 39 52) (not (matches-criteria 0 39 52))) 
    (reaches 0 39 (+ 52 1))
))

(assert (=> 
   (and (reaches 0 39 52) (= (rule-target 39 52) NONE)) 
    (reaches 0 39 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 0 39 53))
    (reaches 0 39 (- 53 1))
))

(assert (=> 
    (and (reaches 0 39 53) (not (matches-criteria 0 39 53))) 
    (reaches 0 39 (+ 53 1))
))

(assert (=> 
   (and (reaches 0 39 53) (= (rule-target 39 53) NONE)) 
    (reaches 0 39 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 0 39 54))
    (reaches 0 39 (- 54 1))
))

(assert (=> 
    (and (reaches 0 39 54) (not (matches-criteria 0 39 54))) 
    (reaches 0 39 (+ 54 1))
))

(assert (=> 
   (and (reaches 0 39 54) (= (rule-target 39 54) NONE)) 
    (reaches 0 39 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 0 39 55))
    (reaches 0 39 (- 55 1))
))

(assert (=> 
    (and (reaches 0 39 55) (not (matches-criteria 0 39 55))) 
    (reaches 0 39 (+ 55 1))
))

(assert (=> 
   (and (reaches 0 39 55) (= (rule-target 39 55) NONE)) 
    (reaches 0 39 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 0 39 56))
    (reaches 0 39 (- 56 1))
))

(assert (=> 
    (and (reaches 0 39 56) (not (matches-criteria 0 39 56))) 
    (reaches 0 39 (+ 56 1))
))

(assert (=> 
   (and (reaches 0 39 56) (= (rule-target 39 56) NONE)) 
    (reaches 0 39 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 0 39 57))
    (reaches 0 39 (- 57 1))
))

(assert (=> 
    (and (reaches 0 39 57) (not (matches-criteria 0 39 57))) 
    (reaches 0 39 (+ 57 1))
))

(assert (=> 
   (and (reaches 0 39 57) (= (rule-target 39 57) NONE)) 
    (reaches 0 39 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 0 39 58))
    (reaches 0 39 (- 58 1))
))

(assert (=> 
    (and (reaches 0 39 58) (not (matches-criteria 0 39 58))) 
    (reaches 0 39 (+ 58 1))
))

(assert (=> 
   (and (reaches 0 39 58) (= (rule-target 39 58) NONE)) 
    (reaches 0 39 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 0 39 59))
    (reaches 0 39 (- 59 1))
))

(assert (=> 
    (and (reaches 0 39 59) (not (matches-criteria 0 39 59))) 
    (reaches 0 39 (+ 59 1))
))

(assert (=> 
   (and (reaches 0 39 59) (= (rule-target 39 59) NONE)) 
    (reaches 0 39 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 0 39 60))
    (reaches 0 39 (- 60 1))
))

(assert (=> 
    (and (reaches 0 39 60) (not (matches-criteria 0 39 60))) 
    (reaches 0 39 (+ 60 1))
))

(assert (=> 
   (and (reaches 0 39 60) (= (rule-target 39 60) NONE)) 
    (reaches 0 39 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 0 39 61))
    (reaches 0 39 (- 61 1))
))

(assert (=> 
    (and (reaches 0 39 61) (not (matches-criteria 0 39 61))) 
    (reaches 0 39 (+ 61 1))
))

(assert (=> 
   (and (reaches 0 39 61) (= (rule-target 39 61) NONE)) 
    (reaches 0 39 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 0 39 62))
    (reaches 0 39 (- 62 1))
))

(assert (=> 
    (and (reaches 0 39 62) (not (matches-criteria 0 39 62))) 
    (reaches 0 39 (+ 62 1))
))

(assert (=> 
   (and (reaches 0 39 62) (= (rule-target 39 62) NONE)) 
    (reaches 0 39 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 0 39 63))
    (reaches 0 39 (- 63 1))
))

(assert (=> 
    (and (reaches 0 39 63) (not (matches-criteria 0 39 63))) 
    (reaches 0 39 (+ 63 1))
))

(assert (=> 
   (and (reaches 0 39 63) (= (rule-target 39 63) NONE)) 
    (reaches 0 39 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 0 39 64))
    (reaches 0 39 (- 64 1))
))

(assert (=> 
    (and (reaches 0 39 64) (not (matches-criteria 0 39 64))) 
    (reaches 0 39 (+ 64 1))
))

(assert (=> 
   (and (reaches 0 39 64) (= (rule-target 39 64) NONE)) 
    (reaches 0 39 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 0 39 65))
    (reaches 0 39 (- 65 1))
))

(assert (=> 
    (and (reaches 0 39 65) (not (matches-criteria 0 39 65))) 
    (reaches 0 39 (+ 65 1))
))

(assert (=> 
   (and (reaches 0 39 65) (= (rule-target 39 65) NONE)) 
    (reaches 0 39 (+ 65 1))
))(assert (=> 
    (and (<= 1 0) (reaches 1 39 0))
    (reaches 1 39 (- 0 1))
))

(assert (=> 
    (and (reaches 1 39 0) (not (matches-criteria 1 39 0))) 
    (reaches 1 39 (+ 0 1))
))

(assert (=> 
   (and (reaches 1 39 0) (= (rule-target 39 0) NONE)) 
    (reaches 1 39 (+ 0 1))
))(assert (=> 
    (and (<= 1 1) (reaches 1 39 1))
    (reaches 1 39 (- 1 1))
))

(assert (=> 
    (and (reaches 1 39 1) (not (matches-criteria 1 39 1))) 
    (reaches 1 39 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 39 1) (= (rule-target 39 1) NONE)) 
    (reaches 1 39 (+ 1 1))
))(assert (=> 
    (and (<= 1 2) (reaches 1 39 2))
    (reaches 1 39 (- 2 1))
))

(assert (=> 
    (and (reaches 1 39 2) (not (matches-criteria 1 39 2))) 
    (reaches 1 39 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 39 2) (= (rule-target 39 2) NONE)) 
    (reaches 1 39 (+ 2 1))
))(assert (=> 
    (and (<= 1 3) (reaches 1 39 3))
    (reaches 1 39 (- 3 1))
))

(assert (=> 
    (and (reaches 1 39 3) (not (matches-criteria 1 39 3))) 
    (reaches 1 39 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 39 3) (= (rule-target 39 3) NONE)) 
    (reaches 1 39 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 39 4))
    (reaches 1 39 (- 4 1))
))

(assert (=> 
    (and (reaches 1 39 4) (not (matches-criteria 1 39 4))) 
    (reaches 1 39 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 39 4) (= (rule-target 39 4) NONE)) 
    (reaches 1 39 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 39 5))
    (reaches 1 39 (- 5 1))
))

(assert (=> 
    (and (reaches 1 39 5) (not (matches-criteria 1 39 5))) 
    (reaches 1 39 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 39 5) (= (rule-target 39 5) NONE)) 
    (reaches 1 39 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 39 6))
    (reaches 1 39 (- 6 1))
))

(assert (=> 
    (and (reaches 1 39 6) (not (matches-criteria 1 39 6))) 
    (reaches 1 39 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 39 6) (= (rule-target 39 6) NONE)) 
    (reaches 1 39 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 39 7))
    (reaches 1 39 (- 7 1))
))

(assert (=> 
    (and (reaches 1 39 7) (not (matches-criteria 1 39 7))) 
    (reaches 1 39 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 39 7) (= (rule-target 39 7) NONE)) 
    (reaches 1 39 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 39 8))
    (reaches 1 39 (- 8 1))
))

(assert (=> 
    (and (reaches 1 39 8) (not (matches-criteria 1 39 8))) 
    (reaches 1 39 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 39 8) (= (rule-target 39 8) NONE)) 
    (reaches 1 39 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 39 9))
    (reaches 1 39 (- 9 1))
))

(assert (=> 
    (and (reaches 1 39 9) (not (matches-criteria 1 39 9))) 
    (reaches 1 39 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 39 9) (= (rule-target 39 9) NONE)) 
    (reaches 1 39 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 39 10))
    (reaches 1 39 (- 10 1))
))

(assert (=> 
    (and (reaches 1 39 10) (not (matches-criteria 1 39 10))) 
    (reaches 1 39 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 39 10) (= (rule-target 39 10) NONE)) 
    (reaches 1 39 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 39 11))
    (reaches 1 39 (- 11 1))
))

(assert (=> 
    (and (reaches 1 39 11) (not (matches-criteria 1 39 11))) 
    (reaches 1 39 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 39 11) (= (rule-target 39 11) NONE)) 
    (reaches 1 39 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 39 12))
    (reaches 1 39 (- 12 1))
))

(assert (=> 
    (and (reaches 1 39 12) (not (matches-criteria 1 39 12))) 
    (reaches 1 39 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 39 12) (= (rule-target 39 12) NONE)) 
    (reaches 1 39 (+ 12 1))
))(assert (=> 
    (and (<= 1 13) (reaches 1 39 13))
    (reaches 1 39 (- 13 1))
))

(assert (=> 
    (and (reaches 1 39 13) (not (matches-criteria 1 39 13))) 
    (reaches 1 39 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 39 13) (= (rule-target 39 13) NONE)) 
    (reaches 1 39 (+ 13 1))
))(assert (=> 
    (and (<= 1 14) (reaches 1 39 14))
    (reaches 1 39 (- 14 1))
))

(assert (=> 
    (and (reaches 1 39 14) (not (matches-criteria 1 39 14))) 
    (reaches 1 39 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 39 14) (= (rule-target 39 14) NONE)) 
    (reaches 1 39 (+ 14 1))
))(assert (=> 
    (and (<= 1 15) (reaches 1 39 15))
    (reaches 1 39 (- 15 1))
))

(assert (=> 
    (and (reaches 1 39 15) (not (matches-criteria 1 39 15))) 
    (reaches 1 39 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 39 15) (= (rule-target 39 15) NONE)) 
    (reaches 1 39 (+ 15 1))
))(assert (=> 
    (and (<= 1 16) (reaches 1 39 16))
    (reaches 1 39 (- 16 1))
))

(assert (=> 
    (and (reaches 1 39 16) (not (matches-criteria 1 39 16))) 
    (reaches 1 39 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 39 16) (= (rule-target 39 16) NONE)) 
    (reaches 1 39 (+ 16 1))
))(assert (=> 
    (and (<= 1 17) (reaches 1 39 17))
    (reaches 1 39 (- 17 1))
))

(assert (=> 
    (and (reaches 1 39 17) (not (matches-criteria 1 39 17))) 
    (reaches 1 39 (+ 17 1))
))

(assert (=> 
   (and (reaches 1 39 17) (= (rule-target 39 17) NONE)) 
    (reaches 1 39 (+ 17 1))
))(assert (=> 
    (and (<= 1 18) (reaches 1 39 18))
    (reaches 1 39 (- 18 1))
))

(assert (=> 
    (and (reaches 1 39 18) (not (matches-criteria 1 39 18))) 
    (reaches 1 39 (+ 18 1))
))

(assert (=> 
   (and (reaches 1 39 18) (= (rule-target 39 18) NONE)) 
    (reaches 1 39 (+ 18 1))
))(assert (=> 
    (and (<= 1 19) (reaches 1 39 19))
    (reaches 1 39 (- 19 1))
))

(assert (=> 
    (and (reaches 1 39 19) (not (matches-criteria 1 39 19))) 
    (reaches 1 39 (+ 19 1))
))

(assert (=> 
   (and (reaches 1 39 19) (= (rule-target 39 19) NONE)) 
    (reaches 1 39 (+ 19 1))
))(assert (=> 
    (and (<= 1 20) (reaches 1 39 20))
    (reaches 1 39 (- 20 1))
))

(assert (=> 
    (and (reaches 1 39 20) (not (matches-criteria 1 39 20))) 
    (reaches 1 39 (+ 20 1))
))

(assert (=> 
   (and (reaches 1 39 20) (= (rule-target 39 20) NONE)) 
    (reaches 1 39 (+ 20 1))
))(assert (=> 
    (and (<= 1 21) (reaches 1 39 21))
    (reaches 1 39 (- 21 1))
))

(assert (=> 
    (and (reaches 1 39 21) (not (matches-criteria 1 39 21))) 
    (reaches 1 39 (+ 21 1))
))

(assert (=> 
   (and (reaches 1 39 21) (= (rule-target 39 21) NONE)) 
    (reaches 1 39 (+ 21 1))
))(assert (=> 
    (and (<= 1 22) (reaches 1 39 22))
    (reaches 1 39 (- 22 1))
))

(assert (=> 
    (and (reaches 1 39 22) (not (matches-criteria 1 39 22))) 
    (reaches 1 39 (+ 22 1))
))

(assert (=> 
   (and (reaches 1 39 22) (= (rule-target 39 22) NONE)) 
    (reaches 1 39 (+ 22 1))
))(assert (=> 
    (and (<= 1 23) (reaches 1 39 23))
    (reaches 1 39 (- 23 1))
))

(assert (=> 
    (and (reaches 1 39 23) (not (matches-criteria 1 39 23))) 
    (reaches 1 39 (+ 23 1))
))

(assert (=> 
   (and (reaches 1 39 23) (= (rule-target 39 23) NONE)) 
    (reaches 1 39 (+ 23 1))
))(assert (=> 
    (and (<= 1 24) (reaches 1 39 24))
    (reaches 1 39 (- 24 1))
))

(assert (=> 
    (and (reaches 1 39 24) (not (matches-criteria 1 39 24))) 
    (reaches 1 39 (+ 24 1))
))

(assert (=> 
   (and (reaches 1 39 24) (= (rule-target 39 24) NONE)) 
    (reaches 1 39 (+ 24 1))
))(assert (=> 
    (and (<= 1 25) (reaches 1 39 25))
    (reaches 1 39 (- 25 1))
))

(assert (=> 
    (and (reaches 1 39 25) (not (matches-criteria 1 39 25))) 
    (reaches 1 39 (+ 25 1))
))

(assert (=> 
   (and (reaches 1 39 25) (= (rule-target 39 25) NONE)) 
    (reaches 1 39 (+ 25 1))
))(assert (=> 
    (and (<= 1 26) (reaches 1 39 26))
    (reaches 1 39 (- 26 1))
))

(assert (=> 
    (and (reaches 1 39 26) (not (matches-criteria 1 39 26))) 
    (reaches 1 39 (+ 26 1))
))

(assert (=> 
   (and (reaches 1 39 26) (= (rule-target 39 26) NONE)) 
    (reaches 1 39 (+ 26 1))
))(assert (=> 
    (and (<= 1 27) (reaches 1 39 27))
    (reaches 1 39 (- 27 1))
))

(assert (=> 
    (and (reaches 1 39 27) (not (matches-criteria 1 39 27))) 
    (reaches 1 39 (+ 27 1))
))

(assert (=> 
   (and (reaches 1 39 27) (= (rule-target 39 27) NONE)) 
    (reaches 1 39 (+ 27 1))
))(assert (=> 
    (and (<= 1 28) (reaches 1 39 28))
    (reaches 1 39 (- 28 1))
))

(assert (=> 
    (and (reaches 1 39 28) (not (matches-criteria 1 39 28))) 
    (reaches 1 39 (+ 28 1))
))

(assert (=> 
   (and (reaches 1 39 28) (= (rule-target 39 28) NONE)) 
    (reaches 1 39 (+ 28 1))
))(assert (=> 
    (and (<= 1 29) (reaches 1 39 29))
    (reaches 1 39 (- 29 1))
))

(assert (=> 
    (and (reaches 1 39 29) (not (matches-criteria 1 39 29))) 
    (reaches 1 39 (+ 29 1))
))

(assert (=> 
   (and (reaches 1 39 29) (= (rule-target 39 29) NONE)) 
    (reaches 1 39 (+ 29 1))
))(assert (=> 
    (and (<= 1 30) (reaches 1 39 30))
    (reaches 1 39 (- 30 1))
))

(assert (=> 
    (and (reaches 1 39 30) (not (matches-criteria 1 39 30))) 
    (reaches 1 39 (+ 30 1))
))

(assert (=> 
   (and (reaches 1 39 30) (= (rule-target 39 30) NONE)) 
    (reaches 1 39 (+ 30 1))
))(assert (=> 
    (and (<= 1 31) (reaches 1 39 31))
    (reaches 1 39 (- 31 1))
))

(assert (=> 
    (and (reaches 1 39 31) (not (matches-criteria 1 39 31))) 
    (reaches 1 39 (+ 31 1))
))

(assert (=> 
   (and (reaches 1 39 31) (= (rule-target 39 31) NONE)) 
    (reaches 1 39 (+ 31 1))
))(assert (=> 
    (and (<= 1 32) (reaches 1 39 32))
    (reaches 1 39 (- 32 1))
))

(assert (=> 
    (and (reaches 1 39 32) (not (matches-criteria 1 39 32))) 
    (reaches 1 39 (+ 32 1))
))

(assert (=> 
   (and (reaches 1 39 32) (= (rule-target 39 32) NONE)) 
    (reaches 1 39 (+ 32 1))
))(assert (=> 
    (and (<= 1 33) (reaches 1 39 33))
    (reaches 1 39 (- 33 1))
))

(assert (=> 
    (and (reaches 1 39 33) (not (matches-criteria 1 39 33))) 
    (reaches 1 39 (+ 33 1))
))

(assert (=> 
   (and (reaches 1 39 33) (= (rule-target 39 33) NONE)) 
    (reaches 1 39 (+ 33 1))
))(assert (=> 
    (and (<= 1 34) (reaches 1 39 34))
    (reaches 1 39 (- 34 1))
))

(assert (=> 
    (and (reaches 1 39 34) (not (matches-criteria 1 39 34))) 
    (reaches 1 39 (+ 34 1))
))

(assert (=> 
   (and (reaches 1 39 34) (= (rule-target 39 34) NONE)) 
    (reaches 1 39 (+ 34 1))
))(assert (=> 
    (and (<= 1 35) (reaches 1 39 35))
    (reaches 1 39 (- 35 1))
))

(assert (=> 
    (and (reaches 1 39 35) (not (matches-criteria 1 39 35))) 
    (reaches 1 39 (+ 35 1))
))

(assert (=> 
   (and (reaches 1 39 35) (= (rule-target 39 35) NONE)) 
    (reaches 1 39 (+ 35 1))
))(assert (=> 
    (and (<= 1 36) (reaches 1 39 36))
    (reaches 1 39 (- 36 1))
))

(assert (=> 
    (and (reaches 1 39 36) (not (matches-criteria 1 39 36))) 
    (reaches 1 39 (+ 36 1))
))

(assert (=> 
   (and (reaches 1 39 36) (= (rule-target 39 36) NONE)) 
    (reaches 1 39 (+ 36 1))
))(assert (=> 
    (and (<= 1 37) (reaches 1 39 37))
    (reaches 1 39 (- 37 1))
))

(assert (=> 
    (and (reaches 1 39 37) (not (matches-criteria 1 39 37))) 
    (reaches 1 39 (+ 37 1))
))

(assert (=> 
   (and (reaches 1 39 37) (= (rule-target 39 37) NONE)) 
    (reaches 1 39 (+ 37 1))
))(assert (=> 
    (and (<= 1 38) (reaches 1 39 38))
    (reaches 1 39 (- 38 1))
))

(assert (=> 
    (and (reaches 1 39 38) (not (matches-criteria 1 39 38))) 
    (reaches 1 39 (+ 38 1))
))

(assert (=> 
   (and (reaches 1 39 38) (= (rule-target 39 38) NONE)) 
    (reaches 1 39 (+ 38 1))
))(assert (=> 
    (and (<= 1 39) (reaches 1 39 39))
    (reaches 1 39 (- 39 1))
))

(assert (=> 
    (and (reaches 1 39 39) (not (matches-criteria 1 39 39))) 
    (reaches 1 39 (+ 39 1))
))

(assert (=> 
   (and (reaches 1 39 39) (= (rule-target 39 39) NONE)) 
    (reaches 1 39 (+ 39 1))
))(assert (=> 
    (and (<= 1 40) (reaches 1 39 40))
    (reaches 1 39 (- 40 1))
))

(assert (=> 
    (and (reaches 1 39 40) (not (matches-criteria 1 39 40))) 
    (reaches 1 39 (+ 40 1))
))

(assert (=> 
   (and (reaches 1 39 40) (= (rule-target 39 40) NONE)) 
    (reaches 1 39 (+ 40 1))
))(assert (=> 
    (and (<= 1 41) (reaches 1 39 41))
    (reaches 1 39 (- 41 1))
))

(assert (=> 
    (and (reaches 1 39 41) (not (matches-criteria 1 39 41))) 
    (reaches 1 39 (+ 41 1))
))

(assert (=> 
   (and (reaches 1 39 41) (= (rule-target 39 41) NONE)) 
    (reaches 1 39 (+ 41 1))
))(assert (=> 
    (and (<= 1 42) (reaches 1 39 42))
    (reaches 1 39 (- 42 1))
))

(assert (=> 
    (and (reaches 1 39 42) (not (matches-criteria 1 39 42))) 
    (reaches 1 39 (+ 42 1))
))

(assert (=> 
   (and (reaches 1 39 42) (= (rule-target 39 42) NONE)) 
    (reaches 1 39 (+ 42 1))
))(assert (=> 
    (and (<= 1 43) (reaches 1 39 43))
    (reaches 1 39 (- 43 1))
))

(assert (=> 
    (and (reaches 1 39 43) (not (matches-criteria 1 39 43))) 
    (reaches 1 39 (+ 43 1))
))

(assert (=> 
   (and (reaches 1 39 43) (= (rule-target 39 43) NONE)) 
    (reaches 1 39 (+ 43 1))
))(assert (=> 
    (and (<= 1 44) (reaches 1 39 44))
    (reaches 1 39 (- 44 1))
))

(assert (=> 
    (and (reaches 1 39 44) (not (matches-criteria 1 39 44))) 
    (reaches 1 39 (+ 44 1))
))

(assert (=> 
   (and (reaches 1 39 44) (= (rule-target 39 44) NONE)) 
    (reaches 1 39 (+ 44 1))
))(assert (=> 
    (and (<= 1 45) (reaches 1 39 45))
    (reaches 1 39 (- 45 1))
))

(assert (=> 
    (and (reaches 1 39 45) (not (matches-criteria 1 39 45))) 
    (reaches 1 39 (+ 45 1))
))

(assert (=> 
   (and (reaches 1 39 45) (= (rule-target 39 45) NONE)) 
    (reaches 1 39 (+ 45 1))
))(assert (=> 
    (and (<= 1 46) (reaches 1 39 46))
    (reaches 1 39 (- 46 1))
))

(assert (=> 
    (and (reaches 1 39 46) (not (matches-criteria 1 39 46))) 
    (reaches 1 39 (+ 46 1))
))

(assert (=> 
   (and (reaches 1 39 46) (= (rule-target 39 46) NONE)) 
    (reaches 1 39 (+ 46 1))
))(assert (=> 
    (and (<= 1 47) (reaches 1 39 47))
    (reaches 1 39 (- 47 1))
))

(assert (=> 
    (and (reaches 1 39 47) (not (matches-criteria 1 39 47))) 
    (reaches 1 39 (+ 47 1))
))

(assert (=> 
   (and (reaches 1 39 47) (= (rule-target 39 47) NONE)) 
    (reaches 1 39 (+ 47 1))
))(assert (=> 
    (and (<= 1 48) (reaches 1 39 48))
    (reaches 1 39 (- 48 1))
))

(assert (=> 
    (and (reaches 1 39 48) (not (matches-criteria 1 39 48))) 
    (reaches 1 39 (+ 48 1))
))

(assert (=> 
   (and (reaches 1 39 48) (= (rule-target 39 48) NONE)) 
    (reaches 1 39 (+ 48 1))
))(assert (=> 
    (and (<= 1 49) (reaches 1 39 49))
    (reaches 1 39 (- 49 1))
))

(assert (=> 
    (and (reaches 1 39 49) (not (matches-criteria 1 39 49))) 
    (reaches 1 39 (+ 49 1))
))

(assert (=> 
   (and (reaches 1 39 49) (= (rule-target 39 49) NONE)) 
    (reaches 1 39 (+ 49 1))
))(assert (=> 
    (and (<= 1 50) (reaches 1 39 50))
    (reaches 1 39 (- 50 1))
))

(assert (=> 
    (and (reaches 1 39 50) (not (matches-criteria 1 39 50))) 
    (reaches 1 39 (+ 50 1))
))

(assert (=> 
   (and (reaches 1 39 50) (= (rule-target 39 50) NONE)) 
    (reaches 1 39 (+ 50 1))
))(assert (=> 
    (and (<= 1 51) (reaches 1 39 51))
    (reaches 1 39 (- 51 1))
))

(assert (=> 
    (and (reaches 1 39 51) (not (matches-criteria 1 39 51))) 
    (reaches 1 39 (+ 51 1))
))

(assert (=> 
   (and (reaches 1 39 51) (= (rule-target 39 51) NONE)) 
    (reaches 1 39 (+ 51 1))
))(assert (=> 
    (and (<= 1 52) (reaches 1 39 52))
    (reaches 1 39 (- 52 1))
))

(assert (=> 
    (and (reaches 1 39 52) (not (matches-criteria 1 39 52))) 
    (reaches 1 39 (+ 52 1))
))

(assert (=> 
   (and (reaches 1 39 52) (= (rule-target 39 52) NONE)) 
    (reaches 1 39 (+ 52 1))
))(assert (=> 
    (and (<= 1 53) (reaches 1 39 53))
    (reaches 1 39 (- 53 1))
))

(assert (=> 
    (and (reaches 1 39 53) (not (matches-criteria 1 39 53))) 
    (reaches 1 39 (+ 53 1))
))

(assert (=> 
   (and (reaches 1 39 53) (= (rule-target 39 53) NONE)) 
    (reaches 1 39 (+ 53 1))
))(assert (=> 
    (and (<= 1 54) (reaches 1 39 54))
    (reaches 1 39 (- 54 1))
))

(assert (=> 
    (and (reaches 1 39 54) (not (matches-criteria 1 39 54))) 
    (reaches 1 39 (+ 54 1))
))

(assert (=> 
   (and (reaches 1 39 54) (= (rule-target 39 54) NONE)) 
    (reaches 1 39 (+ 54 1))
))(assert (=> 
    (and (<= 1 55) (reaches 1 39 55))
    (reaches 1 39 (- 55 1))
))

(assert (=> 
    (and (reaches 1 39 55) (not (matches-criteria 1 39 55))) 
    (reaches 1 39 (+ 55 1))
))

(assert (=> 
   (and (reaches 1 39 55) (= (rule-target 39 55) NONE)) 
    (reaches 1 39 (+ 55 1))
))(assert (=> 
    (and (<= 1 56) (reaches 1 39 56))
    (reaches 1 39 (- 56 1))
))

(assert (=> 
    (and (reaches 1 39 56) (not (matches-criteria 1 39 56))) 
    (reaches 1 39 (+ 56 1))
))

(assert (=> 
   (and (reaches 1 39 56) (= (rule-target 39 56) NONE)) 
    (reaches 1 39 (+ 56 1))
))(assert (=> 
    (and (<= 1 57) (reaches 1 39 57))
    (reaches 1 39 (- 57 1))
))

(assert (=> 
    (and (reaches 1 39 57) (not (matches-criteria 1 39 57))) 
    (reaches 1 39 (+ 57 1))
))

(assert (=> 
   (and (reaches 1 39 57) (= (rule-target 39 57) NONE)) 
    (reaches 1 39 (+ 57 1))
))(assert (=> 
    (and (<= 1 58) (reaches 1 39 58))
    (reaches 1 39 (- 58 1))
))

(assert (=> 
    (and (reaches 1 39 58) (not (matches-criteria 1 39 58))) 
    (reaches 1 39 (+ 58 1))
))

(assert (=> 
   (and (reaches 1 39 58) (= (rule-target 39 58) NONE)) 
    (reaches 1 39 (+ 58 1))
))(assert (=> 
    (and (<= 1 59) (reaches 1 39 59))
    (reaches 1 39 (- 59 1))
))

(assert (=> 
    (and (reaches 1 39 59) (not (matches-criteria 1 39 59))) 
    (reaches 1 39 (+ 59 1))
))

(assert (=> 
   (and (reaches 1 39 59) (= (rule-target 39 59) NONE)) 
    (reaches 1 39 (+ 59 1))
))(assert (=> 
    (and (<= 1 60) (reaches 1 39 60))
    (reaches 1 39 (- 60 1))
))

(assert (=> 
    (and (reaches 1 39 60) (not (matches-criteria 1 39 60))) 
    (reaches 1 39 (+ 60 1))
))

(assert (=> 
   (and (reaches 1 39 60) (= (rule-target 39 60) NONE)) 
    (reaches 1 39 (+ 60 1))
))(assert (=> 
    (and (<= 1 61) (reaches 1 39 61))
    (reaches 1 39 (- 61 1))
))

(assert (=> 
    (and (reaches 1 39 61) (not (matches-criteria 1 39 61))) 
    (reaches 1 39 (+ 61 1))
))

(assert (=> 
   (and (reaches 1 39 61) (= (rule-target 39 61) NONE)) 
    (reaches 1 39 (+ 61 1))
))(assert (=> 
    (and (<= 1 62) (reaches 1 39 62))
    (reaches 1 39 (- 62 1))
))

(assert (=> 
    (and (reaches 1 39 62) (not (matches-criteria 1 39 62))) 
    (reaches 1 39 (+ 62 1))
))

(assert (=> 
   (and (reaches 1 39 62) (= (rule-target 39 62) NONE)) 
    (reaches 1 39 (+ 62 1))
))(assert (=> 
    (and (<= 1 63) (reaches 1 39 63))
    (reaches 1 39 (- 63 1))
))

(assert (=> 
    (and (reaches 1 39 63) (not (matches-criteria 1 39 63))) 
    (reaches 1 39 (+ 63 1))
))

(assert (=> 
   (and (reaches 1 39 63) (= (rule-target 39 63) NONE)) 
    (reaches 1 39 (+ 63 1))
))(assert (=> 
    (and (<= 1 64) (reaches 1 39 64))
    (reaches 1 39 (- 64 1))
))

(assert (=> 
    (and (reaches 1 39 64) (not (matches-criteria 1 39 64))) 
    (reaches 1 39 (+ 64 1))
))

(assert (=> 
   (and (reaches 1 39 64) (= (rule-target 39 64) NONE)) 
    (reaches 1 39 (+ 64 1))
))(assert (=> 
    (and (<= 1 65) (reaches 1 39 65))
    (reaches 1 39 (- 65 1))
))

(assert (=> 
    (and (reaches 1 39 65) (not (matches-criteria 1 39 65))) 
    (reaches 1 39 (+ 65 1))
))

(assert (=> 
   (and (reaches 1 39 65) (= (rule-target 39 65) NONE)) 
    (reaches 1 39 (+ 65 1))
))
(assert (= (and (= (protocol 0)17) (= (source_port 0)87)) (matches-criteria 0 16 0)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)87)) (matches-criteria 1 16 0)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)88)) (matches-criteria 0 16 1)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)88)) (matches-criteria 1 16 1)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)89)) (matches-criteria 0 16 2)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)89)) (matches-criteria 1 16 2)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)99)) (matches-criteria 0 16 3)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)99)) (matches-criteria 1 16 3)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)199)) (matches-criteria 0 16 4)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)199)) (matches-criteria 1 16 4)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)291)) (matches-criteria 0 16 5)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)291)) (matches-criteria 1 16 5)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)3422)) (matches-criteria 0 16 6)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)3422)) (matches-criteria 1 16 6)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8000))) (matches-criteria 0 16 7)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8000))) (matches-criteria 1 16 7)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8001))) (matches-criteria 0 16 8)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8001))) (matches-criteria 1 16 8)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8002))) (matches-criteria 0 16 9)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8002))) (matches-criteria 1 16 9)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8003))) (matches-criteria 0 16 10)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8003))) (matches-criteria 1 16 10)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8004))) (matches-criteria 0 16 11)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8004))) (matches-criteria 1 16 11)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8005))) (matches-criteria 0 16 12)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8005))) (matches-criteria 1 16 12)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8000))) (matches-criteria 0 16 13)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8000))) (matches-criteria 1 16 13)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8001))) (matches-criteria 0 16 14)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8001))) (matches-criteria 1 16 14)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8002))) (matches-criteria 0 16 15)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8002))) (matches-criteria 1 16 15)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8003))) (matches-criteria 0 16 16)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8003))) (matches-criteria 1 16 16)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8004))) (matches-criteria 0 16 17)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8004))) (matches-criteria 1 16 17)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8005))) (matches-criteria 0 16 18)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8005))) (matches-criteria 1 16 18)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8000))) (matches-criteria 0 16 19)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8000))) (matches-criteria 1 16 19)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8001))) (matches-criteria 0 16 20)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8001))) (matches-criteria 1 16 20)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8002))) (matches-criteria 0 16 21)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8002))) (matches-criteria 1 16 21)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8003))) (matches-criteria 0 16 22)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8003))) (matches-criteria 1 16 22)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8004))) (matches-criteria 0 16 23)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8004))) (matches-criteria 1 16 23)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8005))) (matches-criteria 0 16 24)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8005))) (matches-criteria 1 16 24)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8000))) (matches-criteria 0 16 25)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8000))) (matches-criteria 1 16 25)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8001))) (matches-criteria 0 16 26)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8001))) (matches-criteria 1 16 26)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8002))) (matches-criteria 0 16 27)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8002))) (matches-criteria 1 16 27)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8003))) (matches-criteria 0 16 28)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8003))) (matches-criteria 1 16 28)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8004))) (matches-criteria 0 16 29)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8004))) (matches-criteria 1 16 29)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8005))) (matches-criteria 0 16 30)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8005))) (matches-criteria 1 16 30)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8000))) (matches-criteria 0 16 31)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8000))) (matches-criteria 1 16 31)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8001))) (matches-criteria 0 16 32)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8001))) (matches-criteria 1 16 32)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8002))) (matches-criteria 0 16 33)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8002))) (matches-criteria 1 16 33)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8003))) (matches-criteria 0 16 34)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8003))) (matches-criteria 1 16 34)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8004))) (matches-criteria 0 16 35)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8004))) (matches-criteria 1 16 35)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8005))) (matches-criteria 0 16 36)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8005))) (matches-criteria 1 16 36)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8000))) (matches-criteria 0 16 37)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8000))) (matches-criteria 1 16 37)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8001))) (matches-criteria 0 16 38)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8001))) (matches-criteria 1 16 38)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8002))) (matches-criteria 0 16 39)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8002))) (matches-criteria 1 16 39)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8003))) (matches-criteria 0 16 40)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8003))) (matches-criteria 1 16 40)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8004))) (matches-criteria 0 16 41)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8004))) (matches-criteria 1 16 41)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8005))) (matches-criteria 0 16 42)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8005))) (matches-criteria 1 16 42)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8000))) (matches-criteria 0 16 43)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8000))) (matches-criteria 1 16 43)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8001))) (matches-criteria 0 16 44)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8001))) (matches-criteria 1 16 44)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8002))) (matches-criteria 0 16 45)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8002))) (matches-criteria 1 16 45)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8003))) (matches-criteria 0 16 46)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8003))) (matches-criteria 1 16 46)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8004))) (matches-criteria 0 16 47)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8004))) (matches-criteria 1 16 47)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8005))) (matches-criteria 0 16 48)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8005))) (matches-criteria 1 16 48)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8000))) (matches-criteria 0 16 49)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8000))) (matches-criteria 1 16 49)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8001))) (matches-criteria 0 16 50)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8001))) (matches-criteria 1 16 50)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8002))) (matches-criteria 0 16 51)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8002))) (matches-criteria 1 16 51)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8003))) (matches-criteria 0 16 52)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8003))) (matches-criteria 1 16 52)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8004))) (matches-criteria 0 16 53)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8004))) (matches-criteria 1 16 53)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8005))) (matches-criteria 0 16 54)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8005))) (matches-criteria 1 16 54)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (ACK 0))) (matches-criteria 0 16 55)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (ACK 0))) (matches-criteria 1 16 55)))

(assert (= (= (protocol 0)10) (matches-criteria 0 16 56)))
(assert (= (= (protocol 0)10) (matches-criteria 1 16 56)))

(assert (= (= (protocol 0)9) (matches-criteria 0 16 57)))
(assert (= (= (protocol 0)9) (matches-criteria 1 16 57)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)90)) (matches-criteria 0 16 58)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)90)) (matches-criteria 1 16 58)))

(assert (= (and (= (protocol 0)6) (and (<= 95 (destination_port 0)) (<= (destination_port 0)1110))) (matches-criteria 0 16 59)))
(assert (= (and (= (protocol 0)6) (and (<= 95 (destination_port 0)) (<= (destination_port 0)1110))) (matches-criteria 1 16 59)))

(assert (= (= (protocol 0)17) (matches-criteria 0 16 60)))
(assert (= (= (protocol 0)17) (matches-criteria 1 16 60)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 0 16 61)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 1 16 61)))

(assert (= (and (= (protocol 0)6) (not (RST 0))) (matches-criteria 0 16 62)))
(assert (= (and (= (protocol 0)6) (not (RST 0))) (matches-criteria 1 16 62)))

(assert (matches-criteria 0 16 63))
(assert (matches-criteria 1 16 63))

(assert (= (and (= (protocol 0)37) (and (= (protocol 0)17) (= (source_port 0)97))) (matches-criteria 0 17 0)))
(assert (= (and (= (protocol 0)37) (and (= (protocol 0)17) (= (source_port 0)97))) (matches-criteria 1 17 0)))

(assert (= (and (= (protocol 0)1) (and (= (protocol 0)17) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 0 17 1)))
(assert (= (and (= (protocol 0)1) (and (= (protocol 0)17) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 1 17 1)))

(assert (= (and (= (protocol 0)1) (and (= (protocol 0)6) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 0 17 2)))
(assert (= (and (= (protocol 0)1) (and (= (protocol 0)6) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 1 17 2)))

(assert (= (and (= (protocol 0)37) (and (= (protocol 0)6) (= (source_port 0)97))) (matches-criteria 0 17 3)))
(assert (= (and (= (protocol 0)37) (and (= (protocol 0)6) (= (source_port 0)97))) (matches-criteria 1 17 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)100))) (matches-criteria 0 17 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)100))) (matches-criteria 1 17 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)200))) (matches-criteria 0 17 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)200))) (matches-criteria 1 17 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)300))) (matches-criteria 0 17 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)300))) (matches-criteria 1 17 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)400))) (matches-criteria 0 17 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)400))) (matches-criteria 1 17 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)500))) (matches-criteria 0 17 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)500))) (matches-criteria 1 17 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)600))) (matches-criteria 0 17 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)600))) (matches-criteria 1 17 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)700))) (matches-criteria 0 17 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)700))) (matches-criteria 1 17 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)800))) (matches-criteria 0 17 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)800))) (matches-criteria 1 17 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)900))) (matches-criteria 0 17 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)900))) (matches-criteria 1 17 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)1000))) (matches-criteria 0 17 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)1000))) (matches-criteria 1 17 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)100))) (matches-criteria 0 17 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)100))) (matches-criteria 1 17 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)200))) (matches-criteria 0 17 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)200))) (matches-criteria 1 17 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)300))) (matches-criteria 0 17 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)300))) (matches-criteria 1 17 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)400))) (matches-criteria 0 17 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)400))) (matches-criteria 1 17 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)500))) (matches-criteria 0 17 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)500))) (matches-criteria 1 17 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)600))) (matches-criteria 0 17 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)600))) (matches-criteria 1 17 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)700))) (matches-criteria 0 17 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)700))) (matches-criteria 1 17 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)800))) (matches-criteria 0 17 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)800))) (matches-criteria 1 17 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)900))) (matches-criteria 0 17 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)900))) (matches-criteria 1 17 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)1000))) (matches-criteria 0 17 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)1000))) (matches-criteria 1 17 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)100))) (matches-criteria 0 17 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)100))) (matches-criteria 1 17 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)200))) (matches-criteria 0 17 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)200))) (matches-criteria 1 17 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)300))) (matches-criteria 0 17 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)300))) (matches-criteria 1 17 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)400))) (matches-criteria 0 17 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)400))) (matches-criteria 1 17 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)500))) (matches-criteria 0 17 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)500))) (matches-criteria 1 17 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)600))) (matches-criteria 0 17 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)600))) (matches-criteria 1 17 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)700))) (matches-criteria 0 17 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)700))) (matches-criteria 1 17 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)800))) (matches-criteria 0 17 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)800))) (matches-criteria 1 17 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)900))) (matches-criteria 0 17 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)900))) (matches-criteria 1 17 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)1000))) (matches-criteria 0 17 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)1000))) (matches-criteria 1 17 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)100))) (matches-criteria 0 17 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)100))) (matches-criteria 1 17 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)200))) (matches-criteria 0 17 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)200))) (matches-criteria 1 17 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)300))) (matches-criteria 0 17 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)300))) (matches-criteria 1 17 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)400))) (matches-criteria 0 17 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)400))) (matches-criteria 1 17 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)500))) (matches-criteria 0 17 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)500))) (matches-criteria 1 17 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)600))) (matches-criteria 0 17 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)600))) (matches-criteria 1 17 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)700))) (matches-criteria 0 17 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)700))) (matches-criteria 1 17 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)800))) (matches-criteria 0 17 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)800))) (matches-criteria 1 17 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)900))) (matches-criteria 0 17 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)900))) (matches-criteria 1 17 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)1000))) (matches-criteria 0 17 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)1000))) (matches-criteria 1 17 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)100))) (matches-criteria 0 17 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)100))) (matches-criteria 1 17 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)200))) (matches-criteria 0 17 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)200))) (matches-criteria 1 17 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)300))) (matches-criteria 0 17 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)300))) (matches-criteria 1 17 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)400))) (matches-criteria 0 17 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)400))) (matches-criteria 1 17 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)500))) (matches-criteria 0 17 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)500))) (matches-criteria 1 17 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)600))) (matches-criteria 0 17 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)600))) (matches-criteria 1 17 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)700))) (matches-criteria 0 17 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)700))) (matches-criteria 1 17 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)800))) (matches-criteria 0 17 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)800))) (matches-criteria 1 17 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)900))) (matches-criteria 0 17 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)900))) (matches-criteria 1 17 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)1000))) (matches-criteria 0 17 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)1000))) (matches-criteria 1 17 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)100))) (matches-criteria 0 17 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)100))) (matches-criteria 1 17 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)200))) (matches-criteria 0 17 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)200))) (matches-criteria 1 17 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)300))) (matches-criteria 0 17 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)300))) (matches-criteria 1 17 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)400))) (matches-criteria 0 17 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)400))) (matches-criteria 1 17 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)500))) (matches-criteria 0 17 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)500))) (matches-criteria 1 17 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)600))) (matches-criteria 0 17 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)600))) (matches-criteria 1 17 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)700))) (matches-criteria 0 17 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)700))) (matches-criteria 1 17 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)800))) (matches-criteria 0 17 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)800))) (matches-criteria 1 17 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)900))) (matches-criteria 0 17 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)900))) (matches-criteria 1 17 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)1000))) (matches-criteria 0 17 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)1000))) (matches-criteria 1 17 63)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)100))) (matches-criteria 0 17 64)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)100))) (matches-criteria 1 17 64)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)200))) (matches-criteria 0 17 65)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)200))) (matches-criteria 1 17 65)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)300))) (matches-criteria 0 17 66)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)300))) (matches-criteria 1 17 66)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)400))) (matches-criteria 0 17 67)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)400))) (matches-criteria 1 17 67)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)500))) (matches-criteria 0 17 68)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)500))) (matches-criteria 1 17 68)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)600))) (matches-criteria 0 17 69)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)600))) (matches-criteria 1 17 69)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)700))) (matches-criteria 0 17 70)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)700))) (matches-criteria 1 17 70)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)800))) (matches-criteria 0 17 71)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)800))) (matches-criteria 1 17 71)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)900))) (matches-criteria 0 17 72)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)900))) (matches-criteria 1 17 72)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)1000))) (matches-criteria 0 17 73)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)1000))) (matches-criteria 1 17 73)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)100))) (matches-criteria 0 17 74)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)100))) (matches-criteria 1 17 74)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)200))) (matches-criteria 0 17 75)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)200))) (matches-criteria 1 17 75)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)300))) (matches-criteria 0 17 76)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)300))) (matches-criteria 1 17 76)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)400))) (matches-criteria 0 17 77)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)400))) (matches-criteria 1 17 77)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)500))) (matches-criteria 0 17 78)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)500))) (matches-criteria 1 17 78)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)600))) (matches-criteria 0 17 79)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)600))) (matches-criteria 1 17 79)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)700))) (matches-criteria 0 17 80)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)700))) (matches-criteria 1 17 80)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)800))) (matches-criteria 0 17 81)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)800))) (matches-criteria 1 17 81)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)900))) (matches-criteria 0 17 82)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)900))) (matches-criteria 1 17 82)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)1000))) (matches-criteria 0 17 83)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)1000))) (matches-criteria 1 17 83)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)100))) (matches-criteria 0 17 84)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)100))) (matches-criteria 1 17 84)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)200))) (matches-criteria 0 17 85)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)200))) (matches-criteria 1 17 85)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)300))) (matches-criteria 0 17 86)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)300))) (matches-criteria 1 17 86)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)400))) (matches-criteria 0 17 87)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)400))) (matches-criteria 1 17 87)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)500))) (matches-criteria 0 17 88)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)500))) (matches-criteria 1 17 88)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)600))) (matches-criteria 0 17 89)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)600))) (matches-criteria 1 17 89)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)700))) (matches-criteria 0 17 90)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)700))) (matches-criteria 1 17 90)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)800))) (matches-criteria 0 17 91)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)800))) (matches-criteria 1 17 91)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)900))) (matches-criteria 0 17 92)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)900))) (matches-criteria 1 17 92)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)1000))) (matches-criteria 0 17 93)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)1000))) (matches-criteria 1 17 93)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)100))) (matches-criteria 0 17 94)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)100))) (matches-criteria 1 17 94)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)200))) (matches-criteria 0 17 95)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)200))) (matches-criteria 1 17 95)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)300))) (matches-criteria 0 17 96)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)300))) (matches-criteria 1 17 96)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)400))) (matches-criteria 0 17 97)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)400))) (matches-criteria 1 17 97)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)500))) (matches-criteria 0 17 98)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)500))) (matches-criteria 1 17 98)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)600))) (matches-criteria 0 17 99)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)600))) (matches-criteria 1 17 99)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)700))) (matches-criteria 0 17 100)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)700))) (matches-criteria 1 17 100)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)800))) (matches-criteria 0 17 101)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)800))) (matches-criteria 1 17 101)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)900))) (matches-criteria 0 17 102)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)900))) (matches-criteria 1 17 102)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)1000))) (matches-criteria 0 17 103)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)1000))) (matches-criteria 1 17 103)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 0 18 0)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 1 18 0)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 0 18 1)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 1 18 1)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 0 18 2)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 1 18 2)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 0 18 3)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 1 18 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 0 18 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 1 18 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 0 18 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 1 18 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 0 18 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 1 18 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 0 18 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 1 18 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 0 18 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 1 18 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 0 18 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 1 18 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 0 18 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 1 18 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 0 18 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 1 18 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 0 18 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 1 18 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 0 18 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 1 18 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 0 18 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 1 18 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 0 18 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 1 18 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 0 18 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 1 18 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 0 18 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 1 18 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 0 18 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 1 18 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 0 18 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 1 18 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 0 18 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 1 18 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 0 18 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 1 18 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 0 18 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 1 18 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 0 18 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 1 18 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 0 18 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 1 18 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 0 18 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 1 18 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 0 18 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 1 18 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 0 18 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 1 18 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 0 18 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 1 18 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 0 18 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 1 18 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 0 18 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 1 18 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 0 18 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 1 18 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 0 18 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 1 18 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 0 18 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 1 18 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 0 18 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 1 18 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 0 18 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 1 18 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 0 18 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 1 18 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 0 18 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 1 18 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 0 18 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 1 18 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 0 18 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 1 18 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 0 18 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 1 18 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 0 18 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 1 18 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 0 18 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 1 18 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 0 18 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 1 18 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 0 18 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 1 18 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 0 18 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 1 18 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 0 18 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 1 18 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 0 18 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 1 18 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 0 18 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 1 18 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 0 18 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 1 18 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 0 18 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 1 18 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 0 18 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 1 18 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 0 18 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 1 18 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 0 18 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 1 18 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 0 18 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 1 18 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 0 18 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 1 18 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 0 18 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 1 18 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 0 18 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 1 18 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 0 18 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 1 18 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 0 18 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 1 18 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 0 18 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 1 18 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 0 18 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 1 18 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 0 18 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 1 18 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 0 18 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 1 18 63)))

(assert (= (= (protocol 0)6) (matches-criteria 0 18 64)))
(assert (= (= (protocol 0)6) (matches-criteria 1 18 64)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 0 19 0)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 1 19 0)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 0 19 1)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 1 19 1)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 0 19 2)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 1 19 2)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 0 19 3)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 1 19 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 0 19 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 1 19 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 0 19 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 1 19 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 0 19 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 1 19 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 0 19 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 1 19 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 0 19 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 1 19 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 0 19 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 1 19 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 0 19 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 1 19 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 0 19 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 1 19 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 0 19 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 1 19 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 0 19 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 1 19 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 0 19 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 1 19 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 0 19 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 1 19 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 0 19 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 1 19 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 0 19 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 1 19 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 0 19 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 1 19 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 0 19 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 1 19 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 0 19 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 1 19 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 0 19 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 1 19 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 0 19 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 1 19 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 0 19 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 1 19 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 0 19 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 1 19 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 0 19 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 1 19 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 0 19 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 1 19 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 0 19 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 1 19 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 0 19 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 1 19 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 0 19 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 1 19 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 0 19 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 1 19 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 0 19 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 1 19 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 0 19 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 1 19 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 0 19 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 1 19 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 0 19 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 1 19 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 0 19 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 1 19 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 0 19 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 1 19 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 0 19 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 1 19 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 0 19 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 1 19 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 0 19 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 1 19 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 0 19 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 1 19 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 0 19 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 1 19 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 0 19 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 1 19 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 0 19 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 1 19 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 0 19 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 1 19 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 0 19 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 1 19 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 0 19 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 1 19 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 0 19 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 1 19 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 0 19 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 1 19 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 0 19 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 1 19 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 0 19 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 1 19 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 0 19 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 1 19 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 0 19 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 1 19 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 0 19 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 1 19 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 0 19 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 1 19 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 0 19 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 1 19 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 0 19 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 1 19 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 0 19 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 1 19 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 0 19 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 1 19 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 0 19 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 1 19 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 0 19 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 1 19 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 0 19 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 1 19 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 0 19 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 1 19 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 0 19 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 1 19 63)))

(assert (= (= (protocol 0)6) (matches-criteria 0 19 64)))
(assert (= (= (protocol 0)6) (matches-criteria 1 19 64)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)87)) (matches-criteria 0 36 0)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)87)) (matches-criteria 1 36 0)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)88)) (matches-criteria 0 36 1)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)88)) (matches-criteria 1 36 1)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)89)) (matches-criteria 0 36 2)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)89)) (matches-criteria 1 36 2)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)99)) (matches-criteria 0 36 3)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)99)) (matches-criteria 1 36 3)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)199)) (matches-criteria 0 36 4)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)199)) (matches-criteria 1 36 4)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)291)) (matches-criteria 0 36 5)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)291)) (matches-criteria 1 36 5)))

(assert (= (and (= (protocol 0)17) (= (source_port 0)3422)) (matches-criteria 0 36 6)))
(assert (= (and (= (protocol 0)17) (= (source_port 0)3422)) (matches-criteria 1 36 6)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8000))) (matches-criteria 0 36 7)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8000))) (matches-criteria 1 36 7)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8001))) (matches-criteria 0 36 8)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8001))) (matches-criteria 1 36 8)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8002))) (matches-criteria 0 36 9)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8002))) (matches-criteria 1 36 9)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8003))) (matches-criteria 0 36 10)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8003))) (matches-criteria 1 36 10)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8004))) (matches-criteria 0 36 11)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8004))) (matches-criteria 1 36 11)))

(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8005))) (matches-criteria 0 36 12)))
(assert (= (and (= (protocol 0)17) (and (and (<= 230 (source_port 0)) (<= (source_port 0)240)) (= (destination_port 0)8005))) (matches-criteria 1 36 12)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8000))) (matches-criteria 0 36 13)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8000))) (matches-criteria 1 36 13)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8001))) (matches-criteria 0 36 14)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8001))) (matches-criteria 1 36 14)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8002))) (matches-criteria 0 36 15)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8002))) (matches-criteria 1 36 15)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8003))) (matches-criteria 0 36 16)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8003))) (matches-criteria 1 36 16)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8004))) (matches-criteria 0 36 17)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8004))) (matches-criteria 1 36 17)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8005))) (matches-criteria 0 36 18)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4500) (= (destination_port 0)8005))) (matches-criteria 1 36 18)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8000))) (matches-criteria 0 36 19)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8000))) (matches-criteria 1 36 19)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8001))) (matches-criteria 0 36 20)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8001))) (matches-criteria 1 36 20)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8002))) (matches-criteria 0 36 21)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8002))) (matches-criteria 1 36 21)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8003))) (matches-criteria 0 36 22)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8003))) (matches-criteria 1 36 22)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8004))) (matches-criteria 0 36 23)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8004))) (matches-criteria 1 36 23)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8005))) (matches-criteria 0 36 24)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)4555) (= (destination_port 0)8005))) (matches-criteria 1 36 24)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8000))) (matches-criteria 0 36 25)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8000))) (matches-criteria 1 36 25)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8001))) (matches-criteria 0 36 26)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8001))) (matches-criteria 1 36 26)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8002))) (matches-criteria 0 36 27)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8002))) (matches-criteria 1 36 27)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8003))) (matches-criteria 0 36 28)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8003))) (matches-criteria 1 36 28)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8004))) (matches-criteria 0 36 29)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8004))) (matches-criteria 1 36 29)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8005))) (matches-criteria 0 36 30)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6432) (= (destination_port 0)8005))) (matches-criteria 1 36 30)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8000))) (matches-criteria 0 36 31)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8000))) (matches-criteria 1 36 31)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8001))) (matches-criteria 0 36 32)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8001))) (matches-criteria 1 36 32)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8002))) (matches-criteria 0 36 33)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8002))) (matches-criteria 1 36 33)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8003))) (matches-criteria 0 36 34)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8003))) (matches-criteria 1 36 34)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8004))) (matches-criteria 0 36 35)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8004))) (matches-criteria 1 36 35)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8005))) (matches-criteria 0 36 36)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)6462) (= (destination_port 0)8005))) (matches-criteria 1 36 36)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8000))) (matches-criteria 0 36 37)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8000))) (matches-criteria 1 36 37)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8001))) (matches-criteria 0 36 38)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8001))) (matches-criteria 1 36 38)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8002))) (matches-criteria 0 36 39)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8002))) (matches-criteria 1 36 39)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8003))) (matches-criteria 0 36 40)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8003))) (matches-criteria 1 36 40)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8004))) (matches-criteria 0 36 41)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8004))) (matches-criteria 1 36 41)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8005))) (matches-criteria 0 36 42)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)7889) (= (destination_port 0)8005))) (matches-criteria 1 36 42)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8000))) (matches-criteria 0 36 43)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8000))) (matches-criteria 1 36 43)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8001))) (matches-criteria 0 36 44)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8001))) (matches-criteria 1 36 44)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8002))) (matches-criteria 0 36 45)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8002))) (matches-criteria 1 36 45)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8003))) (matches-criteria 0 36 46)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8003))) (matches-criteria 1 36 46)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8004))) (matches-criteria 0 36 47)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8004))) (matches-criteria 1 36 47)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8005))) (matches-criteria 0 36 48)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)8990) (= (destination_port 0)8005))) (matches-criteria 1 36 48)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8000))) (matches-criteria 0 36 49)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8000))) (matches-criteria 1 36 49)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8001))) (matches-criteria 0 36 50)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8001))) (matches-criteria 1 36 50)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8002))) (matches-criteria 0 36 51)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8002))) (matches-criteria 1 36 51)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8003))) (matches-criteria 0 36 52)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8003))) (matches-criteria 1 36 52)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8004))) (matches-criteria 0 36 53)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8004))) (matches-criteria 1 36 53)))

(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8005))) (matches-criteria 0 36 54)))
(assert (= (and (= (protocol 0)17) (and (= (source_port 0)12305) (= (destination_port 0)8005))) (matches-criteria 1 36 54)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (ACK 0))) (matches-criteria 0 36 55)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (ACK 0))) (matches-criteria 1 36 55)))

(assert (= (= (protocol 0)22) (matches-criteria 0 36 56)))
(assert (= (= (protocol 0)22) (matches-criteria 1 36 56)))

(assert (= (= (protocol 0)10) (matches-criteria 0 36 57)))
(assert (= (= (protocol 0)10) (matches-criteria 1 36 57)))

(assert (= (= (protocol 0)9) (matches-criteria 0 36 58)))
(assert (= (= (protocol 0)9) (matches-criteria 1 36 58)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)90)) (matches-criteria 0 36 59)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)90)) (matches-criteria 1 36 59)))

(assert (= (and (= (protocol 0)6) (and (<= 95 (destination_port 0)) (<= (destination_port 0)1110))) (matches-criteria 0 36 60)))
(assert (= (and (= (protocol 0)6) (and (<= 95 (destination_port 0)) (<= (destination_port 0)1110))) (matches-criteria 1 36 60)))

(assert (= (= (protocol 0)17) (matches-criteria 0 36 61)))
(assert (= (= (protocol 0)17) (matches-criteria 1 36 61)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 0 36 62)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 1 36 62)))

(assert (= (and (= (protocol 0)6) (not (RST 0))) (matches-criteria 0 36 63)))
(assert (= (and (= (protocol 0)6) (not (RST 0))) (matches-criteria 1 36 63)))

(assert (matches-criteria 0 36 64))
(assert (matches-criteria 1 36 64))

(assert (= (and (= (protocol 0)37) (and (= (protocol 0)17) (= (source_port 0)97))) (matches-criteria 0 37 0)))
(assert (= (and (= (protocol 0)37) (and (= (protocol 0)17) (= (source_port 0)97))) (matches-criteria 1 37 0)))

(assert (= (and (= (protocol 0)1) (and (= (protocol 0)17) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 0 37 1)))
(assert (= (and (= (protocol 0)1) (and (= (protocol 0)17) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 1 37 1)))

(assert (= (and (= (protocol 0)1) (and (= (protocol 0)6) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 0 37 2)))
(assert (= (and (= (protocol 0)1) (and (= (protocol 0)6) (and (= (destination_port 0)45) (not (= (source_port 0)90))))) (matches-criteria 1 37 2)))

(assert (= (and (= (protocol 0)37) (and (= (protocol 0)6) (= (source_port 0)97))) (matches-criteria 0 37 3)))
(assert (= (and (= (protocol 0)37) (and (= (protocol 0)6) (= (source_port 0)97))) (matches-criteria 1 37 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)100))) (matches-criteria 0 37 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)100))) (matches-criteria 1 37 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)200))) (matches-criteria 0 37 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)200))) (matches-criteria 1 37 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)300))) (matches-criteria 0 37 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)300))) (matches-criteria 1 37 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)400))) (matches-criteria 0 37 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)400))) (matches-criteria 1 37 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)500))) (matches-criteria 0 37 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)500))) (matches-criteria 1 37 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)600))) (matches-criteria 0 37 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)600))) (matches-criteria 1 37 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)700))) (matches-criteria 0 37 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)700))) (matches-criteria 1 37 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)800))) (matches-criteria 0 37 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)800))) (matches-criteria 1 37 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)900))) (matches-criteria 0 37 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)900))) (matches-criteria 1 37 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)1000))) (matches-criteria 0 37 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)100) (= (destination_port 0)1000))) (matches-criteria 1 37 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)100))) (matches-criteria 0 37 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)100))) (matches-criteria 1 37 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)200))) (matches-criteria 0 37 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)200))) (matches-criteria 1 37 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)300))) (matches-criteria 0 37 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)300))) (matches-criteria 1 37 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)400))) (matches-criteria 0 37 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)400))) (matches-criteria 1 37 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)500))) (matches-criteria 0 37 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)500))) (matches-criteria 1 37 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)600))) (matches-criteria 0 37 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)600))) (matches-criteria 1 37 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)700))) (matches-criteria 0 37 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)700))) (matches-criteria 1 37 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)800))) (matches-criteria 0 37 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)800))) (matches-criteria 1 37 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)900))) (matches-criteria 0 37 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)900))) (matches-criteria 1 37 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)1000))) (matches-criteria 0 37 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)200) (= (destination_port 0)1000))) (matches-criteria 1 37 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)100))) (matches-criteria 0 37 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)100))) (matches-criteria 1 37 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)200))) (matches-criteria 0 37 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)200))) (matches-criteria 1 37 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)300))) (matches-criteria 0 37 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)300))) (matches-criteria 1 37 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)400))) (matches-criteria 0 37 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)400))) (matches-criteria 1 37 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)500))) (matches-criteria 0 37 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)500))) (matches-criteria 1 37 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)600))) (matches-criteria 0 37 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)600))) (matches-criteria 1 37 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)700))) (matches-criteria 0 37 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)700))) (matches-criteria 1 37 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)800))) (matches-criteria 0 37 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)800))) (matches-criteria 1 37 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)900))) (matches-criteria 0 37 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)900))) (matches-criteria 1 37 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)1000))) (matches-criteria 0 37 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)300) (= (destination_port 0)1000))) (matches-criteria 1 37 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)100))) (matches-criteria 0 37 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)100))) (matches-criteria 1 37 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)200))) (matches-criteria 0 37 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)200))) (matches-criteria 1 37 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)300))) (matches-criteria 0 37 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)300))) (matches-criteria 1 37 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)400))) (matches-criteria 0 37 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)400))) (matches-criteria 1 37 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)500))) (matches-criteria 0 37 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)500))) (matches-criteria 1 37 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)600))) (matches-criteria 0 37 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)600))) (matches-criteria 1 37 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)700))) (matches-criteria 0 37 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)700))) (matches-criteria 1 37 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)800))) (matches-criteria 0 37 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)800))) (matches-criteria 1 37 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)900))) (matches-criteria 0 37 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)900))) (matches-criteria 1 37 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)1000))) (matches-criteria 0 37 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)400) (= (destination_port 0)1000))) (matches-criteria 1 37 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)100))) (matches-criteria 0 37 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)100))) (matches-criteria 1 37 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)200))) (matches-criteria 0 37 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)200))) (matches-criteria 1 37 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)300))) (matches-criteria 0 37 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)300))) (matches-criteria 1 37 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)400))) (matches-criteria 0 37 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)400))) (matches-criteria 1 37 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)500))) (matches-criteria 0 37 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)500))) (matches-criteria 1 37 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)600))) (matches-criteria 0 37 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)600))) (matches-criteria 1 37 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)700))) (matches-criteria 0 37 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)700))) (matches-criteria 1 37 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)800))) (matches-criteria 0 37 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)800))) (matches-criteria 1 37 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)900))) (matches-criteria 0 37 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)900))) (matches-criteria 1 37 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)1000))) (matches-criteria 0 37 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)500) (= (destination_port 0)1000))) (matches-criteria 1 37 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)100))) (matches-criteria 0 37 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)100))) (matches-criteria 1 37 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)200))) (matches-criteria 0 37 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)200))) (matches-criteria 1 37 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)300))) (matches-criteria 0 37 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)300))) (matches-criteria 1 37 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)400))) (matches-criteria 0 37 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)400))) (matches-criteria 1 37 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)500))) (matches-criteria 0 37 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)500))) (matches-criteria 1 37 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)600))) (matches-criteria 0 37 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)600))) (matches-criteria 1 37 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)700))) (matches-criteria 0 37 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)700))) (matches-criteria 1 37 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)800))) (matches-criteria 0 37 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)800))) (matches-criteria 1 37 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)900))) (matches-criteria 0 37 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)900))) (matches-criteria 1 37 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)1000))) (matches-criteria 0 37 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)600) (= (destination_port 0)1000))) (matches-criteria 1 37 63)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)100))) (matches-criteria 0 37 64)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)100))) (matches-criteria 1 37 64)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)200))) (matches-criteria 0 37 65)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)200))) (matches-criteria 1 37 65)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)300))) (matches-criteria 0 37 66)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)300))) (matches-criteria 1 37 66)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)400))) (matches-criteria 0 37 67)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)400))) (matches-criteria 1 37 67)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)500))) (matches-criteria 0 37 68)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)500))) (matches-criteria 1 37 68)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)600))) (matches-criteria 0 37 69)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)600))) (matches-criteria 1 37 69)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)700))) (matches-criteria 0 37 70)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)700))) (matches-criteria 1 37 70)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)800))) (matches-criteria 0 37 71)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)800))) (matches-criteria 1 37 71)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)900))) (matches-criteria 0 37 72)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)900))) (matches-criteria 1 37 72)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)1000))) (matches-criteria 0 37 73)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)700) (= (destination_port 0)1000))) (matches-criteria 1 37 73)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)100))) (matches-criteria 0 37 74)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)100))) (matches-criteria 1 37 74)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)200))) (matches-criteria 0 37 75)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)200))) (matches-criteria 1 37 75)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)300))) (matches-criteria 0 37 76)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)300))) (matches-criteria 1 37 76)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)400))) (matches-criteria 0 37 77)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)400))) (matches-criteria 1 37 77)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)500))) (matches-criteria 0 37 78)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)500))) (matches-criteria 1 37 78)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)600))) (matches-criteria 0 37 79)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)600))) (matches-criteria 1 37 79)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)700))) (matches-criteria 0 37 80)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)700))) (matches-criteria 1 37 80)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)800))) (matches-criteria 0 37 81)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)800))) (matches-criteria 1 37 81)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)900))) (matches-criteria 0 37 82)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)900))) (matches-criteria 1 37 82)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)1000))) (matches-criteria 0 37 83)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)800) (= (destination_port 0)1000))) (matches-criteria 1 37 83)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)100))) (matches-criteria 0 37 84)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)100))) (matches-criteria 1 37 84)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)200))) (matches-criteria 0 37 85)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)200))) (matches-criteria 1 37 85)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)300))) (matches-criteria 0 37 86)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)300))) (matches-criteria 1 37 86)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)400))) (matches-criteria 0 37 87)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)400))) (matches-criteria 1 37 87)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)500))) (matches-criteria 0 37 88)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)500))) (matches-criteria 1 37 88)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)600))) (matches-criteria 0 37 89)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)600))) (matches-criteria 1 37 89)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)700))) (matches-criteria 0 37 90)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)700))) (matches-criteria 1 37 90)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)800))) (matches-criteria 0 37 91)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)800))) (matches-criteria 1 37 91)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)900))) (matches-criteria 0 37 92)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)900))) (matches-criteria 1 37 92)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)1000))) (matches-criteria 0 37 93)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)900) (= (destination_port 0)1000))) (matches-criteria 1 37 93)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)100))) (matches-criteria 0 37 94)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)100))) (matches-criteria 1 37 94)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)200))) (matches-criteria 0 37 95)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)200))) (matches-criteria 1 37 95)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)300))) (matches-criteria 0 37 96)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)300))) (matches-criteria 1 37 96)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)400))) (matches-criteria 0 37 97)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)400))) (matches-criteria 1 37 97)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)500))) (matches-criteria 0 37 98)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)500))) (matches-criteria 1 37 98)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)600))) (matches-criteria 0 37 99)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)600))) (matches-criteria 1 37 99)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)700))) (matches-criteria 0 37 100)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)700))) (matches-criteria 1 37 100)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)800))) (matches-criteria 0 37 101)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)800))) (matches-criteria 1 37 101)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)900))) (matches-criteria 0 37 102)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)900))) (matches-criteria 1 37 102)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)1000))) (matches-criteria 0 37 103)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)1000) (= (destination_port 0)1000))) (matches-criteria 1 37 103)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 0 38 0)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 1 38 0)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 0 38 1)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 1 38 1)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 0 38 2)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 1 38 2)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 0 38 3)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 1 38 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 0 38 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 1 38 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 0 38 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 1 38 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 0 38 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 1 38 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 0 38 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 1 38 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 0 38 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 1 38 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 0 38 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 1 38 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 0 38 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 1 38 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 0 38 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 1 38 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 0 38 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 1 38 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 0 38 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 1 38 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 0 38 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 1 38 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 0 38 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 1 38 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 0 38 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 1 38 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 0 38 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 1 38 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 0 38 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 1 38 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 0 38 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 1 38 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 0 38 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 1 38 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 0 38 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 1 38 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 0 38 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 1 38 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 0 38 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 1 38 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 0 38 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 1 38 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 0 38 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 1 38 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 0 38 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 1 38 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 0 38 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 1 38 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 0 38 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 1 38 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 0 38 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 1 38 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 0 38 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 1 38 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 0 38 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 1 38 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 0 38 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 1 38 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 0 38 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 1 38 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 0 38 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 1 38 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 0 38 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 1 38 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 0 38 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 1 38 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 0 38 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 1 38 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 0 38 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 1 38 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 0 38 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 1 38 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 0 38 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 1 38 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 0 38 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 1 38 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 0 38 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 1 38 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 0 38 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 1 38 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 0 38 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 1 38 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 0 38 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 1 38 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 0 38 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 1 38 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 0 38 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 1 38 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 0 38 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 1 38 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 0 38 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 1 38 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 0 38 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 1 38 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 0 38 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 1 38 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 0 38 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 1 38 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 0 38 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 1 38 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 0 38 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 1 38 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 0 38 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 1 38 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 0 38 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 1 38 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 0 38 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 1 38 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 0 38 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 1 38 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 0 38 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 1 38 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 0 38 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 1 38 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 0 38 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 1 38 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 0 38 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 1 38 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 0 38 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 1 38 63)))

(assert (= (= (protocol 0)6) (matches-criteria 0 38 64)))
(assert (= (= (protocol 0)6) (matches-criteria 1 38 64)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 0 39 0)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)11))) (matches-criteria 1 39 0)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 0 39 1)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)12))) (matches-criteria 1 39 1)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 0 39 2)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)17))) (matches-criteria 1 39 2)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 0 39 3)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)18))) (matches-criteria 1 39 3)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 0 39 4)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)19))) (matches-criteria 1 39 4)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 0 39 5)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)20))) (matches-criteria 1 39 5)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 0 39 6)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)21))) (matches-criteria 1 39 6)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 0 39 7)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)11) (= (destination_port 0)25))) (matches-criteria 1 39 7)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 0 39 8)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)11))) (matches-criteria 1 39 8)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 0 39 9)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)12))) (matches-criteria 1 39 9)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 0 39 10)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)17))) (matches-criteria 1 39 10)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 0 39 11)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)18))) (matches-criteria 1 39 11)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 0 39 12)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)19))) (matches-criteria 1 39 12)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 0 39 13)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)20))) (matches-criteria 1 39 13)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 0 39 14)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)21))) (matches-criteria 1 39 14)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 0 39 15)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)12) (= (destination_port 0)25))) (matches-criteria 1 39 15)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 0 39 16)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)11))) (matches-criteria 1 39 16)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 0 39 17)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)12))) (matches-criteria 1 39 17)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 0 39 18)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)17))) (matches-criteria 1 39 18)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 0 39 19)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)18))) (matches-criteria 1 39 19)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 0 39 20)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)19))) (matches-criteria 1 39 20)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 0 39 21)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)20))) (matches-criteria 1 39 21)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 0 39 22)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)21))) (matches-criteria 1 39 22)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 0 39 23)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)13) (= (destination_port 0)25))) (matches-criteria 1 39 23)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 0 39 24)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)11))) (matches-criteria 1 39 24)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 0 39 25)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)12))) (matches-criteria 1 39 25)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 0 39 26)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)17))) (matches-criteria 1 39 26)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 0 39 27)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)18))) (matches-criteria 1 39 27)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 0 39 28)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)19))) (matches-criteria 1 39 28)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 0 39 29)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)20))) (matches-criteria 1 39 29)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 0 39 30)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)21))) (matches-criteria 1 39 30)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 0 39 31)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)14) (= (destination_port 0)25))) (matches-criteria 1 39 31)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 0 39 32)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)11))) (matches-criteria 1 39 32)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 0 39 33)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)12))) (matches-criteria 1 39 33)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 0 39 34)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)17))) (matches-criteria 1 39 34)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 0 39 35)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)18))) (matches-criteria 1 39 35)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 0 39 36)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)19))) (matches-criteria 1 39 36)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 0 39 37)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)20))) (matches-criteria 1 39 37)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 0 39 38)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)21))) (matches-criteria 1 39 38)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 0 39 39)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)15) (= (destination_port 0)25))) (matches-criteria 1 39 39)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 0 39 40)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)11))) (matches-criteria 1 39 40)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 0 39 41)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)12))) (matches-criteria 1 39 41)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 0 39 42)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)17))) (matches-criteria 1 39 42)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 0 39 43)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)18))) (matches-criteria 1 39 43)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 0 39 44)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)19))) (matches-criteria 1 39 44)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 0 39 45)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)20))) (matches-criteria 1 39 45)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 0 39 46)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)21))) (matches-criteria 1 39 46)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 0 39 47)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)16) (= (destination_port 0)25))) (matches-criteria 1 39 47)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 0 39 48)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)11))) (matches-criteria 1 39 48)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 0 39 49)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)12))) (matches-criteria 1 39 49)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 0 39 50)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)17))) (matches-criteria 1 39 50)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 0 39 51)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)18))) (matches-criteria 1 39 51)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 0 39 52)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)19))) (matches-criteria 1 39 52)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 0 39 53)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)20))) (matches-criteria 1 39 53)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 0 39 54)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)21))) (matches-criteria 1 39 54)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 0 39 55)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)17) (= (destination_port 0)25))) (matches-criteria 1 39 55)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 0 39 56)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)11))) (matches-criteria 1 39 56)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 0 39 57)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)12))) (matches-criteria 1 39 57)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 0 39 58)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)17))) (matches-criteria 1 39 58)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 0 39 59)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)18))) (matches-criteria 1 39 59)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 0 39 60)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)19))) (matches-criteria 1 39 60)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 0 39 61)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)20))) (matches-criteria 1 39 61)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 0 39 62)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)21))) (matches-criteria 1 39 62)))

(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 0 39 63)))
(assert (= (and (= (protocol 0)6) (and (= (source_port 0)18) (= (destination_port 0)25))) (matches-criteria 1 39 63)))

(assert (= (= (protocol 0)6) (matches-criteria 0 39 64)))
(assert (= (= (protocol 0)6) (matches-criteria 1 39 64)))

(assert (or (and (= chain0 16)(= chain1 36))))
(assert (reaches 0 chain0 0))
(assert (reaches 1 chain1 0))
(assert (not (and (or (= (terminates-with 0) (terminates-with 1))(and (reaches-end 0 chain0)(reaches-end 1 chain1))(and (= (protocol 0)22)(or (reaches 1 36 0))))(=> (and (= (protocol 0)22)(or (reaches 1 36 0))) (= (terminates-with 1) ACCEPT)))))
(check-sat)
(get-model)