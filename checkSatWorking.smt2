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



(assert (= num-of-packets 2))(declare-const chain0 Int)(declare-const chain1 Int)
(assert (= (chain-length 0) 6))(assert (= (chain-length 1) 3))(assert (= (chain-length 5) 7))(assert (= (chain-length 6) 3))

(assert (= (chain-length 2) 0))(assert (= (chain-length 3) 0))(assert (= (chain-length 4) 0))(assert (= (chain-length 7) 0))

(assert (not (reaches 0 0 7)))
(assert (= (reaches 0 0 6) (reaches-end 0 0)))
(assert (= (returns-from 0 0) (or (reaches-return 0 0)(reaches-end 0 0))))(assert (not (reaches 1 0 7)))
(assert (= (reaches 1 0 6) (reaches-end 1 0)))
(assert (= (returns-from 1 0) (or (reaches-return 1 0)(reaches-end 1 0))))(assert (not (reaches 0 1 4)))
(assert (= (reaches 0 1 3) (reaches-end 0 1)))
(assert (= (returns-from 0 1) (or (reaches-return 0 1)(reaches-end 0 1))))(assert (not (reaches 1 1 4)))
(assert (= (reaches 1 1 3) (reaches-end 1 1)))
(assert (= (returns-from 1 1) (or (reaches-return 1 1)(reaches-end 1 1))))(assert (not (reaches 0 5 8)))
(assert (= (reaches 0 5 7) (reaches-end 0 5)))
(assert (= (returns-from 0 5) (or (reaches-return 0 5)(reaches-end 0 5))))(assert (not (reaches 1 5 8)))
(assert (= (reaches 1 5 7) (reaches-end 1 5)))
(assert (= (returns-from 1 5) (or (reaches-return 1 5)(reaches-end 1 5))))(assert (not (reaches 0 6 4)))
(assert (= (reaches 0 6 3) (reaches-end 0 6)))
(assert (= (returns-from 0 6) (or (reaches-return 0 6)(reaches-end 0 6))))(assert (not (reaches 1 6 4)))
(assert (= (reaches 1 6 3) (reaches-end 1 6)))
(assert (= (returns-from 1 6) (or (reaches-return 1 6)(reaches-end 1 6))))
(assert (top-level-chain 0))(assert (top-level-chain 5))
(assert (=> (reaches-end 0 0) (= (terminates-with 0) (policy 0))))(assert (=> (reaches-end 0 5) (= (terminates-with 0) (policy 5))))(assert (=> (reaches-end 1 0) (= (terminates-with 1) (policy 0))))(assert (=> (reaches-end 1 5) (= (terminates-with 1) (policy 5))))
(assert (= (policy 1) NONE))(assert (= (policy 6) NONE))(assert (= (policy 1) NONE))(assert (= (policy 6) NONE))
(assert (=> (reaches 0 0 0) (not (reaches 0 5 0))))(assert (=> (reaches 1 0 0) (not (reaches 1 5 0))))
(assert (not (top-level-chain 1)))(assert (not (top-level-chain 6)))
(assert (= num-of-chains 4))
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun SYN () Bool)
(declare-fun ACK () Bool)
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun URG () Bool)

