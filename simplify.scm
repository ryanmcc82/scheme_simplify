;simlify Assignment 1
;Authors: Ryan McConn Ebitimi Agberebi

(define (simplify x)
  (
    if (atom? x) x
    ;else
    (let* ((operator (car x)) (op1s (simplify (cadr x ))) (op2s (simplify (cadr (cdr x))))
      (op1sExOp (op-not-atom op1s)) (op2sExOp (op-not-atom op2s)) (oprIsMul (opr-is-mul operator))
      (oprIsPlus (opr-is-plus operator))
      ;Note if these vars are only used once we can remove from "let" also
      ;I think we can return false or the operand from "op-not-atom" and avoid a second test.
      )
      (state-print operator op1s op2s oprIsMul op1sExOp op2sExOp);TODO REMOVE
      (cond ((and (not op1sExOp) (not op2sExOp))
                (cond((and (number? op1s) (number? op2s))
                        (display operator);TODO REMOVE
                        (display "_");TODO REMOVE
                        (display op2s);TODO REMOVE
                        (display "\n");TODO REMOVE
                        (if (sum? operator) (+ op1s op2s) (if (mul? operator)(* op1s op2s)(- op1s op2s))); we need to check for the operator and if the second value in the list is an atom or if it is a list. that will fix our problem for test 8 and 9. and based on the test we will swap accordingly.
                    )
                    ((and (not (number? op1s)) (not (number? op2s))) ;(op var var) => return as is
                        (list operator op1s op2s)
                    )
                    ( (number? op2s) ;(op var constant) => swap operands
                        (simplify_minus (list operator op2s op1s))
                    )
                    (else (simplify_minus (list operator op1s op2s))) ;(op constat var) => return as is
                    )
                  )

          (else  (list operator op1s op2s));test output
      )
    )
  )
)

(define (sum? x)
  (eq?  x '+))


(define (mul? x)
  (eq?  x '*))

(define (simplify_minus ex) (if (eq? (car ex) '-) (list '+ (negate (cadr ex)) (cadr (cdr ex))) ex))

(define (negate x)(* -1 x))


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
	(load "atom?.scm")
	(load "op-not-atom.scm")
	(load "opr-is-mul.scm")
	(load "opr-is-plus.scm")
	(load "test.scm")
))
