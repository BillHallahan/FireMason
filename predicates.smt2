(set-option :produce-models true)
(set-option :smt.mbqi true)



(declare-datatypes () ((Target ACCEPT DROP (GO (chain Int) (rule Int)))))


(declare-const start-chain Int)
(declare-const start-rule Int)

(declare-const num-of-chains Int)
(declare-const max-chain-length Int)
(declare-fun chain-length (Int) Int)

(declare-const packet-fate Target)

;-------
(assert (= start-chain 0))
(assert (= start-rule 0))

(assert (= num-of-chains 3))
(assert (= (chain-length 0) 4))
(assert (= (chain-length 1) 1))
(assert (= (chain-length 2) 2))

(assert (= max-chain-length 6))

;-------



(define-fun terminating ((t Target)) Bool 
    (or (= t ACCEPT) (= t DROP))
)


(define-fun isGo ((t Target)) Bool
    (exists ((a Int) (b Int)) (= t (GO a b)))
)


(define-fun valid-rule ((ch Int) (r Int)) Bool
    (and 
        (<= 0 ch)
        (< ch num-of-chains)
        (<= 0 r)
        (< r (chain-length ch))
        (< r max-chain-length)
    )
)

(declare-fun rule-target (Int Int) Target)
(declare-fun matches-criteria (Int Int) Bool)


(declare-fun reaches-end (Int) Bool)
(declare-fun reaches-go (Int Int) Bool)




(define-fun-rec reaches ((ch Int) (r Int)) Bool
    (and 
        (valid-rule ch r)
        (or
            (and (= ch start-chain) (= r start-rule))
            (and 
                (reaches ch (- r 1))
                (or 
                    (and (not (terminating (rule-target ch (- r 1)))) (not (isGo (rule-target ch (- r 1)))))
                    (not (matches-criteria ch (- r 1)))
                    (and 
                        (isGo (rule-target ch (- r 1))) 
                        (reaches-end (chain (rule-target ch (- r 1))))
                    )
                )
            )
            ;(reaches-go ch r)
        )
    ) 
)



(define-fun matches-rule ((ch Int) (r Int)) Bool
   (and (matches-criteria ch r) (reaches ch r)))

(define-fun terminates-at-rule ((ch Int) (r Int)) Bool
    (and 
        (matches-criteria ch r)
        (reaches ch r)
        (terminating (rule-target ch r))
    )
)


(assert 
    (forall ((ch Int) (r Int))
        (= (reaches-go ch r)
            (and
                (valid-rule ch r)
                (exists ((ch2 Int) (r2 Int))
                    (and
                        (valid-rule ch2 r2)
                        (and 
                            (matches-rule ch2 r2)
                            (isGo (rule-target ch2 r2))
                            (= (chain (rule-target ch2 r2)) ch)
                            (= (rule (rule-target ch2 r2)) r)
                        )
                    )
                )
            )
        )
    )
)

(declare-const ch3 Int)
(declare-const r3 Int)
(declare-const ch4 Int)
(declare-const r4 Int)

(assert (= ch3 1))
(assert (= r3 0))

(assert (valid-rule ch4 r4))



;(assert
;    (and 
;        (matches-rule ch4 r4)
;        (isGo (rule-target ch4 r4))
;        (= (chain (rule-target ch4 r4)) ch3)
;        (= (rule (rule-target ch4 r4)) r3)
;    )
;)

(assert (forall ((ch Int))
    (= (reaches-end ch)
        (implies
            (and (<= 0 ch) (< ch num-of-chains))
            (and 
                (not (terminates-at-rule ch (- (chain-length ch) 1)))
                (reaches ch (- (chain-length ch) 1))
            )
        )
    )
))





;----------

(assert (matches-criteria 0 0))
(assert (= (rule-target 0 0 ) ACCEPT))
(assert (not (matches-criteria 0 1)))
(assert (= (rule-target 0 1) (GO 1 0)))
(assert (not(matches-criteria 0 2)))
(assert (not (matches-criteria 0 3)))
(assert (= (rule-target 0 3) ACCEPT))

(assert (not (matches-criteria 1 0)))
(assert (= (rule-target 1 0) ACCEPT))
;----------

(assert (reaches-go 1 0))
(assert (reaches-end 0))
;(assert (terminates-at-rule 0 3))
;(assert (reaches-end 0))

(check-sat)
(get-model)