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
(assert (= (chain-length 0) 11))(assert (= (chain-length 1) 3))(assert (= (chain-length 6) 12))(assert (= (chain-length 7) 3))(assert (= (chain-length 2) 0))(assert (= (chain-length 3) 0))(assert (= (chain-length 4) 0))(assert (= (chain-length 5) 0))
(assert (not (reaches 0 0 12)))

(assert (= (reaches 0 0 11) (reaches-end 0 0)))

(assert (= (returns-from 0 0) (or (reaches-return 0 0)(reaches-end 0 0))))
(assert (not (reaches 1 0 12)))

(assert (= (reaches 1 0 11) (reaches-end 1 0)))

(assert (= (returns-from 1 0) (or (reaches-return 1 0)(reaches-end 1 0))))
(assert (not (reaches 0 1 4)))

(assert (= (reaches 0 1 3) (reaches-end 0 1)))

(assert (= (returns-from 0 1) (or (reaches-return 0 1)(reaches-end 0 1))))
(assert (not (reaches 1 1 4)))

(assert (= (reaches 1 1 3) (reaches-end 1 1)))

(assert (= (returns-from 1 1) (or (reaches-return 1 1)(reaches-end 1 1))))
(assert (not (reaches 0 6 13)))

(assert (= (reaches 0 6 12) (reaches-end 0 6)))

(assert (= (returns-from 0 6) (or (reaches-return 0 6)(reaches-end 0 6))))
(assert (not (reaches 1 6 13)))

(assert (= (reaches 1 6 12) (reaches-end 1 6)))

(assert (= (returns-from 1 6) (or (reaches-return 1 6)(reaches-end 1 6))))
(assert (not (reaches 0 7 4)))

(assert (= (reaches 0 7 3) (reaches-end 0 7)))

(assert (= (returns-from 0 7) (or (reaches-return 0 7)(reaches-end 0 7))))
(assert (not (reaches 1 7 4)))

(assert (= (reaches 1 7 3) (reaches-end 1 7)))

(assert (= (returns-from 1 7) (or (reaches-return 1 7)(reaches-end 1 7))))

(assert (top-level-chain 0))
(assert (top-level-chain 6))

(assert (=> (reaches-end 0 0) (= (terminates-with 0) (policy 0))))
(assert (=> (reaches-end 0 6) (= (terminates-with 0) (policy 6))))
(assert (=> (reaches-end 1 0) (= (terminates-with 1) (policy 0))))
(assert (=> (reaches-end 1 6) (= (terminates-with 1) (policy 6))))

(assert (= (policy 1) NONE))
(assert (= (policy 7) NONE))
(assert (= (policy 1) NONE))
(assert (= (policy 7) NONE))

(assert (=> (reaches 0 0 0) (not (reaches 0 6 0))))
(assert (=> (reaches 1 0 0) (not (reaches 1 6 0))))

(assert (not (top-level-chain 1)))
(assert (not (top-level-chain 7)))

(assert (= num-of-chains 8))
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun SYN () Bool)
(declare-fun ACK () Bool)
(declare-fun RST () Bool)
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun URG () Bool)

