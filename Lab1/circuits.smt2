; Testing Boolean circuits

; Main 3 variable (A,B,C)
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; Additional variables for first circuit
(declare-const O1 Bool)
(declare-const X1 Bool)
(declare-const X2 Bool)
(declare-const X3 Bool)
(declare-const X4 Bool)

; Additional variables for second circuit
(declare-const O2 Bool)
(declare-const H1 Bool)

; Encoding for first circuit
(assert (= X1 (and A B)))
(assert (= X2 (or B C)))
(assert (= X3 (and C B)))
(assert (= X4 (and X2 X3)))
(assert (= O1 (or X1 X4)))

; Encoding for second circuit
(assert (= H1 (or A C)))
(assert (= O2 (and H1 B)))

; Comparing the 2 circuits, it will return unsat if the formulas are the same
(assert (not(= O1 O2)))

; Stating the problem
(check-sat)

; Put exit at the end to optimize
(exit)
