(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(assert (>= A 0))
(assert (>= B 0))
(assert (= 9 (+ A B)))

(assert (>= C 0))
(assert (<= C 200))

(assert (= C (* A (* B B))))
(maximize C)

(check-sat)
(get-objectives)
(get-model)
(exit)