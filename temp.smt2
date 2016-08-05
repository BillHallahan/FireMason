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

(assert 
    (forall ((p Int) (c1 Int) (c2 Int)) 
        (=> 
            (and (not (= c1 c2)) (valid-packet p) (valid-chain c1) (valid-chain c2) (top-level-chain c1) (top-level-chain c2) (reaches p c1 0)) 
            (not (reaches p c2 0))
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
    (and (valid-rule c r) (valid-packet p) (<= 1 r) (reaches p c r))
    (reaches p c (- r 1))
)))

(assert (forall ((c Int) (r Int) (p Int)) (=> 
    (and (valid-rule c r) (valid-packet p) (reaches p c r) (not (matches-criteria p c r))) 
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
)
(assert (= (chain-length 0) 1))(assert (= (chain-length 1) 4))(assert (= (chain-length 2) 1))(assert (= (chain-length 3) 4))(assert (= (chain-length 4) 0))
(assert (= num-of-chains 5))
(declare-fun source_port () Int)
(assert (<= 0 source_port))
(assert (<= source_port 65535))
(declare-fun destination_port () Int)
(assert (<= 0 destination_port))
(assert (<= destination_port 65535))

(assert (= (rule-target 0 0) (GO 1 0)))
(assert (= (rule-target 1 0) DROP))

(assert (= (rule-target 1 1) DROP))

(assert (= (rule-target 1 2) DROP))

(assert (= (rule-target 1 3) DROP))

(assert (= (rule-target 2 0) (GO 3 0)))
(assert (= (rule-target 3 0) DROP))

(assert (= (rule-target 3 1) DROP))

(assert (= (rule-target 3 2) DROP))

(assert (= (rule-target 3 3) DROP))



(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 0 0))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 7) (matches-criteria p 1 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 9) (matches-criteria p 1 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 7) (matches-criteria p 1 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 9) (matches-criteria p 1 3)))))
(assert (forall ((p Int)) (=> (valid-packet p) (matches-criteria p 2 0))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 7) (matches-criteria p 3 0)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= source_port 9) (matches-criteria p 3 1)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 7) (matches-criteria p 3 2)))))
(assert (forall ((p Int)) (=> (valid-packet p) (= (= destination_port 9) (matches-criteria p 3 3)))))

(assert (reaches 0 0 0)) (assert (= num-of-packets 1)) (assert (reaches 0 1 4)) (assert (matches-rule 0 0 1) )(check-sat)
(get-model)