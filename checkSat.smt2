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
(assert (= (chain-length 0) 8))(assert (= (chain-length 1) 3))(assert (= (chain-length 3) 4))(assert (= (chain-length 4) 3))(assert (= (chain-length 5) 8))(assert (= (chain-length 6) 4))(assert (= (chain-length 8) 4))(assert (= (chain-length 9) 4))(assert (= (chain-length 2) 0))(assert (= (chain-length 7) 0))
(assert (not (reaches 0 0 9)))

(assert (= (reaches 0 0 8) (reaches-end 0 0)))

(assert (= (returns-from 0 0) (or (reaches-return 0 0)(reaches-end 0 0))))
(assert (not (reaches 1 0 9)))

(assert (= (reaches 1 0 8) (reaches-end 1 0)))

(assert (= (returns-from 1 0) (or (reaches-return 1 0)(reaches-end 1 0))))
(assert (not (reaches 0 1 4)))

(assert (= (reaches 0 1 3) (reaches-end 0 1)))

(assert (= (returns-from 0 1) (or (reaches-return 0 1)(reaches-end 0 1))))
(assert (not (reaches 1 1 4)))

(assert (= (reaches 1 1 3) (reaches-end 1 1)))

(assert (= (returns-from 1 1) (or (reaches-return 1 1)(reaches-end 1 1))))
(assert (not (reaches 0 3 5)))

(assert (= (reaches 0 3 4) (reaches-end 0 3)))

(assert (= (returns-from 0 3) (or (reaches-return 0 3)(reaches-end 0 3))))
(assert (not (reaches 1 3 5)))

(assert (= (reaches 1 3 4) (reaches-end 1 3)))

(assert (= (returns-from 1 3) (or (reaches-return 1 3)(reaches-end 1 3))))
(assert (not (reaches 0 4 4)))

(assert (= (reaches 0 4 3) (reaches-end 0 4)))

(assert (= (returns-from 0 4) (or (reaches-return 0 4)(reaches-end 0 4))))
(assert (not (reaches 1 4 4)))

(assert (= (reaches 1 4 3) (reaches-end 1 4)))

(assert (= (returns-from 1 4) (or (reaches-return 1 4)(reaches-end 1 4))))
(assert (not (reaches 0 5 9)))

(assert (= (reaches 0 5 8) (reaches-end 0 5)))

(assert (= (returns-from 0 5) (or (reaches-return 0 5)(reaches-end 0 5))))
(assert (not (reaches 1 5 9)))

(assert (= (reaches 1 5 8) (reaches-end 1 5)))

(assert (= (returns-from 1 5) (or (reaches-return 1 5)(reaches-end 1 5))))
(assert (not (reaches 0 6 5)))

(assert (= (reaches 0 6 4) (reaches-end 0 6)))

(assert (= (returns-from 0 6) (or (reaches-return 0 6)(reaches-end 0 6))))
(assert (not (reaches 1 6 5)))

(assert (= (reaches 1 6 4) (reaches-end 1 6)))

(assert (= (returns-from 1 6) (or (reaches-return 1 6)(reaches-end 1 6))))
(assert (not (reaches 0 8 5)))

(assert (= (reaches 0 8 4) (reaches-end 0 8)))

(assert (= (returns-from 0 8) (or (reaches-return 0 8)(reaches-end 0 8))))
(assert (not (reaches 1 8 5)))

(assert (= (reaches 1 8 4) (reaches-end 1 8)))

(assert (= (returns-from 1 8) (or (reaches-return 1 8)(reaches-end 1 8))))
(assert (not (reaches 0 9 5)))

(assert (= (reaches 0 9 4) (reaches-end 0 9)))

(assert (= (returns-from 0 9) (or (reaches-return 0 9)(reaches-end 0 9))))
(assert (not (reaches 1 9 5)))

(assert (= (reaches 1 9 4) (reaches-end 1 9)))

