(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-const x8 Int)

(assert (> x1 0))
(assert (> x2 0))
(assert (> x3 0))
(assert (> x4 0))
(assert (> x5 0))
(assert (> x6 0))
(assert (> x7 0))
(assert (> x8 0))

(assert (< x1 9))
(assert (< x2 9))
(assert (< x3 9))
(assert (< x4 9))
(assert (< x5 9))
(assert (< x6 9))
(assert (< x7 9))
(assert (< x8 9))

(assert (not (= x1 x2)))
(assert (not (= x1 x3)))

(assert (not (= x2 x3)))
(assert (not (= x2 x4)))

(assert (not (= x3 x4)))
(assert (not (= x3 x5)))
(assert (not (= x3 x6)))
(assert (not (= x3 x8)))

(assert (not (= x4 x5)))

(assert (not (= x5 x6)))
(assert (not (= x5 x7)))

(assert (not (= x6 x8)))
(assert (not (= x6 x7)))

(assert (not (= x7 x8)))

(minimize (+ x1 x2 x3 x4 x5 x6 x7 x8) :id total)

(check-sat)
(get-objectives)
(get-model)
(exit)