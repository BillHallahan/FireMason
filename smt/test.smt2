(declare-datatypes () ((Target ACCEPT DROP RETURN (GO (chain Int) (rule Int)) NONE)))

(declare-fun matches-criteria (Int Int) Bool)
(declare-fun rule-target (Int Int) Target)
(declare-fun reaches (Int Int) Bool)
(declare-fun reaches-return (Int) Bool)
(declare-fun reaches-end (Int) Bool)
(declare-fun returns-from (Int) Bool)

(declare-const start-chain Int)
(declare-const start-rule Int)
(declare-const num-of-chains Int)
(declare-fun chain-length (Int) Int)

(define-fun valid-chain ((c Int)) Bool
    (and (<= 0 c) (< c num-of-chains))
)

(define-fun valid-rule ((c Int) (r Int)) Bool
    (and 
        (valid-chain c)
        (<= 0 r)
        (<= r (chain-length c))
    )
)

(define-fun matches-rule((c Int) (r Int)) Bool
   (and (valid-rule c r) (matches-criteria c r) (reaches c r)))

(define-fun terminating ((t Target)) Bool 
    (or (= t ACCEPT) (= t DROP))
)


(define-fun isGo ((t Target)) Bool
    (exists ((a Int) (b Int)) (= t (GO a b)))
)

(assert (reaches start-chain start-rule))

;These two rules enforce that a packet can only reach up to the end of a chain, not past it,
;and that it must reach rule (r - 1) to reach rule r
(assert (forall ((c Int)) (=> (valid-chain c) (not (reaches c (+ (chain-length c) 1))))))
(assert (forall ((c Int) (r Int)) (=> (and (valid-rule c r) (<= 1 r) (reaches c r)) (reaches c (- r 1)))))

(assert (forall ((c Int) (r Int)) (=> (and (valid-rule c r) (reaches c r) (not (matches-criteria c r))) (reaches c (+ r 1)))))
(assert (forall ((c Int)) (= (and (valid-chain c) (< c num-of-chains) (reaches c (chain-length c))) (reaches-end c))))

(assert (forall ((c Int)) (= (or (reaches-return c) (reaches-end c)) (returns-from c))))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (forall ((c Int) (r Int)) 
        (=> 
            (and (matches-rule c r) (terminating (rule-target c r))) 
            (not (reaches c (+ r 1)))
        )
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (forall ((c Int) (r Int)) 
        (=>
            (and (matches-rule c r) (= (rule-target c r) RETURN))
            (and (reaches-return c) (not (reaches c (+ r 1))))
        )
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (forall ((c Int) (r Int))
        (=>
            (and (matches-rule c r) (isGo (rule-target c r)))
            (and
                ;We go to the appropriate rule in the new chain
                (reaches (chain (rule-target c r)) (rule (rule-target c r)))
                ;If we don't return from the new chain, we don't continue in the old chain
                (=> (not (returns-from (chain (rule-target c r)))) (not (reaches c (+ r 1))))
            )
        )
    )
)
(assert (= (chain-length 0) 0))(assert (= (chain-length 1) 10))(assert (= (chain-length 2) 1))(assert (= (chain-length 3) 9))(assert (= (chain-length 4) 1))(assert (= (chain-length 5) 0))
(assert (= start-chain 1))
(assert (= start-rule 0))
(assert (= num-of-chains 6))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun v1 () Bool)
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun v0 () Bool)
(declare-fun v11 () Bool)
(declare-fun v14 () Bool)
(declare-fun v17 () Bool)


(assert (=> (matches-rule 1 0) (not v1)))
(assert (= (rule-target 1 0) NONE))

(assert (=> (matches-rule 1 1) v1))
(assert (= (rule-target 1 1) NONE))

(assert (=> (matches-rule 1 2) v1))
(assert (= (rule-target 1 2) NONE))

(assert (=> (matches-rule 1 3) v1))
(assert (= (rule-target 1 3) NONE))

(assert (=> (matches-rule 1 4) (not v0)))
(assert (= (rule-target 1 4) NONE))

(assert (=> (matches-rule 1 5) v0))
(assert (= (rule-target 1 5) NONE))

(assert (= (rule-target 1 6) (GO 4 0)))

(assert (= (rule-target 1 7) (GO 3 0)))

(assert (= (rule-target 1 8) (GO 2 0)))

(assert (= (rule-target 1 9) DROP))
(assert (= (rule-target 2 0) DROP))

(assert (=> (matches-rule 3 0) (not v11)))
(assert (= (rule-target 3 0) NONE))

(assert (=> (matches-rule 3 1) v11))
(assert (= (rule-target 3 1) NONE))


(assert (=> (matches-rule 3 3) (not v14)))
(assert (= (rule-target 3 3) NONE))

(assert (=> (matches-rule 3 4) v14))
(assert (= (rule-target 3 4) NONE))

(assert (= (rule-target 3 5) DROP))

(assert (=> (matches-rule 3 6) (not v17)))
(assert (= (rule-target 3 6) NONE))

(assert (=> (matches-rule 3 7) v17))
(assert (= (rule-target 3 7) NONE))

(assert (= (rule-target 3 8) ACCEPT))

(assert (= (rule-target 4 0) DROP))




(assert (= (and (not (= destination_port 5)) (and (not (= destination_port 6)) (not (= destination_port 8)))) (matches-criteria 1 0)))
(assert (= (= destination_port 5) (matches-criteria 1 1)))
(assert (= (= destination_port 6) (matches-criteria 1 2)))
(assert (= (= destination_port 8) (matches-criteria 1 3)))
(assert (= v1 (matches-criteria 1 4)))
(assert (= (and (not (= destination_port 5)) (and (not (= destination_port 6)) (not (= destination_port 8)))) (matches-criteria 1 5)))
(assert (= (and (= protocol 6) v0) (matches-criteria 1 6)))
(assert (= (= protocol 2) (matches-criteria 1 7)))
(assert (= (= protocol 3) (matches-criteria 1 8)))
(assert (matches-criteria 1 9))
(assert (= (= protocol 33) (matches-criteria 2 0)))
(assert (= (not (= destination_port 2)) (matches-criteria 3 0)))
(assert (= (= destination_port 2) (matches-criteria 3 1)))
(assert (= (and (= protocol 22) v11) (matches-criteria 3 2)))
(assert (= (not (= destination_port 2)) (matches-criteria 3 3)))
(assert (= (= destination_port 2) (matches-criteria 3 4)))
(assert (= (and (= protocol 22) v14) (matches-criteria 3 5)))
(assert (= (not (= destination_port 2)) (matches-criteria 3 6)))
(assert (= (= destination_port 2) (matches-criteria 3 7)))
(assert (= (and (= protocol 22) v17) (matches-criteria 3 8)))
(assert (= (= protocol 11) (matches-criteria 4 0)))

(assert (matches-rule 3 8))

(check-sat)
(get-model)