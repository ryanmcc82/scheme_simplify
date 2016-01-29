(define (opr-is-plus x)
	(if (or (eq? x + )(eq? x '+)) #t #f)

)

(opr-is-plus (car '(+ 3 5)))
