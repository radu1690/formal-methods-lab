(set-option :produce-models true)

(declare-const xa Real)
(declare-const ya Real)
(declare-const xb Real)
(declare-const yb Real)

(declare-const x Real)
(declare-const m Real)
(declare-const q Real)

; The generic form a function : y(x) = mx + q
(define-fun f ((x Real)) Real (+ q (* m x)))

; a = (1,3)
(assert (= xa 1))
(assert (= ya 3))
; b = (2,7)
(assert (= xb 2))
(assert (= yb 7))

; m = ((yb-ya)/(xb-xa))
(assert (= m (/ (- yb ya) (- xb xa))))
; q = ya - mx
(assert (= q (- ya (* m xa))))

; f(x) = 0 to get the value of x
(assert (= (f x) 0))

(check-sat)
(get-model)
(exit)
