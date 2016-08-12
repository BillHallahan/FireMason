;When being used, make sure to initialize the following correctly:
;num-of-packets
;num-of-chains
;chain-length

(declare-datatypes () ((Target ACCEPT DROP RETURN (GO (chain Int) (rule Int)) NONE)))

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

(define-fun isGo ((t Target)) Bool
    (exists ((a Int) (b Int)) (= t (GO a b)))
)

(define-fun top-level-chain ((c Int)) Bool
    (forall ((c2 Int) (r Int)) 
        (=> 
            (and (valid-rule c2 r) (isGo (rule-target c2 r)))
            (not (= c (chain (rule-target c2 r))))
        )
    )
)

(define-fun reaches-top-level-chain ((p Int) (c Int)) Bool
    (and (valid-packet p) (valid-chain c) (top-level-chain c) (reaches p c 0))
)

;Says a packet can only be in one top level chain
(assert 
    (forall ((p Int) (c1 Int) (c2 Int)) 
        (=> 
            (and (not (= c1 c2)) (valid-packet p) (valid-chain c1) (valid-chain c2) (top-level-chain c1) (top-level-chain c2) (reaches p c1 0)) 
            (not (reaches p c2 0))
        )
    )
)

;Says a non-top-level-chain cannot have a policy
(assert
    (forall ((c Int))
        (=>
            (not (top-level-chain c))
            (= (policy c) NONE)
        )
    )
)

;Says a top-level-chain's policy is the outcome of a packet when it reaches the end of it
(assert
    (forall ((p Int) (c Int))
        (=>
            (and (valid-packet p) (top-level-chain c) (reaches-end p c))
            (= (terminates-with p) (policy c))
        )
    )
)


;These two rules enforce that a packet can only reach up to the end of a chain, not past it,
;and that it must reach rule (r - 1) to reach rule r

(assert (forall ((c Int) (p Int)) (=> 
    (and (valid-chain c) (valid-packet p)) 
    (not (reaches p c (+ (chain-length c) 1)))
)))

(assert (forall ((c Int) (r Int) (p Int)) (=> 
    (and (valid-chain c) (<= 0 r) (<= r (chain-length c)) (valid-packet p) (<= 1 r) (reaches p c r))
    (reaches p c (- r 1))
)))

(assert (forall ((c Int) (r Int) (p Int)) (=> 
    (and (valid-rule c r) (valid-packet p) (reaches p c r) (not (matches-criteria p c r))) 
    (reaches p c (+ r 1))
)))

(assert (forall ((c Int) (r Int) (p Int)) (=> 
    (and (valid-rule c r) (valid-packet p) (reaches p c r) (= (rule-target c r) NONE)) 
    (reaches p c (+ r 1))
)))

(assert (forall ((c Int) (p Int)) (= 
    (and (valid-chain c) (valid-packet p) (reaches p c (chain-length c)))
    (reaches-end p c)
)))

(assert (forall ((c Int) (p Int)) (=> 
    (and (valid-packet p) (valid-chain c))
    (= (or (reaches-return p c) (reaches-end p c)) (returns-from p c))
)))



