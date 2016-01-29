(define (test)
  (begin
    (display "test1: (simplify '1) \n")
    (display (test1) )

    (newline)
    (display "test2: simplify '(+ 1 3)\n")
    (display (test2) )

    (newline)
    (display "test3: (simplify '(+ 1 v))\n")
    (display (test3) )

    (newline)
    (display "test4: (simplify '(+ (+ 2 v) (+ 1 3) ))\n")
    (display (test4) )

    (newline)
    (display "test5: (simplify '(+ (+ v 2) (+ 1 3) ))\n")
    (display (test5) )

    (newline)
    (display "test6: (simplify '(* (* v 2) (* 1 3) ))\n")
    (display (test6) )

        (newline)
        (display "test7: (simplify '(* (- v 2) (- 1 3) ))\n")
        (display (test7) )
))

(define (test1) (simplify '1))

(define (test2) (simplify '(+ 1 3)))

(define (test3) (simplify '(+ 1 v)))

(define (test4) (simplify '(+ (+ 2 v) (+ 1 3) )))

(define (test5) (simplify '(+ (+ v 2) (+ 1 3) )))

(define (test6) (simplify '(* (* v 2) (* 1 3) )))

(define (test7) (simplify '(* (- v 2) (- 1 3) )))
