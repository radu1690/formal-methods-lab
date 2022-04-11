(set-option :produce-models true)
(set-option :opt.priority lex)

(check-sat)
(get-objectives)

(exit)