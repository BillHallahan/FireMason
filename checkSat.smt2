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

;(assert (forall ((c Int) (r Int) (p Int)) (=> 
;    (and (valid-chain c) (<= 0 r) (<= r (chain-length c)) (valid-packet p) (<= 1 r) (reaches p c r))
;    (reaches p c (- r 1))
;)))

;(assert (forall ((c Int) (r Int) (p Int)) (=> 
;    (and (valid-rule c r) (valid-packet p) (reaches p c r) (not (matches-criteria p c r))) 
;    (reaches p c (+ r 1))
;)))

;(assert (forall ((c Int) (r Int) (p Int)) (=> 
;   (and (valid-rule c r) (valid-packet p) (reaches p c r) (= (rule-target c r) NONE)) 
;    (reaches p c (+ r 1))
;)))

(assert (forall ((c Int) (p Int)) (= 
    (and (valid-chain c) (valid-packet p) (reaches p c (chain-length c)))
    (reaches-end p c)
)))

(assert (forall ((c Int) (p Int)) (=> 
    (and (valid-packet p) (valid-chain c))
    (= (or (reaches-return p c) (reaches-end p c)) (returns-from p c))
)))(assert (= num-of-packets 2))
(declare-const chain0 Int)
(declare-const chain1 Int)
(assert (= (chain-length 0) 11))(assert (= (chain-length 1) 16))(assert (= (chain-length 2) 4))(assert (= (chain-length 3) 4))(assert (= (chain-length 4) 4))(assert (= (chain-length 5) 4))(assert (= (chain-length 6) 1))(assert (= (chain-length 7) 3))(assert (= (chain-length 8) 1))(assert (= (chain-length 9) 4))(assert (= (chain-length 10) 0))(assert (= (chain-length 11) 11))(assert (= (chain-length 12) 16))(assert (= (chain-length 13) 5))(assert (= (chain-length 14) 5))(assert (= (chain-length 15) 5))(assert (= (chain-length 16) 5))(assert (= (chain-length 17) 1))(assert (= (chain-length 18) 3))(assert (= (chain-length 19) 1))(assert (= (chain-length 20) 5))(assert (= (chain-length 21) 0))
(assert (= num-of-chains 22))
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

(assert (= (rule-target 0 0) ACCEPT))

(assert (= (rule-target 0 1) DROP))

(assert (= (rule-target 0 2) ACCEPT))

(assert (= (rule-target 0 3) ACCEPT))

(assert (= (rule-target 0 4) ACCEPT))

(assert (= (rule-target 0 5) DROP))

(assert (= (rule-target 0 6) ACCEPT))

(assert (= (rule-target 0 7) ACCEPT))

(assert (= (rule-target 0 8) (GO 6 0)))
(assert (= (rule-target 0 9) (GO 1 0)))
(assert (= (rule-target 0 10) ACCEPT))

(assert (= (rule-target 1 0) ACCEPT))

(assert (= (rule-target 1 1) DROP))

(assert (= (rule-target 1 2) DROP))

(assert (= (rule-target 1 3) NONE))
(assert (= (rule-target 1 4) DROP))

(assert (= (rule-target 1 5) DROP))

(assert (= (rule-target 1 6) (GO 5 0)))

(assert (= (rule-target 1 7) ACCEPT))

(assert (= (rule-target 1 8) ACCEPT))

(assert (= (rule-target 1 9) ACCEPT))

(assert (= (rule-target 1 10) ACCEPT))

(assert (= (rule-target 1 11) ACCEPT))

(assert (= (rule-target 1 12) ACCEPT))

(assert (= (rule-target 1 13) (GO 4 0)))

(assert (= (rule-target 1 14) (GO 3 0)))

(assert (= (rule-target 1 15) (GO 2 0)))

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

(assert (= (rule-target 7 0) DROP))

(assert (= (rule-target 7 1) (GO 9 0)))
(assert (= (rule-target 7 2) (GO 8 0)))
(assert (= (rule-target 8 0) DROP))

(assert (= (rule-target 9 0) DROP))

(assert (= (rule-target 9 1) DROP))

(assert (= (rule-target 9 2) DROP))

(assert (= (rule-target 9 3) DROP))


(assert (= (rule-target 11 0) ACCEPT))

(assert (= (rule-target 11 1) DROP))

(assert (= (rule-target 11 2) ACCEPT))

(assert (= (rule-target 11 3) ACCEPT))

(assert (= (rule-target 11 4) ACCEPT))

(assert (= (rule-target 11 5) DROP))

(assert (= (rule-target 11 6) ACCEPT))

(assert (= (rule-target 11 7) ACCEPT))

(assert (= (rule-target 11 8) (GO 17 0)))
(assert (= (rule-target 11 9) (GO 12 0)))
(assert (= (rule-target 11 10) ACCEPT))

(assert (= (rule-target 12 0) ACCEPT))

(assert (= (rule-target 12 1) DROP))

(assert (= (rule-target 12 2) DROP))

(assert (= (rule-target 12 3) NONE))
(assert (= (rule-target 12 4) DROP))

(assert (= (rule-target 12 5) DROP))

(assert (= (rule-target 12 6) (GO 16 0)))

(assert (= (rule-target 12 7) ACCEPT))

(assert (= (rule-target 12 8) ACCEPT))

(assert (= (rule-target 12 9) ACCEPT))

(assert (= (rule-target 12 10) ACCEPT))

(assert (= (rule-target 12 11) ACCEPT))

(assert (= (rule-target 12 12) ACCEPT))

(assert (= (rule-target 12 13) (GO 15 0)))

(assert (= (rule-target 12 14) (GO 14 0)))

(assert (= (rule-target 12 15) (GO 13 0)))

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

(assert (= (rule-target 16 1) DROP))

(assert (= (rule-target 16 2) ACCEPT))

(assert (= (rule-target 16 3) DROP))

(assert (= (rule-target 16 4) DROP))

(assert (= (rule-target 17 0) DROP))

(assert (= (rule-target 18 0) DROP))

(assert (= (rule-target 18 1) (GO 20 0)))
(assert (= (rule-target 18 2) (GO 19 0)))
(assert (= (rule-target 19 0) DROP))

(assert (= (rule-target 20 0) DROP))

(assert (= (rule-target 20 1) DROP))

(assert (= (rule-target 20 2) ACCEPT))

(assert (= (rule-target 20 3) DROP))

