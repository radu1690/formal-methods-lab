(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)

; 1 = belongs to clique, 0 = doesn't belong to clique
(assert (or (= A 0) (= A 1)))
(assert (or (= B 0) (= B 1)))
(assert (or (= C 0) (= C 1)))
(assert (or (= D 0) (= D 1)))

; B and D are not connected so only one can belong to the clique
(assert (or (= 1 (+ B D)) (= 0 (+ B D))))

; if one node belongs to the clique, increase size by 1
; note that size is increased if the provided expression is false!
(assert-soft (= A 0) :weight 1 :id size_clique)
(assert-soft (= B 0) :weight 1 :id size_clique)
(assert-soft (= C 0) :weight 1 :id size_clique)
(assert-soft (= D 0) :weight 1 :id size_clique)

(maximize size_clique)

(check-sat)
(get-objectives)
(get-model)
(exit)