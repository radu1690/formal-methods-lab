(set-option:produce-models true)

(declare-const A Int)
(declare-const B Int)
(declare-const C Int)
(declare-const D Int)
(declare-const E Int)

; Conditions given
(assert (= (+ A C) D))
(assert (= (* A B) C))
(assert (= (- C B) B))
(assert (= (* A 4) D))


; A B C D need to be all different
(assert (distinct A B C D))

; All number are single digit
(assert (>= A 0))
(assert (>= A 0))
(assert (>= B 0))
(assert (>= B 0))
(assert (>= C 0))
(assert (>= C 0))
(assert (>= D 0))
(assert (>= D 0))



(define-fun max ((a Int) (b Int)) Int (ite (>= a b) a b))

(assert (= E (max A (max B (max C D)))))


(check-sat)
(get-model)
(exit)