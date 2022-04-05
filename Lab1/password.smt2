; Using the digits 1,2,3 and 4 you need to create a 3-length
; password. There are some rules that must be fulfilled:

; The password should be even
; We cannot use the same digit three times, otherwise it would be easy to guess it.
; It is possible to repeat the same digit twice, just make sure the two digits are not adjacent.

; Solve it using a SAT solver and report the solution. Is this unique?

(declare-const X11 Bool)
(declare-const X12 Bool)
(declare-const X13 Bool)
(declare-const X21 Bool)
(declare-const X22 Bool)
(declare-const X23 Bool)
(declare-const X31 Bool)
(declare-const X32 Bool)
(declare-const X33 Bool)
(declare-const X41 Bool)
(declare-const X42 Bool)
(declare-const X43 Bool)

; The password should be even
(assert (and (not X13) (not X33)))
;(assert (or X23 X43))

; We cannot use the same digit three times, otherwise it would be easy to guess it.
(assert (not (and X11 X12 X13)))
(assert (not (and X21 X22 X23)))
(assert (not (and X31 X32 X33)))
(assert (not (and X41 X42 X43)))

; It is possible to repeat the same digit twice, just make sure the two digits are not adjacent.
(assert (=> X11 (not X12)))
(assert (=> X21 (not X22)))
(assert (=> X31 (not X32)))
(assert (=> X41 (not X42)))

(assert (=> X13 (not X12)))
(assert (=> X23 (not X22)))
(assert (=> X33 (not X32)))
(assert (=> X43 (not X42)))

(assert (=> X12 (not X11)))
(assert (=> X22 (not X21)))
(assert (=> X32 (not X31)))
(assert (=> X42 (not X41)))

(assert (=> X12 (not X13)))
(assert (=> X22 (not X23)))
(assert (=> X32 (not X33)))
(assert (=> X42 (not X43)))

; Digits must be selected
(assert (or X11 X21 X31 X41))
(assert (or X12 X22 X32 X42))
(assert (or X13 X23 X33 X43))

; At most one number per position
(assert (=> X11 (and (not X21) (not X31) (not X41))))
(assert (=> X21 (and (not X11) (not X31) (not X41))))
(assert (=> X31 (and (not X21) (not X11) (not X41))))
(assert (=> X41 (and (not X21) (not X31) (not X11))))



; 312
(assert (not (and X31 X12 X23)))
; not unique


(check-sat)
(exit)

