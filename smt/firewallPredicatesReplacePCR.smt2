(assert (=> 
    (and (<= 1 {r}) (reaches {p} {c} {r}))
    (reaches {p} {c} (- {r} 1))
))

(assert (=> 
    (and (reaches {p} {c} {r}) (not (matches-criteria {p} {c} {r}))) 
    (reaches {p} {c} (+ {r} 1))
))

(assert (=> 
   (and (reaches {p} {c} {r}) (= (rule-target {c} {r}) NONE)) 
    (reaches {p} {c} (+ {r} 1))
))