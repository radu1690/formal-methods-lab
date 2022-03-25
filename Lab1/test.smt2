(declare-const A1 Bool)
(declare-const A2 Bool)
(declare-const A3 Bool)
(declare-const B1 Bool)
(declare-const B2 Bool)
(declare-const B3 Bool)
(declare-const C1 Bool)
(declare-const C2 Bool)
(declare-const C3 Bool)
(declare-const O1 Bool)
(declare-const O2 Bool)

(assert (= O1 (and (not (and A1 C2)) (not (and A2 C3)) (not (and A3 C2)) (not (and A2 C1)))))

(assert (= O2 (and (=> A1 (not C2)) (=> A3 (not C2)) (=> A2 (and (not C1) (not C3))) )))

(assert (not(= O1 O2)))

(check-sat)
(exit)