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

;if we reach and match to the rule of a terminating target, we don't go to any new rules
(assert 
    (=> 
        (and (matches-rule {p} {c} {r}) (terminating (rule-target {c} {r}))) 
        (and (not (reaches {p} {c} (+ {r} 1))) (= (terminates-with {p}) (rule-target {c} {r})))
    )
)

;if we reach and match to the rule of a RETURN target, we don't go to any new rules
(assert 
    (=>
        (and (matches-rule {p} {c} {r}) (= (rule-target {c} {r}) RETURN))
        (and (reaches-return {p} {c}) (not (reaches {p} {c} (+ {r} 1))))
    )
)

;This is for when a rule matches and jumps to another chain
(assert
    (=>
        (and (matches-rule {p} {c} {r}) (isGo (rule-target {c} {r})))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches {p} (chain (rule-target {c} {r})) (rule (rule-target {c} {r})))
            ;If we don't return from the new chain, we don't continue in the old chain
            (= (returns-from {p} (chain (rule-target {c} {r}))) (reaches {p} {c} (+ {r} 1)))
        )
    )
)

(assert
    (=>
        (and (matches-rule {p} {c} {r}) (isGoReturn (rule-target {c} {r})))
        (and
            ;We go to the appropriate rule in the new chain
            (reaches {p} (chainR (rule-target {c} {r})) (ruleR (rule-target {c} {r})))
            ;We don't continue in the old chain no matter what
            (not (reaches {p} {c} (+ {r} 1)))
            ;We return in this chain iff we return in the jumped to chain
            (= (returns-from {p} (chainR (rule-target {c} {r}))) (returns-from {p} {c}))
        )
    )
)

;This is for when a rule does not match but would jump to another chain if it did
(assert
    (=>
        (and (not (matches-rule {p} {c} {r})) (isGo (rule-target {c} {r})))
        (not (reaches {p} (chain (rule-target {c} {r})) (rule (rule-target {c} {r}))))
    )
)

(assert
    (=>
        (and (not (matches-rule {p} {c} {r})) (isGoReturn (rule-target {c} {r})))
        (not (reaches {p} (chainR (rule-target {c} {r})) (ruleR (rule-target {c} {r}))))
    )
)