(assert (= (returns-from 1 9) (or (reaches-return 1 9)(reaches-end 1 9))))

(assert (top-level-chain 0))
(assert (top-level-chain 3))
(assert (top-level-chain 5))
(assert (top-level-chain 8))

(assert (=> (reaches-end 0 0) (= (terminates-with 0) (policy 0))))
(assert (=> (reaches-end 0 3) (= (terminates-with 0) (policy 3))))
(assert (=> (reaches-end 0 5) (= (terminates-with 0) (policy 5))))
(assert (=> (reaches-end 0 8) (= (terminates-with 0) (policy 8))))
(assert (=> (reaches-end 1 0) (= (terminates-with 1) (policy 0))))
(assert (=> (reaches-end 1 3) (= (terminates-with 1) (policy 3))))
(assert (=> (reaches-end 1 5) (= (terminates-with 1) (policy 5))))
(assert (=> (reaches-end 1 8) (= (terminates-with 1) (policy 8))))

(assert (= (policy 1) NONE))
(assert (= (policy 4) NONE))
(assert (= (policy 6) NONE))
(assert (= (policy 9) NONE))
(assert (= (policy 1) NONE))
(assert (= (policy 4) NONE))
(assert (= (policy 6) NONE))
(assert (= (policy 9) NONE))

(assert (=> (reaches 0 0 0) (not (reaches 0 3 0))))
(assert (=> (reaches 0 0 0) (not (reaches 0 5 0))))
(assert (=> (reaches 0 0 0) (not (reaches 0 8 0))))
(assert (=> (reaches 0 3 0) (not (reaches 0 5 0))))
(assert (=> (reaches 0 3 0) (not (reaches 0 8 0))))
(assert (=> (reaches 0 5 0) (not (reaches 0 8 0))))
(assert (=> (reaches 1 0 0) (not (reaches 1 3 0))))
(assert (=> (reaches 1 0 0) (not (reaches 1 5 0))))
(assert (=> (reaches 1 0 0) (not (reaches 1 8 0))))
(assert (=> (reaches 1 3 0) (not (reaches 1 5 0))))
(assert (=> (reaches 1 3 0) (not (reaches 1 8 0))))
(assert (=> (reaches 1 5 0) (not (reaches 1 8 0))))

(assert (not (top-level-chain 1)))
(assert (not (top-level-chain 4)))
(assert (not (top-level-chain 6)))
(assert (not (top-level-chain 9)))

(assert (= num-of-chains 10))
(declare-fun protocol (Int) Int)
(assert (<= 0 (protocol 0)))
(assert (<= (protocol 0) 255))
(declare-fun destination_port (Int) Int)
(assert (<= 0 (destination_port 0)))
(assert (<= (destination_port 0) 65535))
(declare-fun RST (Int) Bool)
(declare-fun SYN (Int) Bool)
(declare-fun ACK (Int) Bool)
(declare-fun URG (Int) Bool)

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


(assert (= (rule-target 0 6) (GO 1 0)))
(assert (=> (matches-rule 0 0 6) (and (reaches 0 1 0)(= (returns-from 0 1) (reaches 0 0 7)))))
(assert (=> (matches-rule 1 0 6) (and (reaches 1 1 0)(= (returns-from 1 1) (reaches 1 0 7)))))
(assert (=> (not (matches-rule 0 0 6)) (not (reaches 0 1 0))))
(assert (=> (not (matches-rule 1 0 6)) (not (reaches 1 1 0))))

