(set-option:produce-models true)

(declare-const x11 Bool)
(declare-const x12 Bool)
(declare-const x13 Bool)
(declare-const x14 Bool)
(declare-const x21 Bool)
(declare-const x22 Bool)
(declare-const x23 Bool)
(declare-const x24 Bool)
(declare-const x31 Bool)
(declare-const x32 Bool)
(declare-const x33 Bool)
(declare-const x34 Bool)
(declare-const x41 Bool)
(declare-const x42 Bool)
(declare-const x43 Bool)
(declare-const x44 Bool)

; MATRIX: 
;   1   2
;   3   4

; xPinPosition
; x12 -> pin 1 in position 2

; All pins have to be used
(assert (or x11 x12 x13 x14))
(assert (or x21 x22 x23 x24))
(assert (or x31 x32 x33 x34))
(assert (or x41 x42 x43 x44))

; All steps must be done 
(assert (or x11 x21 x31 x41))
(assert (or x12 x22 x32 x42))
(assert (or x13 x23 x33 x43))
(assert (or x14 x24 x34 x44))

; Each pin can be used once
(assert (=> x11 (and (not x12) (not x13) (not x14))))
(assert (=> x12 (and (not x11) (not x13) (not x14))))
(assert (=> x13 (and (not x12) (not x11) (not x14))))
(assert (=> x14 (and (not x12) (not x13) (not x11))))

(assert (=> x21 (and (not x22) (not x23) (not x24))))
(assert (=> x22 (and (not x21) (not x23) (not x24))))
(assert (=> x23 (and (not x22) (not x21) (not x24))))
(assert (=> x24 (and (not x22) (not x23) (not x21))))

(assert (=> x31 (and (not x32) (not x33) (not x34))))
(assert (=> x32 (and (not x31) (not x33) (not x34))))
(assert (=> x33 (and (not x32) (not x31) (not x34))))
(assert (=> x34 (and (not x32) (not x33) (not x31))))

(assert (=> x41 (and (not x42) (not x43) (not x44))))
(assert (=> x42 (and (not x41) (not x43) (not x44))))
(assert (=> x43 (and (not x42) (not x41) (not x44))))
(assert (=> x44 (and (not x42) (not x43) (not x41))))


; For each step, only one pin can be used
(assert (=> x11 (and (not x21) (not x31) (not x41))))
(assert (=> x21 (and (not x11) (not x31) (not x41))))
(assert (=> x31 (and (not x21) (not x11) (not x41))))
(assert (=> x41 (and (not x21) (not x31) (not x11))))

(assert (=> x12 (and (not x22) (not x32) (not x42))))
(assert (=> x22 (and (not x12) (not x32) (not x42))))
(assert (=> x32 (and (not x22) (not x12) (not x42))))
(assert (=> x42 (and (not x22) (not x32) (not x12))))

(assert (=> x13 (and (not x23) (not x33) (not x43))))
(assert (=> x23 (and (not x13) (not x33) (not x43))))
(assert (=> x33 (and (not x23) (not x13) (not x43))))
(assert (=> x43 (and (not x23) (not x33) (not x13))))

(assert (=> x14 (and (not x24) (not x34) (not x44))))
(assert (=> x24 (and (not x14) (not x34) (not x44))))
(assert (=> x34 (and (not x24) (not x14) (not x44))))
(assert (=> x44 (and (not x24) (not x34) (not x14))))

; Steps conditions
(assert (=> x11 (or x22 x32)))
(assert (=> x12 (or x23 x33)))
(assert (=> x13 (or x24 x34)))
(assert (=> x14 (or x21 x31)))

(assert (=> x21 (or x12 x42)))
(assert (=> x22 (or x13 x43)))
(assert (=> x23 (or x14 x44)))
(assert (=> x24 (or x11 x41)))

(assert (=> x31 (or x12 x42)))
(assert (=> x32 (or x13 x43)))
(assert (=> x33 (or x14 x44)))
(assert (=> x34 (or x11 x41)))

(assert (=> x41 (or x22 x32)))
(assert (=> x42 (or x23 x33)))
(assert (=> x43 (or x24 x34)))
(assert (=> x44 (or x21 x31)))


(check-sat)
(check-allsat (x11 x12 x13 x14 x21 x22 x23 x24 x31 x32 x33 x34 x41 x42 x43 x44))