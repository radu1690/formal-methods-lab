;(set-option :produce-models true)
;(set-option :opt.priority box)

; number of trees to add
(declare-const add_tree Int)
; fnction which defines the total number of trees
(define-fun tot_tress () Int (+ 50 add_tree))
; function which defines the number of apples per tree
(define-fun apple_per_tree () Int (- 800 (* 10 add_tree)))

; total apples = number of trees * apples per tree
(maximize (* tot_tress apple_per_tree) :id apples)

(check-sat)
(get-objectives)
(get-model)
(exit)