(assert (= (rule-target 0 7) DROP))
(assert (=> (matches-rule 0 0 7) (and (not (reaches 0 0 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 0 7) (and (not (reaches 1 0 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 1 0) ACCEPT))
(assert (=> (matches-rule 0 1 0) (and (not (reaches 0 1 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 0) (and (not (reaches 1 1 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 1 1) ACCEPT))
(assert (=> (matches-rule 0 1 1) (and (not (reaches 0 1 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 1) (and (not (reaches 1 1 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 1 2) ACCEPT))
(assert (=> (matches-rule 0 1 2) (and (not (reaches 0 1 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 1 2) (and (not (reaches 1 1 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 3 0) DROP))
(assert (=> (matches-rule 0 3 0) (and (not (reaches 0 3 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 3 0) (and (not (reaches 1 3 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 3 1) ACCEPT))
(assert (=> (matches-rule 0 3 1) (and (not (reaches 0 3 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 3 1) (and (not (reaches 1 3 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 3 2) (GO 4 0)))
(assert (=> (matches-rule 0 3 2) (and (reaches 0 4 0)(= (returns-from 0 4) (reaches 0 3 3)))))
(assert (=> (matches-rule 1 3 2) (and (reaches 1 4 0)(= (returns-from 1 4) (reaches 1 3 3)))))
(assert (=> (not (matches-rule 0 3 2)) (not (reaches 0 4 0))))
(assert (=> (not (matches-rule 1 3 2)) (not (reaches 1 4 0))))

(assert (= (rule-target 3 3) ACCEPT))
(assert (=> (matches-rule 0 3 3) (and (not (reaches 0 3 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 3 3) (and (not (reaches 1 3 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 4 0) ACCEPT))
(assert (=> (matches-rule 0 4 0) (and (not (reaches 0 4 1))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 4 0) (and (not (reaches 1 4 1))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 4 1) ACCEPT))
(assert (=> (matches-rule 0 4 1) (and (not (reaches 0 4 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 4 1) (and (not (reaches 1 4 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 4 2) ACCEPT))
(assert (=> (matches-rule 0 4 2) (and (not (reaches 0 4 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 4 2) (and (not (reaches 1 4 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 5 0) DROP))
(assert (=> (matches-rule 0 5 0) (and (not (reaches 0 5 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 0) (and (not (reaches 1 5 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 1) DROP))
(assert (=> (matches-rule 0 5 1) (and (not (reaches 0 5 2))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 1) (and (not (reaches 1 5 2))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 2) DROP))
(assert (=> (matches-rule 0 5 2) (and (not (reaches 0 5 3))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 2) (and (not (reaches 1 5 3))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 3) DROP))
(assert (=> (matches-rule 0 5 3) (and (not (reaches 0 5 4))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 3) (and (not (reaches 1 5 4))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 4) DROP))
(assert (=> (matches-rule 0 5 4) (and (not (reaches 0 5 5))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 4) (and (not (reaches 1 5 5))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 5) DROP))
(assert (=> (matches-rule 0 5 5) (and (not (reaches 0 5 6))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 5) (and (not (reaches 1 5 6))(= (terminates-with 1) DROP))))


(assert (= (rule-target 5 6) (GO 6 0)))
(assert (=> (matches-rule 0 5 6) (and (reaches 0 6 0)(= (returns-from 0 6) (reaches 0 5 7)))))
(assert (=> (matches-rule 1 5 6) (and (reaches 1 6 0)(= (returns-from 1 6) (reaches 1 5 7)))))
(assert (=> (not (matches-rule 0 5 6)) (not (reaches 0 6 0))))
(assert (=> (not (matches-rule 1 5 6)) (not (reaches 1 6 0))))

(assert (= (rule-target 5 7) DROP))
(assert (=> (matches-rule 0 5 7) (and (not (reaches 0 5 8))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 5 7) (and (not (reaches 1 5 8))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 0) DROP))
(assert (=> (matches-rule 0 6 0) (and (not (reaches 0 6 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 6 0) (and (not (reaches 1 6 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 6 1) ACCEPT))
(assert (=> (matches-rule 0 6 1) (and (not (reaches 0 6 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 6 1) (and (not (reaches 1 6 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 6 2) ACCEPT))
(assert (=> (matches-rule 0 6 2) (and (not (reaches 0 6 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 6 2) (and (not (reaches 1 6 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 6 3) ACCEPT))
(assert (=> (matches-rule 0 6 3) (and (not (reaches 0 6 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 6 3) (and (not (reaches 1 6 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 8 0) DROP))
(assert (=> (matches-rule 0 8 0) (and (not (reaches 0 8 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 8 0) (and (not (reaches 1 8 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 8 1) ACCEPT))
(assert (=> (matches-rule 0 8 1) (and (not (reaches 0 8 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 8 1) (and (not (reaches 1 8 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 8 2) (GO 9 0)))
(assert (=> (matches-rule 0 8 2) (and (reaches 0 9 0)(= (returns-from 0 9) (reaches 0 8 3)))))
(assert (=> (matches-rule 1 8 2) (and (reaches 1 9 0)(= (returns-from 1 9) (reaches 1 8 3)))))
(assert (=> (not (matches-rule 0 8 2)) (not (reaches 0 9 0))))
(assert (=> (not (matches-rule 1 8 2)) (not (reaches 1 9 0))))

(assert (= (rule-target 8 3) ACCEPT))
(assert (=> (matches-rule 0 8 3) (and (not (reaches 0 8 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 8 3) (and (not (reaches 1 8 4))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 9 0) DROP))
(assert (=> (matches-rule 0 9 0) (and (not (reaches 0 9 1))(= (terminates-with 0) DROP))))
(assert (=> (matches-rule 1 9 0) (and (not (reaches 1 9 1))(= (terminates-with 1) DROP))))


(assert (= (rule-target 9 1) ACCEPT))
(assert (=> (matches-rule 0 9 1) (and (not (reaches 0 9 2))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 9 1) (and (not (reaches 1 9 2))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 9 2) ACCEPT))
(assert (=> (matches-rule 0 9 2) (and (not (reaches 0 9 3))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 9 2) (and (not (reaches 1 9 3))(= (terminates-with 1) ACCEPT))))


(assert (= (rule-target 9 3) ACCEPT))
(assert (=> (matches-rule 0 9 3) (and (not (reaches 0 9 4))(= (terminates-with 0) ACCEPT))))
(assert (=> (matches-rule 1 9 3) (and (not (reaches 1 9 4))(= (terminates-with 1) ACCEPT))))



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
    (and (<= 1 8) (reaches 0 5 8))
    (reaches 0 5 (- 8 1))
))

(assert (=> 
    (and (reaches 0 5 8) (not (matches-criteria 0 5 8))) 
    (reaches 0 5 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 5 8) (= (rule-target 5 8) NONE)) 
    (reaches 0 5 (+ 8 1))
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
    (and (<= 1 8) (reaches 1 5 8))
    (reaches 1 5 (- 8 1))
))

(assert (=> 
    (and (reaches 1 5 8) (not (matches-criteria 1 5 8))) 
    (reaches 1 5 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 5 8) (= (rule-target 5 8) NONE)) 
    (reaches 1 5 (+ 8 1))
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
    (and (<= 1 3) (reaches 0 8 3))
    (reaches 0 8 (- 3 1))
))

(assert (=> 
    (and (reaches 0 8 3) (not (matches-criteria 0 8 3))) 
    (reaches 0 8 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 8 3) (= (rule-target 8 3) NONE)) 
    (reaches 0 8 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 8 4))
    (reaches 0 8 (- 4 1))
))

(assert (=> 
    (and (reaches 0 8 4) (not (matches-criteria 0 8 4))) 
    (reaches 0 8 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 8 4) (= (rule-target 8 4) NONE)) 
    (reaches 0 8 (+ 4 1))
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
    (and (<= 1 3) (reaches 1 8 3))
    (reaches 1 8 (- 3 1))
))

(assert (=> 
    (and (reaches 1 8 3) (not (matches-criteria 1 8 3))) 
    (reaches 1 8 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 8 3) (= (rule-target 8 3) NONE)) 
    (reaches 1 8 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 8 4))
    (reaches 1 8 (- 4 1))
))

(assert (=> 
    (and (reaches 1 8 4) (not (matches-criteria 1 8 4))) 
    (reaches 1 8 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 8 4) (= (rule-target 8 4) NONE)) 
    (reaches 1 8 (+ 4 1))
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
    (and (<= 1 3) (reaches 0 9 3))
    (reaches 0 9 (- 3 1))
))

(assert (=> 
    (and (reaches 0 9 3) (not (matches-criteria 0 9 3))) 
    (reaches 0 9 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 9 3) (= (rule-target 9 3) NONE)) 
    (reaches 0 9 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 0 9 4))
    (reaches 0 9 (- 4 1))
))

(assert (=> 
    (and (reaches 0 9 4) (not (matches-criteria 0 9 4))) 
    (reaches 0 9 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 9 4) (= (rule-target 9 4) NONE)) 
    (reaches 0 9 (+ 4 1))
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
    (and (<= 1 3) (reaches 1 9 3))
    (reaches 1 9 (- 3 1))
))

(assert (=> 
    (and (reaches 1 9 3) (not (matches-criteria 1 9 3))) 
    (reaches 1 9 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 9 3) (= (rule-target 9 3) NONE)) 
    (reaches 1 9 (+ 3 1))
))(assert (=> 
    (and (<= 1 4) (reaches 1 9 4))
    (reaches 1 9 (- 4 1))
))

(assert (=> 
    (and (reaches 1 9 4) (not (matches-criteria 1 9 4))) 
    (reaches 1 9 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 9 4) (= (rule-target 9 4) NONE)) 
    (reaches 1 9 (+ 4 1))
))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)49)) (matches-criteria 0 0 0)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)49)) (matches-criteria 1 0 0)))

(assert (= (and (= (protocol 0)17) (= (destination_port 0)48)) (matches-criteria 0 0 1)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)48)) (matches-criteria 1 0 1)))

(assert (= (and (= (protocol 0)6) (RST 0)) (matches-criteria 0 0 2)))
(assert (= (and (= (protocol 0)6) (RST 0)) (matches-criteria 1 0 2)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)49)) (matches-criteria 0 0 3)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)49)) (matches-criteria 1 0 3)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)48)) (matches-criteria 0 0 4)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)48)) (matches-criteria 1 0 4)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 0 0 5)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 1 0 5)))

(assert (matches-criteria 0 0 6))
(assert (matches-criteria 1 0 6))

(assert (= (and (= (protocol 0)6) (URG 0)) (matches-criteria 0 0 7)))
(assert (= (and (= (protocol 0)6) (URG 0)) (matches-criteria 1 0 7)))

(assert (= (= (protocol 0)117) (matches-criteria 0 1 0)))
(assert (= (= (protocol 0)117) (matches-criteria 1 1 0)))

(assert (= (= (protocol 0)6) (matches-criteria 0 1 1)))
(assert (= (= (protocol 0)6) (matches-criteria 1 1 1)))

(assert (= (= (protocol 0)17) (matches-criteria 0 1 2)))
(assert (= (= (protocol 0)17) (matches-criteria 1 1 2)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)110)) (matches-criteria 0 3 0)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)110)) (matches-criteria 1 3 0)))

(assert (= (= (protocol 0)124) (matches-criteria 0 3 1)))
(assert (= (= (protocol 0)124) (matches-criteria 1 3 1)))

(assert (matches-criteria 0 3 2))
(assert (matches-criteria 1 3 2))

(assert (= (and (= (protocol 0)17) (= (destination_port 0)109)) (matches-criteria 0 3 3)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)109)) (matches-criteria 1 3 3)))

(assert (= (= (protocol 0)117) (matches-criteria 0 4 0)))
(assert (= (= (protocol 0)117) (matches-criteria 1 4 0)))

(assert (= (= (protocol 0)6) (matches-criteria 0 4 1)))
(assert (= (= (protocol 0)6) (matches-criteria 1 4 1)))

(assert (= (= (protocol 0)17) (matches-criteria 0 4 2)))
(assert (= (= (protocol 0)17) (matches-criteria 1 4 2)))

(assert (= (and (= (protocol 0)17) (= (destination_port 0)49)) (matches-criteria 0 5 0)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)49)) (matches-criteria 1 5 0)))

(assert (= (and (= (protocol 0)17) (= (destination_port 0)48)) (matches-criteria 0 5 1)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)48)) (matches-criteria 1 5 1)))

(assert (= (and (= (protocol 0)6) (RST 0)) (matches-criteria 0 5 2)))
(assert (= (and (= (protocol 0)6) (RST 0)) (matches-criteria 1 5 2)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)49)) (matches-criteria 0 5 3)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)49)) (matches-criteria 1 5 3)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)48)) (matches-criteria 0 5 4)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)48)) (matches-criteria 1 5 4)))

