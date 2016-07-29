(define-fun-rec 
   fac ((x Int)) Int
   (
    ite (<= x 1)
        1 
        (* x (fac (- x 1)))
   )
)

(assert (= (fac 4) 25))

(check-sat)