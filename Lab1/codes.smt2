;   12  => one number is correct and well places
;   14  => nothing is correct
;   43  => one number is correct but wrong placed

(declare-const X11 Bool)
(declare-const X12 Bool)
(declare-const X21 Bool)
(declare-const X22 Bool)
(declare-const X31 Bool)
(declare-const X32 Bool)
(declare-const X41 Bool)
(declare-const X42 Bool)

;   12  => one number is correct and well placed
(assert (or (and X11 (not X21) (not X22)) (and X22 (not X11) (not X12))))

;   14  => nothing is correct
(assert (and (not X11) (not X12) (not X41) (not X42)))

;   43  => one number is correct but wrong placed
(assert (or (and X31 (not X41) (not X42)) (and X42 (not X31) (not X32))))

; Hidden conditions
; At least one number in the first position:
(assert (or X11 X21 X31 X41))

; At least one number in the second position:
(assert (or X12 X22 X32 X42))

; At most one number in the first position:
(assert (=> X11 (and (not X21) (not X31) (not X41))))
(assert (=> X21 (and (not X11) (not X31) (not X41))))
(assert (=> X31 (and (not X21) (not X11) (not X41))))
(assert (=> X41 (and (not X21) (not X31) (not X11))))

; At most one number in the second position:
(assert (=> X12 (and (not X22) (not X32) (not X42))))
(assert (=> X22 (and (not X12) (not X32) (not X42))))
(assert (=> X32 (and (not X22) (not X12) (not X42))))
(assert (=> X42 (and (not X22) (not X32) (not X12))))


; Check if the solution 32 is unique (if it returns unsat, it is unique)
;(assert (not (and X31 X22)))

(check-sat)
(exit)