;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (forall ((p Int) (c Int) (r Int)) 
        (=> 
            (and (matches-rule p c r) (terminating (rule-target c r))) 
            (and (not (reaches p c (+ r 1))) (= (terminates-with p) (rule-target c r)))
        )
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (forall ( (p Int) (c Int) (r Int)) 
        (=>
            (and (matches-rule p c r) (= (rule-target c r) RETURN))
            (and (reaches-return p c) (not (reaches p c (+ r 1))))
        )
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (forall ((p Int) (c Int) (r Int))
        (=>
            (and (matches-rule p c r) (isGo (rule-target c r)))
            (and
                ;We go to the appropriate rule in the new chain
                (reaches p (chain (rule-target c r)) (rule (rule-target c r)))
                ;If we don't return from the new chain, we don't continue in the old chain
                (= (returns-from p (chain (rule-target c r))) (reaches p c (+ r 1)))
            )
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (forall ((p Int) (c Int) (r Int))
        (=>
            (and (not (matches-rule p c r)) (isGo (rule-target c r)))
            (not (reaches p (chain (rule-target c r)) (rule (rule-target c r))))
        )
    )
)(assert (= num-of-packets 2))
(declare-const chain0 Int)
(declare-const chain1 Int)
(assert (= (chain-length 0) 6))(assert (= (chain-length 1) 13))(assert (= (chain-length 2) 4))(assert (= (chain-length 3) 4))(assert (= (chain-length 4) 4))(assert (= (chain-length 5) 4))(assert (= (chain-length 6) 3))(assert (= (chain-length 7) 1))(assert (= (chain-length 8) 4))(assert (= (chain-length 9) 0))(assert (= (chain-length 10) 6))(assert (= (chain-length 11) 13))(assert (= (chain-length 12) 5))(assert (= (chain-length 13) 5))(assert (= (chain-length 14) 5))(assert (= (chain-length 15) 5))(assert (= (chain-length 16) 3))(assert (= (chain-length 17) 1))(assert (= (chain-length 18) 5))(assert (= (chain-length 19) 0))
(assert (= num-of-chains 20))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun SYN () Bool)
(declare-fun ACK () Bool)
(declare-fun FIN () Bool)

(assert (= (rule-target 0 0) ACCEPT))

(assert (= (rule-target 0 1) ACCEPT))

(assert (= (rule-target 0 2) DROP))

(assert (= (rule-target 0 3) (GO 1 0)))
(assert (= (rule-target 0 4) ACCEPT))

(assert (= (rule-target 0 5) ACCEPT))

(assert (= (rule-target 1 0) ACCEPT))

(assert (= (rule-target 1 1) DROP))

(assert (= (rule-target 1 2) DROP))

(assert (= (rule-target 1 3) NONE))
(assert (= (rule-target 1 4) (GO 5 0)))

(assert (= (rule-target 1 5) ACCEPT))

(assert (= (rule-target 1 6) ACCEPT))

(assert (= (rule-target 1 7) ACCEPT))

(assert (= (rule-target 1 8) ACCEPT))

(assert (= (rule-target 1 9) ACCEPT))

(assert (= (rule-target 1 10) (GO 4 0)))

(assert (= (rule-target 1 11) (GO 3 0)))

(assert (= (rule-target 1 12) (GO 2 0)))

(assert (= (rule-target 2 0) DROP))

(assert (= (rule-target 2 1) DROP))

(assert (= (rule-target 2 2) DROP))

(assert (= (rule-target 2 3) DROP))

(assert (= (rule-target 3 0) DROP))

(assert (= (rule-target 3 1) DROP))

(assert (= (rule-target 3 2) DROP))

(assert (= (rule-target 3 3) DROP))

(assert (= (rule-target 4 0) DROP))

(assert (= (rule-target 4 1) DROP))

(assert (= (rule-target 4 2) DROP))

(assert (= (rule-target 4 3) DROP))

(assert (= (rule-target 5 0) DROP))

(assert (= (rule-target 5 1) DROP))

(assert (= (rule-target 5 2) DROP))

(assert (= (rule-target 5 3) DROP))

(assert (= (rule-target 6 0) DROP))

(assert (= (rule-target 6 1) (GO 8 0)))
(assert (= (rule-target 6 2) (GO 7 0)))
(assert (= (rule-target 7 0) DROP))

(assert (= (rule-target 8 0) DROP))

(assert (= (rule-target 8 1) DROP))

(assert (= (rule-target 8 2) DROP))

(assert (= (rule-target 8 3) DROP))


(assert (= (rule-target 10 0) ACCEPT))

(assert (= (rule-target 10 1) ACCEPT))

(assert (= (rule-target 10 2) DROP))

(assert (= (rule-target 10 3) (GO 11 0)))
(assert (= (rule-target 10 4) ACCEPT))

(assert (= (rule-target 10 5) ACCEPT))

(assert (= (rule-target 11 0) ACCEPT))

(assert (= (rule-target 11 1) DROP))

(assert (= (rule-target 11 2) DROP))

(assert (= (rule-target 11 3) NONE))
(assert (= (rule-target 11 4) (GO 15 0)))

(assert (= (rule-target 11 5) ACCEPT))

(assert (= (rule-target 11 6) ACCEPT))

(assert (= (rule-target 11 7) ACCEPT))

(assert (= (rule-target 11 8) ACCEPT))

(assert (= (rule-target 11 9) ACCEPT))

(assert (= (rule-target 11 10) (GO 14 0)))

(assert (= (rule-target 11 11) (GO 13 0)))

(assert (= (rule-target 11 12) (GO 12 0)))

(assert (= (rule-target 12 0) DROP))

(assert (= (rule-target 12 1) DROP))

(assert (= (rule-target 12 2) ACCEPT))

(assert (= (rule-target 12 3) DROP))

(assert (= (rule-target 12 4) DROP))

(assert (= (rule-target 13 0) DROP))

(assert (= (rule-target 13 1) DROP))

(assert (= (rule-target 13 2) ACCEPT))

(assert (= (rule-target 13 3) DROP))

(assert (= (rule-target 13 4) DROP))

(assert (= (rule-target 14 0) DROP))

(assert (= (rule-target 14 1) DROP))

(assert (= (rule-target 14 2) ACCEPT))

(assert (= (rule-target 14 3) DROP))

(assert (= (rule-target 14 4) DROP))

(assert (= (rule-target 15 0) DROP))

(assert (= (rule-target 15 1) DROP))

(assert (= (rule-target 15 2) ACCEPT))

(assert (= (rule-target 15 3) DROP))

(assert (= (rule-target 15 4) DROP))

(assert (= (rule-target 16 0) DROP))

(assert (= (rule-target 16 1) (GO 18 0)))
(assert (= (rule-target 16 2) (GO 17 0)))
(assert (= (rule-target 17 0) DROP))

(assert (= (rule-target 18 0) DROP))

(assert (= (rule-target 18 1) DROP))

(assert (= (rule-target 18 2) ACCEPT))

(assert (= (rule-target 18 3) DROP))

(assert (= (rule-target 18 4) DROP))



(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 89) (matches-criteria p 0 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 4) (matches-criteria p 0 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 78) (matches-criteria p 0 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 0 3))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria p 0 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 17) (= source_port 98)) (matches-criteria p 0 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 9) (matches-criteria p 1 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 1 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 22) (matches-criteria p 1 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 6)) (matches-criteria p 1 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria p 1 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= source_port 10) (= protocol 88)) (matches-criteria p 1 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria p 1 6)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria p 1 7)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= source_port 10) (= protocol 87)) (matches-criteria p 1 8)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria p 1 9)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria p 1 10)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria p 1 11)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria p 1 12)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 2 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 2 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 2 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 2 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 3 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 3 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 3 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 3 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 4 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 4 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 4 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 4 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 5 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 5 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 5 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 5 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (not (= protocol 4)) (matches-criteria p 6 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 6 1))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 6 2))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 7 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 8 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 8 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 8 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 8 3)))))

