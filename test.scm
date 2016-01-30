(define (test)
  (begin
    (display "test0: (simplify '1) \n")
    (display (test0) )

    (newline)
    (display "test1: simplify '(+ 1 3)\n")
    (display (test1) )

    (newline)
    (display "test2: (simplify '(+ 1 v))\n")
    (display (test2) )

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
    (display "test5a: (simplify '(* (- v 2) (- 1 3) ))\n")
    (display (test5a) )


))

(define (test0) (simplify '1))
(define (result0) 1)
(define (ptest0) (if (equal? (test0) result0) (display "Test1: Passed\n") (display "Test1: Failed\n")))

(define (test1) (simplify '(+ 1 3)))
(define (ptest1) (if (equal? Test1 4) (display "Test1: Passed\n") (display "Test1: Failed\n")))

(define (test2a) (simplify '(+ 1 v)))
(define (result2a) '(+ 1 v))
(define (ptest2a) (if (equal? test2a result2a) (display "Test2a: Passed\n") (display "Test2a: Failed\n")))

(define (test2) (simplify '(+ v 1)))
(define (result2) '(+ 1 v))
(define (ptest2) (if (equal? (test2) (result2)) (display "Test2: Passed\n") (display "Test2: Failed\n")))

(define (test4) (simplify '(+ (+ 2 v) (+ 1 3) )))

(define (test5) (simplify '(+ (+ v 2) (+ 1 3) )))

(define (test6) (simplify '(* (* v 2) (* 1 3) )))

(define (test5a) (simplify '(* (- v 2) (- 1 3) )))

(define (test7) (simplify '(+ t1 ( + t2 t3))))

(define (test8) (simplify '(* t1 ( * t2 t3))))

(define (test9) (simplify '(+ ( + 1 t) 2))) ;=>(+ (+  1  2 ) t)

(define (test10) (simplify '(* ( * 1 t) 2))) ;=> (∗ (∗  1  2 ) t)

(define (test11) (simplify '(* ( + 1 t) 2)))

(define (test12) (simplify '(* 1 ( +  2 t))))

(define (test13) (simplify '(* (+ t1 t2 ) 2))) ;→ (+ (* 2 t1 ) (* 2 t2 ))
(define (result13) '(+ (* 2 t1 ) (* 2 t2 )))
(define (ptest13) (if (eq? test13 result13) (display "Test1: Passed\n") (display "Test1: Failed\n")))
