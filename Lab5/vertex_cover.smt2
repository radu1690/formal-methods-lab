; vertexes
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)
(declare-const E Bool)
(declare-const F Bool)
(declare-const G Bool)
; edges
(declare-const A_B Bool)
(declare-const B_C Bool)
(declare-const C_D Bool)
(declare-const C_E Bool)
(declare-const D_E Bool)
(declare-const D_F Bool)
(declare-const E_F Bool)
(declare-const D_G Bool)

; for each edge, at least one vertex must be true
(assert (or A B))
(assert (or B C))
(assert (or C D))
(assert (or C E))
(assert (or D E))
(assert (or D F))
(assert (or D G))
(assert (or E F))

; if a vertex is true, increase cover
(assert-soft (not A) :weight 1 :id cover )
(assert-soft (not B) :weight 1 :id cover )
(assert-soft (not C) :weight 1 :id cover )
(assert-soft (not D) :weight 1 :id cover )
(assert-soft (not E) :weight 1 :id cover )
(assert-soft (not F) :weight 1 :id cover )
(assert-soft (not G) :weight 1 :id cover )

(minimize cover)

(check-sat)
(get-objectives)
(get-model)
(exit)