; A asnwers
(declare-const A1 Int)
(declare-const A2 Int)
(declare-const A3 Int)
(declare-const A4 Int)
(declare-const A5 Int)
(declare-const A6 Int)
(declare-const A7 Int)
(declare-const A8 Int)
(declare-const A9 Int)
(declare-const A10 Int)

; B answers
(declare-const B1 Int)
(declare-const B2 Int)
(declare-const B3 Int)
(declare-const B4 Int)
(declare-const B5 Int)
(declare-const B6 Int)
(declare-const B7 Int)
(declare-const B8 Int)
(declare-const B9 Int)
(declare-const B10 Int)

; asnwers is either A or B so they must be different
(assert (not (= A1 B1)))
(assert (not (= A2 B2)))
(assert (not (= A3 B3)))
(assert (not (= A4 B4)))
(assert (not (= A5 B5)))
(assert (not (= A6 B6)))
(assert (not (= A7 B7)))
(assert (not (= A8 B8)))
(assert (not (= A9 B9)))
(assert (not (= A10 B10)))

; each answers is either 10 points or 0 points
(assert (or (= A1 10) (= A1 0)))
(assert (or (= A2 10) (= A2 0)))
(assert (or (= A3 10) (= A3 0)))
(assert (or (= A4 10) (= A4 0)))
(assert (or (= A5 10) (= A5 0)))
(assert (or (= A6 10) (= A6 0)))
(assert (or (= A7 10) (= A7 0)))
(assert (or (= A8 10) (= A8 0)))
(assert (or (= A9 10) (= A9 0)))
(assert (or (= A10 10) (= A10 0)))

(assert (or (= B1 10) (= B1 0)))
(assert (or (= B2 10) (= B2 0)))
(assert (or (= B3 10) (= B3 0)))
(assert (or (= B4 10) (= B4 0)))
(assert (or (= B5 10) (= B5 0)))
(assert (or (= B6 10) (= B6 0)))
(assert (or (= B7 10) (= B7 0)))
(assert (or (= B8 10) (= B8 0)))
(assert (or (= B9 10) (= B9 0)))
(assert (or (= B10 10) (= B10 0)))

; Mary score
(assert (= 70 (+ B1 B2 A3 B4 A5 B6 B7 A8 B9 B10)))
; Dan score
(assert (= 50 (+ B1 A2 A3 A4 B5 A6 B7 A8 A9 A10)))
; Lisa score
(assert (= 30 (+ B1 A2 A3 A4 B5 B6 B7 A8 B9 A10)))

; John score
(declare-const john_score Int)
(assert (= john_score (+ B1 B2 A3 A4 A5 B6 B7 A8 A9 A10)))

;john score is 60 (First solution found)

;checking if solution is unique
(assert (not (and (= B1 10) (= B2 10) (= A3 10) (= B4 10) (= A5 10) (= A6 10) (= A7 10) (= A8 10) (= A9 10) (= B10 10))))

(check-sat)

(exit)