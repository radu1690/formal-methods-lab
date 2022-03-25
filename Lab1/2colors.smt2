; 2 colors: R = red , B = blue
; Nodes: 1, 2, 3, 4
; Edges: 1-2, 1-3, 1-4, 2-3, 3-4

; Variables: R1, R2, R3, R4, B1, B2, B3, B4
; R1 = Node 1 is red


(declare-const R1 Bool)
(declare-const R2 Bool)
(declare-const R3 Bool)
(declare-const R4 Bool)

(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const B4 Bool)

; A node must have at least one color
(assert (and (or R1 B1) (or R2 B2) (or R3 B3) (or R4 B4)))

; A node must have at most one color
(assert (= R1 (not B1)))
(assert (= B1 (not R1)))
(assert (= R2 (not B2)))
(assert (= B2 (not R2)))
(assert (= R3 (not B3)))
(assert (= B3 (not R3)))
(assert (= R4 (not B4)))
(assert (= B4 (not R4)))

(assert (=> R1 (and B2 (not R2))))
(assert (=> R1 (and B4 (not R4))))
(assert (=> R1 (and B3 (not R3))))
(assert (=> B1 (and R2 (not B2))))
(assert (=> B1 (and R4 (not B4))))
(assert (=> B1 (and R3 (not B3))))

(assert (=> R2 (and B1 (not R1))))
(assert (=> R2 (and B3 (not R3))))
(assert (=> B2 (and R1 (not B1))))
(assert (=> B2 (and R3 (not B3))))

(assert (=> R4 (and B1 (not R1))))
(assert (=> R4 (and B3 (not R3))))
(assert (=> B4 (and R1 (not B1))))
(assert (=> B4 (and R3 (not B3))))

(assert (=> R3 (and B2 (not R2))))
(assert (=> R3 (and B4 (not R4))))
(assert (=> R3 (and B1 (not R1))))
(assert (=> B3 (and R2 (not B2))))
(assert (=> B3 (and R4 (not B4))))
(assert (=> B3 (and R1 (not B1))))


(check-sat)
(exit)