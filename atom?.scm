(define (atom? x); TODO we may need a better method for this
 (and (not (list? x))
	(not (null? x))
	)
)