(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 0 5 5)))
(assert (= (and (= (protocol 0)6) (and (SYN 0) (not (ACK 0)))) (matches-criteria 1 5 5)))

(assert (matches-criteria 0 5 6))
(assert (matches-criteria 1 5 6))

(assert (= (and (= (protocol 0)6) (URG 0)) (matches-criteria 0 5 7)))
(assert (= (and (= (protocol 0)6) (URG 0)) (matches-criteria 1 5 7)))

(assert (= (= (protocol 0)124) (matches-criteria 0 6 0)))
(assert (= (= (protocol 0)124) (matches-criteria 1 6 0)))

(assert (= (= (protocol 0)117) (matches-criteria 0 6 1)))
(assert (= (= (protocol 0)117) (matches-criteria 1 6 1)))

(assert (= (= (protocol 0)6) (matches-criteria 0 6 2)))
(assert (= (= (protocol 0)6) (matches-criteria 1 6 2)))

(assert (= (= (protocol 0)17) (matches-criteria 0 6 3)))
(assert (= (= (protocol 0)17) (matches-criteria 1 6 3)))

(assert (= (and (= (protocol 0)6) (= (destination_port 0)110)) (matches-criteria 0 8 0)))
(assert (= (and (= (protocol 0)6) (= (destination_port 0)110)) (matches-criteria 1 8 0)))

