; Three students A, B and C are accused of having illegally obtained
; the questions for the Automated Reasoning exam. During the
; investigation process the students made the following statements:

; A said: "B is guilty and C is innocent"
; B said: "If A is guilty, then C is also guilty"
; C said: "I’m innocent and one of the others, perhaps even the two, are guilty"

; Who cheated?

(declare-const A Bool)
(declare-const B Bool)
(declare-const C Bool)

; "B is guilty and C is innocent"
(assert (and B (not C)))

; "If A is guilty, then C is also guilty"
(assert (=> A C))

; "I’m innocent and one of the others, perhaps even the two, are guilty"
(assert (and (not C) (or (and B A) (and (not B) A) (and B (not A)))))

(check-sat)
(exit)
