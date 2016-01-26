;I think we can return false or the operand from "op-not-atom" and avoid a second test.
(define (op-not-atom x)
  (if (atom? x) #f
    (car x)
  )
)
