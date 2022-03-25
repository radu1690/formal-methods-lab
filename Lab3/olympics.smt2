(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const result Int)

(assert (> a 0))
(assert (>= b 0))
(assert (> c 0))

(assert (<= a 9))
(assert (<= b 9))
(assert (<= c 9))

; negation example:
;(assert (not (= x1 0)))


(define-fun three_digits ((x1 Int) (x2 Int) (x3 Int)) Int (+ (* x1 100) (* x2 10) x3))
; both abc and cba must be multple of 4:
(assert (and (= 0 (mod (three_digits a b c) 4)) (= 0 (mod (three_digits c b a) 4))))
(assert (= result (three_digits a b c)))

; 41 numbers
(assert (not (= result 404)))
(assert (not (= result 408)))
(assert (not (= result 804)))
(assert (not (= result 808)))
(assert (not (= result 824)))
(assert (not (= result 828)))
(assert (not (= result 844)))
(assert (not (= result 848)))
(assert (not (= result 864)))
(assert (not (= result 868)))
(assert (not (= result 884)))
(assert (not (= result 888)))
(assert (not (= result 612)))
(assert (not (= result 692)))
(assert (not (= result 616)))
(assert (not (= result 696)))
(assert (not (= result 632)))
(assert (not (= result 636)))
(assert (not (= result 652)))
(assert (not (= result 656)))
(assert (not (= result 676)))
(assert (not (= result 672)))
(assert (not (= result 464)))
(assert (not (= result 468)))
(assert (not (= result 484)))
(assert (not (= result 488)))
(assert (not (= result 424)))
(assert (not (= result 444)))
(assert (not (= result 448)))
(assert (not (= result 428)))
(assert (not (= result 212)))
(assert (not (= result 216)))
(assert (not (= result 256)))
(assert (not (= result 272)))
(assert (not (= result 276)))
(assert (not (= result 672)))
(assert (not (= result 292)))
(assert (not (= result 296)))
(assert (not (= result 232)))
(assert (not (= result 236)))
(assert (not (= result 252)))

(check-sat)
(get-model)
(exit)