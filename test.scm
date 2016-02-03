(define (test)
  (begin
    (display "test0: (simplify '1) \n")
    (display (test0) )

    (newline)
    (display "test1: simplify '(+ 1 3)\n")
    (display (test1) )

    (display "test2a: (simplify '(+ 1 v))\n")
    (display (test2a) )

    (display "test2: (simplify '(+ v 1))\n")
    (display (test2) )

    (newline)
    (display "test4: (simplify '(+ (+ 2 v) (+ 1 3) ))\n")
    (display (test4) )

    (newline)
    (display "test5: (simplify '(+ (+ v 2) (+ 1 3) ))\n")
    (display (test5) )

    (newline)
    (display "test11a: (simplify '(* (- v 2) (- 1 3) )))\n")
    (display (test11a) )

    (newline)
    (display "test6: (simplify '(* (* v 2) (* 2 3) )))\n")
    (display (test6) )

    (newline)
    (display "test6a: (simplify '(* (* v 2) (* 1 3) )))\n")
    (display (test6a) )

    (newline)
    (display "test7: (simplify '(- (- v 2) (- 2 3) )))\n")
    (display (test7) )

    ))


(define (ptest)
  (begin
      (display "Test Results:\n")
    (ptest0)
    (ptest1)
    (ptest2)
    (ptest2a)
    (ptest2b)
    (ptest3)
    (ptest4)
    (ptest5)
    (ptest6)
    (ptest6a)
    (ptest7)
    (ptest7a)
    (ptest8)
    (ptest8a)
    ))

;NOTE:TEST NEED TO LINE UP WITH RULES SO WE CAN CHECK OUR REFERENCE

(define (test0) (simplify '1))
(define (result0) 1)
(define (ptest0) (if (equal? (test0) (result0)) (display "Test0: Passed\n") (display "Test0: Failed\n")))

(define (test1) (simplify '(+ 1 3)))
(define (result1) 4)
(define (ptest1) (if (equal? (Test1) (result1)) (display "Test1: Passed\n") (display "Test1: Failed\n")))

(define (test2) (simplify '(+ v 1)))
(define (result2) '(+ 1 v))
(define (ptest2) (if (equal? (test2) (result2)) (display "Test2: Passed\n") (display "Test2: Failed\n")))

(define (test2a) (simplify '(+ 1 v)))
(define (result2a) '(+ 1 v))
(define (ptest2a) (if (equal? (test2a) (result2a)) (display "Test2a: Passed\n") (display "Test2a: Failed\n")))

(define (test2b) (simplify '(+ (* v 2 ) 1)))
(define (result2b) '(+ 1 (* v 2 ))) ;must test for rule 9 state first
(define (ptest2b) (if (equal? (test2b) (result2b)) (display "Test2b: Passed\n") (display "Test2b: Failed\n")))

(define (test3) (simplify '(* 4 2)))
(define (result3) 8)
(define (ptest3) (if (equal? (test3) (result3)) (display "Test3: Passed\n") (display "Test3: Failed\n")))

(define (test4) (simplify '(* v 3 )))
(define (result4) '(* 3 v ))
(define (ptest4) (if (equal? (test4) (result4)) (display "Test4: Passed\n") (display "Test4: Failed\n")))

(define (test4a) (simplify '(* (+ v 2) (+ 1 3) )))
(define (result4a) '(* 4 (+ 2 v)  ))
(define (ptest4a) (if (equal? (test4a) (result4a)) (display "Test4a: Passed\n") (display "Test4a: Failed\n")))

(define (test5) (simplify '(- 4 7 )))
(define (result5) -3 )
(define (ptest5) (if (equal? (test5) (result5)) (display "Test5: Passed\n") (display "Test5: Failed\n")))

(define (test6) (simplify '(- v 2)))
(define (result6) '(+ -2 v))
(define (ptest6) (if (equal? (test6) (result6)) (display "Test6: Passed\n") (display "Test6: Failed\n")))

(define (test6a) (simplify '(- (* v 2) (* 1 3) )))
(define (result6a) '(+ -3 (* 2 v) ))
(define (ptest6a) (if (equal? (test6a) (result6a)) (display "Test6a: Passed\n") (display "Test6a: Failed\n")))

(define (test7) (simplify '(+ v (+ x z) )))
(define (result7) '(+ (+ v x) z))
(define (ptest7) (if (equal? (test7) (result7)) (display "Test7: Passed\n") (display "Test7: Failed\n")))

(define (test7a) (simplify '(+ (- v 2) (+ x z) )))
(define (result7a) '(+ (+ (+ -2 v) x ) z ))
(define (ptest7a) (if (equal? (test7a) (result7a)) (display "Test7a: Passed\n") (display "Test7a: Failed\n")))

(define (test7c) (simplify '(+ t1 (+ t2 t3))))
(define (result7c) '(+ (+ t1 t2) t3) )
(define (ptest7c) (if (equal? (test7c) (result7c)) (display "Test7c: Passed\n") (display "Test7c: Failed\n")))

(define (test8) (simplify '(* t1 ( * t2 t3))))
(define (result8) '(* (* t1 t2) t3) )
(define (ptest8) (if (equal? (test8) (result8)) (display "Test8: Passed\n") (display "Test8: Failed\n")))

(define (test8a) (simplify '(* (- v 2) ( * t2 t3))))
(define (result8a) '(* (* (+ -2 v) t2) t3) )
(define (ptest8a) (if (equal? (test8a) (result8a)) (display "Test8a: Passed\n") (display "Test8a: Failed\n")))

(define (test9) (simplify '(+ ( + 1 t) 2))) ;=>(+ (+  1  2 ) t)

(define (test10) (simplify '(* ( * 1 t) 2))) ;=> (∗ (∗  1  2 ) t)

(define (test11) (simplify '(* ( + 1 t) 2)))

(define (test11a) (simplify '(* (- v 2) (- 1 3) )))
(define (result11a) '( 4 (* -2 v))) ;(+ (∗ c 1 c 2 ) (∗ c 2 t))
(define (ptest11a) (if (equal? (test11a) (result11a)) (display "test11a: Passed\n") (display "test11a: Failed\n")))

(define (test12) (simplify '(* 1 ( +  2 t))))

(define (test13) (simplify '(* (+ t1 t2 ) 2))) ;→ (+ (* 2 t1 ) (* 2 t2 ))
(define (result13) '(+ (* 2 t1 ) (* 2 t2 )))
(define (ptest13) (if (eq? test13 result13) (display "Test1: Passed\n") (display "Test1: Failed\n")))
