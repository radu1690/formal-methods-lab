(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const e Int)
(declare-const d Int)

(assert (distinct a b c d e))

(assert (> a d))
(assert (and (> b c) (> b e)))
(assert (or (> e b) (> e d)))
(assert (> c a))

(assert (> a 0))
(assert (> b 0))
(assert (> c 0))
(assert (> d 0))
(assert (> e 0))

(check-sat)
(get-model)
(exit)