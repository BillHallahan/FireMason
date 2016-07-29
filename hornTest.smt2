(set-logic HORN)

(declare-fun test (Int Int) Bool)

(assert (forall ((i Int) (j Int)) (=> (< i j) (test i j))))

(assert (forall ((i Int) (j Int)) (=> (not (< i j)) (not (test i j)))))

(assert (test 3 4))

(check-sat)
(get-model)

