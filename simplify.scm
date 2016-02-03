;simlify Assignment 1
;Authors: Ryan McConn Ebitimi Agberebi

(define (simplify x)
  (
    if (atom? x) x
    ;else
    (let* ((operator (car x)) (op1s (simplify (cadr x ))) (op2s (simplify (cadr (cdr x))))
      (op1sExOp (op-not-atom op1s)) (op2sExOp (op-not-atom op2s)) (oprIsMul (opr-is-mul operator))
      (oprIsPlus (opr-is-plus operator))(op1isNum (number? op1s))(op2isNum (number? op2s))
      ;Note if these vars are only used once we can remove from "let" also
      ;I think we can return false or the operand from "op-not-atom" and avoid a second test.
      )
      ;(state-print operator op1s op2s oprIsMul op1sExOp op2sExOp);TODO REMOVE
      (cond ((and (not op1sExOp) (not op2sExOp));All atoms
                (cond((and op1isNum op2isNum)
                        ;(display operator);TODO REMOVE
                        ;(display "_");TODO REMOVE
                        ;(display op2s);TODO REMOVE
                        ;(display "\n");TODO REMOVE
                        (if (sum? operator) (+ op1s op2s) (if (mul? operator)(* op1s op2s)(- op1s op2s))); we need to check for the operator and if the second value in the list is an atom or if it is a list. that will fix our problem for test 8 and 9. and based on the test we will swap accordingly.
                    )
                    ((and (not op1isNum) (not op2isNum)) ;(op var var) => return as is
                        (list operator op1s op2s)
                    )
                    ( op2isNum ;(op var constant) => swap operands
                        (simplify_minus (list operator op2s op1s))
                    )
                    (else (simplify_minus (list operator op1s op2s))) ;(op constat var) => return as is
                    )
                  )
          ((or op1isNum op2isNum); one constant and one var/s-exp aka rules 9 -16 + 2,4,6 b's
              (cond(false);TODO rules 9-16

              (op2isNum ; else (var con) in cases 2,4,6 b's
                  (simplify_minus (list operator op2s op1s))
              )
              (else  (list operator op1s op2s)));default output
          )
          (else ; all vars and s-exp aka cases 7,8, 17-20
              (cond
                  ((and (sum? operator)(sum? op2sExOp))
                    (evalRearange1 operator op1s op2s)
                  )
                  ((and (mul? operator)(mul? op2sExOp))
                    (evalRearange1 operator op1s op2s)
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

(define (simplify_minus ex) (if (eq? (car ex) '-) (list '+ (negate (cadr ex)) (cadr (cdr ex))) ex))

(define (negate x)(* -1 x))

(define (lastT ex) (cadr (cdr ex)))

(define (evalRearange1 op t1 ex)(list op (list t1 (cadr ex )) (lastT ex) ))


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