(assert (= (= (protocol 0)124) (matches-criteria 0 8 1)))
(assert (= (= (protocol 0)124) (matches-criteria 1 8 1)))

(assert (matches-criteria 0 8 2))
(assert (matches-criteria 1 8 2))

(assert (= (and (= (protocol 0)17) (= (destination_port 0)109)) (matches-criteria 0 8 3)))
(assert (= (and (= (protocol 0)17) (= (destination_port 0)109)) (matches-criteria 1 8 3)))

(assert (= (= (protocol 0)124) (matches-criteria 0 9 0)))
(assert (= (= (protocol 0)124) (matches-criteria 1 9 0)))

(assert (= (= (protocol 0)117) (matches-criteria 0 9 1)))
(assert (= (= (protocol 0)117) (matches-criteria 1 9 1)))

(assert (= (= (protocol 0)6) (matches-criteria 0 9 2)))
(assert (= (= (protocol 0)6) (matches-criteria 1 9 2)))

(assert (= (= (protocol 0)17) (matches-criteria 0 9 3)))
(assert (= (= (protocol 0)17) (matches-criteria 1 9 3)))

(assert (or (and (= chain0 0)(= chain1 5))(and (= chain0 3)(= chain1 8))))
(assert (reaches 0 chain0 0))
(assert (reaches 1 chain1 0))
(assert (not (and (or (= (terminates-with 0) (terminates-with 1))(and (reaches-end 0 chain0)(reaches-end 1 chain1))(and (= (protocol 0)124)(or (reaches 1 5 0))))(=> (and (= (protocol 0)124)(or (reaches 1 5 0))) (= (terminates-with 1) DROP)))))
(check-sat)
(get-model)