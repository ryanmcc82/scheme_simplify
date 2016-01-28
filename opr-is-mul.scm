(define (opr-is-mul x)
	(if (or (eq? x * )(eq? x '*)) #t #f)

)

(opr-is-mul (car '(+ 3 5)))
