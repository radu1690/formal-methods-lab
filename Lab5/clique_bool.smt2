; true = belongs to clique
; false = doesn't belong to clique
(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)
(declare-const D Bool)

; B and D are not connected
(assert (not (and B D)))

; if one node does not belong to the clique, increase penalty
; for example if A is false, increase penalty
(assert-soft A :weight 1 :id penalty)
(assert-soft B :weight 1 :id penalty)
(assert-soft C :weight 1 :id penalty)
(assert-soft D :weight 1 :id penalty)

(minimize penalty)

(check-sat)
(get-objectives)
(get-model)
(exit)