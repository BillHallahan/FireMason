(declare-datatypes () ((Target ACCEPT DROP RETURN (GO (chain Int) (rule Int)) NONE)))

(declare-fun matches-criteria (Int Int) Bool)
(declare-fun rule-target (Int Int) Target)
(declare-fun reaches (Int Int) Bool)
(declare-fun reaches-return (Int) Bool)
(declare-fun reaches-end (Int) Bool)
(declare-fun returns-from (Int) Bool)

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