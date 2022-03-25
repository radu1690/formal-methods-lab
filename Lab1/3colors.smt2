; 2 colors: R = red , B = blue, G = green
; Nodes: 1, 2, 3, 4
; Edges: 1-2, 1-3, 1-4, 2-3, 3-4

; Variables: R1, R2, R3, R4, B1, B2, B3, B4, G1, G2, G3, G4
; R1 = Node 1 is red


(declare-const R1 Bool)
(declare-const R2 Bool)
(declare-const R3 Bool)
(declare-const R4 Bool)

(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const B4 Bool)

(declare-const G1 Bool)
(declare-const G2 Bool)
(declare-const G3 Bool)
(declare-const G4 Bool)

; A node must have at least one color
(assert (and (or R1 B1 G1) (or R2 B2 G2) (or R3 B3 G3) (or R4 B4 G4)))

; A node must have at most one color (iff probably not required because of the above formula)
(assert (= R1 (and (not B1) (not G1))))
(assert (= B1 (and (not R1) (not G1))))
(assert (= G1 (and (not B1) (not R1))))
(assert (= R2 (and (not B2) (not G2))))
(assert (= B2 (and (not R2) (not G2))))
(assert (= G2 (and (not B2) (not R2))))
(assert (= R3 (and (not B3) (not G3))))
(assert (= B3 (and (not R3) (not G3))))
(assert (= G3 (and (not B3) (not R3))))
(assert (= R4 (and (not B4) (not G4))))
(assert (= B4 (and (not R4) (not G4))))
(assert (= G4 (and (not B4) (not R4))))

; Conditions on Node 1
(assert (=> R1 (and (or B2 G2) (not R2))))
(assert (=> R1 (and (or B3 G3) (not R3))))
(assert (=> R1 (and (or B4 G4) (not R4))))
(assert (=> B1 (and (or R2 G2) (not B2))))
(assert (=> B1 (and (or R3 G3) (not B3))))
(assert (=> B1 (and (or R4 G4) (not B4))))
(assert (=> G1 (and (or R2 B2) (not G2))))
(assert (=> G1 (and (or R3 B3) (not G3))))
(assert (=> G1 (and (or R4 B4) (not G4))))

; Conditions on Node 3
(assert (=> R3 (and (or B2 G2) (not R2))))
(assert (=> R3 (and (or B3 G1) (not R1))))
(assert (=> R3 (and (or B4 G4) (not R4))))
(assert (=> B3 (and (or R2 G2) (not B2))))
(assert (=> B3 (and (or R1 G1) (not B1))))
(assert (=> B3 (and (or R4 G4) (not B4))))
(assert (=> G3 (and (or R2 B2) (not G2))))
(assert (=> G3 (and (or R1 B1) (not G1))))
(assert (=> G3 (and (or R4 B4) (not G4))))

; Conditions on node 2
(assert (=> R2 (and (or B1 G1) (not R1))))
(assert (=> R2 (and (or B3 G3) (not R3))))
(assert (=> B2 (and (or R1 G1) (not B1))))
(assert (=> B2 (and (or R3 G3) (not B3))))
(assert (=> G2 (and (or B1 R1) (not G1))))
(assert (=> G2 (and (or B3 R3) (not G3))))

; Conditions on node 4
(assert (=> R4 (and (or B1 G1) (not R1))))
(assert (=> R4 (and (or B3 G3) (not R3))))
(assert (=> B4 (and (or R1 G1) (not B1))))
(assert (=> B4 (and (or R3 G3) (not B3))))
(assert (=> G4 (and (or B1 R1) (not G1))))
(assert (=> G4 (and (or B3 R3) (not G3))))

;(assert (not R1))
;(assert (not B1))
;(assert (not G1))
;(assert (not R2))

(check-sat)
(exit)