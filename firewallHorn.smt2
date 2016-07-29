(set-logic HORN)

(declare-fun matches-criteria (Int Int) Bool)
(declare-fun reaches (Int Int) Bool)

;(declare-const start-chain Int)
;(declare-const start-rule Int)

;(assert (forall ((ch Int) (r Int)) (=>  (< ch  r) (matches-criteria ch (- r 1)))))

(assert (forall ((ch Int) (r Int))  (not (matches-criteria ch (- r 1)))))

(assert (forall ((ch Int) (r Int)) (=> (not (matches-criteria ch (- r 1))) (reaches ch r))))

(check-sat)