(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 89) (matches-criteria p 10 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 4) (matches-criteria p 10 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 78) (matches-criteria p 10 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 10 3))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria p 10 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 17) (= source_port 98)) (matches-criteria p 10 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 9) (matches-criteria p 11 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 11 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 22) (matches-criteria p 11 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 6)) (matches-criteria p 11 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria p 11 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= source_port 10) (= protocol 88)) (matches-criteria p 11 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria p 11 6)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria p 11 7)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= source_port 10) (= protocol 87)) (matches-criteria p 11 8)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria p 11 9)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria p 11 10)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria p 11 11)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria p 11 12)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 12 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 12 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 100) (matches-criteria p 12 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 12 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 12 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 13 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 13 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 100) (matches-criteria p 13 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 13 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 13 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 14 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 14 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 100) (matches-criteria p 14 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 14 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 14 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 15 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 15 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 100) (matches-criteria p 15 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 15 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 15 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (not (= protocol 4)) (matches-criteria p 16 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 16 1))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 16 2))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 17 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 7)) (matches-criteria p 18 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 8)) (matches-criteria p 18 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 100) (matches-criteria p 18 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria p 18 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria p 18 4)))))

(assert (or (= chain0 2)(= chain0 3)(= chain0 4)(= chain0 5)(= chain0 8)))(assert (or (= chain1 12)(= chain1 13)(= chain1 14)(= chain1 15)(= chain1 18)))(assert (reaches 0 chain0 0))(assert (reaches 1 chain1 0))(assert (not (and (or (= (terminates-with 0) (terminates-with 1)) (and (reaches-end 0 chain0) (reaches-end 1 chain1)) (= destination_port 100)) (=> (= destination_port 100) (= (terminates-with 1) ACCEPT)))))(check-sat-using (then (repeat (then simplify qe)) smt))
(get-model)