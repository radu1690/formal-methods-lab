(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const B4 Bool)
(declare-const B5 Bool)
(declare-const B6 Bool)

(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)
(declare-const A4 Bool)
(declare-const A5 Bool)
(declare-const A6 Bool)

(declare-const R1 Bool)
(declare-const R2 Bool)
(declare-const R3 Bool)
(declare-const R4 Bool)
(declare-const R5 Bool)
(declare-const R6 Bool)

(declare-const K1 Bool)
(declare-const K2 Bool)
(declare-const K3 Bool)
(declare-const K4 Bool)
(declare-const K5 Bool)
(declare-const K6 Bool)

(assert (and (or (not B1) (not A1)) (or (not B1) (not R1)) (or (not B1) (not K1)) (or (not A1) (not R1)) (or (not A1) (not K1)) (or (not R1) (not K1)) ))
(assert (and (or (not B2) (not A2)) (or (not B2) (not R2)) (or (not B2) (not K2)) (or (not A2) (not R2)) (or (not A2) (not K2)) (or (not R2) (not K2)) ))
(assert (and (or (not B3) (not A3)) (or (not B3) (not R3)) (or (not B3) (not K3)) (or (not A3) (not R3)) (or (not A3) (not K3)) (or (not R3) (not K3)) ))
(assert (and (or (not B4) (not A4)) (or (not B4) (not R4)) (or (not B4) (not K4)) (or (not A4) (not R4)) (or (not A4) (not K4)) (or (not R4) (not K4)) ))
(assert (and (or (not B5) (not A5)) (or (not B5) (not R5)) (or (not B5) (not K5)) (or (not A5) (not R5)) (or (not A5) (not K5)) (or (not R5) (not K5)) ))
(assert (and (or (not B6) (not A6)) (or (not B6) (not R6)) (or (not B6) (not K6)) (or (not A6) (not R6)) (or (not A6) (not K6)) (or (not R6) (not K6)) ))

(declare-const placeB Bool)
(declare-const placeA Bool)
(declare-const placeK Bool)
(declare-const placeR Bool)

(assert (=> placeB (or (and B2 B3 (not B1) (not B4) (not B5) (not B6)) (and B5 B6 (not B1) (not B2) (not B3) (not B4))) ))
(assert (=> placeA (or (and A1 A2 A3 (not A4) (not A5) (not A6)) (and A2 A3 A4 (not A1) (not A5) (not A6)) (and A3 A4 A5 (not A1) (not A2) (not A6)) (and A4 A5 A6 (not A1) (not A2) (not A3))) ))
(assert (=> placeR (and (or R1 R6) (or (not R6) (not R1))) ))

(assert (=> placeK (and (or K2 K3 K4 K5) (or (not K2) (not K3)) (or (not K2) (not K4)) (or (not K2) (not K5)) (or (not K3) (not K4)) (or (not K3) (not K5)) (or (not K4) (not K5))  )))

(assert placeA)

(assert-soft placeB :weight 1 :id penalty)
(assert-soft placeR :weight 1 :id penalty)
(assert-soft placeK :weight 1 :id penalty)

(minimize penalty)
(check-sat)
(get-objectives)
(get-model)
(exit)