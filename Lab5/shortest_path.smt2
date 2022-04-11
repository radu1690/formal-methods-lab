(set-option :produce-models true)
(set-option :opt.priority box)

; A = distance from G to A (same logic to other nodes)
(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)
(declare-const F Int)
(declare-const H Int)
(define-fun G () Int 0)
;(declare-const G Int)

; declare the possible distances
; for example for f the distance is either the distance from g to d plus 5 or
; the distance from g to g plus 9
(assert (or (= F (+ D 5)) (= F (+ G 9))))
(assert (or (= H (+ E 8)) (= H (+ G 3))))
(assert (or (= A (+ D 2)) (= A (+ B 4))))
(assert (or (= C (+ B 4)) (= C (+ E 7))))
(assert (or (= D (+ F 5)) (= D (+ E 3)) (= D (+ A 2))))
(assert (or (= B (+ A 4)) (= B (+ E 6)) (= B (+ C 4))))
(assert (or (= E (+ D 3)) (= E (+ B 6)) (= E (+ C 7)) (= E (+ H 8))))

(minimize B)



(check-sat)
(get-objectives)
(get-model)
(exit)