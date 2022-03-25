(set-option :produce-models true)

(declare-const circle Real)
(declare-const square Real)
(declare-const rhomb Real)
(declare-const pentagon Real)
(declare-const triangle Real)
(declare-const rectangle Real)

(declare-const x Real)

(declare-const a Real)
(declare-const b Real)
(declare-const c Real)
(declare-const d Real)

; all figures should weight more than 0
(assert (> circle 0))
(assert (> square 0))
(assert (> rhomb 0))
(assert (> pentagon 0))
(assert (> triangle 0))
(assert (> rectangle 0))

; Encode the 4 solutions
(assert (= a (+ rhomb square rhomb)))
(assert (= b (+ square rhomb)))
(assert (= c (+ square triangle)))
(assert (= d (+ pentagon rhomb)))

; define triangle
(assert (= triangle (/ square 2)))

;first constraint
(assert (= (+ rhomb square circle) (+ pentagon rectangle rectangle)))
;second constraint
(assert (= (+ square pentagon) (+ circle rhomb square)))
;third constraint
(assert (= x (+ rectangle rectangle rectangle)))
(assert (or (= x a) (= x b) (= x c) (= x d)))

; all figures should be different except triangle?
(assert (distinct rhomb pentagon rectangle circle square))
; all possible solutions should be different
(assert (distinct a b c d ))


(check-sat)
(get-model)
(exit)