(assert (= (rule-target 20 4) DROP))



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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 0) (terminating (rule-target 0 0))) 
        (and (not (reaches 0 0 (+ 0 1))) (= (terminates-with 0) (rule-target 0 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 0) (= (rule-target 0 0) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 0) (isGo (rule-target 0 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 0)) (rule (rule-target 0 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 0))) (reaches 0 0 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 0)) (isGo (rule-target 0 0)))
        (not (reaches 0 (chain (rule-target 0 0)) (rule (rule-target 0 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 1) (terminating (rule-target 0 1))) 
        (and (not (reaches 0 0 (+ 1 1))) (= (terminates-with 0) (rule-target 0 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 1) (= (rule-target 0 1) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 1) (isGo (rule-target 0 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 1)) (rule (rule-target 0 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 1))) (reaches 0 0 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 1)) (isGo (rule-target 0 1)))
        (not (reaches 0 (chain (rule-target 0 1)) (rule (rule-target 0 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 2) (terminating (rule-target 0 2))) 
        (and (not (reaches 0 0 (+ 2 1))) (= (terminates-with 0) (rule-target 0 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 2) (= (rule-target 0 2) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 2) (isGo (rule-target 0 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 2)) (rule (rule-target 0 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 2))) (reaches 0 0 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 2)) (isGo (rule-target 0 2)))
        (not (reaches 0 (chain (rule-target 0 2)) (rule (rule-target 0 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 3) (terminating (rule-target 0 3))) 
        (and (not (reaches 0 0 (+ 3 1))) (= (terminates-with 0) (rule-target 0 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 3) (= (rule-target 0 3) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 3) (isGo (rule-target 0 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 3)) (rule (rule-target 0 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 3))) (reaches 0 0 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 3)) (isGo (rule-target 0 3)))
        (not (reaches 0 (chain (rule-target 0 3)) (rule (rule-target 0 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 4) (terminating (rule-target 0 4))) 
        (and (not (reaches 0 0 (+ 4 1))) (= (terminates-with 0) (rule-target 0 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 4) (= (rule-target 0 4) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 4) (isGo (rule-target 0 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 4)) (rule (rule-target 0 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 4))) (reaches 0 0 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 4)) (isGo (rule-target 0 4)))
        (not (reaches 0 (chain (rule-target 0 4)) (rule (rule-target 0 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 5) (terminating (rule-target 0 5))) 
        (and (not (reaches 0 0 (+ 5 1))) (= (terminates-with 0) (rule-target 0 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 5) (= (rule-target 0 5) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 5) (isGo (rule-target 0 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 5)) (rule (rule-target 0 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 5))) (reaches 0 0 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 5)) (isGo (rule-target 0 5)))
        (not (reaches 0 (chain (rule-target 0 5)) (rule (rule-target 0 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 6) (terminating (rule-target 0 6))) 
        (and (not (reaches 0 0 (+ 6 1))) (= (terminates-with 0) (rule-target 0 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 6) (= (rule-target 0 6) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 6) (isGo (rule-target 0 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 6)) (rule (rule-target 0 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 6))) (reaches 0 0 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 6)) (isGo (rule-target 0 6)))
        (not (reaches 0 (chain (rule-target 0 6)) (rule (rule-target 0 6))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 7) (terminating (rule-target 0 7))) 
        (and (not (reaches 0 0 (+ 7 1))) (= (terminates-with 0) (rule-target 0 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 7) (= (rule-target 0 7) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 7) (isGo (rule-target 0 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 7)) (rule (rule-target 0 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 7))) (reaches 0 0 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 7)) (isGo (rule-target 0 7)))
        (not (reaches 0 (chain (rule-target 0 7)) (rule (rule-target 0 7))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 8) (terminating (rule-target 0 8))) 
        (and (not (reaches 0 0 (+ 8 1))) (= (terminates-with 0) (rule-target 0 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 8) (= (rule-target 0 8) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 8) (isGo (rule-target 0 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 8)) (rule (rule-target 0 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 8))) (reaches 0 0 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 8)) (isGo (rule-target 0 8)))
        (not (reaches 0 (chain (rule-target 0 8)) (rule (rule-target 0 8))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 9) (terminating (rule-target 0 9))) 
        (and (not (reaches 0 0 (+ 9 1))) (= (terminates-with 0) (rule-target 0 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 9) (= (rule-target 0 9) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 9) (isGo (rule-target 0 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 9)) (rule (rule-target 0 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 9))) (reaches 0 0 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 9)) (isGo (rule-target 0 9)))
        (not (reaches 0 (chain (rule-target 0 9)) (rule (rule-target 0 9))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 10) (terminating (rule-target 0 10))) 
        (and (not (reaches 0 0 (+ 10 1))) (= (terminates-with 0) (rule-target 0 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 10) (= (rule-target 0 10) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 10) (isGo (rule-target 0 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 10)) (rule (rule-target 0 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 10))) (reaches 0 0 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 10)) (isGo (rule-target 0 10)))
        (not (reaches 0 (chain (rule-target 0 10)) (rule (rule-target 0 10))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 0 11) (terminating (rule-target 0 11))) 
        (and (not (reaches 0 0 (+ 11 1))) (= (terminates-with 0) (rule-target 0 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 0 11) (= (rule-target 0 11) RETURN))
        (and (reaches-return 0 0) (not (reaches 0 0 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 0 11) (isGo (rule-target 0 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 0 11)) (rule (rule-target 0 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 0 11))) (reaches 0 0 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 0 11)) (isGo (rule-target 0 11)))
        (not (reaches 0 (chain (rule-target 0 11)) (rule (rule-target 0 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 0) (terminating (rule-target 0 0))) 
        (and (not (reaches 1 0 (+ 0 1))) (= (terminates-with 1) (rule-target 0 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 0) (= (rule-target 0 0) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 0) (isGo (rule-target 0 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 0)) (rule (rule-target 0 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 0))) (reaches 1 0 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 0)) (isGo (rule-target 0 0)))
        (not (reaches 1 (chain (rule-target 0 0)) (rule (rule-target 0 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 1) (terminating (rule-target 0 1))) 
        (and (not (reaches 1 0 (+ 1 1))) (= (terminates-with 1) (rule-target 0 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 1) (= (rule-target 0 1) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 1) (isGo (rule-target 0 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 1)) (rule (rule-target 0 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 1))) (reaches 1 0 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 1)) (isGo (rule-target 0 1)))
        (not (reaches 1 (chain (rule-target 0 1)) (rule (rule-target 0 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 2) (terminating (rule-target 0 2))) 
        (and (not (reaches 1 0 (+ 2 1))) (= (terminates-with 1) (rule-target 0 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 2) (= (rule-target 0 2) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 2) (isGo (rule-target 0 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 2)) (rule (rule-target 0 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 2))) (reaches 1 0 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 2)) (isGo (rule-target 0 2)))
        (not (reaches 1 (chain (rule-target 0 2)) (rule (rule-target 0 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 3) (terminating (rule-target 0 3))) 
        (and (not (reaches 1 0 (+ 3 1))) (= (terminates-with 1) (rule-target 0 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 3) (= (rule-target 0 3) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 3) (isGo (rule-target 0 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 3)) (rule (rule-target 0 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 3))) (reaches 1 0 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 3)) (isGo (rule-target 0 3)))
        (not (reaches 1 (chain (rule-target 0 3)) (rule (rule-target 0 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 4) (terminating (rule-target 0 4))) 
        (and (not (reaches 1 0 (+ 4 1))) (= (terminates-with 1) (rule-target 0 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 4) (= (rule-target 0 4) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 4) (isGo (rule-target 0 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 4)) (rule (rule-target 0 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 4))) (reaches 1 0 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 4)) (isGo (rule-target 0 4)))
        (not (reaches 1 (chain (rule-target 0 4)) (rule (rule-target 0 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 5) (terminating (rule-target 0 5))) 
        (and (not (reaches 1 0 (+ 5 1))) (= (terminates-with 1) (rule-target 0 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 5) (= (rule-target 0 5) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 5) (isGo (rule-target 0 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 5)) (rule (rule-target 0 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 5))) (reaches 1 0 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 5)) (isGo (rule-target 0 5)))
        (not (reaches 1 (chain (rule-target 0 5)) (rule (rule-target 0 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 6) (terminating (rule-target 0 6))) 
        (and (not (reaches 1 0 (+ 6 1))) (= (terminates-with 1) (rule-target 0 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 6) (= (rule-target 0 6) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 6) (isGo (rule-target 0 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 6)) (rule (rule-target 0 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 6))) (reaches 1 0 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 6)) (isGo (rule-target 0 6)))
        (not (reaches 1 (chain (rule-target 0 6)) (rule (rule-target 0 6))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 7) (terminating (rule-target 0 7))) 
        (and (not (reaches 1 0 (+ 7 1))) (= (terminates-with 1) (rule-target 0 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 7) (= (rule-target 0 7) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 7) (isGo (rule-target 0 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 7)) (rule (rule-target 0 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 7))) (reaches 1 0 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 7)) (isGo (rule-target 0 7)))
        (not (reaches 1 (chain (rule-target 0 7)) (rule (rule-target 0 7))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 8) (terminating (rule-target 0 8))) 
        (and (not (reaches 1 0 (+ 8 1))) (= (terminates-with 1) (rule-target 0 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 8) (= (rule-target 0 8) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 8) (isGo (rule-target 0 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 8)) (rule (rule-target 0 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 8))) (reaches 1 0 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 8)) (isGo (rule-target 0 8)))
        (not (reaches 1 (chain (rule-target 0 8)) (rule (rule-target 0 8))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 9) (terminating (rule-target 0 9))) 
        (and (not (reaches 1 0 (+ 9 1))) (= (terminates-with 1) (rule-target 0 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 9) (= (rule-target 0 9) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 9) (isGo (rule-target 0 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 9)) (rule (rule-target 0 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 9))) (reaches 1 0 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 9)) (isGo (rule-target 0 9)))
        (not (reaches 1 (chain (rule-target 0 9)) (rule (rule-target 0 9))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 10) (terminating (rule-target 0 10))) 
        (and (not (reaches 1 0 (+ 10 1))) (= (terminates-with 1) (rule-target 0 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 10) (= (rule-target 0 10) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 10) (isGo (rule-target 0 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 10)) (rule (rule-target 0 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 10))) (reaches 1 0 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 10)) (isGo (rule-target 0 10)))
        (not (reaches 1 (chain (rule-target 0 10)) (rule (rule-target 0 10))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 0 11) (terminating (rule-target 0 11))) 
        (and (not (reaches 1 0 (+ 11 1))) (= (terminates-with 1) (rule-target 0 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 0 11) (= (rule-target 0 11) RETURN))
        (and (reaches-return 1 0) (not (reaches 1 0 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 0 11) (isGo (rule-target 0 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 0 11)) (rule (rule-target 0 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 0 11))) (reaches 1 0 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 0 11)) (isGo (rule-target 0 11)))
        (not (reaches 1 (chain (rule-target 0 11)) (rule (rule-target 0 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 0) (terminating (rule-target 1 0))) 
        (and (not (reaches 0 1 (+ 0 1))) (= (terminates-with 0) (rule-target 1 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 0) (= (rule-target 1 0) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 0) (isGo (rule-target 1 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 0)) (rule (rule-target 1 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 0))) (reaches 0 1 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 0)) (isGo (rule-target 1 0)))
        (not (reaches 0 (chain (rule-target 1 0)) (rule (rule-target 1 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 1) (terminating (rule-target 1 1))) 
        (and (not (reaches 0 1 (+ 1 1))) (= (terminates-with 0) (rule-target 1 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 1) (= (rule-target 1 1) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 1) (isGo (rule-target 1 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 1)) (rule (rule-target 1 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 1))) (reaches 0 1 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 1)) (isGo (rule-target 1 1)))
        (not (reaches 0 (chain (rule-target 1 1)) (rule (rule-target 1 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 2) (terminating (rule-target 1 2))) 
        (and (not (reaches 0 1 (+ 2 1))) (= (terminates-with 0) (rule-target 1 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 2) (= (rule-target 1 2) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 2) (isGo (rule-target 1 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 2)) (rule (rule-target 1 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 2))) (reaches 0 1 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 2)) (isGo (rule-target 1 2)))
        (not (reaches 0 (chain (rule-target 1 2)) (rule (rule-target 1 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 3) (terminating (rule-target 1 3))) 
        (and (not (reaches 0 1 (+ 3 1))) (= (terminates-with 0) (rule-target 1 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 3) (= (rule-target 1 3) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 3) (isGo (rule-target 1 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 3)) (rule (rule-target 1 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 3))) (reaches 0 1 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 3)) (isGo (rule-target 1 3)))
        (not (reaches 0 (chain (rule-target 1 3)) (rule (rule-target 1 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 4) (terminating (rule-target 1 4))) 
        (and (not (reaches 0 1 (+ 4 1))) (= (terminates-with 0) (rule-target 1 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 4) (= (rule-target 1 4) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 4) (isGo (rule-target 1 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 4)) (rule (rule-target 1 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 4))) (reaches 0 1 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 4)) (isGo (rule-target 1 4)))
        (not (reaches 0 (chain (rule-target 1 4)) (rule (rule-target 1 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 5) (terminating (rule-target 1 5))) 
        (and (not (reaches 0 1 (+ 5 1))) (= (terminates-with 0) (rule-target 1 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 5) (= (rule-target 1 5) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 5) (isGo (rule-target 1 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 5)) (rule (rule-target 1 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 5))) (reaches 0 1 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 5)) (isGo (rule-target 1 5)))
        (not (reaches 0 (chain (rule-target 1 5)) (rule (rule-target 1 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 6) (terminating (rule-target 1 6))) 
        (and (not (reaches 0 1 (+ 6 1))) (= (terminates-with 0) (rule-target 1 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 6) (= (rule-target 1 6) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 6) (isGo (rule-target 1 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 6)) (rule (rule-target 1 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 6))) (reaches 0 1 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 6)) (isGo (rule-target 1 6)))
        (not (reaches 0 (chain (rule-target 1 6)) (rule (rule-target 1 6))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 7) (terminating (rule-target 1 7))) 
        (and (not (reaches 0 1 (+ 7 1))) (= (terminates-with 0) (rule-target 1 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 7) (= (rule-target 1 7) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 7) (isGo (rule-target 1 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 7)) (rule (rule-target 1 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 7))) (reaches 0 1 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 7)) (isGo (rule-target 1 7)))
        (not (reaches 0 (chain (rule-target 1 7)) (rule (rule-target 1 7))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 8) (terminating (rule-target 1 8))) 
        (and (not (reaches 0 1 (+ 8 1))) (= (terminates-with 0) (rule-target 1 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 8) (= (rule-target 1 8) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 8) (isGo (rule-target 1 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 8)) (rule (rule-target 1 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 8))) (reaches 0 1 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 8)) (isGo (rule-target 1 8)))
        (not (reaches 0 (chain (rule-target 1 8)) (rule (rule-target 1 8))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 9) (terminating (rule-target 1 9))) 
        (and (not (reaches 0 1 (+ 9 1))) (= (terminates-with 0) (rule-target 1 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 9) (= (rule-target 1 9) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 9) (isGo (rule-target 1 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 9)) (rule (rule-target 1 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 9))) (reaches 0 1 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 9)) (isGo (rule-target 1 9)))
        (not (reaches 0 (chain (rule-target 1 9)) (rule (rule-target 1 9))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 10) (terminating (rule-target 1 10))) 
        (and (not (reaches 0 1 (+ 10 1))) (= (terminates-with 0) (rule-target 1 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 10) (= (rule-target 1 10) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 10) (isGo (rule-target 1 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 10)) (rule (rule-target 1 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 10))) (reaches 0 1 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 10)) (isGo (rule-target 1 10)))
        (not (reaches 0 (chain (rule-target 1 10)) (rule (rule-target 1 10))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 11) (terminating (rule-target 1 11))) 
        (and (not (reaches 0 1 (+ 11 1))) (= (terminates-with 0) (rule-target 1 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 11) (= (rule-target 1 11) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 11) (isGo (rule-target 1 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 11)) (rule (rule-target 1 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 11))) (reaches 0 1 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 11)) (isGo (rule-target 1 11)))
        (not (reaches 0 (chain (rule-target 1 11)) (rule (rule-target 1 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 12) (terminating (rule-target 1 12))) 
        (and (not (reaches 0 1 (+ 12 1))) (= (terminates-with 0) (rule-target 1 12)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 12) (= (rule-target 1 12) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 12 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 12) (isGo (rule-target 1 12)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 12)) (rule (rule-target 1 12)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 12))) (reaches 0 1 (+ 12 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 12)) (isGo (rule-target 1 12)))
        (not (reaches 0 (chain (rule-target 1 12)) (rule (rule-target 1 12))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 13) (terminating (rule-target 1 13))) 
        (and (not (reaches 0 1 (+ 13 1))) (= (terminates-with 0) (rule-target 1 13)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 13) (= (rule-target 1 13) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 13 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 13) (isGo (rule-target 1 13)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 13)) (rule (rule-target 1 13)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 13))) (reaches 0 1 (+ 13 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 13)) (isGo (rule-target 1 13)))
        (not (reaches 0 (chain (rule-target 1 13)) (rule (rule-target 1 13))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 14) (terminating (rule-target 1 14))) 
        (and (not (reaches 0 1 (+ 14 1))) (= (terminates-with 0) (rule-target 1 14)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 14) (= (rule-target 1 14) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 14 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 14) (isGo (rule-target 1 14)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 14)) (rule (rule-target 1 14)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 14))) (reaches 0 1 (+ 14 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 14)) (isGo (rule-target 1 14)))
        (not (reaches 0 (chain (rule-target 1 14)) (rule (rule-target 1 14))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 15) (terminating (rule-target 1 15))) 
        (and (not (reaches 0 1 (+ 15 1))) (= (terminates-with 0) (rule-target 1 15)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 15) (= (rule-target 1 15) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 15 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 15) (isGo (rule-target 1 15)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 15)) (rule (rule-target 1 15)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 15))) (reaches 0 1 (+ 15 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 15)) (isGo (rule-target 1 15)))
        (not (reaches 0 (chain (rule-target 1 15)) (rule (rule-target 1 15))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 1 16) (terminating (rule-target 1 16))) 
        (and (not (reaches 0 1 (+ 16 1))) (= (terminates-with 0) (rule-target 1 16)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 1 16) (= (rule-target 1 16) RETURN))
        (and (reaches-return 0 1) (not (reaches 0 1 (+ 16 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 1 16) (isGo (rule-target 1 16)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 1 16)) (rule (rule-target 1 16)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 1 16))) (reaches 0 1 (+ 16 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 1 16)) (isGo (rule-target 1 16)))
        (not (reaches 0 (chain (rule-target 1 16)) (rule (rule-target 1 16))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 0) (terminating (rule-target 1 0))) 
        (and (not (reaches 1 1 (+ 0 1))) (= (terminates-with 1) (rule-target 1 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 0) (= (rule-target 1 0) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 0) (isGo (rule-target 1 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 0)) (rule (rule-target 1 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 0))) (reaches 1 1 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 0)) (isGo (rule-target 1 0)))
        (not (reaches 1 (chain (rule-target 1 0)) (rule (rule-target 1 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 1) (terminating (rule-target 1 1))) 
        (and (not (reaches 1 1 (+ 1 1))) (= (terminates-with 1) (rule-target 1 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 1) (= (rule-target 1 1) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 1) (isGo (rule-target 1 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 1)) (rule (rule-target 1 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 1))) (reaches 1 1 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 1)) (isGo (rule-target 1 1)))
        (not (reaches 1 (chain (rule-target 1 1)) (rule (rule-target 1 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 2) (terminating (rule-target 1 2))) 
        (and (not (reaches 1 1 (+ 2 1))) (= (terminates-with 1) (rule-target 1 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 2) (= (rule-target 1 2) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 2) (isGo (rule-target 1 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 2)) (rule (rule-target 1 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 2))) (reaches 1 1 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 2)) (isGo (rule-target 1 2)))
        (not (reaches 1 (chain (rule-target 1 2)) (rule (rule-target 1 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 3) (terminating (rule-target 1 3))) 
        (and (not (reaches 1 1 (+ 3 1))) (= (terminates-with 1) (rule-target 1 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 3) (= (rule-target 1 3) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 3) (isGo (rule-target 1 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 3)) (rule (rule-target 1 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 3))) (reaches 1 1 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 3)) (isGo (rule-target 1 3)))
        (not (reaches 1 (chain (rule-target 1 3)) (rule (rule-target 1 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 4) (terminating (rule-target 1 4))) 
        (and (not (reaches 1 1 (+ 4 1))) (= (terminates-with 1) (rule-target 1 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 4) (= (rule-target 1 4) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 4) (isGo (rule-target 1 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 4)) (rule (rule-target 1 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 4))) (reaches 1 1 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 4)) (isGo (rule-target 1 4)))
        (not (reaches 1 (chain (rule-target 1 4)) (rule (rule-target 1 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 5) (terminating (rule-target 1 5))) 
        (and (not (reaches 1 1 (+ 5 1))) (= (terminates-with 1) (rule-target 1 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 5) (= (rule-target 1 5) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 5) (isGo (rule-target 1 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 5)) (rule (rule-target 1 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 5))) (reaches 1 1 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 5)) (isGo (rule-target 1 5)))
        (not (reaches 1 (chain (rule-target 1 5)) (rule (rule-target 1 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 6) (terminating (rule-target 1 6))) 
        (and (not (reaches 1 1 (+ 6 1))) (= (terminates-with 1) (rule-target 1 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 6) (= (rule-target 1 6) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 6) (isGo (rule-target 1 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 6)) (rule (rule-target 1 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 6))) (reaches 1 1 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 6)) (isGo (rule-target 1 6)))
        (not (reaches 1 (chain (rule-target 1 6)) (rule (rule-target 1 6))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 7) (terminating (rule-target 1 7))) 
        (and (not (reaches 1 1 (+ 7 1))) (= (terminates-with 1) (rule-target 1 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 7) (= (rule-target 1 7) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 7) (isGo (rule-target 1 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 7)) (rule (rule-target 1 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 7))) (reaches 1 1 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 7)) (isGo (rule-target 1 7)))
        (not (reaches 1 (chain (rule-target 1 7)) (rule (rule-target 1 7))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 8) (terminating (rule-target 1 8))) 
        (and (not (reaches 1 1 (+ 8 1))) (= (terminates-with 1) (rule-target 1 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 8) (= (rule-target 1 8) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 8) (isGo (rule-target 1 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 8)) (rule (rule-target 1 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 8))) (reaches 1 1 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 8)) (isGo (rule-target 1 8)))
        (not (reaches 1 (chain (rule-target 1 8)) (rule (rule-target 1 8))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 9) (terminating (rule-target 1 9))) 
        (and (not (reaches 1 1 (+ 9 1))) (= (terminates-with 1) (rule-target 1 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 9) (= (rule-target 1 9) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 9) (isGo (rule-target 1 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 9)) (rule (rule-target 1 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 9))) (reaches 1 1 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 9)) (isGo (rule-target 1 9)))
        (not (reaches 1 (chain (rule-target 1 9)) (rule (rule-target 1 9))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 10) (terminating (rule-target 1 10))) 
        (and (not (reaches 1 1 (+ 10 1))) (= (terminates-with 1) (rule-target 1 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 10) (= (rule-target 1 10) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 10) (isGo (rule-target 1 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 10)) (rule (rule-target 1 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 10))) (reaches 1 1 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 10)) (isGo (rule-target 1 10)))
        (not (reaches 1 (chain (rule-target 1 10)) (rule (rule-target 1 10))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 11) (terminating (rule-target 1 11))) 
        (and (not (reaches 1 1 (+ 11 1))) (= (terminates-with 1) (rule-target 1 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 11) (= (rule-target 1 11) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 11) (isGo (rule-target 1 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 11)) (rule (rule-target 1 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 11))) (reaches 1 1 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 11)) (isGo (rule-target 1 11)))
        (not (reaches 1 (chain (rule-target 1 11)) (rule (rule-target 1 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 12) (terminating (rule-target 1 12))) 
        (and (not (reaches 1 1 (+ 12 1))) (= (terminates-with 1) (rule-target 1 12)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 12) (= (rule-target 1 12) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 12 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 12) (isGo (rule-target 1 12)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 12)) (rule (rule-target 1 12)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 12))) (reaches 1 1 (+ 12 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 12)) (isGo (rule-target 1 12)))
        (not (reaches 1 (chain (rule-target 1 12)) (rule (rule-target 1 12))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 13) (terminating (rule-target 1 13))) 
        (and (not (reaches 1 1 (+ 13 1))) (= (terminates-with 1) (rule-target 1 13)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 13) (= (rule-target 1 13) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 13 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 13) (isGo (rule-target 1 13)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 13)) (rule (rule-target 1 13)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 13))) (reaches 1 1 (+ 13 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 13)) (isGo (rule-target 1 13)))
        (not (reaches 1 (chain (rule-target 1 13)) (rule (rule-target 1 13))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 14) (terminating (rule-target 1 14))) 
        (and (not (reaches 1 1 (+ 14 1))) (= (terminates-with 1) (rule-target 1 14)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 14) (= (rule-target 1 14) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 14 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 14) (isGo (rule-target 1 14)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 14)) (rule (rule-target 1 14)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 14))) (reaches 1 1 (+ 14 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 14)) (isGo (rule-target 1 14)))
        (not (reaches 1 (chain (rule-target 1 14)) (rule (rule-target 1 14))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 15) (terminating (rule-target 1 15))) 
        (and (not (reaches 1 1 (+ 15 1))) (= (terminates-with 1) (rule-target 1 15)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 15) (= (rule-target 1 15) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 15 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 15) (isGo (rule-target 1 15)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 15)) (rule (rule-target 1 15)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 15))) (reaches 1 1 (+ 15 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 15)) (isGo (rule-target 1 15)))
        (not (reaches 1 (chain (rule-target 1 15)) (rule (rule-target 1 15))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 1 16) (terminating (rule-target 1 16))) 
        (and (not (reaches 1 1 (+ 16 1))) (= (terminates-with 1) (rule-target 1 16)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 1 16) (= (rule-target 1 16) RETURN))
        (and (reaches-return 1 1) (not (reaches 1 1 (+ 16 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 1 16) (isGo (rule-target 1 16)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 1 16)) (rule (rule-target 1 16)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 1 16))) (reaches 1 1 (+ 16 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 1 16)) (isGo (rule-target 1 16)))
        (not (reaches 1 (chain (rule-target 1 16)) (rule (rule-target 1 16))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 2 0) (terminating (rule-target 2 0))) 
        (and (not (reaches 0 2 (+ 0 1))) (= (terminates-with 0) (rule-target 2 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 2 0) (= (rule-target 2 0) RETURN))
        (and (reaches-return 0 2) (not (reaches 0 2 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 2 0) (isGo (rule-target 2 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 2 0)) (rule (rule-target 2 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 2 0))) (reaches 0 2 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 2 0)) (isGo (rule-target 2 0)))
        (not (reaches 0 (chain (rule-target 2 0)) (rule (rule-target 2 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 2 1) (terminating (rule-target 2 1))) 
        (and (not (reaches 0 2 (+ 1 1))) (= (terminates-with 0) (rule-target 2 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 2 1) (= (rule-target 2 1) RETURN))
        (and (reaches-return 0 2) (not (reaches 0 2 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 2 1) (isGo (rule-target 2 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 2 1)) (rule (rule-target 2 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 2 1))) (reaches 0 2 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 2 1)) (isGo (rule-target 2 1)))
        (not (reaches 0 (chain (rule-target 2 1)) (rule (rule-target 2 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 2 2) (terminating (rule-target 2 2))) 
        (and (not (reaches 0 2 (+ 2 1))) (= (terminates-with 0) (rule-target 2 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 2 2) (= (rule-target 2 2) RETURN))
        (and (reaches-return 0 2) (not (reaches 0 2 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 2 2) (isGo (rule-target 2 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 2 2)) (rule (rule-target 2 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 2 2))) (reaches 0 2 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 2 2)) (isGo (rule-target 2 2)))
        (not (reaches 0 (chain (rule-target 2 2)) (rule (rule-target 2 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 2 3) (terminating (rule-target 2 3))) 
        (and (not (reaches 0 2 (+ 3 1))) (= (terminates-with 0) (rule-target 2 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 2 3) (= (rule-target 2 3) RETURN))
        (and (reaches-return 0 2) (not (reaches 0 2 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 2 3) (isGo (rule-target 2 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 2 3)) (rule (rule-target 2 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 2 3))) (reaches 0 2 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 2 3)) (isGo (rule-target 2 3)))
        (not (reaches 0 (chain (rule-target 2 3)) (rule (rule-target 2 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 2 4) (terminating (rule-target 2 4))) 
        (and (not (reaches 0 2 (+ 4 1))) (= (terminates-with 0) (rule-target 2 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 2 4) (= (rule-target 2 4) RETURN))
        (and (reaches-return 0 2) (not (reaches 0 2 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 2 4) (isGo (rule-target 2 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 2 4)) (rule (rule-target 2 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 2 4))) (reaches 0 2 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 2 4)) (isGo (rule-target 2 4)))
        (not (reaches 0 (chain (rule-target 2 4)) (rule (rule-target 2 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 2 0) (terminating (rule-target 2 0))) 
        (and (not (reaches 1 2 (+ 0 1))) (= (terminates-with 1) (rule-target 2 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 2 0) (= (rule-target 2 0) RETURN))
        (and (reaches-return 1 2) (not (reaches 1 2 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 2 0) (isGo (rule-target 2 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 2 0)) (rule (rule-target 2 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 2 0))) (reaches 1 2 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 2 0)) (isGo (rule-target 2 0)))
        (not (reaches 1 (chain (rule-target 2 0)) (rule (rule-target 2 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 2 1) (terminating (rule-target 2 1))) 
        (and (not (reaches 1 2 (+ 1 1))) (= (terminates-with 1) (rule-target 2 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 2 1) (= (rule-target 2 1) RETURN))
        (and (reaches-return 1 2) (not (reaches 1 2 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 2 1) (isGo (rule-target 2 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 2 1)) (rule (rule-target 2 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 2 1))) (reaches 1 2 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 2 1)) (isGo (rule-target 2 1)))
        (not (reaches 1 (chain (rule-target 2 1)) (rule (rule-target 2 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 2 2) (terminating (rule-target 2 2))) 
        (and (not (reaches 1 2 (+ 2 1))) (= (terminates-with 1) (rule-target 2 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 2 2) (= (rule-target 2 2) RETURN))
        (and (reaches-return 1 2) (not (reaches 1 2 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 2 2) (isGo (rule-target 2 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 2 2)) (rule (rule-target 2 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 2 2))) (reaches 1 2 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 2 2)) (isGo (rule-target 2 2)))
        (not (reaches 1 (chain (rule-target 2 2)) (rule (rule-target 2 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 2 3) (terminating (rule-target 2 3))) 
        (and (not (reaches 1 2 (+ 3 1))) (= (terminates-with 1) (rule-target 2 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 2 3) (= (rule-target 2 3) RETURN))
        (and (reaches-return 1 2) (not (reaches 1 2 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 2 3) (isGo (rule-target 2 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 2 3)) (rule (rule-target 2 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 2 3))) (reaches 1 2 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 2 3)) (isGo (rule-target 2 3)))
        (not (reaches 1 (chain (rule-target 2 3)) (rule (rule-target 2 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 2 4) (terminating (rule-target 2 4))) 
        (and (not (reaches 1 2 (+ 4 1))) (= (terminates-with 1) (rule-target 2 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 2 4) (= (rule-target 2 4) RETURN))
        (and (reaches-return 1 2) (not (reaches 1 2 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 2 4) (isGo (rule-target 2 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 2 4)) (rule (rule-target 2 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 2 4))) (reaches 1 2 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 2 4)) (isGo (rule-target 2 4)))
        (not (reaches 1 (chain (rule-target 2 4)) (rule (rule-target 2 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 3 0) (terminating (rule-target 3 0))) 
        (and (not (reaches 0 3 (+ 0 1))) (= (terminates-with 0) (rule-target 3 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 3 0) (= (rule-target 3 0) RETURN))
        (and (reaches-return 0 3) (not (reaches 0 3 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 3 0) (isGo (rule-target 3 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 3 0)) (rule (rule-target 3 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 3 0))) (reaches 0 3 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 3 0)) (isGo (rule-target 3 0)))
        (not (reaches 0 (chain (rule-target 3 0)) (rule (rule-target 3 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 3 1) (terminating (rule-target 3 1))) 
        (and (not (reaches 0 3 (+ 1 1))) (= (terminates-with 0) (rule-target 3 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 3 1) (= (rule-target 3 1) RETURN))
        (and (reaches-return 0 3) (not (reaches 0 3 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 3 1) (isGo (rule-target 3 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 3 1)) (rule (rule-target 3 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 3 1))) (reaches 0 3 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 3 1)) (isGo (rule-target 3 1)))
        (not (reaches 0 (chain (rule-target 3 1)) (rule (rule-target 3 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 3 2) (terminating (rule-target 3 2))) 
        (and (not (reaches 0 3 (+ 2 1))) (= (terminates-with 0) (rule-target 3 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 3 2) (= (rule-target 3 2) RETURN))
        (and (reaches-return 0 3) (not (reaches 0 3 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 3 2) (isGo (rule-target 3 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 3 2)) (rule (rule-target 3 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 3 2))) (reaches 0 3 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 3 2)) (isGo (rule-target 3 2)))
        (not (reaches 0 (chain (rule-target 3 2)) (rule (rule-target 3 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 3 3) (terminating (rule-target 3 3))) 
        (and (not (reaches 0 3 (+ 3 1))) (= (terminates-with 0) (rule-target 3 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 3 3) (= (rule-target 3 3) RETURN))
        (and (reaches-return 0 3) (not (reaches 0 3 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 3 3) (isGo (rule-target 3 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 3 3)) (rule (rule-target 3 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 3 3))) (reaches 0 3 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 3 3)) (isGo (rule-target 3 3)))
        (not (reaches 0 (chain (rule-target 3 3)) (rule (rule-target 3 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 3 4) (terminating (rule-target 3 4))) 
        (and (not (reaches 0 3 (+ 4 1))) (= (terminates-with 0) (rule-target 3 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 3 4) (= (rule-target 3 4) RETURN))
        (and (reaches-return 0 3) (not (reaches 0 3 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 3 4) (isGo (rule-target 3 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 3 4)) (rule (rule-target 3 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 3 4))) (reaches 0 3 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 3 4)) (isGo (rule-target 3 4)))
        (not (reaches 0 (chain (rule-target 3 4)) (rule (rule-target 3 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 3 0) (terminating (rule-target 3 0))) 
        (and (not (reaches 1 3 (+ 0 1))) (= (terminates-with 1) (rule-target 3 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 3 0) (= (rule-target 3 0) RETURN))
        (and (reaches-return 1 3) (not (reaches 1 3 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 3 0) (isGo (rule-target 3 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 3 0)) (rule (rule-target 3 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 3 0))) (reaches 1 3 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 3 0)) (isGo (rule-target 3 0)))
        (not (reaches 1 (chain (rule-target 3 0)) (rule (rule-target 3 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 3 1) (terminating (rule-target 3 1))) 
        (and (not (reaches 1 3 (+ 1 1))) (= (terminates-with 1) (rule-target 3 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 3 1) (= (rule-target 3 1) RETURN))
        (and (reaches-return 1 3) (not (reaches 1 3 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 3 1) (isGo (rule-target 3 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 3 1)) (rule (rule-target 3 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 3 1))) (reaches 1 3 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 3 1)) (isGo (rule-target 3 1)))
        (not (reaches 1 (chain (rule-target 3 1)) (rule (rule-target 3 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 3 2) (terminating (rule-target 3 2))) 
        (and (not (reaches 1 3 (+ 2 1))) (= (terminates-with 1) (rule-target 3 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 3 2) (= (rule-target 3 2) RETURN))
        (and (reaches-return 1 3) (not (reaches 1 3 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 3 2) (isGo (rule-target 3 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 3 2)) (rule (rule-target 3 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 3 2))) (reaches 1 3 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 3 2)) (isGo (rule-target 3 2)))
        (not (reaches 1 (chain (rule-target 3 2)) (rule (rule-target 3 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 3 3) (terminating (rule-target 3 3))) 
        (and (not (reaches 1 3 (+ 3 1))) (= (terminates-with 1) (rule-target 3 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 3 3) (= (rule-target 3 3) RETURN))
        (and (reaches-return 1 3) (not (reaches 1 3 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 3 3) (isGo (rule-target 3 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 3 3)) (rule (rule-target 3 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 3 3))) (reaches 1 3 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 3 3)) (isGo (rule-target 3 3)))
        (not (reaches 1 (chain (rule-target 3 3)) (rule (rule-target 3 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 3 4) (terminating (rule-target 3 4))) 
        (and (not (reaches 1 3 (+ 4 1))) (= (terminates-with 1) (rule-target 3 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 3 4) (= (rule-target 3 4) RETURN))
        (and (reaches-return 1 3) (not (reaches 1 3 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 3 4) (isGo (rule-target 3 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 3 4)) (rule (rule-target 3 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 3 4))) (reaches 1 3 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 3 4)) (isGo (rule-target 3 4)))
        (not (reaches 1 (chain (rule-target 3 4)) (rule (rule-target 3 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 4 0) (terminating (rule-target 4 0))) 
        (and (not (reaches 0 4 (+ 0 1))) (= (terminates-with 0) (rule-target 4 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 4 0) (= (rule-target 4 0) RETURN))
        (and (reaches-return 0 4) (not (reaches 0 4 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 4 0) (isGo (rule-target 4 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 4 0)) (rule (rule-target 4 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 4 0))) (reaches 0 4 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 4 0)) (isGo (rule-target 4 0)))
        (not (reaches 0 (chain (rule-target 4 0)) (rule (rule-target 4 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 4 1) (terminating (rule-target 4 1))) 
        (and (not (reaches 0 4 (+ 1 1))) (= (terminates-with 0) (rule-target 4 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 4 1) (= (rule-target 4 1) RETURN))
        (and (reaches-return 0 4) (not (reaches 0 4 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 4 1) (isGo (rule-target 4 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 4 1)) (rule (rule-target 4 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 4 1))) (reaches 0 4 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 4 1)) (isGo (rule-target 4 1)))
        (not (reaches 0 (chain (rule-target 4 1)) (rule (rule-target 4 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 4 2) (terminating (rule-target 4 2))) 
        (and (not (reaches 0 4 (+ 2 1))) (= (terminates-with 0) (rule-target 4 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 4 2) (= (rule-target 4 2) RETURN))
        (and (reaches-return 0 4) (not (reaches 0 4 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 4 2) (isGo (rule-target 4 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 4 2)) (rule (rule-target 4 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 4 2))) (reaches 0 4 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 4 2)) (isGo (rule-target 4 2)))
        (not (reaches 0 (chain (rule-target 4 2)) (rule (rule-target 4 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 4 3) (terminating (rule-target 4 3))) 
        (and (not (reaches 0 4 (+ 3 1))) (= (terminates-with 0) (rule-target 4 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 4 3) (= (rule-target 4 3) RETURN))
        (and (reaches-return 0 4) (not (reaches 0 4 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 4 3) (isGo (rule-target 4 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 4 3)) (rule (rule-target 4 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 4 3))) (reaches 0 4 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 4 3)) (isGo (rule-target 4 3)))
        (not (reaches 0 (chain (rule-target 4 3)) (rule (rule-target 4 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 4 4) (terminating (rule-target 4 4))) 
        (and (not (reaches 0 4 (+ 4 1))) (= (terminates-with 0) (rule-target 4 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 4 4) (= (rule-target 4 4) RETURN))
        (and (reaches-return 0 4) (not (reaches 0 4 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 4 4) (isGo (rule-target 4 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 4 4)) (rule (rule-target 4 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 4 4))) (reaches 0 4 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 4 4)) (isGo (rule-target 4 4)))
        (not (reaches 0 (chain (rule-target 4 4)) (rule (rule-target 4 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 4 0) (terminating (rule-target 4 0))) 
        (and (not (reaches 1 4 (+ 0 1))) (= (terminates-with 1) (rule-target 4 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 4 0) (= (rule-target 4 0) RETURN))
        (and (reaches-return 1 4) (not (reaches 1 4 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 4 0) (isGo (rule-target 4 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 4 0)) (rule (rule-target 4 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 4 0))) (reaches 1 4 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 4 0)) (isGo (rule-target 4 0)))
        (not (reaches 1 (chain (rule-target 4 0)) (rule (rule-target 4 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 4 1) (terminating (rule-target 4 1))) 
        (and (not (reaches 1 4 (+ 1 1))) (= (terminates-with 1) (rule-target 4 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 4 1) (= (rule-target 4 1) RETURN))
        (and (reaches-return 1 4) (not (reaches 1 4 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 4 1) (isGo (rule-target 4 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 4 1)) (rule (rule-target 4 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 4 1))) (reaches 1 4 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 4 1)) (isGo (rule-target 4 1)))
        (not (reaches 1 (chain (rule-target 4 1)) (rule (rule-target 4 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 4 2) (terminating (rule-target 4 2))) 
        (and (not (reaches 1 4 (+ 2 1))) (= (terminates-with 1) (rule-target 4 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 4 2) (= (rule-target 4 2) RETURN))
        (and (reaches-return 1 4) (not (reaches 1 4 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 4 2) (isGo (rule-target 4 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 4 2)) (rule (rule-target 4 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 4 2))) (reaches 1 4 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 4 2)) (isGo (rule-target 4 2)))
        (not (reaches 1 (chain (rule-target 4 2)) (rule (rule-target 4 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 4 3) (terminating (rule-target 4 3))) 
        (and (not (reaches 1 4 (+ 3 1))) (= (terminates-with 1) (rule-target 4 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 4 3) (= (rule-target 4 3) RETURN))
        (and (reaches-return 1 4) (not (reaches 1 4 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 4 3) (isGo (rule-target 4 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 4 3)) (rule (rule-target 4 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 4 3))) (reaches 1 4 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 4 3)) (isGo (rule-target 4 3)))
        (not (reaches 1 (chain (rule-target 4 3)) (rule (rule-target 4 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 4 4) (terminating (rule-target 4 4))) 
        (and (not (reaches 1 4 (+ 4 1))) (= (terminates-with 1) (rule-target 4 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 4 4) (= (rule-target 4 4) RETURN))
        (and (reaches-return 1 4) (not (reaches 1 4 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 4 4) (isGo (rule-target 4 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 4 4)) (rule (rule-target 4 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 4 4))) (reaches 1 4 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 4 4)) (isGo (rule-target 4 4)))
        (not (reaches 1 (chain (rule-target 4 4)) (rule (rule-target 4 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 5 0) (terminating (rule-target 5 0))) 
        (and (not (reaches 0 5 (+ 0 1))) (= (terminates-with 0) (rule-target 5 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 5 0) (= (rule-target 5 0) RETURN))
        (and (reaches-return 0 5) (not (reaches 0 5 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 5 0) (isGo (rule-target 5 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 5 0)) (rule (rule-target 5 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 5 0))) (reaches 0 5 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 5 0)) (isGo (rule-target 5 0)))
        (not (reaches 0 (chain (rule-target 5 0)) (rule (rule-target 5 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 5 1) (terminating (rule-target 5 1))) 
        (and (not (reaches 0 5 (+ 1 1))) (= (terminates-with 0) (rule-target 5 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 5 1) (= (rule-target 5 1) RETURN))
        (and (reaches-return 0 5) (not (reaches 0 5 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 5 1) (isGo (rule-target 5 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 5 1)) (rule (rule-target 5 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 5 1))) (reaches 0 5 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 5 1)) (isGo (rule-target 5 1)))
        (not (reaches 0 (chain (rule-target 5 1)) (rule (rule-target 5 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 5 2) (terminating (rule-target 5 2))) 
        (and (not (reaches 0 5 (+ 2 1))) (= (terminates-with 0) (rule-target 5 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 5 2) (= (rule-target 5 2) RETURN))
        (and (reaches-return 0 5) (not (reaches 0 5 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 5 2) (isGo (rule-target 5 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 5 2)) (rule (rule-target 5 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 5 2))) (reaches 0 5 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 5 2)) (isGo (rule-target 5 2)))
        (not (reaches 0 (chain (rule-target 5 2)) (rule (rule-target 5 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 5 3) (terminating (rule-target 5 3))) 
        (and (not (reaches 0 5 (+ 3 1))) (= (terminates-with 0) (rule-target 5 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 5 3) (= (rule-target 5 3) RETURN))
        (and (reaches-return 0 5) (not (reaches 0 5 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 5 3) (isGo (rule-target 5 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 5 3)) (rule (rule-target 5 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 5 3))) (reaches 0 5 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 5 3)) (isGo (rule-target 5 3)))
        (not (reaches 0 (chain (rule-target 5 3)) (rule (rule-target 5 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 5 4) (terminating (rule-target 5 4))) 
        (and (not (reaches 0 5 (+ 4 1))) (= (terminates-with 0) (rule-target 5 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 5 4) (= (rule-target 5 4) RETURN))
        (and (reaches-return 0 5) (not (reaches 0 5 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 5 4) (isGo (rule-target 5 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 5 4)) (rule (rule-target 5 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 5 4))) (reaches 0 5 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 5 4)) (isGo (rule-target 5 4)))
        (not (reaches 0 (chain (rule-target 5 4)) (rule (rule-target 5 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 5 0) (terminating (rule-target 5 0))) 
        (and (not (reaches 1 5 (+ 0 1))) (= (terminates-with 1) (rule-target 5 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 5 0) (= (rule-target 5 0) RETURN))
        (and (reaches-return 1 5) (not (reaches 1 5 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 5 0) (isGo (rule-target 5 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 5 0)) (rule (rule-target 5 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 5 0))) (reaches 1 5 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 5 0)) (isGo (rule-target 5 0)))
        (not (reaches 1 (chain (rule-target 5 0)) (rule (rule-target 5 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 5 1) (terminating (rule-target 5 1))) 
        (and (not (reaches 1 5 (+ 1 1))) (= (terminates-with 1) (rule-target 5 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 5 1) (= (rule-target 5 1) RETURN))
        (and (reaches-return 1 5) (not (reaches 1 5 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 5 1) (isGo (rule-target 5 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 5 1)) (rule (rule-target 5 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 5 1))) (reaches 1 5 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 5 1)) (isGo (rule-target 5 1)))
        (not (reaches 1 (chain (rule-target 5 1)) (rule (rule-target 5 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 5 2) (terminating (rule-target 5 2))) 
        (and (not (reaches 1 5 (+ 2 1))) (= (terminates-with 1) (rule-target 5 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 5 2) (= (rule-target 5 2) RETURN))
        (and (reaches-return 1 5) (not (reaches 1 5 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 5 2) (isGo (rule-target 5 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 5 2)) (rule (rule-target 5 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 5 2))) (reaches 1 5 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 5 2)) (isGo (rule-target 5 2)))
        (not (reaches 1 (chain (rule-target 5 2)) (rule (rule-target 5 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 5 3) (terminating (rule-target 5 3))) 
        (and (not (reaches 1 5 (+ 3 1))) (= (terminates-with 1) (rule-target 5 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 5 3) (= (rule-target 5 3) RETURN))
        (and (reaches-return 1 5) (not (reaches 1 5 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 5 3) (isGo (rule-target 5 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 5 3)) (rule (rule-target 5 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 5 3))) (reaches 1 5 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 5 3)) (isGo (rule-target 5 3)))
        (not (reaches 1 (chain (rule-target 5 3)) (rule (rule-target 5 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 5 4) (terminating (rule-target 5 4))) 
        (and (not (reaches 1 5 (+ 4 1))) (= (terminates-with 1) (rule-target 5 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 5 4) (= (rule-target 5 4) RETURN))
        (and (reaches-return 1 5) (not (reaches 1 5 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 5 4) (isGo (rule-target 5 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 5 4)) (rule (rule-target 5 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 5 4))) (reaches 1 5 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 5 4)) (isGo (rule-target 5 4)))
        (not (reaches 1 (chain (rule-target 5 4)) (rule (rule-target 5 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 6 0) (terminating (rule-target 6 0))) 
        (and (not (reaches 0 6 (+ 0 1))) (= (terminates-with 0) (rule-target 6 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 6 0) (= (rule-target 6 0) RETURN))
        (and (reaches-return 0 6) (not (reaches 0 6 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 6 0) (isGo (rule-target 6 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 6 0)) (rule (rule-target 6 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 6 0))) (reaches 0 6 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 6 0)) (isGo (rule-target 6 0)))
        (not (reaches 0 (chain (rule-target 6 0)) (rule (rule-target 6 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 6 1) (terminating (rule-target 6 1))) 
        (and (not (reaches 0 6 (+ 1 1))) (= (terminates-with 0) (rule-target 6 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 6 1) (= (rule-target 6 1) RETURN))
        (and (reaches-return 0 6) (not (reaches 0 6 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 6 1) (isGo (rule-target 6 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 6 1)) (rule (rule-target 6 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 6 1))) (reaches 0 6 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 6 1)) (isGo (rule-target 6 1)))
        (not (reaches 0 (chain (rule-target 6 1)) (rule (rule-target 6 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 6 0) (terminating (rule-target 6 0))) 
        (and (not (reaches 1 6 (+ 0 1))) (= (terminates-with 1) (rule-target 6 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 6 0) (= (rule-target 6 0) RETURN))
        (and (reaches-return 1 6) (not (reaches 1 6 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 6 0) (isGo (rule-target 6 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 6 0)) (rule (rule-target 6 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 6 0))) (reaches 1 6 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 6 0)) (isGo (rule-target 6 0)))
        (not (reaches 1 (chain (rule-target 6 0)) (rule (rule-target 6 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 6 1) (terminating (rule-target 6 1))) 
        (and (not (reaches 1 6 (+ 1 1))) (= (terminates-with 1) (rule-target 6 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 6 1) (= (rule-target 6 1) RETURN))
        (and (reaches-return 1 6) (not (reaches 1 6 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 6 1) (isGo (rule-target 6 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 6 1)) (rule (rule-target 6 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 6 1))) (reaches 1 6 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 6 1)) (isGo (rule-target 6 1)))
        (not (reaches 1 (chain (rule-target 6 1)) (rule (rule-target 6 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 7 0) (terminating (rule-target 7 0))) 
        (and (not (reaches 0 7 (+ 0 1))) (= (terminates-with 0) (rule-target 7 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 7 0) (= (rule-target 7 0) RETURN))
        (and (reaches-return 0 7) (not (reaches 0 7 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 7 0) (isGo (rule-target 7 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 7 0)) (rule (rule-target 7 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 7 0))) (reaches 0 7 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 7 0)) (isGo (rule-target 7 0)))
        (not (reaches 0 (chain (rule-target 7 0)) (rule (rule-target 7 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 7 1) (terminating (rule-target 7 1))) 
        (and (not (reaches 0 7 (+ 1 1))) (= (terminates-with 0) (rule-target 7 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 7 1) (= (rule-target 7 1) RETURN))
        (and (reaches-return 0 7) (not (reaches 0 7 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 7 1) (isGo (rule-target 7 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 7 1)) (rule (rule-target 7 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 7 1))) (reaches 0 7 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 7 1)) (isGo (rule-target 7 1)))
        (not (reaches 0 (chain (rule-target 7 1)) (rule (rule-target 7 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 7 2) (terminating (rule-target 7 2))) 
        (and (not (reaches 0 7 (+ 2 1))) (= (terminates-with 0) (rule-target 7 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 7 2) (= (rule-target 7 2) RETURN))
        (and (reaches-return 0 7) (not (reaches 0 7 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 7 2) (isGo (rule-target 7 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 7 2)) (rule (rule-target 7 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 7 2))) (reaches 0 7 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 7 2)) (isGo (rule-target 7 2)))
        (not (reaches 0 (chain (rule-target 7 2)) (rule (rule-target 7 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 7 3) (terminating (rule-target 7 3))) 
        (and (not (reaches 0 7 (+ 3 1))) (= (terminates-with 0) (rule-target 7 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 7 3) (= (rule-target 7 3) RETURN))
        (and (reaches-return 0 7) (not (reaches 0 7 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 7 3) (isGo (rule-target 7 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 7 3)) (rule (rule-target 7 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 7 3))) (reaches 0 7 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 7 3)) (isGo (rule-target 7 3)))
        (not (reaches 0 (chain (rule-target 7 3)) (rule (rule-target 7 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 7 0) (terminating (rule-target 7 0))) 
        (and (not (reaches 1 7 (+ 0 1))) (= (terminates-with 1) (rule-target 7 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 7 0) (= (rule-target 7 0) RETURN))
        (and (reaches-return 1 7) (not (reaches 1 7 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 7 0) (isGo (rule-target 7 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 7 0)) (rule (rule-target 7 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 7 0))) (reaches 1 7 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 7 0)) (isGo (rule-target 7 0)))
        (not (reaches 1 (chain (rule-target 7 0)) (rule (rule-target 7 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 7 1) (terminating (rule-target 7 1))) 
        (and (not (reaches 1 7 (+ 1 1))) (= (terminates-with 1) (rule-target 7 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 7 1) (= (rule-target 7 1) RETURN))
        (and (reaches-return 1 7) (not (reaches 1 7 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 7 1) (isGo (rule-target 7 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 7 1)) (rule (rule-target 7 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 7 1))) (reaches 1 7 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 7 1)) (isGo (rule-target 7 1)))
        (not (reaches 1 (chain (rule-target 7 1)) (rule (rule-target 7 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 7 2) (terminating (rule-target 7 2))) 
        (and (not (reaches 1 7 (+ 2 1))) (= (terminates-with 1) (rule-target 7 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 7 2) (= (rule-target 7 2) RETURN))
        (and (reaches-return 1 7) (not (reaches 1 7 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 7 2) (isGo (rule-target 7 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 7 2)) (rule (rule-target 7 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 7 2))) (reaches 1 7 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 7 2)) (isGo (rule-target 7 2)))
        (not (reaches 1 (chain (rule-target 7 2)) (rule (rule-target 7 2))))
    )
)(assert (=> 
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

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 7 3) (terminating (rule-target 7 3))) 
        (and (not (reaches 1 7 (+ 3 1))) (= (terminates-with 1) (rule-target 7 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 7 3) (= (rule-target 7 3) RETURN))
        (and (reaches-return 1 7) (not (reaches 1 7 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 7 3) (isGo (rule-target 7 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 7 3)) (rule (rule-target 7 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 7 3))) (reaches 1 7 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 7 3)) (isGo (rule-target 7 3)))
        (not (reaches 1 (chain (rule-target 7 3)) (rule (rule-target 7 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 8 0) (terminating (rule-target 8 0))) 
        (and (not (reaches 0 8 (+ 0 1))) (= (terminates-with 0) (rule-target 8 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 8 0) (= (rule-target 8 0) RETURN))
        (and (reaches-return 0 8) (not (reaches 0 8 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 8 0) (isGo (rule-target 8 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 8 0)) (rule (rule-target 8 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 8 0))) (reaches 0 8 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 8 0)) (isGo (rule-target 8 0)))
        (not (reaches 0 (chain (rule-target 8 0)) (rule (rule-target 8 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 8 1) (terminating (rule-target 8 1))) 
        (and (not (reaches 0 8 (+ 1 1))) (= (terminates-with 0) (rule-target 8 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 8 1) (= (rule-target 8 1) RETURN))
        (and (reaches-return 0 8) (not (reaches 0 8 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 8 1) (isGo (rule-target 8 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 8 1)) (rule (rule-target 8 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 8 1))) (reaches 0 8 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 8 1)) (isGo (rule-target 8 1)))
        (not (reaches 0 (chain (rule-target 8 1)) (rule (rule-target 8 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 8 0) (terminating (rule-target 8 0))) 
        (and (not (reaches 1 8 (+ 0 1))) (= (terminates-with 1) (rule-target 8 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 8 0) (= (rule-target 8 0) RETURN))
        (and (reaches-return 1 8) (not (reaches 1 8 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 8 0) (isGo (rule-target 8 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 8 0)) (rule (rule-target 8 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 8 0))) (reaches 1 8 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 8 0)) (isGo (rule-target 8 0)))
        (not (reaches 1 (chain (rule-target 8 0)) (rule (rule-target 8 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 8 1) (terminating (rule-target 8 1))) 
        (and (not (reaches 1 8 (+ 1 1))) (= (terminates-with 1) (rule-target 8 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 8 1) (= (rule-target 8 1) RETURN))
        (and (reaches-return 1 8) (not (reaches 1 8 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 8 1) (isGo (rule-target 8 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 8 1)) (rule (rule-target 8 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 8 1))) (reaches 1 8 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 8 1)) (isGo (rule-target 8 1)))
        (not (reaches 1 (chain (rule-target 8 1)) (rule (rule-target 8 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 9 0) (terminating (rule-target 9 0))) 
        (and (not (reaches 0 9 (+ 0 1))) (= (terminates-with 0) (rule-target 9 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 9 0) (= (rule-target 9 0) RETURN))
        (and (reaches-return 0 9) (not (reaches 0 9 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 9 0) (isGo (rule-target 9 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 9 0)) (rule (rule-target 9 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 9 0))) (reaches 0 9 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 9 0)) (isGo (rule-target 9 0)))
        (not (reaches 0 (chain (rule-target 9 0)) (rule (rule-target 9 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 9 1) (terminating (rule-target 9 1))) 
        (and (not (reaches 0 9 (+ 1 1))) (= (terminates-with 0) (rule-target 9 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 9 1) (= (rule-target 9 1) RETURN))
        (and (reaches-return 0 9) (not (reaches 0 9 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 9 1) (isGo (rule-target 9 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 9 1)) (rule (rule-target 9 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 9 1))) (reaches 0 9 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 9 1)) (isGo (rule-target 9 1)))
        (not (reaches 0 (chain (rule-target 9 1)) (rule (rule-target 9 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 9 2) (terminating (rule-target 9 2))) 
        (and (not (reaches 0 9 (+ 2 1))) (= (terminates-with 0) (rule-target 9 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 9 2) (= (rule-target 9 2) RETURN))
        (and (reaches-return 0 9) (not (reaches 0 9 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 9 2) (isGo (rule-target 9 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 9 2)) (rule (rule-target 9 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 9 2))) (reaches 0 9 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 9 2)) (isGo (rule-target 9 2)))
        (not (reaches 0 (chain (rule-target 9 2)) (rule (rule-target 9 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 9 3) (terminating (rule-target 9 3))) 
        (and (not (reaches 0 9 (+ 3 1))) (= (terminates-with 0) (rule-target 9 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 9 3) (= (rule-target 9 3) RETURN))
        (and (reaches-return 0 9) (not (reaches 0 9 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 9 3) (isGo (rule-target 9 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 9 3)) (rule (rule-target 9 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 9 3))) (reaches 0 9 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 9 3)) (isGo (rule-target 9 3)))
        (not (reaches 0 (chain (rule-target 9 3)) (rule (rule-target 9 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 9 4) (terminating (rule-target 9 4))) 
        (and (not (reaches 0 9 (+ 4 1))) (= (terminates-with 0) (rule-target 9 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 9 4) (= (rule-target 9 4) RETURN))
        (and (reaches-return 0 9) (not (reaches 0 9 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 9 4) (isGo (rule-target 9 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 9 4)) (rule (rule-target 9 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 9 4))) (reaches 0 9 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 9 4)) (isGo (rule-target 9 4)))
        (not (reaches 0 (chain (rule-target 9 4)) (rule (rule-target 9 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 9 0) (terminating (rule-target 9 0))) 
        (and (not (reaches 1 9 (+ 0 1))) (= (terminates-with 1) (rule-target 9 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 9 0) (= (rule-target 9 0) RETURN))
        (and (reaches-return 1 9) (not (reaches 1 9 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 9 0) (isGo (rule-target 9 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 9 0)) (rule (rule-target 9 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 9 0))) (reaches 1 9 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 9 0)) (isGo (rule-target 9 0)))
        (not (reaches 1 (chain (rule-target 9 0)) (rule (rule-target 9 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 9 1) (terminating (rule-target 9 1))) 
        (and (not (reaches 1 9 (+ 1 1))) (= (terminates-with 1) (rule-target 9 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 9 1) (= (rule-target 9 1) RETURN))
        (and (reaches-return 1 9) (not (reaches 1 9 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 9 1) (isGo (rule-target 9 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 9 1)) (rule (rule-target 9 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 9 1))) (reaches 1 9 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 9 1)) (isGo (rule-target 9 1)))
        (not (reaches 1 (chain (rule-target 9 1)) (rule (rule-target 9 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 9 2) (terminating (rule-target 9 2))) 
        (and (not (reaches 1 9 (+ 2 1))) (= (terminates-with 1) (rule-target 9 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 9 2) (= (rule-target 9 2) RETURN))
        (and (reaches-return 1 9) (not (reaches 1 9 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 9 2) (isGo (rule-target 9 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 9 2)) (rule (rule-target 9 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 9 2))) (reaches 1 9 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 9 2)) (isGo (rule-target 9 2)))
        (not (reaches 1 (chain (rule-target 9 2)) (rule (rule-target 9 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 9 3) (terminating (rule-target 9 3))) 
        (and (not (reaches 1 9 (+ 3 1))) (= (terminates-with 1) (rule-target 9 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 9 3) (= (rule-target 9 3) RETURN))
        (and (reaches-return 1 9) (not (reaches 1 9 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 9 3) (isGo (rule-target 9 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 9 3)) (rule (rule-target 9 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 9 3))) (reaches 1 9 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 9 3)) (isGo (rule-target 9 3)))
        (not (reaches 1 (chain (rule-target 9 3)) (rule (rule-target 9 3))))
    )
)(assert (=> 
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

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 9 4) (terminating (rule-target 9 4))) 
        (and (not (reaches 1 9 (+ 4 1))) (= (terminates-with 1) (rule-target 9 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 9 4) (= (rule-target 9 4) RETURN))
        (and (reaches-return 1 9) (not (reaches 1 9 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 9 4) (isGo (rule-target 9 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 9 4)) (rule (rule-target 9 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 9 4))) (reaches 1 9 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 9 4)) (isGo (rule-target 9 4)))
        (not (reaches 1 (chain (rule-target 9 4)) (rule (rule-target 9 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 10 0) (terminating (rule-target 10 0))) 
        (and (not (reaches 0 10 (+ 0 1))) (= (terminates-with 0) (rule-target 10 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 10 0) (= (rule-target 10 0) RETURN))
        (and (reaches-return 0 10) (not (reaches 0 10 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 10 0) (isGo (rule-target 10 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 10 0)) (rule (rule-target 10 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 10 0))) (reaches 0 10 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 10 0)) (isGo (rule-target 10 0)))
        (not (reaches 0 (chain (rule-target 10 0)) (rule (rule-target 10 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 10 0) (terminating (rule-target 10 0))) 
        (and (not (reaches 1 10 (+ 0 1))) (= (terminates-with 1) (rule-target 10 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 10 0) (= (rule-target 10 0) RETURN))
        (and (reaches-return 1 10) (not (reaches 1 10 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 10 0) (isGo (rule-target 10 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 10 0)) (rule (rule-target 10 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 10 0))) (reaches 1 10 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 10 0)) (isGo (rule-target 10 0)))
        (not (reaches 1 (chain (rule-target 10 0)) (rule (rule-target 10 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 0) (terminating (rule-target 11 0))) 
        (and (not (reaches 0 11 (+ 0 1))) (= (terminates-with 0) (rule-target 11 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 0) (= (rule-target 11 0) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 0) (isGo (rule-target 11 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 0)) (rule (rule-target 11 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 0))) (reaches 0 11 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 0)) (isGo (rule-target 11 0)))
        (not (reaches 0 (chain (rule-target 11 0)) (rule (rule-target 11 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 1) (terminating (rule-target 11 1))) 
        (and (not (reaches 0 11 (+ 1 1))) (= (terminates-with 0) (rule-target 11 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 1) (= (rule-target 11 1) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 1) (isGo (rule-target 11 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 1)) (rule (rule-target 11 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 1))) (reaches 0 11 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 1)) (isGo (rule-target 11 1)))
        (not (reaches 0 (chain (rule-target 11 1)) (rule (rule-target 11 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 2) (terminating (rule-target 11 2))) 
        (and (not (reaches 0 11 (+ 2 1))) (= (terminates-with 0) (rule-target 11 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 2) (= (rule-target 11 2) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 2) (isGo (rule-target 11 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 2)) (rule (rule-target 11 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 2))) (reaches 0 11 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 2)) (isGo (rule-target 11 2)))
        (not (reaches 0 (chain (rule-target 11 2)) (rule (rule-target 11 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 3) (terminating (rule-target 11 3))) 
        (and (not (reaches 0 11 (+ 3 1))) (= (terminates-with 0) (rule-target 11 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 3) (= (rule-target 11 3) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 3) (isGo (rule-target 11 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 3)) (rule (rule-target 11 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 3))) (reaches 0 11 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 3)) (isGo (rule-target 11 3)))
        (not (reaches 0 (chain (rule-target 11 3)) (rule (rule-target 11 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 0 11 4))
    (reaches 0 11 (- 4 1))
))

(assert (=> 
    (and (reaches 0 11 4) (not (matches-criteria 0 11 4))) 
    (reaches 0 11 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 11 4) (= (rule-target 11 4) NONE)) 
    (reaches 0 11 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 4) (terminating (rule-target 11 4))) 
        (and (not (reaches 0 11 (+ 4 1))) (= (terminates-with 0) (rule-target 11 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 4) (= (rule-target 11 4) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 4) (isGo (rule-target 11 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 4)) (rule (rule-target 11 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 4))) (reaches 0 11 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 4)) (isGo (rule-target 11 4)))
        (not (reaches 0 (chain (rule-target 11 4)) (rule (rule-target 11 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 0 11 5))
    (reaches 0 11 (- 5 1))
))

(assert (=> 
    (and (reaches 0 11 5) (not (matches-criteria 0 11 5))) 
    (reaches 0 11 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 11 5) (= (rule-target 11 5) NONE)) 
    (reaches 0 11 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 5) (terminating (rule-target 11 5))) 
        (and (not (reaches 0 11 (+ 5 1))) (= (terminates-with 0) (rule-target 11 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 5) (= (rule-target 11 5) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 5) (isGo (rule-target 11 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 5)) (rule (rule-target 11 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 5))) (reaches 0 11 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 5)) (isGo (rule-target 11 5)))
        (not (reaches 0 (chain (rule-target 11 5)) (rule (rule-target 11 5))))
    )
)(assert (=> 
    (and (<= 1 6) (reaches 0 11 6))
    (reaches 0 11 (- 6 1))
))

(assert (=> 
    (and (reaches 0 11 6) (not (matches-criteria 0 11 6))) 
    (reaches 0 11 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 11 6) (= (rule-target 11 6) NONE)) 
    (reaches 0 11 (+ 6 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 6) (terminating (rule-target 11 6))) 
        (and (not (reaches 0 11 (+ 6 1))) (= (terminates-with 0) (rule-target 11 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 6) (= (rule-target 11 6) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 6) (isGo (rule-target 11 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 6)) (rule (rule-target 11 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 6))) (reaches 0 11 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 6)) (isGo (rule-target 11 6)))
        (not (reaches 0 (chain (rule-target 11 6)) (rule (rule-target 11 6))))
    )
)(assert (=> 
    (and (<= 1 7) (reaches 0 11 7))
    (reaches 0 11 (- 7 1))
))

(assert (=> 
    (and (reaches 0 11 7) (not (matches-criteria 0 11 7))) 
    (reaches 0 11 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 11 7) (= (rule-target 11 7) NONE)) 
    (reaches 0 11 (+ 7 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 7) (terminating (rule-target 11 7))) 
        (and (not (reaches 0 11 (+ 7 1))) (= (terminates-with 0) (rule-target 11 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 7) (= (rule-target 11 7) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 7) (isGo (rule-target 11 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 7)) (rule (rule-target 11 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 7))) (reaches 0 11 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 7)) (isGo (rule-target 11 7)))
        (not (reaches 0 (chain (rule-target 11 7)) (rule (rule-target 11 7))))
    )
)(assert (=> 
    (and (<= 1 8) (reaches 0 11 8))
    (reaches 0 11 (- 8 1))
))

(assert (=> 
    (and (reaches 0 11 8) (not (matches-criteria 0 11 8))) 
    (reaches 0 11 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 11 8) (= (rule-target 11 8) NONE)) 
    (reaches 0 11 (+ 8 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 8) (terminating (rule-target 11 8))) 
        (and (not (reaches 0 11 (+ 8 1))) (= (terminates-with 0) (rule-target 11 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 8) (= (rule-target 11 8) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 8) (isGo (rule-target 11 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 8)) (rule (rule-target 11 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 8))) (reaches 0 11 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 8)) (isGo (rule-target 11 8)))
        (not (reaches 0 (chain (rule-target 11 8)) (rule (rule-target 11 8))))
    )
)(assert (=> 
    (and (<= 1 9) (reaches 0 11 9))
    (reaches 0 11 (- 9 1))
))

(assert (=> 
    (and (reaches 0 11 9) (not (matches-criteria 0 11 9))) 
    (reaches 0 11 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 11 9) (= (rule-target 11 9) NONE)) 
    (reaches 0 11 (+ 9 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 9) (terminating (rule-target 11 9))) 
        (and (not (reaches 0 11 (+ 9 1))) (= (terminates-with 0) (rule-target 11 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 9) (= (rule-target 11 9) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 9) (isGo (rule-target 11 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 9)) (rule (rule-target 11 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 9))) (reaches 0 11 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 9)) (isGo (rule-target 11 9)))
        (not (reaches 0 (chain (rule-target 11 9)) (rule (rule-target 11 9))))
    )
)(assert (=> 
    (and (<= 1 10) (reaches 0 11 10))
    (reaches 0 11 (- 10 1))
))

(assert (=> 
    (and (reaches 0 11 10) (not (matches-criteria 0 11 10))) 
    (reaches 0 11 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 11 10) (= (rule-target 11 10) NONE)) 
    (reaches 0 11 (+ 10 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 10) (terminating (rule-target 11 10))) 
        (and (not (reaches 0 11 (+ 10 1))) (= (terminates-with 0) (rule-target 11 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 10) (= (rule-target 11 10) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 10) (isGo (rule-target 11 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 10)) (rule (rule-target 11 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 10))) (reaches 0 11 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 10)) (isGo (rule-target 11 10)))
        (not (reaches 0 (chain (rule-target 11 10)) (rule (rule-target 11 10))))
    )
)(assert (=> 
    (and (<= 1 11) (reaches 0 11 11))
    (reaches 0 11 (- 11 1))
))

(assert (=> 
    (and (reaches 0 11 11) (not (matches-criteria 0 11 11))) 
    (reaches 0 11 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 11 11) (= (rule-target 11 11) NONE)) 
    (reaches 0 11 (+ 11 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 11 11) (terminating (rule-target 11 11))) 
        (and (not (reaches 0 11 (+ 11 1))) (= (terminates-with 0) (rule-target 11 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 11 11) (= (rule-target 11 11) RETURN))
        (and (reaches-return 0 11) (not (reaches 0 11 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 11 11) (isGo (rule-target 11 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 11 11)) (rule (rule-target 11 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 11 11))) (reaches 0 11 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 11 11)) (isGo (rule-target 11 11)))
        (not (reaches 0 (chain (rule-target 11 11)) (rule (rule-target 11 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 0) (terminating (rule-target 11 0))) 
        (and (not (reaches 1 11 (+ 0 1))) (= (terminates-with 1) (rule-target 11 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 0) (= (rule-target 11 0) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 0) (isGo (rule-target 11 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 0)) (rule (rule-target 11 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 0))) (reaches 1 11 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 0)) (isGo (rule-target 11 0)))
        (not (reaches 1 (chain (rule-target 11 0)) (rule (rule-target 11 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 1) (terminating (rule-target 11 1))) 
        (and (not (reaches 1 11 (+ 1 1))) (= (terminates-with 1) (rule-target 11 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 1) (= (rule-target 11 1) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 1) (isGo (rule-target 11 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 1)) (rule (rule-target 11 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 1))) (reaches 1 11 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 1)) (isGo (rule-target 11 1)))
        (not (reaches 1 (chain (rule-target 11 1)) (rule (rule-target 11 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 2) (terminating (rule-target 11 2))) 
        (and (not (reaches 1 11 (+ 2 1))) (= (terminates-with 1) (rule-target 11 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 2) (= (rule-target 11 2) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 2) (isGo (rule-target 11 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 2)) (rule (rule-target 11 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 2))) (reaches 1 11 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 2)) (isGo (rule-target 11 2)))
        (not (reaches 1 (chain (rule-target 11 2)) (rule (rule-target 11 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 3) (terminating (rule-target 11 3))) 
        (and (not (reaches 1 11 (+ 3 1))) (= (terminates-with 1) (rule-target 11 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 3) (= (rule-target 11 3) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 3) (isGo (rule-target 11 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 3)) (rule (rule-target 11 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 3))) (reaches 1 11 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 3)) (isGo (rule-target 11 3)))
        (not (reaches 1 (chain (rule-target 11 3)) (rule (rule-target 11 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 1 11 4))
    (reaches 1 11 (- 4 1))
))

(assert (=> 
    (and (reaches 1 11 4) (not (matches-criteria 1 11 4))) 
    (reaches 1 11 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 11 4) (= (rule-target 11 4) NONE)) 
    (reaches 1 11 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 4) (terminating (rule-target 11 4))) 
        (and (not (reaches 1 11 (+ 4 1))) (= (terminates-with 1) (rule-target 11 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 4) (= (rule-target 11 4) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 4) (isGo (rule-target 11 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 4)) (rule (rule-target 11 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 4))) (reaches 1 11 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 4)) (isGo (rule-target 11 4)))
        (not (reaches 1 (chain (rule-target 11 4)) (rule (rule-target 11 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 1 11 5))
    (reaches 1 11 (- 5 1))
))

(assert (=> 
    (and (reaches 1 11 5) (not (matches-criteria 1 11 5))) 
    (reaches 1 11 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 11 5) (= (rule-target 11 5) NONE)) 
    (reaches 1 11 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 5) (terminating (rule-target 11 5))) 
        (and (not (reaches 1 11 (+ 5 1))) (= (terminates-with 1) (rule-target 11 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 5) (= (rule-target 11 5) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 5) (isGo (rule-target 11 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 5)) (rule (rule-target 11 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 5))) (reaches 1 11 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 5)) (isGo (rule-target 11 5)))
        (not (reaches 1 (chain (rule-target 11 5)) (rule (rule-target 11 5))))
    )
)(assert (=> 
    (and (<= 1 6) (reaches 1 11 6))
    (reaches 1 11 (- 6 1))
))

(assert (=> 
    (and (reaches 1 11 6) (not (matches-criteria 1 11 6))) 
    (reaches 1 11 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 11 6) (= (rule-target 11 6) NONE)) 
    (reaches 1 11 (+ 6 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 6) (terminating (rule-target 11 6))) 
        (and (not (reaches 1 11 (+ 6 1))) (= (terminates-with 1) (rule-target 11 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 6) (= (rule-target 11 6) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 6) (isGo (rule-target 11 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 6)) (rule (rule-target 11 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 6))) (reaches 1 11 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 6)) (isGo (rule-target 11 6)))
        (not (reaches 1 (chain (rule-target 11 6)) (rule (rule-target 11 6))))
    )
)(assert (=> 
    (and (<= 1 7) (reaches 1 11 7))
    (reaches 1 11 (- 7 1))
))

(assert (=> 
    (and (reaches 1 11 7) (not (matches-criteria 1 11 7))) 
    (reaches 1 11 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 11 7) (= (rule-target 11 7) NONE)) 
    (reaches 1 11 (+ 7 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 7) (terminating (rule-target 11 7))) 
        (and (not (reaches 1 11 (+ 7 1))) (= (terminates-with 1) (rule-target 11 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 7) (= (rule-target 11 7) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 7) (isGo (rule-target 11 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 7)) (rule (rule-target 11 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 7))) (reaches 1 11 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 7)) (isGo (rule-target 11 7)))
        (not (reaches 1 (chain (rule-target 11 7)) (rule (rule-target 11 7))))
    )
)(assert (=> 
    (and (<= 1 8) (reaches 1 11 8))
    (reaches 1 11 (- 8 1))
))

(assert (=> 
    (and (reaches 1 11 8) (not (matches-criteria 1 11 8))) 
    (reaches 1 11 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 11 8) (= (rule-target 11 8) NONE)) 
    (reaches 1 11 (+ 8 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 8) (terminating (rule-target 11 8))) 
        (and (not (reaches 1 11 (+ 8 1))) (= (terminates-with 1) (rule-target 11 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 8) (= (rule-target 11 8) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 8) (isGo (rule-target 11 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 8)) (rule (rule-target 11 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 8))) (reaches 1 11 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 8)) (isGo (rule-target 11 8)))
        (not (reaches 1 (chain (rule-target 11 8)) (rule (rule-target 11 8))))
    )
)(assert (=> 
    (and (<= 1 9) (reaches 1 11 9))
    (reaches 1 11 (- 9 1))
))

(assert (=> 
    (and (reaches 1 11 9) (not (matches-criteria 1 11 9))) 
    (reaches 1 11 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 11 9) (= (rule-target 11 9) NONE)) 
    (reaches 1 11 (+ 9 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 9) (terminating (rule-target 11 9))) 
        (and (not (reaches 1 11 (+ 9 1))) (= (terminates-with 1) (rule-target 11 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 9) (= (rule-target 11 9) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 9) (isGo (rule-target 11 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 9)) (rule (rule-target 11 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 9))) (reaches 1 11 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 9)) (isGo (rule-target 11 9)))
        (not (reaches 1 (chain (rule-target 11 9)) (rule (rule-target 11 9))))
    )
)(assert (=> 
    (and (<= 1 10) (reaches 1 11 10))
    (reaches 1 11 (- 10 1))
))

(assert (=> 
    (and (reaches 1 11 10) (not (matches-criteria 1 11 10))) 
    (reaches 1 11 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 11 10) (= (rule-target 11 10) NONE)) 
    (reaches 1 11 (+ 10 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 10) (terminating (rule-target 11 10))) 
        (and (not (reaches 1 11 (+ 10 1))) (= (terminates-with 1) (rule-target 11 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 10) (= (rule-target 11 10) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 10) (isGo (rule-target 11 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 10)) (rule (rule-target 11 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 10))) (reaches 1 11 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 10)) (isGo (rule-target 11 10)))
        (not (reaches 1 (chain (rule-target 11 10)) (rule (rule-target 11 10))))
    )
)(assert (=> 
    (and (<= 1 11) (reaches 1 11 11))
    (reaches 1 11 (- 11 1))
))

(assert (=> 
    (and (reaches 1 11 11) (not (matches-criteria 1 11 11))) 
    (reaches 1 11 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 11 11) (= (rule-target 11 11) NONE)) 
    (reaches 1 11 (+ 11 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 11 11) (terminating (rule-target 11 11))) 
        (and (not (reaches 1 11 (+ 11 1))) (= (terminates-with 1) (rule-target 11 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 11 11) (= (rule-target 11 11) RETURN))
        (and (reaches-return 1 11) (not (reaches 1 11 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 11 11) (isGo (rule-target 11 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 11 11)) (rule (rule-target 11 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 11 11))) (reaches 1 11 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 11 11)) (isGo (rule-target 11 11)))
        (not (reaches 1 (chain (rule-target 11 11)) (rule (rule-target 11 11))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 0) (terminating (rule-target 12 0))) 
        (and (not (reaches 0 12 (+ 0 1))) (= (terminates-with 0) (rule-target 12 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 0) (= (rule-target 12 0) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 0) (isGo (rule-target 12 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 0)) (rule (rule-target 12 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 0))) (reaches 0 12 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 0)) (isGo (rule-target 12 0)))
        (not (reaches 0 (chain (rule-target 12 0)) (rule (rule-target 12 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 1) (terminating (rule-target 12 1))) 
        (and (not (reaches 0 12 (+ 1 1))) (= (terminates-with 0) (rule-target 12 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 1) (= (rule-target 12 1) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 1) (isGo (rule-target 12 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 1)) (rule (rule-target 12 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 1))) (reaches 0 12 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 1)) (isGo (rule-target 12 1)))
        (not (reaches 0 (chain (rule-target 12 1)) (rule (rule-target 12 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 2) (terminating (rule-target 12 2))) 
        (and (not (reaches 0 12 (+ 2 1))) (= (terminates-with 0) (rule-target 12 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 2) (= (rule-target 12 2) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 2) (isGo (rule-target 12 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 2)) (rule (rule-target 12 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 2))) (reaches 0 12 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 2)) (isGo (rule-target 12 2)))
        (not (reaches 0 (chain (rule-target 12 2)) (rule (rule-target 12 2))))
    )
)(assert (=> 
    (and (<= 1 3) (reaches 0 12 3))
    (reaches 0 12 (- 3 1))
))

(assert (=> 
    (and (reaches 0 12 3) (not (matches-criteria 0 12 3))) 
    (reaches 0 12 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 12 3) (= (rule-target 12 3) NONE)) 
    (reaches 0 12 (+ 3 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 3) (terminating (rule-target 12 3))) 
        (and (not (reaches 0 12 (+ 3 1))) (= (terminates-with 0) (rule-target 12 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 3) (= (rule-target 12 3) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 3) (isGo (rule-target 12 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 3)) (rule (rule-target 12 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 3))) (reaches 0 12 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 3)) (isGo (rule-target 12 3)))
        (not (reaches 0 (chain (rule-target 12 3)) (rule (rule-target 12 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 0 12 4))
    (reaches 0 12 (- 4 1))
))

(assert (=> 
    (and (reaches 0 12 4) (not (matches-criteria 0 12 4))) 
    (reaches 0 12 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 12 4) (= (rule-target 12 4) NONE)) 
    (reaches 0 12 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 4) (terminating (rule-target 12 4))) 
        (and (not (reaches 0 12 (+ 4 1))) (= (terminates-with 0) (rule-target 12 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 4) (= (rule-target 12 4) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 4) (isGo (rule-target 12 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 4)) (rule (rule-target 12 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 4))) (reaches 0 12 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 4)) (isGo (rule-target 12 4)))
        (not (reaches 0 (chain (rule-target 12 4)) (rule (rule-target 12 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 0 12 5))
    (reaches 0 12 (- 5 1))
))

(assert (=> 
    (and (reaches 0 12 5) (not (matches-criteria 0 12 5))) 
    (reaches 0 12 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 12 5) (= (rule-target 12 5) NONE)) 
    (reaches 0 12 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 5) (terminating (rule-target 12 5))) 
        (and (not (reaches 0 12 (+ 5 1))) (= (terminates-with 0) (rule-target 12 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 5) (= (rule-target 12 5) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 5) (isGo (rule-target 12 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 5)) (rule (rule-target 12 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 5))) (reaches 0 12 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 5)) (isGo (rule-target 12 5)))
        (not (reaches 0 (chain (rule-target 12 5)) (rule (rule-target 12 5))))
    )
)(assert (=> 
    (and (<= 1 6) (reaches 0 12 6))
    (reaches 0 12 (- 6 1))
))

(assert (=> 
    (and (reaches 0 12 6) (not (matches-criteria 0 12 6))) 
    (reaches 0 12 (+ 6 1))
))

(assert (=> 
   (and (reaches 0 12 6) (= (rule-target 12 6) NONE)) 
    (reaches 0 12 (+ 6 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 6) (terminating (rule-target 12 6))) 
        (and (not (reaches 0 12 (+ 6 1))) (= (terminates-with 0) (rule-target 12 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 6) (= (rule-target 12 6) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 6) (isGo (rule-target 12 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 6)) (rule (rule-target 12 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 6))) (reaches 0 12 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 6)) (isGo (rule-target 12 6)))
        (not (reaches 0 (chain (rule-target 12 6)) (rule (rule-target 12 6))))
    )
)(assert (=> 
    (and (<= 1 7) (reaches 0 12 7))
    (reaches 0 12 (- 7 1))
))

(assert (=> 
    (and (reaches 0 12 7) (not (matches-criteria 0 12 7))) 
    (reaches 0 12 (+ 7 1))
))

(assert (=> 
   (and (reaches 0 12 7) (= (rule-target 12 7) NONE)) 
    (reaches 0 12 (+ 7 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 7) (terminating (rule-target 12 7))) 
        (and (not (reaches 0 12 (+ 7 1))) (= (terminates-with 0) (rule-target 12 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 7) (= (rule-target 12 7) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 7) (isGo (rule-target 12 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 7)) (rule (rule-target 12 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 7))) (reaches 0 12 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 7)) (isGo (rule-target 12 7)))
        (not (reaches 0 (chain (rule-target 12 7)) (rule (rule-target 12 7))))
    )
)(assert (=> 
    (and (<= 1 8) (reaches 0 12 8))
    (reaches 0 12 (- 8 1))
))

(assert (=> 
    (and (reaches 0 12 8) (not (matches-criteria 0 12 8))) 
    (reaches 0 12 (+ 8 1))
))

(assert (=> 
   (and (reaches 0 12 8) (= (rule-target 12 8) NONE)) 
    (reaches 0 12 (+ 8 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 8) (terminating (rule-target 12 8))) 
        (and (not (reaches 0 12 (+ 8 1))) (= (terminates-with 0) (rule-target 12 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 8) (= (rule-target 12 8) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 8) (isGo (rule-target 12 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 8)) (rule (rule-target 12 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 8))) (reaches 0 12 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 8)) (isGo (rule-target 12 8)))
        (not (reaches 0 (chain (rule-target 12 8)) (rule (rule-target 12 8))))
    )
)(assert (=> 
    (and (<= 1 9) (reaches 0 12 9))
    (reaches 0 12 (- 9 1))
))

(assert (=> 
    (and (reaches 0 12 9) (not (matches-criteria 0 12 9))) 
    (reaches 0 12 (+ 9 1))
))

(assert (=> 
   (and (reaches 0 12 9) (= (rule-target 12 9) NONE)) 
    (reaches 0 12 (+ 9 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 9) (terminating (rule-target 12 9))) 
        (and (not (reaches 0 12 (+ 9 1))) (= (terminates-with 0) (rule-target 12 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 9) (= (rule-target 12 9) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 9) (isGo (rule-target 12 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 9)) (rule (rule-target 12 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 9))) (reaches 0 12 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 9)) (isGo (rule-target 12 9)))
        (not (reaches 0 (chain (rule-target 12 9)) (rule (rule-target 12 9))))
    )
)(assert (=> 
    (and (<= 1 10) (reaches 0 12 10))
    (reaches 0 12 (- 10 1))
))

(assert (=> 
    (and (reaches 0 12 10) (not (matches-criteria 0 12 10))) 
    (reaches 0 12 (+ 10 1))
))

(assert (=> 
   (and (reaches 0 12 10) (= (rule-target 12 10) NONE)) 
    (reaches 0 12 (+ 10 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 10) (terminating (rule-target 12 10))) 
        (and (not (reaches 0 12 (+ 10 1))) (= (terminates-with 0) (rule-target 12 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 10) (= (rule-target 12 10) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 10) (isGo (rule-target 12 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 10)) (rule (rule-target 12 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 10))) (reaches 0 12 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 10)) (isGo (rule-target 12 10)))
        (not (reaches 0 (chain (rule-target 12 10)) (rule (rule-target 12 10))))
    )
)(assert (=> 
    (and (<= 1 11) (reaches 0 12 11))
    (reaches 0 12 (- 11 1))
))

(assert (=> 
    (and (reaches 0 12 11) (not (matches-criteria 0 12 11))) 
    (reaches 0 12 (+ 11 1))
))

(assert (=> 
   (and (reaches 0 12 11) (= (rule-target 12 11) NONE)) 
    (reaches 0 12 (+ 11 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 11) (terminating (rule-target 12 11))) 
        (and (not (reaches 0 12 (+ 11 1))) (= (terminates-with 0) (rule-target 12 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 11) (= (rule-target 12 11) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 11) (isGo (rule-target 12 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 11)) (rule (rule-target 12 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 11))) (reaches 0 12 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 11)) (isGo (rule-target 12 11)))
        (not (reaches 0 (chain (rule-target 12 11)) (rule (rule-target 12 11))))
    )
)(assert (=> 
    (and (<= 1 12) (reaches 0 12 12))
    (reaches 0 12 (- 12 1))
))

(assert (=> 
    (and (reaches 0 12 12) (not (matches-criteria 0 12 12))) 
    (reaches 0 12 (+ 12 1))
))

(assert (=> 
   (and (reaches 0 12 12) (= (rule-target 12 12) NONE)) 
    (reaches 0 12 (+ 12 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 12) (terminating (rule-target 12 12))) 
        (and (not (reaches 0 12 (+ 12 1))) (= (terminates-with 0) (rule-target 12 12)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 12) (= (rule-target 12 12) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 12 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 12) (isGo (rule-target 12 12)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 12)) (rule (rule-target 12 12)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 12))) (reaches 0 12 (+ 12 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 12)) (isGo (rule-target 12 12)))
        (not (reaches 0 (chain (rule-target 12 12)) (rule (rule-target 12 12))))
    )
)(assert (=> 
    (and (<= 1 13) (reaches 0 12 13))
    (reaches 0 12 (- 13 1))
))

(assert (=> 
    (and (reaches 0 12 13) (not (matches-criteria 0 12 13))) 
    (reaches 0 12 (+ 13 1))
))

(assert (=> 
   (and (reaches 0 12 13) (= (rule-target 12 13) NONE)) 
    (reaches 0 12 (+ 13 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 13) (terminating (rule-target 12 13))) 
        (and (not (reaches 0 12 (+ 13 1))) (= (terminates-with 0) (rule-target 12 13)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 13) (= (rule-target 12 13) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 13 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 13) (isGo (rule-target 12 13)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 13)) (rule (rule-target 12 13)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 13))) (reaches 0 12 (+ 13 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 13)) (isGo (rule-target 12 13)))
        (not (reaches 0 (chain (rule-target 12 13)) (rule (rule-target 12 13))))
    )
)(assert (=> 
    (and (<= 1 14) (reaches 0 12 14))
    (reaches 0 12 (- 14 1))
))

(assert (=> 
    (and (reaches 0 12 14) (not (matches-criteria 0 12 14))) 
    (reaches 0 12 (+ 14 1))
))

(assert (=> 
   (and (reaches 0 12 14) (= (rule-target 12 14) NONE)) 
    (reaches 0 12 (+ 14 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 14) (terminating (rule-target 12 14))) 
        (and (not (reaches 0 12 (+ 14 1))) (= (terminates-with 0) (rule-target 12 14)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 14) (= (rule-target 12 14) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 14 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 14) (isGo (rule-target 12 14)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 14)) (rule (rule-target 12 14)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 14))) (reaches 0 12 (+ 14 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 14)) (isGo (rule-target 12 14)))
        (not (reaches 0 (chain (rule-target 12 14)) (rule (rule-target 12 14))))
    )
)(assert (=> 
    (and (<= 1 15) (reaches 0 12 15))
    (reaches 0 12 (- 15 1))
))

(assert (=> 
    (and (reaches 0 12 15) (not (matches-criteria 0 12 15))) 
    (reaches 0 12 (+ 15 1))
))

(assert (=> 
   (and (reaches 0 12 15) (= (rule-target 12 15) NONE)) 
    (reaches 0 12 (+ 15 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 15) (terminating (rule-target 12 15))) 
        (and (not (reaches 0 12 (+ 15 1))) (= (terminates-with 0) (rule-target 12 15)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 15) (= (rule-target 12 15) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 15 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 15) (isGo (rule-target 12 15)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 15)) (rule (rule-target 12 15)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 15))) (reaches 0 12 (+ 15 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 15)) (isGo (rule-target 12 15)))
        (not (reaches 0 (chain (rule-target 12 15)) (rule (rule-target 12 15))))
    )
)(assert (=> 
    (and (<= 1 16) (reaches 0 12 16))
    (reaches 0 12 (- 16 1))
))

(assert (=> 
    (and (reaches 0 12 16) (not (matches-criteria 0 12 16))) 
    (reaches 0 12 (+ 16 1))
))

(assert (=> 
   (and (reaches 0 12 16) (= (rule-target 12 16) NONE)) 
    (reaches 0 12 (+ 16 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 12 16) (terminating (rule-target 12 16))) 
        (and (not (reaches 0 12 (+ 16 1))) (= (terminates-with 0) (rule-target 12 16)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 12 16) (= (rule-target 12 16) RETURN))
        (and (reaches-return 0 12) (not (reaches 0 12 (+ 16 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 12 16) (isGo (rule-target 12 16)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 12 16)) (rule (rule-target 12 16)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 12 16))) (reaches 0 12 (+ 16 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 12 16)) (isGo (rule-target 12 16)))
        (not (reaches 0 (chain (rule-target 12 16)) (rule (rule-target 12 16))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 0) (terminating (rule-target 12 0))) 
        (and (not (reaches 1 12 (+ 0 1))) (= (terminates-with 1) (rule-target 12 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 0) (= (rule-target 12 0) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 0) (isGo (rule-target 12 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 0)) (rule (rule-target 12 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 0))) (reaches 1 12 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 0)) (isGo (rule-target 12 0)))
        (not (reaches 1 (chain (rule-target 12 0)) (rule (rule-target 12 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 1) (terminating (rule-target 12 1))) 
        (and (not (reaches 1 12 (+ 1 1))) (= (terminates-with 1) (rule-target 12 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 1) (= (rule-target 12 1) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 1) (isGo (rule-target 12 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 1)) (rule (rule-target 12 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 1))) (reaches 1 12 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 1)) (isGo (rule-target 12 1)))
        (not (reaches 1 (chain (rule-target 12 1)) (rule (rule-target 12 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 2) (terminating (rule-target 12 2))) 
        (and (not (reaches 1 12 (+ 2 1))) (= (terminates-with 1) (rule-target 12 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 2) (= (rule-target 12 2) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 2) (isGo (rule-target 12 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 2)) (rule (rule-target 12 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 2))) (reaches 1 12 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 2)) (isGo (rule-target 12 2)))
        (not (reaches 1 (chain (rule-target 12 2)) (rule (rule-target 12 2))))
    )
)(assert (=> 
    (and (<= 1 3) (reaches 1 12 3))
    (reaches 1 12 (- 3 1))
))

(assert (=> 
    (and (reaches 1 12 3) (not (matches-criteria 1 12 3))) 
    (reaches 1 12 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 12 3) (= (rule-target 12 3) NONE)) 
    (reaches 1 12 (+ 3 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 3) (terminating (rule-target 12 3))) 
        (and (not (reaches 1 12 (+ 3 1))) (= (terminates-with 1) (rule-target 12 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 3) (= (rule-target 12 3) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 3) (isGo (rule-target 12 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 3)) (rule (rule-target 12 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 3))) (reaches 1 12 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 3)) (isGo (rule-target 12 3)))
        (not (reaches 1 (chain (rule-target 12 3)) (rule (rule-target 12 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 1 12 4))
    (reaches 1 12 (- 4 1))
))

(assert (=> 
    (and (reaches 1 12 4) (not (matches-criteria 1 12 4))) 
    (reaches 1 12 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 12 4) (= (rule-target 12 4) NONE)) 
    (reaches 1 12 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 4) (terminating (rule-target 12 4))) 
        (and (not (reaches 1 12 (+ 4 1))) (= (terminates-with 1) (rule-target 12 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 4) (= (rule-target 12 4) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 4) (isGo (rule-target 12 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 4)) (rule (rule-target 12 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 4))) (reaches 1 12 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 4)) (isGo (rule-target 12 4)))
        (not (reaches 1 (chain (rule-target 12 4)) (rule (rule-target 12 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 1 12 5))
    (reaches 1 12 (- 5 1))
))

(assert (=> 
    (and (reaches 1 12 5) (not (matches-criteria 1 12 5))) 
    (reaches 1 12 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 12 5) (= (rule-target 12 5) NONE)) 
    (reaches 1 12 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 5) (terminating (rule-target 12 5))) 
        (and (not (reaches 1 12 (+ 5 1))) (= (terminates-with 1) (rule-target 12 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 5) (= (rule-target 12 5) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 5) (isGo (rule-target 12 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 5)) (rule (rule-target 12 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 5))) (reaches 1 12 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 5)) (isGo (rule-target 12 5)))
        (not (reaches 1 (chain (rule-target 12 5)) (rule (rule-target 12 5))))
    )
)(assert (=> 
    (and (<= 1 6) (reaches 1 12 6))
    (reaches 1 12 (- 6 1))
))

(assert (=> 
    (and (reaches 1 12 6) (not (matches-criteria 1 12 6))) 
    (reaches 1 12 (+ 6 1))
))

(assert (=> 
   (and (reaches 1 12 6) (= (rule-target 12 6) NONE)) 
    (reaches 1 12 (+ 6 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 6) (terminating (rule-target 12 6))) 
        (and (not (reaches 1 12 (+ 6 1))) (= (terminates-with 1) (rule-target 12 6)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 6) (= (rule-target 12 6) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 6 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 6) (isGo (rule-target 12 6)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 6)) (rule (rule-target 12 6)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 6))) (reaches 1 12 (+ 6 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 6)) (isGo (rule-target 12 6)))
        (not (reaches 1 (chain (rule-target 12 6)) (rule (rule-target 12 6))))
    )
)(assert (=> 
    (and (<= 1 7) (reaches 1 12 7))
    (reaches 1 12 (- 7 1))
))

(assert (=> 
    (and (reaches 1 12 7) (not (matches-criteria 1 12 7))) 
    (reaches 1 12 (+ 7 1))
))

(assert (=> 
   (and (reaches 1 12 7) (= (rule-target 12 7) NONE)) 
    (reaches 1 12 (+ 7 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 7) (terminating (rule-target 12 7))) 
        (and (not (reaches 1 12 (+ 7 1))) (= (terminates-with 1) (rule-target 12 7)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 7) (= (rule-target 12 7) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 7 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 7) (isGo (rule-target 12 7)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 7)) (rule (rule-target 12 7)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 7))) (reaches 1 12 (+ 7 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 7)) (isGo (rule-target 12 7)))
        (not (reaches 1 (chain (rule-target 12 7)) (rule (rule-target 12 7))))
    )
)(assert (=> 
    (and (<= 1 8) (reaches 1 12 8))
    (reaches 1 12 (- 8 1))
))

(assert (=> 
    (and (reaches 1 12 8) (not (matches-criteria 1 12 8))) 
    (reaches 1 12 (+ 8 1))
))

(assert (=> 
   (and (reaches 1 12 8) (= (rule-target 12 8) NONE)) 
    (reaches 1 12 (+ 8 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 8) (terminating (rule-target 12 8))) 
        (and (not (reaches 1 12 (+ 8 1))) (= (terminates-with 1) (rule-target 12 8)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 8) (= (rule-target 12 8) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 8 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 8) (isGo (rule-target 12 8)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 8)) (rule (rule-target 12 8)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 8))) (reaches 1 12 (+ 8 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 8)) (isGo (rule-target 12 8)))
        (not (reaches 1 (chain (rule-target 12 8)) (rule (rule-target 12 8))))
    )
)(assert (=> 
    (and (<= 1 9) (reaches 1 12 9))
    (reaches 1 12 (- 9 1))
))

(assert (=> 
    (and (reaches 1 12 9) (not (matches-criteria 1 12 9))) 
    (reaches 1 12 (+ 9 1))
))

(assert (=> 
   (and (reaches 1 12 9) (= (rule-target 12 9) NONE)) 
    (reaches 1 12 (+ 9 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 9) (terminating (rule-target 12 9))) 
        (and (not (reaches 1 12 (+ 9 1))) (= (terminates-with 1) (rule-target 12 9)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 9) (= (rule-target 12 9) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 9 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 9) (isGo (rule-target 12 9)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 9)) (rule (rule-target 12 9)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 9))) (reaches 1 12 (+ 9 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 9)) (isGo (rule-target 12 9)))
        (not (reaches 1 (chain (rule-target 12 9)) (rule (rule-target 12 9))))
    )
)(assert (=> 
    (and (<= 1 10) (reaches 1 12 10))
    (reaches 1 12 (- 10 1))
))

(assert (=> 
    (and (reaches 1 12 10) (not (matches-criteria 1 12 10))) 
    (reaches 1 12 (+ 10 1))
))

(assert (=> 
   (and (reaches 1 12 10) (= (rule-target 12 10) NONE)) 
    (reaches 1 12 (+ 10 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 10) (terminating (rule-target 12 10))) 
        (and (not (reaches 1 12 (+ 10 1))) (= (terminates-with 1) (rule-target 12 10)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 10) (= (rule-target 12 10) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 10 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 10) (isGo (rule-target 12 10)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 10)) (rule (rule-target 12 10)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 10))) (reaches 1 12 (+ 10 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 10)) (isGo (rule-target 12 10)))
        (not (reaches 1 (chain (rule-target 12 10)) (rule (rule-target 12 10))))
    )
)(assert (=> 
    (and (<= 1 11) (reaches 1 12 11))
    (reaches 1 12 (- 11 1))
))

(assert (=> 
    (and (reaches 1 12 11) (not (matches-criteria 1 12 11))) 
    (reaches 1 12 (+ 11 1))
))

(assert (=> 
   (and (reaches 1 12 11) (= (rule-target 12 11) NONE)) 
    (reaches 1 12 (+ 11 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 11) (terminating (rule-target 12 11))) 
        (and (not (reaches 1 12 (+ 11 1))) (= (terminates-with 1) (rule-target 12 11)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 11) (= (rule-target 12 11) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 11 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 11) (isGo (rule-target 12 11)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 11)) (rule (rule-target 12 11)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 11))) (reaches 1 12 (+ 11 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 11)) (isGo (rule-target 12 11)))
        (not (reaches 1 (chain (rule-target 12 11)) (rule (rule-target 12 11))))
    )
)(assert (=> 
    (and (<= 1 12) (reaches 1 12 12))
    (reaches 1 12 (- 12 1))
))

(assert (=> 
    (and (reaches 1 12 12) (not (matches-criteria 1 12 12))) 
    (reaches 1 12 (+ 12 1))
))

(assert (=> 
   (and (reaches 1 12 12) (= (rule-target 12 12) NONE)) 
    (reaches 1 12 (+ 12 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 12) (terminating (rule-target 12 12))) 
        (and (not (reaches 1 12 (+ 12 1))) (= (terminates-with 1) (rule-target 12 12)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 12) (= (rule-target 12 12) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 12 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 12) (isGo (rule-target 12 12)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 12)) (rule (rule-target 12 12)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 12))) (reaches 1 12 (+ 12 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 12)) (isGo (rule-target 12 12)))
        (not (reaches 1 (chain (rule-target 12 12)) (rule (rule-target 12 12))))
    )
)(assert (=> 
    (and (<= 1 13) (reaches 1 12 13))
    (reaches 1 12 (- 13 1))
))

(assert (=> 
    (and (reaches 1 12 13) (not (matches-criteria 1 12 13))) 
    (reaches 1 12 (+ 13 1))
))

(assert (=> 
   (and (reaches 1 12 13) (= (rule-target 12 13) NONE)) 
    (reaches 1 12 (+ 13 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 13) (terminating (rule-target 12 13))) 
        (and (not (reaches 1 12 (+ 13 1))) (= (terminates-with 1) (rule-target 12 13)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 13) (= (rule-target 12 13) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 13 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 13) (isGo (rule-target 12 13)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 13)) (rule (rule-target 12 13)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 13))) (reaches 1 12 (+ 13 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 13)) (isGo (rule-target 12 13)))
        (not (reaches 1 (chain (rule-target 12 13)) (rule (rule-target 12 13))))
    )
)(assert (=> 
    (and (<= 1 14) (reaches 1 12 14))
    (reaches 1 12 (- 14 1))
))

(assert (=> 
    (and (reaches 1 12 14) (not (matches-criteria 1 12 14))) 
    (reaches 1 12 (+ 14 1))
))

(assert (=> 
   (and (reaches 1 12 14) (= (rule-target 12 14) NONE)) 
    (reaches 1 12 (+ 14 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 14) (terminating (rule-target 12 14))) 
        (and (not (reaches 1 12 (+ 14 1))) (= (terminates-with 1) (rule-target 12 14)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 14) (= (rule-target 12 14) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 14 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 14) (isGo (rule-target 12 14)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 14)) (rule (rule-target 12 14)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 14))) (reaches 1 12 (+ 14 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 14)) (isGo (rule-target 12 14)))
        (not (reaches 1 (chain (rule-target 12 14)) (rule (rule-target 12 14))))
    )
)(assert (=> 
    (and (<= 1 15) (reaches 1 12 15))
    (reaches 1 12 (- 15 1))
))

(assert (=> 
    (and (reaches 1 12 15) (not (matches-criteria 1 12 15))) 
    (reaches 1 12 (+ 15 1))
))

(assert (=> 
   (and (reaches 1 12 15) (= (rule-target 12 15) NONE)) 
    (reaches 1 12 (+ 15 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 15) (terminating (rule-target 12 15))) 
        (and (not (reaches 1 12 (+ 15 1))) (= (terminates-with 1) (rule-target 12 15)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 15) (= (rule-target 12 15) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 15 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 15) (isGo (rule-target 12 15)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 15)) (rule (rule-target 12 15)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 15))) (reaches 1 12 (+ 15 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 15)) (isGo (rule-target 12 15)))
        (not (reaches 1 (chain (rule-target 12 15)) (rule (rule-target 12 15))))
    )
)(assert (=> 
    (and (<= 1 16) (reaches 1 12 16))
    (reaches 1 12 (- 16 1))
))

(assert (=> 
    (and (reaches 1 12 16) (not (matches-criteria 1 12 16))) 
    (reaches 1 12 (+ 16 1))
))

(assert (=> 
   (and (reaches 1 12 16) (= (rule-target 12 16) NONE)) 
    (reaches 1 12 (+ 16 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 12 16) (terminating (rule-target 12 16))) 
        (and (not (reaches 1 12 (+ 16 1))) (= (terminates-with 1) (rule-target 12 16)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 12 16) (= (rule-target 12 16) RETURN))
        (and (reaches-return 1 12) (not (reaches 1 12 (+ 16 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 12 16) (isGo (rule-target 12 16)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 12 16)) (rule (rule-target 12 16)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 12 16))) (reaches 1 12 (+ 16 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 12 16)) (isGo (rule-target 12 16)))
        (not (reaches 1 (chain (rule-target 12 16)) (rule (rule-target 12 16))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 0) (terminating (rule-target 13 0))) 
        (and (not (reaches 0 13 (+ 0 1))) (= (terminates-with 0) (rule-target 13 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 0) (= (rule-target 13 0) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 0) (isGo (rule-target 13 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 0)) (rule (rule-target 13 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 0))) (reaches 0 13 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 0)) (isGo (rule-target 13 0)))
        (not (reaches 0 (chain (rule-target 13 0)) (rule (rule-target 13 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 1) (terminating (rule-target 13 1))) 
        (and (not (reaches 0 13 (+ 1 1))) (= (terminates-with 0) (rule-target 13 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 1) (= (rule-target 13 1) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 1) (isGo (rule-target 13 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 1)) (rule (rule-target 13 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 1))) (reaches 0 13 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 1)) (isGo (rule-target 13 1)))
        (not (reaches 0 (chain (rule-target 13 1)) (rule (rule-target 13 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 2) (terminating (rule-target 13 2))) 
        (and (not (reaches 0 13 (+ 2 1))) (= (terminates-with 0) (rule-target 13 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 2) (= (rule-target 13 2) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 2) (isGo (rule-target 13 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 2)) (rule (rule-target 13 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 2))) (reaches 0 13 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 2)) (isGo (rule-target 13 2)))
        (not (reaches 0 (chain (rule-target 13 2)) (rule (rule-target 13 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 3) (terminating (rule-target 13 3))) 
        (and (not (reaches 0 13 (+ 3 1))) (= (terminates-with 0) (rule-target 13 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 3) (= (rule-target 13 3) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 3) (isGo (rule-target 13 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 3)) (rule (rule-target 13 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 3))) (reaches 0 13 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 3)) (isGo (rule-target 13 3)))
        (not (reaches 0 (chain (rule-target 13 3)) (rule (rule-target 13 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 4) (terminating (rule-target 13 4))) 
        (and (not (reaches 0 13 (+ 4 1))) (= (terminates-with 0) (rule-target 13 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 4) (= (rule-target 13 4) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 4) (isGo (rule-target 13 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 4)) (rule (rule-target 13 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 4))) (reaches 0 13 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 4)) (isGo (rule-target 13 4)))
        (not (reaches 0 (chain (rule-target 13 4)) (rule (rule-target 13 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 0 13 5))
    (reaches 0 13 (- 5 1))
))

(assert (=> 
    (and (reaches 0 13 5) (not (matches-criteria 0 13 5))) 
    (reaches 0 13 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 13 5) (= (rule-target 13 5) NONE)) 
    (reaches 0 13 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 13 5) (terminating (rule-target 13 5))) 
        (and (not (reaches 0 13 (+ 5 1))) (= (terminates-with 0) (rule-target 13 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 13 5) (= (rule-target 13 5) RETURN))
        (and (reaches-return 0 13) (not (reaches 0 13 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 13 5) (isGo (rule-target 13 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 13 5)) (rule (rule-target 13 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 13 5))) (reaches 0 13 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 13 5)) (isGo (rule-target 13 5)))
        (not (reaches 0 (chain (rule-target 13 5)) (rule (rule-target 13 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 0) (terminating (rule-target 13 0))) 
        (and (not (reaches 1 13 (+ 0 1))) (= (terminates-with 1) (rule-target 13 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 0) (= (rule-target 13 0) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 0) (isGo (rule-target 13 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 0)) (rule (rule-target 13 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 0))) (reaches 1 13 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 0)) (isGo (rule-target 13 0)))
        (not (reaches 1 (chain (rule-target 13 0)) (rule (rule-target 13 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 1) (terminating (rule-target 13 1))) 
        (and (not (reaches 1 13 (+ 1 1))) (= (terminates-with 1) (rule-target 13 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 1) (= (rule-target 13 1) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 1) (isGo (rule-target 13 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 1)) (rule (rule-target 13 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 1))) (reaches 1 13 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 1)) (isGo (rule-target 13 1)))
        (not (reaches 1 (chain (rule-target 13 1)) (rule (rule-target 13 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 2) (terminating (rule-target 13 2))) 
        (and (not (reaches 1 13 (+ 2 1))) (= (terminates-with 1) (rule-target 13 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 2) (= (rule-target 13 2) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 2) (isGo (rule-target 13 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 2)) (rule (rule-target 13 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 2))) (reaches 1 13 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 2)) (isGo (rule-target 13 2)))
        (not (reaches 1 (chain (rule-target 13 2)) (rule (rule-target 13 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 3) (terminating (rule-target 13 3))) 
        (and (not (reaches 1 13 (+ 3 1))) (= (terminates-with 1) (rule-target 13 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 3) (= (rule-target 13 3) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 3) (isGo (rule-target 13 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 3)) (rule (rule-target 13 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 3))) (reaches 1 13 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 3)) (isGo (rule-target 13 3)))
        (not (reaches 1 (chain (rule-target 13 3)) (rule (rule-target 13 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 4) (terminating (rule-target 13 4))) 
        (and (not (reaches 1 13 (+ 4 1))) (= (terminates-with 1) (rule-target 13 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 4) (= (rule-target 13 4) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 4) (isGo (rule-target 13 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 4)) (rule (rule-target 13 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 4))) (reaches 1 13 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 4)) (isGo (rule-target 13 4)))
        (not (reaches 1 (chain (rule-target 13 4)) (rule (rule-target 13 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 1 13 5))
    (reaches 1 13 (- 5 1))
))

(assert (=> 
    (and (reaches 1 13 5) (not (matches-criteria 1 13 5))) 
    (reaches 1 13 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 13 5) (= (rule-target 13 5) NONE)) 
    (reaches 1 13 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 13 5) (terminating (rule-target 13 5))) 
        (and (not (reaches 1 13 (+ 5 1))) (= (terminates-with 1) (rule-target 13 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 13 5) (= (rule-target 13 5) RETURN))
        (and (reaches-return 1 13) (not (reaches 1 13 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 13 5) (isGo (rule-target 13 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 13 5)) (rule (rule-target 13 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 13 5))) (reaches 1 13 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 13 5)) (isGo (rule-target 13 5)))
        (not (reaches 1 (chain (rule-target 13 5)) (rule (rule-target 13 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 0) (terminating (rule-target 14 0))) 
        (and (not (reaches 0 14 (+ 0 1))) (= (terminates-with 0) (rule-target 14 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 0) (= (rule-target 14 0) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 0) (isGo (rule-target 14 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 0)) (rule (rule-target 14 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 0))) (reaches 0 14 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 0)) (isGo (rule-target 14 0)))
        (not (reaches 0 (chain (rule-target 14 0)) (rule (rule-target 14 0))))
    )
)(assert (=> 
    (and (<= 1 1) (reaches 0 14 1))
    (reaches 0 14 (- 1 1))
))

(assert (=> 
    (and (reaches 0 14 1) (not (matches-criteria 0 14 1))) 
    (reaches 0 14 (+ 1 1))
))

(assert (=> 
   (and (reaches 0 14 1) (= (rule-target 14 1) NONE)) 
    (reaches 0 14 (+ 1 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 1) (terminating (rule-target 14 1))) 
        (and (not (reaches 0 14 (+ 1 1))) (= (terminates-with 0) (rule-target 14 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 1) (= (rule-target 14 1) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 1) (isGo (rule-target 14 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 1)) (rule (rule-target 14 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 1))) (reaches 0 14 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 1)) (isGo (rule-target 14 1)))
        (not (reaches 0 (chain (rule-target 14 1)) (rule (rule-target 14 1))))
    )
)(assert (=> 
    (and (<= 1 2) (reaches 0 14 2))
    (reaches 0 14 (- 2 1))
))

(assert (=> 
    (and (reaches 0 14 2) (not (matches-criteria 0 14 2))) 
    (reaches 0 14 (+ 2 1))
))

(assert (=> 
   (and (reaches 0 14 2) (= (rule-target 14 2) NONE)) 
    (reaches 0 14 (+ 2 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 2) (terminating (rule-target 14 2))) 
        (and (not (reaches 0 14 (+ 2 1))) (= (terminates-with 0) (rule-target 14 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 2) (= (rule-target 14 2) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 2) (isGo (rule-target 14 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 2)) (rule (rule-target 14 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 2))) (reaches 0 14 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 2)) (isGo (rule-target 14 2)))
        (not (reaches 0 (chain (rule-target 14 2)) (rule (rule-target 14 2))))
    )
)(assert (=> 
    (and (<= 1 3) (reaches 0 14 3))
    (reaches 0 14 (- 3 1))
))

(assert (=> 
    (and (reaches 0 14 3) (not (matches-criteria 0 14 3))) 
    (reaches 0 14 (+ 3 1))
))

(assert (=> 
   (and (reaches 0 14 3) (= (rule-target 14 3) NONE)) 
    (reaches 0 14 (+ 3 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 3) (terminating (rule-target 14 3))) 
        (and (not (reaches 0 14 (+ 3 1))) (= (terminates-with 0) (rule-target 14 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 3) (= (rule-target 14 3) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 3) (isGo (rule-target 14 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 3)) (rule (rule-target 14 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 3))) (reaches 0 14 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 3)) (isGo (rule-target 14 3)))
        (not (reaches 0 (chain (rule-target 14 3)) (rule (rule-target 14 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 0 14 4))
    (reaches 0 14 (- 4 1))
))

(assert (=> 
    (and (reaches 0 14 4) (not (matches-criteria 0 14 4))) 
    (reaches 0 14 (+ 4 1))
))

(assert (=> 
   (and (reaches 0 14 4) (= (rule-target 14 4) NONE)) 
    (reaches 0 14 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 4) (terminating (rule-target 14 4))) 
        (and (not (reaches 0 14 (+ 4 1))) (= (terminates-with 0) (rule-target 14 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 4) (= (rule-target 14 4) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 4) (isGo (rule-target 14 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 4)) (rule (rule-target 14 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 4))) (reaches 0 14 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 4)) (isGo (rule-target 14 4)))
        (not (reaches 0 (chain (rule-target 14 4)) (rule (rule-target 14 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 0 14 5))
    (reaches 0 14 (- 5 1))
))

(assert (=> 
    (and (reaches 0 14 5) (not (matches-criteria 0 14 5))) 
    (reaches 0 14 (+ 5 1))
))

(assert (=> 
   (and (reaches 0 14 5) (= (rule-target 14 5) NONE)) 
    (reaches 0 14 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 14 5) (terminating (rule-target 14 5))) 
        (and (not (reaches 0 14 (+ 5 1))) (= (terminates-with 0) (rule-target 14 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 14 5) (= (rule-target 14 5) RETURN))
        (and (reaches-return 0 14) (not (reaches 0 14 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 14 5) (isGo (rule-target 14 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 14 5)) (rule (rule-target 14 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 14 5))) (reaches 0 14 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 14 5)) (isGo (rule-target 14 5)))
        (not (reaches 0 (chain (rule-target 14 5)) (rule (rule-target 14 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 0) (terminating (rule-target 14 0))) 
        (and (not (reaches 1 14 (+ 0 1))) (= (terminates-with 1) (rule-target 14 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 0) (= (rule-target 14 0) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 0) (isGo (rule-target 14 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 0)) (rule (rule-target 14 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 0))) (reaches 1 14 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 0)) (isGo (rule-target 14 0)))
        (not (reaches 1 (chain (rule-target 14 0)) (rule (rule-target 14 0))))
    )
)(assert (=> 
    (and (<= 1 1) (reaches 1 14 1))
    (reaches 1 14 (- 1 1))
))

(assert (=> 
    (and (reaches 1 14 1) (not (matches-criteria 1 14 1))) 
    (reaches 1 14 (+ 1 1))
))

(assert (=> 
   (and (reaches 1 14 1) (= (rule-target 14 1) NONE)) 
    (reaches 1 14 (+ 1 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 1) (terminating (rule-target 14 1))) 
        (and (not (reaches 1 14 (+ 1 1))) (= (terminates-with 1) (rule-target 14 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 1) (= (rule-target 14 1) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 1) (isGo (rule-target 14 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 1)) (rule (rule-target 14 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 1))) (reaches 1 14 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 1)) (isGo (rule-target 14 1)))
        (not (reaches 1 (chain (rule-target 14 1)) (rule (rule-target 14 1))))
    )
)(assert (=> 
    (and (<= 1 2) (reaches 1 14 2))
    (reaches 1 14 (- 2 1))
))

(assert (=> 
    (and (reaches 1 14 2) (not (matches-criteria 1 14 2))) 
    (reaches 1 14 (+ 2 1))
))

(assert (=> 
   (and (reaches 1 14 2) (= (rule-target 14 2) NONE)) 
    (reaches 1 14 (+ 2 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 2) (terminating (rule-target 14 2))) 
        (and (not (reaches 1 14 (+ 2 1))) (= (terminates-with 1) (rule-target 14 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 2) (= (rule-target 14 2) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 2) (isGo (rule-target 14 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 2)) (rule (rule-target 14 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 2))) (reaches 1 14 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 2)) (isGo (rule-target 14 2)))
        (not (reaches 1 (chain (rule-target 14 2)) (rule (rule-target 14 2))))
    )
)(assert (=> 
    (and (<= 1 3) (reaches 1 14 3))
    (reaches 1 14 (- 3 1))
))

(assert (=> 
    (and (reaches 1 14 3) (not (matches-criteria 1 14 3))) 
    (reaches 1 14 (+ 3 1))
))

(assert (=> 
   (and (reaches 1 14 3) (= (rule-target 14 3) NONE)) 
    (reaches 1 14 (+ 3 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 3) (terminating (rule-target 14 3))) 
        (and (not (reaches 1 14 (+ 3 1))) (= (terminates-with 1) (rule-target 14 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 3) (= (rule-target 14 3) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 3) (isGo (rule-target 14 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 3)) (rule (rule-target 14 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 3))) (reaches 1 14 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 3)) (isGo (rule-target 14 3)))
        (not (reaches 1 (chain (rule-target 14 3)) (rule (rule-target 14 3))))
    )
)(assert (=> 
    (and (<= 1 4) (reaches 1 14 4))
    (reaches 1 14 (- 4 1))
))

(assert (=> 
    (and (reaches 1 14 4) (not (matches-criteria 1 14 4))) 
    (reaches 1 14 (+ 4 1))
))

(assert (=> 
   (and (reaches 1 14 4) (= (rule-target 14 4) NONE)) 
    (reaches 1 14 (+ 4 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 4) (terminating (rule-target 14 4))) 
        (and (not (reaches 1 14 (+ 4 1))) (= (terminates-with 1) (rule-target 14 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 4) (= (rule-target 14 4) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 4) (isGo (rule-target 14 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 4)) (rule (rule-target 14 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 4))) (reaches 1 14 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 4)) (isGo (rule-target 14 4)))
        (not (reaches 1 (chain (rule-target 14 4)) (rule (rule-target 14 4))))
    )
)(assert (=> 
    (and (<= 1 5) (reaches 1 14 5))
    (reaches 1 14 (- 5 1))
))

(assert (=> 
    (and (reaches 1 14 5) (not (matches-criteria 1 14 5))) 
    (reaches 1 14 (+ 5 1))
))

(assert (=> 
   (and (reaches 1 14 5) (= (rule-target 14 5) NONE)) 
    (reaches 1 14 (+ 5 1))
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 14 5) (terminating (rule-target 14 5))) 
        (and (not (reaches 1 14 (+ 5 1))) (= (terminates-with 1) (rule-target 14 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 14 5) (= (rule-target 14 5) RETURN))
        (and (reaches-return 1 14) (not (reaches 1 14 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 14 5) (isGo (rule-target 14 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 14 5)) (rule (rule-target 14 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 14 5))) (reaches 1 14 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 14 5)) (isGo (rule-target 14 5)))
        (not (reaches 1 (chain (rule-target 14 5)) (rule (rule-target 14 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 0) (terminating (rule-target 15 0))) 
        (and (not (reaches 0 15 (+ 0 1))) (= (terminates-with 0) (rule-target 15 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 0) (= (rule-target 15 0) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 0) (isGo (rule-target 15 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 0)) (rule (rule-target 15 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 0))) (reaches 0 15 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 0)) (isGo (rule-target 15 0)))
        (not (reaches 0 (chain (rule-target 15 0)) (rule (rule-target 15 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 1) (terminating (rule-target 15 1))) 
        (and (not (reaches 0 15 (+ 1 1))) (= (terminates-with 0) (rule-target 15 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 1) (= (rule-target 15 1) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 1) (isGo (rule-target 15 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 1)) (rule (rule-target 15 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 1))) (reaches 0 15 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 1)) (isGo (rule-target 15 1)))
        (not (reaches 0 (chain (rule-target 15 1)) (rule (rule-target 15 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 2) (terminating (rule-target 15 2))) 
        (and (not (reaches 0 15 (+ 2 1))) (= (terminates-with 0) (rule-target 15 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 2) (= (rule-target 15 2) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 2) (isGo (rule-target 15 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 2)) (rule (rule-target 15 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 2))) (reaches 0 15 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 2)) (isGo (rule-target 15 2)))
        (not (reaches 0 (chain (rule-target 15 2)) (rule (rule-target 15 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 3) (terminating (rule-target 15 3))) 
        (and (not (reaches 0 15 (+ 3 1))) (= (terminates-with 0) (rule-target 15 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 3) (= (rule-target 15 3) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 3) (isGo (rule-target 15 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 3)) (rule (rule-target 15 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 3))) (reaches 0 15 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 3)) (isGo (rule-target 15 3)))
        (not (reaches 0 (chain (rule-target 15 3)) (rule (rule-target 15 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 4) (terminating (rule-target 15 4))) 
        (and (not (reaches 0 15 (+ 4 1))) (= (terminates-with 0) (rule-target 15 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 4) (= (rule-target 15 4) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 4) (isGo (rule-target 15 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 4)) (rule (rule-target 15 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 4))) (reaches 0 15 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 4)) (isGo (rule-target 15 4)))
        (not (reaches 0 (chain (rule-target 15 4)) (rule (rule-target 15 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 15 5) (terminating (rule-target 15 5))) 
        (and (not (reaches 0 15 (+ 5 1))) (= (terminates-with 0) (rule-target 15 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 15 5) (= (rule-target 15 5) RETURN))
        (and (reaches-return 0 15) (not (reaches 0 15 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 15 5) (isGo (rule-target 15 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 15 5)) (rule (rule-target 15 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 15 5))) (reaches 0 15 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 15 5)) (isGo (rule-target 15 5)))
        (not (reaches 0 (chain (rule-target 15 5)) (rule (rule-target 15 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 0) (terminating (rule-target 15 0))) 
        (and (not (reaches 1 15 (+ 0 1))) (= (terminates-with 1) (rule-target 15 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 0) (= (rule-target 15 0) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 0) (isGo (rule-target 15 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 0)) (rule (rule-target 15 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 0))) (reaches 1 15 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 0)) (isGo (rule-target 15 0)))
        (not (reaches 1 (chain (rule-target 15 0)) (rule (rule-target 15 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 1) (terminating (rule-target 15 1))) 
        (and (not (reaches 1 15 (+ 1 1))) (= (terminates-with 1) (rule-target 15 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 1) (= (rule-target 15 1) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 1) (isGo (rule-target 15 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 1)) (rule (rule-target 15 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 1))) (reaches 1 15 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 1)) (isGo (rule-target 15 1)))
        (not (reaches 1 (chain (rule-target 15 1)) (rule (rule-target 15 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 2) (terminating (rule-target 15 2))) 
        (and (not (reaches 1 15 (+ 2 1))) (= (terminates-with 1) (rule-target 15 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 2) (= (rule-target 15 2) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 2) (isGo (rule-target 15 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 2)) (rule (rule-target 15 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 2))) (reaches 1 15 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 2)) (isGo (rule-target 15 2)))
        (not (reaches 1 (chain (rule-target 15 2)) (rule (rule-target 15 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 3) (terminating (rule-target 15 3))) 
        (and (not (reaches 1 15 (+ 3 1))) (= (terminates-with 1) (rule-target 15 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 3) (= (rule-target 15 3) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 3) (isGo (rule-target 15 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 3)) (rule (rule-target 15 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 3))) (reaches 1 15 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 3)) (isGo (rule-target 15 3)))
        (not (reaches 1 (chain (rule-target 15 3)) (rule (rule-target 15 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 4) (terminating (rule-target 15 4))) 
        (and (not (reaches 1 15 (+ 4 1))) (= (terminates-with 1) (rule-target 15 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 4) (= (rule-target 15 4) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 4) (isGo (rule-target 15 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 4)) (rule (rule-target 15 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 4))) (reaches 1 15 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 4)) (isGo (rule-target 15 4)))
        (not (reaches 1 (chain (rule-target 15 4)) (rule (rule-target 15 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 15 5) (terminating (rule-target 15 5))) 
        (and (not (reaches 1 15 (+ 5 1))) (= (terminates-with 1) (rule-target 15 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 15 5) (= (rule-target 15 5) RETURN))
        (and (reaches-return 1 15) (not (reaches 1 15 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 15 5) (isGo (rule-target 15 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 15 5)) (rule (rule-target 15 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 15 5))) (reaches 1 15 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 15 5)) (isGo (rule-target 15 5)))
        (not (reaches 1 (chain (rule-target 15 5)) (rule (rule-target 15 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 0) (terminating (rule-target 16 0))) 
        (and (not (reaches 0 16 (+ 0 1))) (= (terminates-with 0) (rule-target 16 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 0) (= (rule-target 16 0) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 0) (isGo (rule-target 16 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 0)) (rule (rule-target 16 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 0))) (reaches 0 16 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 0)) (isGo (rule-target 16 0)))
        (not (reaches 0 (chain (rule-target 16 0)) (rule (rule-target 16 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 1) (terminating (rule-target 16 1))) 
        (and (not (reaches 0 16 (+ 1 1))) (= (terminates-with 0) (rule-target 16 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 1) (= (rule-target 16 1) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 1) (isGo (rule-target 16 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 1)) (rule (rule-target 16 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 1))) (reaches 0 16 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 1)) (isGo (rule-target 16 1)))
        (not (reaches 0 (chain (rule-target 16 1)) (rule (rule-target 16 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 2) (terminating (rule-target 16 2))) 
        (and (not (reaches 0 16 (+ 2 1))) (= (terminates-with 0) (rule-target 16 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 2) (= (rule-target 16 2) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 2) (isGo (rule-target 16 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 2)) (rule (rule-target 16 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 2))) (reaches 0 16 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 2)) (isGo (rule-target 16 2)))
        (not (reaches 0 (chain (rule-target 16 2)) (rule (rule-target 16 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 3) (terminating (rule-target 16 3))) 
        (and (not (reaches 0 16 (+ 3 1))) (= (terminates-with 0) (rule-target 16 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 3) (= (rule-target 16 3) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 3) (isGo (rule-target 16 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 3)) (rule (rule-target 16 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 3))) (reaches 0 16 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 3)) (isGo (rule-target 16 3)))
        (not (reaches 0 (chain (rule-target 16 3)) (rule (rule-target 16 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 4) (terminating (rule-target 16 4))) 
        (and (not (reaches 0 16 (+ 4 1))) (= (terminates-with 0) (rule-target 16 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 4) (= (rule-target 16 4) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 4) (isGo (rule-target 16 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 4)) (rule (rule-target 16 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 4))) (reaches 0 16 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 4)) (isGo (rule-target 16 4)))
        (not (reaches 0 (chain (rule-target 16 4)) (rule (rule-target 16 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 16 5) (terminating (rule-target 16 5))) 
        (and (not (reaches 0 16 (+ 5 1))) (= (terminates-with 0) (rule-target 16 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 16 5) (= (rule-target 16 5) RETURN))
        (and (reaches-return 0 16) (not (reaches 0 16 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 16 5) (isGo (rule-target 16 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 16 5)) (rule (rule-target 16 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 16 5))) (reaches 0 16 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 16 5)) (isGo (rule-target 16 5)))
        (not (reaches 0 (chain (rule-target 16 5)) (rule (rule-target 16 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 0) (terminating (rule-target 16 0))) 
        (and (not (reaches 1 16 (+ 0 1))) (= (terminates-with 1) (rule-target 16 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 0) (= (rule-target 16 0) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 0) (isGo (rule-target 16 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 0)) (rule (rule-target 16 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 0))) (reaches 1 16 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 0)) (isGo (rule-target 16 0)))
        (not (reaches 1 (chain (rule-target 16 0)) (rule (rule-target 16 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 1) (terminating (rule-target 16 1))) 
        (and (not (reaches 1 16 (+ 1 1))) (= (terminates-with 1) (rule-target 16 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 1) (= (rule-target 16 1) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 1) (isGo (rule-target 16 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 1)) (rule (rule-target 16 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 1))) (reaches 1 16 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 1)) (isGo (rule-target 16 1)))
        (not (reaches 1 (chain (rule-target 16 1)) (rule (rule-target 16 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 2) (terminating (rule-target 16 2))) 
        (and (not (reaches 1 16 (+ 2 1))) (= (terminates-with 1) (rule-target 16 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 2) (= (rule-target 16 2) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 2) (isGo (rule-target 16 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 2)) (rule (rule-target 16 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 2))) (reaches 1 16 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 2)) (isGo (rule-target 16 2)))
        (not (reaches 1 (chain (rule-target 16 2)) (rule (rule-target 16 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 3) (terminating (rule-target 16 3))) 
        (and (not (reaches 1 16 (+ 3 1))) (= (terminates-with 1) (rule-target 16 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 3) (= (rule-target 16 3) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 3) (isGo (rule-target 16 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 3)) (rule (rule-target 16 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 3))) (reaches 1 16 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 3)) (isGo (rule-target 16 3)))
        (not (reaches 1 (chain (rule-target 16 3)) (rule (rule-target 16 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 4) (terminating (rule-target 16 4))) 
        (and (not (reaches 1 16 (+ 4 1))) (= (terminates-with 1) (rule-target 16 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 4) (= (rule-target 16 4) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 4) (isGo (rule-target 16 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 4)) (rule (rule-target 16 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 4))) (reaches 1 16 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 4)) (isGo (rule-target 16 4)))
        (not (reaches 1 (chain (rule-target 16 4)) (rule (rule-target 16 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 16 5) (terminating (rule-target 16 5))) 
        (and (not (reaches 1 16 (+ 5 1))) (= (terminates-with 1) (rule-target 16 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 16 5) (= (rule-target 16 5) RETURN))
        (and (reaches-return 1 16) (not (reaches 1 16 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 16 5) (isGo (rule-target 16 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 16 5)) (rule (rule-target 16 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 16 5))) (reaches 1 16 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 16 5)) (isGo (rule-target 16 5)))
        (not (reaches 1 (chain (rule-target 16 5)) (rule (rule-target 16 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 17 0) (terminating (rule-target 17 0))) 
        (and (not (reaches 0 17 (+ 0 1))) (= (terminates-with 0) (rule-target 17 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 17 0) (= (rule-target 17 0) RETURN))
        (and (reaches-return 0 17) (not (reaches 0 17 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 17 0) (isGo (rule-target 17 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 17 0)) (rule (rule-target 17 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 17 0))) (reaches 0 17 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 17 0)) (isGo (rule-target 17 0)))
        (not (reaches 0 (chain (rule-target 17 0)) (rule (rule-target 17 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 17 1) (terminating (rule-target 17 1))) 
        (and (not (reaches 0 17 (+ 1 1))) (= (terminates-with 0) (rule-target 17 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 17 1) (= (rule-target 17 1) RETURN))
        (and (reaches-return 0 17) (not (reaches 0 17 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 17 1) (isGo (rule-target 17 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 17 1)) (rule (rule-target 17 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 17 1))) (reaches 0 17 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 17 1)) (isGo (rule-target 17 1)))
        (not (reaches 0 (chain (rule-target 17 1)) (rule (rule-target 17 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 17 0) (terminating (rule-target 17 0))) 
        (and (not (reaches 1 17 (+ 0 1))) (= (terminates-with 1) (rule-target 17 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 17 0) (= (rule-target 17 0) RETURN))
        (and (reaches-return 1 17) (not (reaches 1 17 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 17 0) (isGo (rule-target 17 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 17 0)) (rule (rule-target 17 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 17 0))) (reaches 1 17 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 17 0)) (isGo (rule-target 17 0)))
        (not (reaches 1 (chain (rule-target 17 0)) (rule (rule-target 17 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 17 1) (terminating (rule-target 17 1))) 
        (and (not (reaches 1 17 (+ 1 1))) (= (terminates-with 1) (rule-target 17 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 17 1) (= (rule-target 17 1) RETURN))
        (and (reaches-return 1 17) (not (reaches 1 17 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 17 1) (isGo (rule-target 17 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 17 1)) (rule (rule-target 17 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 17 1))) (reaches 1 17 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 17 1)) (isGo (rule-target 17 1)))
        (not (reaches 1 (chain (rule-target 17 1)) (rule (rule-target 17 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 18 0) (terminating (rule-target 18 0))) 
        (and (not (reaches 0 18 (+ 0 1))) (= (terminates-with 0) (rule-target 18 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 18 0) (= (rule-target 18 0) RETURN))
        (and (reaches-return 0 18) (not (reaches 0 18 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 18 0) (isGo (rule-target 18 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 18 0)) (rule (rule-target 18 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 18 0))) (reaches 0 18 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 18 0)) (isGo (rule-target 18 0)))
        (not (reaches 0 (chain (rule-target 18 0)) (rule (rule-target 18 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 18 1) (terminating (rule-target 18 1))) 
        (and (not (reaches 0 18 (+ 1 1))) (= (terminates-with 0) (rule-target 18 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 18 1) (= (rule-target 18 1) RETURN))
        (and (reaches-return 0 18) (not (reaches 0 18 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 18 1) (isGo (rule-target 18 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 18 1)) (rule (rule-target 18 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 18 1))) (reaches 0 18 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 18 1)) (isGo (rule-target 18 1)))
        (not (reaches 0 (chain (rule-target 18 1)) (rule (rule-target 18 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 18 2) (terminating (rule-target 18 2))) 
        (and (not (reaches 0 18 (+ 2 1))) (= (terminates-with 0) (rule-target 18 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 18 2) (= (rule-target 18 2) RETURN))
        (and (reaches-return 0 18) (not (reaches 0 18 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 18 2) (isGo (rule-target 18 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 18 2)) (rule (rule-target 18 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 18 2))) (reaches 0 18 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 18 2)) (isGo (rule-target 18 2)))
        (not (reaches 0 (chain (rule-target 18 2)) (rule (rule-target 18 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 18 3) (terminating (rule-target 18 3))) 
        (and (not (reaches 0 18 (+ 3 1))) (= (terminates-with 0) (rule-target 18 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 18 3) (= (rule-target 18 3) RETURN))
        (and (reaches-return 0 18) (not (reaches 0 18 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 18 3) (isGo (rule-target 18 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 18 3)) (rule (rule-target 18 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 18 3))) (reaches 0 18 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 18 3)) (isGo (rule-target 18 3)))
        (not (reaches 0 (chain (rule-target 18 3)) (rule (rule-target 18 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 18 0) (terminating (rule-target 18 0))) 
        (and (not (reaches 1 18 (+ 0 1))) (= (terminates-with 1) (rule-target 18 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 18 0) (= (rule-target 18 0) RETURN))
        (and (reaches-return 1 18) (not (reaches 1 18 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 18 0) (isGo (rule-target 18 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 18 0)) (rule (rule-target 18 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 18 0))) (reaches 1 18 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 18 0)) (isGo (rule-target 18 0)))
        (not (reaches 1 (chain (rule-target 18 0)) (rule (rule-target 18 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 18 1) (terminating (rule-target 18 1))) 
        (and (not (reaches 1 18 (+ 1 1))) (= (terminates-with 1) (rule-target 18 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 18 1) (= (rule-target 18 1) RETURN))
        (and (reaches-return 1 18) (not (reaches 1 18 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 18 1) (isGo (rule-target 18 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 18 1)) (rule (rule-target 18 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 18 1))) (reaches 1 18 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 18 1)) (isGo (rule-target 18 1)))
        (not (reaches 1 (chain (rule-target 18 1)) (rule (rule-target 18 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 18 2) (terminating (rule-target 18 2))) 
        (and (not (reaches 1 18 (+ 2 1))) (= (terminates-with 1) (rule-target 18 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 18 2) (= (rule-target 18 2) RETURN))
        (and (reaches-return 1 18) (not (reaches 1 18 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 18 2) (isGo (rule-target 18 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 18 2)) (rule (rule-target 18 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 18 2))) (reaches 1 18 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 18 2)) (isGo (rule-target 18 2)))
        (not (reaches 1 (chain (rule-target 18 2)) (rule (rule-target 18 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 18 3) (terminating (rule-target 18 3))) 
        (and (not (reaches 1 18 (+ 3 1))) (= (terminates-with 1) (rule-target 18 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 18 3) (= (rule-target 18 3) RETURN))
        (and (reaches-return 1 18) (not (reaches 1 18 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 18 3) (isGo (rule-target 18 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 18 3)) (rule (rule-target 18 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 18 3))) (reaches 1 18 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 18 3)) (isGo (rule-target 18 3)))
        (not (reaches 1 (chain (rule-target 18 3)) (rule (rule-target 18 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 19 0) (terminating (rule-target 19 0))) 
        (and (not (reaches 0 19 (+ 0 1))) (= (terminates-with 0) (rule-target 19 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 19 0) (= (rule-target 19 0) RETURN))
        (and (reaches-return 0 19) (not (reaches 0 19 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 19 0) (isGo (rule-target 19 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 19 0)) (rule (rule-target 19 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 19 0))) (reaches 0 19 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 19 0)) (isGo (rule-target 19 0)))
        (not (reaches 0 (chain (rule-target 19 0)) (rule (rule-target 19 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 19 1) (terminating (rule-target 19 1))) 
        (and (not (reaches 0 19 (+ 1 1))) (= (terminates-with 0) (rule-target 19 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 19 1) (= (rule-target 19 1) RETURN))
        (and (reaches-return 0 19) (not (reaches 0 19 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 19 1) (isGo (rule-target 19 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 19 1)) (rule (rule-target 19 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 19 1))) (reaches 0 19 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 19 1)) (isGo (rule-target 19 1)))
        (not (reaches 0 (chain (rule-target 19 1)) (rule (rule-target 19 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 19 0) (terminating (rule-target 19 0))) 
        (and (not (reaches 1 19 (+ 0 1))) (= (terminates-with 1) (rule-target 19 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 19 0) (= (rule-target 19 0) RETURN))
        (and (reaches-return 1 19) (not (reaches 1 19 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 19 0) (isGo (rule-target 19 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 19 0)) (rule (rule-target 19 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 19 0))) (reaches 1 19 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 19 0)) (isGo (rule-target 19 0)))
        (not (reaches 1 (chain (rule-target 19 0)) (rule (rule-target 19 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 19 1) (terminating (rule-target 19 1))) 
        (and (not (reaches 1 19 (+ 1 1))) (= (terminates-with 1) (rule-target 19 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 19 1) (= (rule-target 19 1) RETURN))
        (and (reaches-return 1 19) (not (reaches 1 19 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 19 1) (isGo (rule-target 19 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 19 1)) (rule (rule-target 19 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 19 1))) (reaches 1 19 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 19 1)) (isGo (rule-target 19 1)))
        (not (reaches 1 (chain (rule-target 19 1)) (rule (rule-target 19 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 0) (terminating (rule-target 20 0))) 
        (and (not (reaches 0 20 (+ 0 1))) (= (terminates-with 0) (rule-target 20 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 0) (= (rule-target 20 0) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 0) (isGo (rule-target 20 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 0)) (rule (rule-target 20 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 0))) (reaches 0 20 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 0)) (isGo (rule-target 20 0)))
        (not (reaches 0 (chain (rule-target 20 0)) (rule (rule-target 20 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 1) (terminating (rule-target 20 1))) 
        (and (not (reaches 0 20 (+ 1 1))) (= (terminates-with 0) (rule-target 20 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 1) (= (rule-target 20 1) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 1) (isGo (rule-target 20 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 1)) (rule (rule-target 20 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 1))) (reaches 0 20 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 1)) (isGo (rule-target 20 1)))
        (not (reaches 0 (chain (rule-target 20 1)) (rule (rule-target 20 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 2) (terminating (rule-target 20 2))) 
        (and (not (reaches 0 20 (+ 2 1))) (= (terminates-with 0) (rule-target 20 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 2) (= (rule-target 20 2) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 2) (isGo (rule-target 20 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 2)) (rule (rule-target 20 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 2))) (reaches 0 20 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 2)) (isGo (rule-target 20 2)))
        (not (reaches 0 (chain (rule-target 20 2)) (rule (rule-target 20 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 3) (terminating (rule-target 20 3))) 
        (and (not (reaches 0 20 (+ 3 1))) (= (terminates-with 0) (rule-target 20 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 3) (= (rule-target 20 3) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 3) (isGo (rule-target 20 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 3)) (rule (rule-target 20 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 3))) (reaches 0 20 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 3)) (isGo (rule-target 20 3)))
        (not (reaches 0 (chain (rule-target 20 3)) (rule (rule-target 20 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 4) (terminating (rule-target 20 4))) 
        (and (not (reaches 0 20 (+ 4 1))) (= (terminates-with 0) (rule-target 20 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 4) (= (rule-target 20 4) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 4) (isGo (rule-target 20 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 4)) (rule (rule-target 20 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 4))) (reaches 0 20 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 4)) (isGo (rule-target 20 4)))
        (not (reaches 0 (chain (rule-target 20 4)) (rule (rule-target 20 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 20 5) (terminating (rule-target 20 5))) 
        (and (not (reaches 0 20 (+ 5 1))) (= (terminates-with 0) (rule-target 20 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 20 5) (= (rule-target 20 5) RETURN))
        (and (reaches-return 0 20) (not (reaches 0 20 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 20 5) (isGo (rule-target 20 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 20 5)) (rule (rule-target 20 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 20 5))) (reaches 0 20 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 20 5)) (isGo (rule-target 20 5)))
        (not (reaches 0 (chain (rule-target 20 5)) (rule (rule-target 20 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 0) (terminating (rule-target 20 0))) 
        (and (not (reaches 1 20 (+ 0 1))) (= (terminates-with 1) (rule-target 20 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 0) (= (rule-target 20 0) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 0) (isGo (rule-target 20 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 0)) (rule (rule-target 20 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 0))) (reaches 1 20 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 0)) (isGo (rule-target 20 0)))
        (not (reaches 1 (chain (rule-target 20 0)) (rule (rule-target 20 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 1) (terminating (rule-target 20 1))) 
        (and (not (reaches 1 20 (+ 1 1))) (= (terminates-with 1) (rule-target 20 1)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 1) (= (rule-target 20 1) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 1 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 1) (isGo (rule-target 20 1)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 1)) (rule (rule-target 20 1)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 1))) (reaches 1 20 (+ 1 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 1)) (isGo (rule-target 20 1)))
        (not (reaches 1 (chain (rule-target 20 1)) (rule (rule-target 20 1))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 2) (terminating (rule-target 20 2))) 
        (and (not (reaches 1 20 (+ 2 1))) (= (terminates-with 1) (rule-target 20 2)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 2) (= (rule-target 20 2) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 2 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 2) (isGo (rule-target 20 2)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 2)) (rule (rule-target 20 2)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 2))) (reaches 1 20 (+ 2 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 2)) (isGo (rule-target 20 2)))
        (not (reaches 1 (chain (rule-target 20 2)) (rule (rule-target 20 2))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 3) (terminating (rule-target 20 3))) 
        (and (not (reaches 1 20 (+ 3 1))) (= (terminates-with 1) (rule-target 20 3)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 3) (= (rule-target 20 3) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 3 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 3) (isGo (rule-target 20 3)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 3)) (rule (rule-target 20 3)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 3))) (reaches 1 20 (+ 3 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 3)) (isGo (rule-target 20 3)))
        (not (reaches 1 (chain (rule-target 20 3)) (rule (rule-target 20 3))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 4) (terminating (rule-target 20 4))) 
        (and (not (reaches 1 20 (+ 4 1))) (= (terminates-with 1) (rule-target 20 4)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 4) (= (rule-target 20 4) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 4 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 4) (isGo (rule-target 20 4)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 4)) (rule (rule-target 20 4)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 4))) (reaches 1 20 (+ 4 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 4)) (isGo (rule-target 20 4)))
        (not (reaches 1 (chain (rule-target 20 4)) (rule (rule-target 20 4))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 20 5) (terminating (rule-target 20 5))) 
        (and (not (reaches 1 20 (+ 5 1))) (= (terminates-with 1) (rule-target 20 5)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 20 5) (= (rule-target 20 5) RETURN))
        (and (reaches-return 1 20) (not (reaches 1 20 (+ 5 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 20 5) (isGo (rule-target 20 5)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 20 5)) (rule (rule-target 20 5)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 20 5))) (reaches 1 20 (+ 5 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 20 5)) (isGo (rule-target 20 5)))
        (not (reaches 1 (chain (rule-target 20 5)) (rule (rule-target 20 5))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 0 21 0) (terminating (rule-target 21 0))) 
        (and (not (reaches 0 21 (+ 0 1))) (= (terminates-with 0) (rule-target 21 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 0 21 0) (= (rule-target 21 0) RETURN))
        (and (reaches-return 0 21) (not (reaches 0 21 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 0 21 0) (isGo (rule-target 21 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 0 (chain (rule-target 21 0)) (rule (rule-target 21 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 0 (chain (rule-target 21 0))) (reaches 0 21 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 0 21 0)) (isGo (rule-target 21 0)))
        (not (reaches 0 (chain (rule-target 21 0)) (rule (rule-target 21 0))))
    )
)(assert (=> 
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
))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule 1 21 0) (terminating (rule-target 21 0))) 
        (and (not (reaches 1 21 (+ 0 1))) (= (terminates-with 1) (rule-target 21 0)))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule 1 21 0) (= (rule-target 21 0) RETURN))
        (and (reaches-return 1 21) (not (reaches 1 21 (+ 0 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule 1 21 0) (isGo (rule-target 21 0)))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches 1 (chain (rule-target 21 0)) (rule (rule-target 21 0)))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from 1 (chain (rule-target 21 0))) (reaches 1 21 (+ 0 1)))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule 1 21 0)) (isGo (rule-target 21 0)))
        (not (reaches 1 (chain (rule-target 21 0)) (rule (rule-target 21 0))))
    )
)

(assert (=> (valid-packet 0) (= (and (not SYN) ACK) (matches-criteria 0 0 0))))(assert (=> (valid-packet 1) (= (and (not SYN) ACK) (matches-criteria 1 0 0))))
(assert (=> (valid-packet 0) (= (and (not SYN) (not ACK)) (matches-criteria 0 0 1))))(assert (=> (valid-packet 1) (= (and (not SYN) (not ACK)) (matches-criteria 1 0 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 37) (= source_port 97)) (matches-criteria 0 0 2))))(assert (=> (valid-packet 1) (= (and (= protocol 37) (= source_port 97)) (matches-criteria 1 0 2))))
(assert (=> (valid-packet 0) (= (= destination_port 89) (matches-criteria 0 0 3))))(assert (=> (valid-packet 1) (= (= destination_port 89) (matches-criteria 1 0 3))))
(assert (=> (valid-packet 0) (= (= destination_port 4) (matches-criteria 0 0 4))))(assert (=> (valid-packet 1) (= (= destination_port 4) (matches-criteria 1 0 4))))
(assert (=> (valid-packet 0) (= (= destination_port 78) (matches-criteria 0 0 5))))(assert (=> (valid-packet 1) (= (= destination_port 78) (matches-criteria 1 0 5))))
(assert (=> (valid-packet 0) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 0 0 6))))(assert (=> (valid-packet 1) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 1 0 6))))
(assert (=> (valid-packet 0) (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 0 7))))(assert (=> (valid-packet 1) (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 0 7))))
(assert (=> (valid-packet 0) (matches-criteria 0 0 8)))(assert (=> (valid-packet 1) (matches-criteria 1 0 8)))
(assert (=> (valid-packet 0) (matches-criteria 0 0 9)))(assert (=> (valid-packet 1) (matches-criteria 1 0 9)))
(assert (=> (valid-packet 0) (= (and (= protocol 17) (= source_port 98)) (matches-criteria 0 0 10))))(assert (=> (valid-packet 1) (= (and (= protocol 17) (= source_port 98)) (matches-criteria 1 0 10))))
(assert (=> (valid-packet 0) (= (= destination_port 9) (matches-criteria 0 1 0))))(assert (=> (valid-packet 1) (= (= destination_port 9) (matches-criteria 1 1 0))))
(assert (=> (valid-packet 0) (= (= protocol 0) (matches-criteria 0 1 1))))(assert (=> (valid-packet 1) (= (= protocol 0) (matches-criteria 1 1 1))))
(assert (=> (valid-packet 0) (= (= protocol 22) (matches-criteria 0 1 2))))(assert (=> (valid-packet 1) (= (= protocol 22) (matches-criteria 1 1 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 6)) (matches-criteria 0 1 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 6)) (matches-criteria 1 1 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 0 1 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 1 1 4))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 0 1 5))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 1 1 5))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 0 1 6))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 1 1 6))))
(assert (=> (valid-packet 0) (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 0 1 7))))(assert (=> (valid-packet 1) (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 1 1 7))))
(assert (=> (valid-packet 0) (= (and (= source_port 10) (= protocol 88)) (matches-criteria 0 1 8))))(assert (=> (valid-packet 1) (= (and (= source_port 10) (= protocol 88)) (matches-criteria 1 1 8))))
(assert (=> (valid-packet 0) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 0 1 9))))(assert (=> (valid-packet 1) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 1 1 9))))
(assert (=> (valid-packet 0) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 0 1 10))))(assert (=> (valid-packet 1) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 1 1 10))))
(assert (=> (valid-packet 0) (= (and (= source_port 10) (= protocol 87)) (matches-criteria 0 1 11))))(assert (=> (valid-packet 1) (= (and (= source_port 10) (= protocol 87)) (matches-criteria 1 1 11))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 0 1 12))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 1 1 12))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 0 1 13))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 1 1 13))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 0 1 14))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 1 1 14))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 0 1 15))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 1 1 15))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 2 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 2 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 2 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 2 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 2 2))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 2 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 2 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 2 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 3 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 3 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 3 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 3 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 3 2))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 3 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 3 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 3 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 4 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 4 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 4 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 4 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 4 2))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 4 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 4 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 4 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 5 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 5 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 5 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 5 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 5 2))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 5 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 5 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 5 3))))
(assert (=> (valid-packet 0) (= (= protocol 17) (matches-criteria 0 6 0))))(assert (=> (valid-packet 1) (= (= protocol 17) (matches-criteria 1 6 0))))
(assert (=> (valid-packet 0) (= (not (= protocol 4)) (matches-criteria 0 7 0))))(assert (=> (valid-packet 1) (= (not (= protocol 4)) (matches-criteria 1 7 0))))
(assert (=> (valid-packet 0) (matches-criteria 0 7 1)))(assert (=> (valid-packet 1) (matches-criteria 1 7 1)))
(assert (=> (valid-packet 0) (matches-criteria 0 7 2)))(assert (=> (valid-packet 1) (matches-criteria 1 7 2)))
(assert (=> (valid-packet 0) (= (= protocol 0) (matches-criteria 0 8 0))))(assert (=> (valid-packet 1) (= (= protocol 0) (matches-criteria 1 8 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 9 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 9 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 9 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 9 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 9 2))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 9 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 9 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 9 3))))

(assert (=> (valid-packet 0) (= (and (not SYN) ACK) (matches-criteria 0 11 0))))(assert (=> (valid-packet 1) (= (and (not SYN) ACK) (matches-criteria 1 11 0))))
(assert (=> (valid-packet 0) (= (and (not SYN) (not ACK)) (matches-criteria 0 11 1))))(assert (=> (valid-packet 1) (= (and (not SYN) (not ACK)) (matches-criteria 1 11 1))))
(assert (=> (valid-packet 0) (= (and (= protocol 37) (= source_port 97)) (matches-criteria 0 11 2))))(assert (=> (valid-packet 1) (= (and (= protocol 37) (= source_port 97)) (matches-criteria 1 11 2))))
(assert (=> (valid-packet 0) (= (= destination_port 89) (matches-criteria 0 11 3))))(assert (=> (valid-packet 1) (= (= destination_port 89) (matches-criteria 1 11 3))))
(assert (=> (valid-packet 0) (= (= destination_port 4) (matches-criteria 0 11 4))))(assert (=> (valid-packet 1) (= (= destination_port 4) (matches-criteria 1 11 4))))
(assert (=> (valid-packet 0) (= (= destination_port 78) (matches-criteria 0 11 5))))(assert (=> (valid-packet 1) (= (= destination_port 78) (matches-criteria 1 11 5))))
(assert (=> (valid-packet 0) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 0 11 6))))(assert (=> (valid-packet 1) (= (and (= protocol 1) (and (= destination_port 45) (not (= source_port 90)))) (matches-criteria 1 11 6))))
(assert (=> (valid-packet 0) (= (and (= protocol 17) (= source_port 96)) (matches-criteria 0 11 7))))(assert (=> (valid-packet 1) (= (and (= protocol 17) (= source_port 96)) (matches-criteria 1 11 7))))
(assert (=> (valid-packet 0) (matches-criteria 0 11 8)))(assert (=> (valid-packet 1) (matches-criteria 1 11 8)))
(assert (=> (valid-packet 0) (matches-criteria 0 11 9)))(assert (=> (valid-packet 1) (matches-criteria 1 11 9)))
(assert (=> (valid-packet 0) (= (and (= protocol 17) (= source_port 98)) (matches-criteria 0 11 10))))(assert (=> (valid-packet 1) (= (and (= protocol 17) (= source_port 98)) (matches-criteria 1 11 10))))
(assert (=> (valid-packet 0) (= (= destination_port 9) (matches-criteria 0 12 0))))(assert (=> (valid-packet 1) (= (= destination_port 9) (matches-criteria 1 12 0))))
(assert (=> (valid-packet 0) (= (= protocol 0) (matches-criteria 0 12 1))))(assert (=> (valid-packet 1) (= (= protocol 0) (matches-criteria 1 12 1))))
(assert (=> (valid-packet 0) (= (= protocol 22) (matches-criteria 0 12 2))))(assert (=> (valid-packet 1) (= (= protocol 22) (matches-criteria 1 12 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 6)) (matches-criteria 0 12 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 6)) (matches-criteria 1 12 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 0 12 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not ACK) (and (not FIN) (and (not RST) (and (not SYN) (and (not URG) (= destination_port 32)))))))) (matches-criteria 1 12 4))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 0 12 5))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (and (not ACK) (= destination_port 32))))) (matches-criteria 1 12 5))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 0 12 6))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria 1 12 6))))
(assert (=> (valid-packet 0) (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 0 12 7))))(assert (=> (valid-packet 1) (= (and SYN (and (= protocol 7) (not ACK))) (matches-criteria 1 12 7))))
(assert (=> (valid-packet 0) (= (and (= source_port 10) (= protocol 88)) (matches-criteria 0 12 8))))(assert (=> (valid-packet 1) (= (and (= source_port 10) (= protocol 88)) (matches-criteria 1 12 8))))
(assert (=> (valid-packet 0) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 0 12 9))))(assert (=> (valid-packet 1) (= (and (= destination_port 10) (= protocol 88)) (matches-criteria 1 12 9))))
(assert (=> (valid-packet 0) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 0 12 10))))(assert (=> (valid-packet 1) (= (and (= destination_port 10) (= protocol 87)) (matches-criteria 1 12 10))))
(assert (=> (valid-packet 0) (= (and (= source_port 10) (= protocol 87)) (matches-criteria 0 12 11))))(assert (=> (valid-packet 1) (= (and (= source_port 10) (= protocol 87)) (matches-criteria 1 12 11))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 0 12 12))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria 1 12 12))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 0 12 13))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and (not SYN) (= destination_port 5)))) (matches-criteria 1 12 13))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 0 12 14))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and ACK (= destination_port 5)))) (matches-criteria 1 12 14))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 0 12 15))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (and (= source_port 4) (and FIN (= destination_port 5)))) (matches-criteria 1 12 15))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 13 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 13 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 13 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 13 1))))
(assert (=> (valid-packet 0) (= (= destination_port 100) (matches-criteria 0 13 2))))(assert (=> (valid-packet 1) (= (= destination_port 100) (matches-criteria 1 13 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 13 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 13 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 13 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 13 4))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 14 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 14 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 14 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 14 1))))
(assert (=> (valid-packet 0) (= (= destination_port 100) (matches-criteria 0 14 2))))(assert (=> (valid-packet 1) (= (= destination_port 100) (matches-criteria 1 14 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 14 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 14 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 14 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 14 4))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 15 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 15 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 15 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 15 1))))
(assert (=> (valid-packet 0) (= (= destination_port 100) (matches-criteria 0 15 2))))(assert (=> (valid-packet 1) (= (= destination_port 100) (matches-criteria 1 15 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 15 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 15 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 15 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 15 4))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 16 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 16 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 16 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 16 1))))
(assert (=> (valid-packet 0) (= (= destination_port 100) (matches-criteria 0 16 2))))(assert (=> (valid-packet 1) (= (= destination_port 100) (matches-criteria 1 16 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 16 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 16 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 16 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 16 4))))
(assert (=> (valid-packet 0) (= (= protocol 17) (matches-criteria 0 17 0))))(assert (=> (valid-packet 1) (= (= protocol 17) (matches-criteria 1 17 0))))
(assert (=> (valid-packet 0) (= (not (= protocol 4)) (matches-criteria 0 18 0))))(assert (=> (valid-packet 1) (= (not (= protocol 4)) (matches-criteria 1 18 0))))
(assert (=> (valid-packet 0) (matches-criteria 0 18 1)))(assert (=> (valid-packet 1) (matches-criteria 1 18 1)))
(assert (=> (valid-packet 0) (matches-criteria 0 18 2)))(assert (=> (valid-packet 1) (matches-criteria 1 18 2)))
(assert (=> (valid-packet 0) (= (= protocol 0) (matches-criteria 0 19 0))))(assert (=> (valid-packet 1) (= (= protocol 0) (matches-criteria 1 19 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 0 20 0))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 7)) (matches-criteria 1 20 0))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 0 20 1))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= source_port 8)) (matches-criteria 1 20 1))))
(assert (=> (valid-packet 0) (= (= destination_port 100) (matches-criteria 0 20 2))))(assert (=> (valid-packet 1) (= (= destination_port 100) (matches-criteria 1 20 2))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 0 20 3))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 7)) (matches-criteria 1 20 3))))
(assert (=> (valid-packet 0) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 0 20 4))))(assert (=> (valid-packet 1) (= (and (= protocol 6) (= destination_port 8)) (matches-criteria 1 20 4))))

(assert (or (= chain0 2)(= chain0 3)(= chain0 4)(= chain0 5)(= chain0 9)))(assert (or (= chain1 13)(= chain1 14)(= chain1 15)(= chain1 16)(= chain1 20)))(assert (reaches 0 chain0 0))(assert (reaches 1 chain1 0))(assert (not (and (or (= (terminates-with 0) (terminates-with 1)) (and (reaches-end 0 chain0) (reaches-end 1 chain1)) (= destination_port 100)) (=> (= destination_port 100) (= (terminates-with 1) ACCEPT)))))(check-sat-using (then (repeat (then simplify (repeat qe))) smt))
(get-model)