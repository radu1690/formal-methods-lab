; 3 chairs in a row and three guests: A, B, C. We know that:
; A does not want to sit next to c
; A does not want to sit on the leftmost chair
; B does not want to sit at the right of C

; Variables A1, A2, A3 representing if A sits on chair 1/2/3 (same for B and C)

(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)
(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)

; A does not want to sit next to c:
(assert (and (not (and A1 C2)) (not (and A2 C3)) (not (and A3 C2)) (not (and A2 C1))))
; Equivalent to:
;(assert (=> A1 (not C2)))
;(assert (=> A3 (not C2)))
;(assert (=> A2 (and (not C1) (not C3))))

; A does not want to sit on the leftmost chair
(assert (not A1))

; B does not want to sit at the right of C
(assert (and (not (and C1 B2)) (not (and C2 B3))))
; Equivalent to:
;(assert (=> C1 (not B2)))
;(assert (=> C2 (not B3)))

; Each person must sit
(assert (or A1 A2 A3))
(assert (or B1 B2 B3))
(assert (or C1 C2 C3))

; Each person can sit on only one chair
(assert (=> A1 (and (not A2) (not A3))))
(assert (=> B1 (and (not B2) (not B3))))
(assert (=> C1 (and (not C2) (not C3))))
(assert (=> A2 (and (not A1) (not A3))))
(assert (=> B2 (and (not B1) (not B3))))
(assert (=> C2 (and (not C1) (not C1))))
(assert (=> A3 (and (not A2) (not A1))))
(assert (=> B3 (and (not B2) (not B1))))
(assert (=> C3 (and (not C2) (not C1))))

; Only one person can sit on a chair
(assert (=> A1 (and (not B1) (not C1))))
(assert (=> A2 (and (not B2) (not C2))))
(assert (=> A3 (and (not B3) (not C3))))
(assert (=> B1 (and (not A1) (not C1))))
(assert (=> B2 (and (not A2) (not C2))))
(assert (=> B3 (and (not A3) (not C3))))
(assert (=> C1 (and (not B1) (not A1))))
(assert (=> C2 (and (not B2) (not A2))))
(assert (=> C3 (and (not B3) (not A3))))

; Chairs must be used
(assert (or A1 B1 C1))
(assert (or A2 B2 C2))
(assert (or A3 B3 C3))


(check-sat)
(exit)