(assert (= (rule-target 0 0) DROP))(assert (=> (matches-rule 0 0 0) (and (not (reaches 0 0 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 0) (and (not (reaches 1 0 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 1) DROP))(assert (=> (matches-rule 0 0 1) (and (not (reaches 0 0 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 1) (and (not (reaches 1 0 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 2) DROP))(assert (=> (matches-rule 0 0 2) (and (not (reaches 0 0 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 2) (and (not (reaches 1 0 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 3) DROP))(assert (=> (matches-rule 0 0 3) (and (not (reaches 0 0 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 3) (and (not (reaches 1 0 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 0 4) (GO 1 0)))(assert (=> (matches-rule 0 0 4) (and (reaches 0 1 0)(= (returns-from 0 1) (reaches 0 0 5)))))(assert (=> (matches-rule 1 0 4) (and (reaches 1 1 0)(= (returns-from 1 1) (reaches 1 0 5)))))(assert (=> (not (matches-rule 0 0 4)) (not (reaches 0 1 0))))(assert (=> (not (matches-rule 1 0 4)) (not (reaches 1 1 0))))
(assert (= (rule-target 0 5) DROP))(assert (=> (matches-rule 0 0 5) (and (not (reaches 0 0 6))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 0 5) (and (not (reaches 1 0 6))(= (terminates-with 1) DROP))))

(assert (= (rule-target 1 0) ACCEPT))(assert (=> (matches-rule 0 1 0) (and (not (reaches 0 1 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 0) (and (not (reaches 1 1 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 1) ACCEPT))(assert (=> (matches-rule 0 1 1) (and (not (reaches 0 1 2))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 1) (and (not (reaches 1 1 2))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 1 2) ACCEPT))(assert (=> (matches-rule 0 1 2) (and (not (reaches 0 1 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 1 2) (and (not (reaches 1 1 3))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 5 0) DROP))(assert (=> (matches-rule 0 5 0) (and (not (reaches 0 5 1))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 0) (and (not (reaches 1 5 1))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 1) DROP))(assert (=> (matches-rule 0 5 1) (and (not (reaches 0 5 2))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 1) (and (not (reaches 1 5 2))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 2) DROP))(assert (=> (matches-rule 0 5 2) (and (not (reaches 0 5 3))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 2) (and (not (reaches 1 5 3))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 3) DROP))(assert (=> (matches-rule 0 5 3) (and (not (reaches 0 5 4))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 3) (and (not (reaches 1 5 4))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 4) DROP))(assert (=> (matches-rule 0 5 4) (and (not (reaches 0 5 5))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 4) (and (not (reaches 1 5 5))(= (terminates-with 1) DROP))))

(assert (= (rule-target 5 5) (GO 6 0)))(assert (=> (matches-rule 0 5 5) (and (reaches 0 6 0)(= (returns-from 0 6) (reaches 0 5 6)))))(assert (=> (matches-rule 1 5 5) (and (reaches 1 6 0)(= (returns-from 1 6) (reaches 1 5 6)))))(assert (=> (not (matches-rule 0 5 5)) (not (reaches 0 6 0))))(assert (=> (not (matches-rule 1 5 5)) (not (reaches 1 6 0))))
(assert (= (rule-target 5 6) DROP))(assert (=> (matches-rule 0 5 6) (and (not (reaches 0 5 7))(= (terminates-with 0) DROP))))(assert (=> (matches-rule 1 5 6) (and (not (reaches 1 5 7))(= (terminates-with 1) DROP))))

(assert (= (rule-target 6 0) ACCEPT))(assert (=> (matches-rule 0 6 0) (and (not (reaches 0 6 1))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 6 0) (and (not (reaches 1 6 1))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 6 1) ACCEPT))(assert (=> (matches-rule 0 6 1) (and (not (reaches 0 6 2))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 6 1) (and (not (reaches 1 6 2))(= (terminates-with 1) ACCEPT))))

(assert (= (rule-target 6 2) ACCEPT))(assert (=> (matches-rule 0 6 2) (and (not (reaches 0 6 3))(= (terminates-with 0) ACCEPT))))(assert (=> (matches-rule 1 6 2) (and (not (reaches 1 6 3))(= (terminates-with 1) ACCEPT))))


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
    (and (<= 1 5) (reaches 0 5 5))
    (reaches 0 5 (- 5 1))
))

(assert (=> 
    (and (reaches 0 5 5) (not (matches-criteria 0 5 5))) 
    (reaches 0 5 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 5 5) (= (rule-target 5 5) NONE)) 
    (reaches 0 5 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 0 5 6))
    (reaches 0 5 (- 6 1))
))

(assert (=> 
    (and (reaches 0 5 6) (not (matches-criteria 0 5 6))) 
    (reaches 0 5 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 5 6) (= (rule-target 5 6) NONE)) 
    (reaches 0 5 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 0 5 7))
    (reaches 0 5 (- 7 1))
))

(assert (=> 
    (and (reaches 0 5 7) (not (matches-criteria 0 5 7))) 
    (reaches 0 5 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 5 7) (= (rule-target 5 7) NONE)) 
    (reaches 0 5 (+ 7 1))
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
    (and (<= 1 5) (reaches 1 5 5))
    (reaches 1 5 (- 5 1))
))

(assert (=> 
    (and (reaches 1 5 5) (not (matches-criteria 1 5 5))) 
    (reaches 1 5 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 5 5) (= (rule-target 5 5) NONE)) 
    (reaches 1 5 (+ 5 1))
))(assert (=> 
    (and (<= 1 6) (reaches 1 5 6))
    (reaches 1 5 (- 6 1))
))

(assert (=> 
    (and (reaches 1 5 6) (not (matches-criteria 1 5 6))) 
    (reaches 1 5 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 5 6) (= (rule-target 5 6) NONE)) 
    (reaches 1 5 (+ 6 1))
))(assert (=> 
    (and (<= 1 7) (reaches 1 5 7))
    (reaches 1 5 (- 7 1))
))

(assert (=> 
    (and (reaches 1 5 7) (not (matches-criteria 1 5 7))) 
    (reaches 1 5 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 5 7) (= (rule-target 5 7) NONE)) 
    (reaches 1 5 (+ 7 1))
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
))
(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 0 0 0)))(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 1 0 0)))
(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 0 0 1)))(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 1 0 1)))
(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 0 0 2)))(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 1 0 2)))
(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 0 0 3)))(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 1 0 3)))
(assert (matches-criteria 0 0 4))(assert (matches-criteria 1 0 4))
(assert (= (and (= protocol 6) URG) (matches-criteria 0 0 5)))(assert (= (and (= protocol 6) URG) (matches-criteria 1 0 5)))
(assert (= (= protocol 117) (matches-criteria 0 1 0)))(assert (= (= protocol 117) (matches-criteria 1 1 0)))
(assert (= (= protocol 6) (matches-criteria 0 1 1)))(assert (= (= protocol 6) (matches-criteria 1 1 1)))
(assert (= (= protocol 17) (matches-criteria 0 1 2)))(assert (= (= protocol 17) (matches-criteria 1 1 2)))
(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 0 5 0)))(assert (= (and (= protocol 6) (and SYN (not ACK))) (matches-criteria 1 5 0)))
(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 0 5 1)))(assert (= (and (= protocol 6) (= destination_port 48)) (matches-criteria 1 5 1)))
(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 0 5 2)))(assert (= (and (= protocol 6) (= source_port 37)) (matches-criteria 1 5 2)))
(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 0 5 3)))(assert (= (and (= protocol 17) (= destination_port 46)) (matches-criteria 1 5 3)))
(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 0 5 4)))(assert (= (and (= protocol 17) (= destination_port 47)) (matches-criteria 1 5 4)))
(assert (matches-criteria 0 5 5))(assert (matches-criteria 1 5 5))
(assert (= (and (= protocol 6) URG) (matches-criteria 0 5 6)))(assert (= (and (= protocol 6) URG) (matches-criteria 1 5 6)))
(assert (= (= protocol 117) (matches-criteria 0 6 0)))(assert (= (= protocol 117) (matches-criteria 1 6 0)))
(assert (= (= protocol 6) (matches-criteria 0 6 1)))(assert (= (= protocol 6) (matches-criteria 1 6 1)))
(assert (= (= protocol 17) (matches-criteria 0 6 2)))(assert (= (= protocol 17) (matches-criteria 1 6 2)))

(assert (or (and (= chain0 0)(= chain1 5))))
(assert (reaches 0 chain0 0))
(assert (reaches 1 chain1 0))
(assert 
    (not 
        (and 
            (or 
                (= (terminates-with 0) (terminates-with 1))
                (and (reaches-end 0 chain0)(reaches-end 1 chain1))
                (and (and (= protocol 6) (= destination_port 48))(or (reaches 1 5 0)))
            )
            (=> (and (and (= protocol 6) (= destination_port 48))(or (reaches 1 5 0))) (= (terminates-with 1) DROP))
        )
    )
)



(declare-const x0 Int)
(declare-const y0 Int)
(declare-const x1 Int)
(declare-const y1 Int)

(assert (valid-rule x0 y0))
(assert (valid-rule x1 y1))

(assert (terminates-at 0 x0 y0))
(assert (terminates-at 1 x1 y1))



;(assert (=(reaches-end 0 0) (= (terminates-with 0) DROP)))
;(assert (=(reaches-end 1 5) (= (terminates-with 0) DROP)))













(check-sat)
(get-model)