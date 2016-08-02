(declare-datatypes () ((Target ACCEPT DROP RETURN (GO (chain Int) (rule Int)) NONE)))

(declare-fun matches-criteria (Int Int Int) Bool)
(declare-fun rule-target (Int Int) Target)
(declare-fun reaches (Int Int Int) Bool)
(declare-fun reaches-return (Int Int) Bool)
(declare-fun reaches-end (Int Int) Bool)
(declare-fun returns-from (Int Int) Bool)

(declare-const num-of-packets Int)
(declare-const num-of-chains Int)
(declare-fun chain-length (Int) Int)

(define-fun valid-packet ((p Int)) Bool
    (and (<= 0 p) (< p num-of-packets)))

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

;These two rules enforce that a packet can only reach up to the end of a chain, not past it,
;and that it must reach rule (r - 1) to reach rule r
(assert (forall ((c Int) (p Int)) (=> (and (valid-chain c) (valid-packet p)) (not (reaches p c (+ (chain-length c) 1))))))
(assert (forall ((c Int) (r Int) (p Int)) (=> (and (valid-rule c r) (valid-packet p) (<= 1 r) (reaches p c r)) (reaches p c (- r 1)))))

(assert (forall ((c Int) (r Int) (p Int)) (=> (and (valid-rule c r) (valid-packet p) (reaches p c r) (not (matches-criteria p c r))) (reaches p c (+ r 1)))))
(assert (forall ((c Int) (p Int)) (= (and (valid-chain c) (valid-packet p) (reaches p c (chain-length c))) (reaches-end p c))))

(assert (forall ((c Int) (p Int)) (= (or (reaches-return p c) (reaches-end p c)) (returns-from p c))))

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (forall ((p Int) (c Int) (r Int)) 
        (=> 
            (and (matches-rule p c r) (terminating (rule-target c r))) 
            (not (reaches p c (+ r 1)))
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
                (=> (not (returns-from p (chain (rule-target c r)))) (not (reaches p c (+ r 1))))
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
)
(assert (= (chain-length 0) 1))(assert (= (chain-length 1) 6))(assert (= (chain-length 2) 6))(assert (= (chain-length 3) 6))(assert (= (chain-length 4) 2))(assert (= (chain-length 5) 1))(assert (= (chain-length 6) 6))(assert (= (chain-length 7) 0))
(assert (= num-of-chains 8))
(declare-fun protocol () Int)
(assert (<= 0 protocol))
(assert (<= protocol 255))
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))
(declare-fun v10 (Int) Bool)

(assert (= (rule-target 0 0) (GO 1 0)))
(assert (= (rule-target 1 0) DROP))

(assert (= (rule-target 1 1) DROP))


(assert (= (rule-target 1 3) (GO 3 0)))

(assert (= (rule-target 1 4) DROP))

(assert (= (rule-target 1 5) (GO 2 0)))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 2 0)) (not (v10 p)))))
(assert (= (rule-target 2 0) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 2 1)) (v10 p))))
(assert (= (rule-target 2 1) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 2 2)) (v10 p))))
(assert (= (rule-target 2 2) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 2 3)) (v10 p))))
(assert (= (rule-target 2 3) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 2 4)) (v10 p))))
(assert (= (rule-target 2 4) NONE))

(assert (= (rule-target 2 5) DROP))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 3 0)) (not (v10 p)))))
(assert (= (rule-target 3 0) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 3 1)) (v10 p))))
(assert (= (rule-target 3 1) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 3 2)) (v10 p))))
(assert (= (rule-target 3 2) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 3 3)) (v10 p))))
(assert (= (rule-target 3 3) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 3 4)) (v10 p))))
(assert (= (rule-target 3 4) NONE))

(assert (= (rule-target 3 5) DROP))

(assert (= (rule-target 4 0) (GO 6 0)))
(assert (= (rule-target 4 1) (GO 5 0)))
(assert (= (rule-target 5 0) DROP))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 6 0)) (not (v10 p)))))
(assert (= (rule-target 6 0) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 6 1)) (v10 p))))
(assert (= (rule-target 6 1) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 6 2)) (v10 p))))
(assert (= (rule-target 6 2) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 6 3)) (v10 p))))
(assert (= (rule-target 6 3) NONE))

(assert (forall ((p Int)) (=> (and (valid-packet p) (matches-rule p 6 4)) (v10 p))))
(assert (= (rule-target 6 4) NONE))

(assert (= (rule-target 6 5) DROP))



(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 0 0))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 1 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 22) (matches-criteria p 1 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= source_port 6)) (matches-criteria p 1 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (= destination_port 5)) (matches-criteria p 1 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (<= 4 source_port ) (<= source_port 8))) (matches-criteria p 1 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (and (= source_port 4) (= destination_port 5))) (matches-criteria p 1 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (not (= source_port 7)) (and (not (= source_port 8)) (and (not (= destination_port 7)) (not (= destination_port 8))))) (matches-criteria p 2 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 7) (matches-criteria p 2 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 8) (matches-criteria p 2 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 7) (matches-criteria p 2 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 8) (matches-criteria p 2 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (v10 p)) (matches-criteria p 2 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (not (= source_port 7)) (and (not (= source_port 8)) (and (not (= destination_port 7)) (not (= destination_port 8))))) (matches-criteria p 3 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 7) (matches-criteria p 3 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 8) (matches-criteria p 3 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 7) (matches-criteria p 3 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 8) (matches-criteria p 3 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (v10 p)) (matches-criteria p 3 5)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 4 0))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 4 1))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= protocol 0) (matches-criteria p 5 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (not (= source_port 7)) (and (not (= source_port 8)) (and (not (= destination_port 7)) (not (= destination_port 8))))) (matches-criteria p 6 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 7) (matches-criteria p 6 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 8) (matches-criteria p 6 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 7) (matches-criteria p 6 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 8) (matches-criteria p 6 4)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (and (= protocol 6) (v10 p)) (matches-criteria p 6 5)))))

(assert (not (reaches 0 4 0))) (assert (reaches 0 5 0))(check-sat)
(get-model)