(assert (= (rule-target 0 0) DROP))
(assert (=> (matches-rule 0 0 0) (and (not (reaches 0 0 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 0) (and (not (reaches 1 0 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 1) DROP))
(assert (=> (matches-rule 0 0 1) (and (not (reaches 0 0 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 1) (and (not (reaches 1 0 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 2) DROP))
(assert (=> (matches-rule 0 0 2) (and (not (reaches 0 0 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 2) (and (not (reaches 1 0 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 3) DROP))
(assert (=> (matches-rule 0 0 3) (and (not (reaches 0 0 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 3) (and (not (reaches 1 0 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 4) DROP))
(assert (=> (matches-rule 0 0 4) (and (not (reaches 0 0 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 4) (and (not (reaches 1 0 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 5) DROP))
(assert (=> (matches-rule 0 0 5) (and (not (reaches 0 0 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 5) (and (not (reaches 1 0 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 6) DROP))
(assert (=> (matches-rule 0 0 6) (and (not (reaches 0 0 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 6) (and (not (reaches 1 0 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 7) DROP))
(assert (=> (matches-rule 0 0 7) (and (not (reaches 0 0 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 7) (and (not (reaches 1 0 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 8) DROP))
(assert (=> (matches-rule 0 0 8) (and (not (reaches 0 0 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 8) (and (not (reaches 1 0 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 0 9) (GO 1 0)))
(assert (=> (matches-rule 0 0 9) (and (reaches 0 1 0)(= (returns-from 0 1) (reaches 0 0 10)))))
(assert (=> (matches-rule 1 0 9) (and (reaches 1 1 0)(= (returns-from 1 1) (reaches 1 0 10)))))
(assert (=> (not (matches-rule 0 0 9)) (not (reaches 0 1 0))))
(assert (=> (not (matches-rule 1 0 9)) (not (reaches 1 1 0))))

(assert (= (rule-target 0 10) DROP))
(assert (=> (matches-rule 0 0 10) (and (not (reaches 0 0 11))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 10) (and (not (reaches 1 0 11))(= (terminates-with 1) DROP))))


(assert (= (rule-target 1 0) ACCEPT))
(assert (=> (matches-rule 0 1 0) (and (not (reaches 0 1 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 0) (and (not (reaches 1 1 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 1 1) ACCEPT))
(assert (=> (matches-rule 0 1 1) (and (not (reaches 0 1 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 1) (and (not (reaches 1 1 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 1 2) ACCEPT))
(assert (=> (matches-rule 0 1 2) (and (not (reaches 0 1 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 2) (and (not (reaches 1 1 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 6 0) DROP))
(assert (=> (matches-rule 0 6 0) (and (not (reaches 0 6 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 0) (and (not (reaches 1 6 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 1) DROP))
(assert (=> (matches-rule 0 6 1) (and (not (reaches 0 6 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 1) (and (not (reaches 1 6 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 2) DROP))
(assert (=> (matches-rule 0 6 2) (and (not (reaches 0 6 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 2) (and (not (reaches 1 6 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 3) DROP))
(assert (=> (matches-rule 0 6 3) (and (not (reaches 0 6 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 3) (and (not (reaches 1 6 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 4) DROP))
(assert (=> (matches-rule 0 6 4) (and (not (reaches 0 6 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 4) (and (not (reaches 1 6 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 5) DROP))
(assert (=> (matches-rule 0 6 5) (and (not (reaches 0 6 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 5) (and (not (reaches 1 6 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 6) DROP))
(assert (=> (matches-rule 0 6 6) (and (not (reaches 0 6 7))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 6) (and (not (reaches 1 6 7))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 7) DROP))
(assert (=> (matches-rule 0 6 7) (and (not (reaches 0 6 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 7) (and (not (reaches 1 6 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 8) DROP))
(assert (=> (matches-rule 0 6 8) (and (not (reaches 0 6 9))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 8) (and (not (reaches 1 6 9))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 9) DROP))
(assert (=> (matches-rule 0 6 9) (and (not (reaches 0 6 10))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 9) (and (not (reaches 1 6 10))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 10) (GO 7 0)))
(assert (=> (matches-rule 0 6 10) (and (reaches 0 7 0)(= (returns-from 0 7) (reaches 0 6 11)))))
(assert (=> (matches-rule 1 6 10) (and (reaches 1 7 0)(= (returns-from 1 7) (reaches 1 6 11)))))
(assert (=> (not (matches-rule 0 6 10)) (not (reaches 0 7 0))))
(assert (=> (not (matches-rule 1 6 10)) (not (reaches 1 7 0))))

(assert (= (rule-target 6 11) DROP))
(assert (=> (matches-rule 0 6 11) (and (not (reaches 0 6 12))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 11) (and (not (reaches 1 6 12))(= (terminates-with 1) DROP))))


(assert (= (rule-target 7 0) ACCEPT))
(assert (=> (matches-rule 0 7 0) (and (not (reaches 0 7 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 7 0) (and (not (reaches 1 7 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 7 1) ACCEPT))
(assert (=> (matches-rule 0 7 1) (and (not (reaches 0 7 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 7 1) (and (not (reaches 1 7 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 7 2) ACCEPT))
(assert (=> (matches-rule 0 7 2) (and (not (reaches 0 7 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 7 2) (and (not (reaches 1 7 3))(= (terminates-with 1) ACCEPT))))



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
    (and (<= 1 3) (reaches 0 6 3))
    (reaches 0 6 (- 3 1))
))

(assert (=> 
    (and (reaches 0 6 3) (not (matches-criteria 0 6 3))) 
    (reaches 0 6 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 6 3) (= (rule-target 6 3) NONE)) 
    (reaches 0 6 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 6 4))
    (reaches 0 6 (- 4 1))
))

(assert (=> 
    (and (reaches 0 6 4) (not (matches-criteria 0 6 4))) 
    (reaches 0 6 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 6 4) (= (rule-target 6 4) NONE)) 
    (reaches 0 6 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 0 6 5))
    (reaches 0 6 (- 5 1))
))

(assert (=> 
    (and (reaches 0 6 5) (not (matches-criteria 0 6 5))) 
    (reaches 0 6 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 6 5) (= (rule-target 6 5) NONE)) 
    (reaches 0 6 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 6 6))
    (reaches 0 6 (- 6 1))
))

(assert (=> 
    (and (reaches 0 6 6) (not (matches-criteria 0 6 6))) 
    (reaches 0 6 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 6 6) (= (rule-target 6 6) NONE)) 
    (reaches 0 6 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 6 7))
    (reaches 0 6 (- 7 1))
))

(assert (=> 
    (and (reaches 0 6 7) (not (matches-criteria 0 6 7))) 
    (reaches 0 6 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 6 7) (= (rule-target 6 7) NONE)) 
    (reaches 0 6 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 0 6 8))
    (reaches 0 6 (- 8 1))
))

(assert (=> 
    (and (reaches 0 6 8) (not (matches-criteria 0 6 8))) 
    (reaches 0 6 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 6 8) (= (rule-target 6 8) NONE)) 
    (reaches 0 6 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 0 6 9))
    (reaches 0 6 (- 9 1))
))

(assert (=> 
    (and (reaches 0 6 9) (not (matches-criteria 0 6 9))) 
    (reaches 0 6 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 6 9) (= (rule-target 6 9) NONE)) 
    (reaches 0 6 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 0 6 10))
    (reaches 0 6 (- 10 1))
))

(assert (=> 
    (and (reaches 0 6 10) (not (matches-criteria 0 6 10))) 
    (reaches 0 6 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 6 10) (= (rule-target 6 10) NONE)) 
    (reaches 0 6 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 0 6 11))
    (reaches 0 6 (- 11 1))
))

(assert (=> 
    (and (reaches 0 6 11) (not (matches-criteria 0 6 11))) 
    (reaches 0 6 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 6 11) (= (rule-target 6 11) NONE)) 
    (reaches 0 6 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 0 6 12))
    (reaches 0 6 (- 12 1))
))

(assert (=> 
    (and (reaches 0 6 12) (not (matches-criteria 0 6 12))) 
    (reaches 0 6 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 6 12) (= (rule-target 6 12) NONE)) 
    (reaches 0 6 (+ 12 1))
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
    (and (<= 1 3) (reaches 1 6 3))
    (reaches 1 6 (- 3 1))
))

(assert (=> 
    (and (reaches 1 6 3) (not (matches-criteria 1 6 3))) 
    (reaches 1 6 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 6 3) (= (rule-target 6 3) NONE)) 
    (reaches 1 6 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 6 4))
    (reaches 1 6 (- 4 1))
))

(assert (=> 
    (and (reaches 1 6 4) (not (matches-criteria 1 6 4))) 
    (reaches 1 6 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 6 4) (= (rule-target 6 4) NONE)) 
    (reaches 1 6 (+ 4 1))
))(assert (=> 
    (and (<= 1 5) (reaches 1 6 5))
    (reaches 1 6 (- 5 1))
))

(assert (=> 
    (and (reaches 1 6 5) (not (matches-criteria 1 6 5))) 
    (reaches 1 6 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 6 5) (= (rule-target 6 5) NONE)) 
    (reaches 1 6 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 6 6))
    (reaches 1 6 (- 6 1))
))

(assert (=> 
    (and (reaches 1 6 6) (not (matches-criteria 1 6 6))) 
    (reaches 1 6 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 6 6) (= (rule-target 6 6) NONE)) 
    (reaches 1 6 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 6 7))
    (reaches 1 6 (- 7 1))
))

(assert (=> 
    (and (reaches 1 6 7) (not (matches-criteria 1 6 7))) 
    (reaches 1 6 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 6 7) (= (rule-target 6 7) NONE)) 
    (reaches 1 6 (+ 7 1))
))(assert (=> 
    (and (<= 1 8) (reaches 1 6 8))
    (reaches 1 6 (- 8 1))
))

(assert (=> 
    (and (reaches 1 6 8) (not (matches-criteria 1 6 8))) 
    (reaches 1 6 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 6 8) (= (rule-target 6 8) NONE)) 
    (reaches 1 6 (+ 8 1))
))(assert (=> 
    (and (<= 1 9) (reaches 1 6 9))
    (reaches 1 6 (- 9 1))
))

(assert (=> 
    (and (reaches 1 6 9) (not (matches-criteria 1 6 9))) 
    (reaches 1 6 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 6 9) (= (rule-target 6 9) NONE)) 
    (reaches 1 6 (+ 9 1))
))(assert (=> 
    (and (<= 1 10) (reaches 1 6 10))
    (reaches 1 6 (- 10 1))
))

(assert (=> 
    (and (reaches 1 6 10) (not (matches-criteria 1 6 10))) 
    (reaches 1 6 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 6 10) (= (rule-target 6 10) NONE)) 
    (reaches 1 6 (+ 10 1))
))(assert (=> 
    (and (<= 1 11) (reaches 1 6 11))
    (reaches 1 6 (- 11 1))
))

(assert (=> 
    (and (reaches 1 6 11) (not (matches-criteria 1 6 11))) 
    (reaches 1 6 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 6 11) (= (rule-target 6 11) NONE)) 
    (reaches 1 6 (+ 11 1))
))(assert (=> 
    (and (<= 1 12) (reaches 1 6 12))
    (reaches 1 6 (- 12 1))
))

(assert (=> 
    (and (reaches 1 6 12) (not (matches-criteria 1 6 12))) 
    (reaches 1 6 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 6 12) (= (rule-target 6 12) NONE)) 
    (reaches 1 6 (+ 12 1))
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
    (and (<= 1 3) (reaches 0 7 3))
    (reaches 0 7 (- 3 1))
))

(assert (=> 
    (and (reaches 0 7 3) (not (matches-criteria 0 7 3))) 
    (reaches 0 7 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 7 3) (= (rule-target 7 3) NONE)) 
    (reaches 0 7 (+ 3 1))
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
    (and (<= 1 3) (reaches 1 7 3))
    (reaches 1 7 (- 3 1))
))

(assert (=> 
    (and (reaches 1 7 3) (not (matches-criteria 1 7 3))) 
    (reaches 1 7 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 7 3) (= (rule-target 7 3) NONE)) 
    (reaches 1 7 (+ 3 1))
))
(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 0 0 0)))
(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 1 0 0)))

(assert (= (and (= protocol 6) RST) (matches-criteria 0 0 1)))
(assert (= (and (= protocol 6) RST) (matches-criteria 1 0 1)))

(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 0 0 2)))
(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 1 0 2)))

(assert (= (and (= protocol 6) (= destination_port 49)) (matches-criteria 0 0 3)))
(assert (= (and (= protocol 6) (= destination_port 49)) (matches-criteria 1 0 3)))

(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 0 0 4)))
(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 1 0 4)))

(assert (= (and (= protocol 17) (= destination_port 49)) (matches-criteria 0 0 5)))
(assert (= (and (= protocol 17) (= destination_port 49)) (matches-criteria 1 0 5)))

(assert (= (and (= protocol 17) (= destination_port 48)) (matches-criteria 0 0 6)))
(assert (= (and (= protocol 17) (= destination_port 48)) (matches-criteria 1 0 6)))

(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 0 0 7)))
(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 1 0 7)))

(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 0 0 8)))
(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 1 0 8)))

(assert (matches-criteria 0 0 9))
(assert (matches-criteria 1 0 9))

(assert (= (and (= protocol 6) URG) (matches-criteria 0 0 10)))
(assert (= (and (= protocol 6) URG) (matches-criteria 1 0 10)))

(assert (= (= protocol 117) (matches-criteria 0 1 0)))
(assert (= (= protocol 117) (matches-criteria 1 1 0)))

(assert (= (= protocol 6) (matches-criteria 0 1 1)))
(assert (= (= protocol 6) (matches-criteria 1 1 1)))

(assert (= (= protocol 17) (matches-criteria 0 1 2)))
(assert (= (= protocol 17) (matches-criteria 1 1 2)))

(assert (= (= protocol 124) (matches-criteria 0 6 0)))
(assert (= (= protocol 124) (matches-criteria 1 6 0)))

(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 0 6 1)))
(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 1 6 1)))

(assert (= (and (= protocol 6) RST) (matches-criteria 0 6 2)))
(assert (= (and (= protocol 6) RST) (matches-criteria 1 6 2)))

(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 0 6 3)))
(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 1 6 3)))

(assert (= (and (= protocol 6) (= destination_port 49)) (matches-criteria 0 6 4)))
(assert (= (and (= protocol 6) (= destination_port 49)) (matches-criteria 1 6 4)))

(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 0 6 5)))
(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 1 6 5)))

(assert (= (and (= protocol 17) (= destination_port 49)) (matches-criteria 0 6 6)))
(assert (= (and (= protocol 17) (= destination_port 49)) (matches-criteria 1 6 6)))

(assert (= (and (= protocol 17) (= destination_port 48)) (matches-criteria 0 6 7)))
(assert (= (and (= protocol 17) (= destination_port 48)) (matches-criteria 1 6 7)))

(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 0 6 8)))
(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 1 6 8)))

(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 0 6 9)))
(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 1 6 9)))

(assert (matches-criteria 0 6 10))
(assert (matches-criteria 1 6 10))

(assert (= (and (= protocol 6) URG) (matches-criteria 0 6 11)))
(assert (= (and (= protocol 6) URG) (matches-criteria 1 6 11)))

(assert (= (= protocol 117) (matches-criteria 0 7 0)))
(assert (= (= protocol 117) (matches-criteria 1 7 0)))

(assert (= (= protocol 6) (matches-criteria 0 7 1)))
(assert (= (= protocol 6) (matches-criteria 1 7 1)))

(assert (= (= protocol 17) (matches-criteria 0 7 2)))
(assert (= (= protocol 17) (matches-criteria 1 7 2)))

(assert (or (and (= chain0 0)(= chain1 6))))
(assert (reaches 0 chain0 0))
(assert (reaches 1 chain1 0))
(assert (not (and (or (= (terminates-with 0) (terminates-with 1))(and (reaches-end 0 chain0)(reaches-end 1 chain1))(and (= protocol 124)(or (reaches 1 6 0))))(=> (and (= protocol 124)(or (reaches 1 6 0))) (= (terminates-with 1) DROP)))))
(check-sat)
(get-model)