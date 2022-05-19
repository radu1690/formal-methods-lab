(set-option :produce-models true)

;(define-const AA Int 4)
(define-fun AA () Int 4)
(define-fun AB () Int 3)
(define-fun AC () Int 2)
(define-fun AD () Int 5)

(define-fun BA () Int (- 10))
(define-fun BB () Int 2)
(define-fun BC () Int 0)
(define-fun BD () Int (- 1))

(define-fun CA () Int 7)
(define-fun CB () Int 5)
(define-fun CC () Int 2)
(define-fun CD () Int 3)

(define-fun DA () Int 0)
(define-fun DB () Int 8)
(define-fun DC () Int (- 4))
(define-fun DD () Int (- 5))

(declare-const rA Int)
(assert (or (= rA AA) (= rA AB) (= rA AC) (= rA AD)))

(declare-const rB Int)
(assert (or (= rB BA) (= rB BB) (= rB BC) (= rB BD)))

(declare-const rC Int)
(assert (or (= rC CA) (= rC CB) (= rC CC) (= rC CD)))

(declare-const rD Int)
(assert (or (= rD DA) (= rD DB) (= rD DC) (= rD DD)))

(maxmin rA rB rC rD)

(check-sat)
(get-objectives)


(get-model)
(exit)