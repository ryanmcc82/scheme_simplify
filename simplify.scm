;simlify Assignment 1
;Authors: Ryan McConn Ebitimi Agberebi

(define (simplify x)
  (
    if (atom? x) x
    ;else
    (let* ((operator (car x)) (op1s (simplify (cadr x ))) (op2s (simplify (cadr (cdr x))))
      (op1sExOp (op-not-atom op1s)) (op2sExOp (op-not-atom op2s)) (oprIsMul (opr-is-mul operator))
      (op1isNum (number? op1s))(op2isNum (number? op2s))
      ;Note if these vars are only used once we can remove from "let" also
      ;I think we can return false or the operand from "op-not-atom" and avoid a second test.
      )
      ;(state-print operator op1s op2s oprIsMul op1sExOp op2sExOp);TODO REMOVE
      (cond ((and (not op1sExOp) (not op2sExOp));All atoms NOTE not most efficient way to do this but a little late to change
                (cond((and op1isNum op2isNum); could have just done this test aka both operands are numbers -> do operation
                        ;(display operator);TODO REMOVE
                        ;(display "_");TODO REMOVE
                        ;(display op2s);TODO REMOVE
                        ;(display "\n");TODO REMOVE
                        (if (sum? operator) (+ op1s op2s) (if (mul? operator)(* op1s op2s)(- op1s op2s))); we need to check for the operator and if the second value in the list is an atom or if it is a list. that will fix our problem for test 8 and 9. and based on the test we will swap accordingly.
                    )
                    ((and (not op1isNum) (not op2isNum)) ;(op var var) => return as is
                        (list operator op1s op2s)
                    )
                    ((nutralElimination? operator op1s op2s) )
                    ;((and (or (eq? op1s 0)(eq? op2s 0)) (mul? operator)) 0)
                    ;((or (and (eq? op1s 1) (mul? operator))(and (eq? op1s 0) (or (sum? operator)(minus? operator)))) op2s)
                    ;((or (and (eq? op2s 1) (mul? operator))(and (eq? op2s 0) (or (sum? operator)(minus? operator)))) op1s)
                    ( op2isNum ;(op var constant) => swap operands
                        (simplify_minus (list operator op2s op1s))
                    )
                    (else (simplify_minus (list operator op1s op2s))) ;(op constat var) => return as is
                    )
                  )
          (else ;(or op1isNum op2isNum); one constant and one var/s-exp aka rules 9 -16 + 2,4,6 b's
              (cond
                  (op2isNum ; else (var con) in cases 2,4,6 b's
                      (simplify (simplify_minus (list operator op2s op1s)))
                  )
                  ((and (eq? op1s 0) (mul? operator)) 0);if multiplied by zero return zero
                  ((or (and (eq? op1s 1) (mul? operator))(and (eq? op1s 0) (or (sum? operator)(minus? operator)))) op2s)
                  ((and (sum? operator)(sum? op2sExOp)); rule 7
                      (simplify (evalRearange1 operator op1s op2s))
                  )
                  ((or (sum? operator)(minus? operator))(list operator op1s op2s)) ;all following rules operator = *
                  ((mul? op2sExOp); rule 8; and 10 after 4b
                      (simplify (evalRearange1 operator op1s op2s)); TODO does this need to be surround by a recursive call to simplify?
                  )

                  ((sum? op2sExOp);rule 11 and 12 after 4b
                      (simplify (termMulDistributTS operator op1s op2s op2sExOp))
                  )
                  ((and(mul? operator)(or (sum? op1sExOp)(minus? op1sExOp)) )
                      (simplify (termMulDistributST operator op1s op2s op1sExOp))
                  )
                  ((and(mul? operator)(not (not op2sExOp) )); not not returns true for - and + but not vars or numbers
                      (simplify (termMulDistributTS operator op1s op2s op2sExOp)) ;don't need to worry bout op2sExOp being *; caught by rule 8
                  )
                  (else  (list operator op1s op2s));default output
              )
          )
      )
    )
  )
)

(define (sum? x)
  (eq?  x '+))

(define (mul? x)
  (eq?  x '*))

  (define (minus? x) (eq? x '-))

(define (simplify_minus ex) (if (eq? (car ex) '-) (list '+ (negate (cadr ex)) (caddr ex)) ex))

(define (negate x)(* -1 x))

(define (lastT ex) (cadr (cdr ex)))

(define (evalRearange1 op t1 ex)(list op (list op t1 (cadr ex )) (caddr ex) ))

(define (termMulDistributTS op T1 ex exOp) (list exOp (list op t1 (cadr ex)) (list op t1 (caddr ex))))

(define (termMulDistributST op ex t3 exOp) (list exOp (list op (cadr ex) t3 ) (list op (caddr ex) t3 )))

(define (nutralElimination? op op1s op2s)(
    cond((and (or (eq? op1s 0)(eq? op2s 0)) (mul? op)) 0)
    ((or (and (eq? op1s 1) (mul? op))(and (eq? op1s 0) (or (sum? op)(minus? op)))) op2s)
    ((or (and (eq? op2s 1) (mul? op))(and (eq? op2s 0) (or (sum? op)(minus? op)))) op1s)
    (else #f)
    ))

(define (atom? x); TODO we may need a better method for this
 (and (not (list? x))
	(not (null? x))
	)
)

;I think we can return false or the operand from "op-not-atom" and avoid a second test.
(define (op-not-atom x)
  (if (atom? x) #f
    (car x)
  )
)

(define (opr-is-mul x)
	(if (or (eq? x *)(eq? x '*)) #t #f)
)

(define (opr-is-plus x)
	(if (or (eq? x + )(eq? x '+)) #t #f)

)

(define (state-print operator op1s op2s oprIsMul op1sExOp op2sExOp)
  (begin
      (display "\t\t")
    (display (list operator op1s op2s))
    (newline)
    (display (string-append "\t\t" "vars: oprIsMul:" (write-to-string oprIsMul)

      " op1sExOp:" (write-to-string op1sExOp)
      " op2sExOp: " (write-to-string op2sExOp) ))
      (newline)
      (newline)
      #f
  )
)

;after first running (load "simplify.scm") calling this reloads
(define (loadf)
	(begin
	(load "simplify.scm")
	;(load "atom?.scm"); completed and moved to "simplify.scm"
	;(load "op-not-atom.scm"); completed and moved to "simplify.scm"
	;(load "opr-is-mul.scm"); completed and moved to "simplify.scm"
	;(load "opr-is-plus.scm"); completed and moved to "simplify.scm"
	(load "test.scm")
))
