;Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order
;evaluation or normal order evaluation. He defines the following two procedures:
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

;Then he evaluates the expression
(test 0 (p))

;What behavior will ben observe with an interpreter that uses applicative order evaluation?
;With normal-order evaluation? (Assume the exaluation rule for the spceial form if is the same. Predicate first.)

;APPLICATIVE ORDER:
;(How scheme works, all procedures are evaluated when the procedure is applied)
;applicative order will execute all of the arguments passed in so `p` will be executed and is recursive so it will cause an infinite loop,
;the function will never complete. This seems normal, in most languages that I have used, the return value of the called function being
;passed in would be the parameter. This is similar to test(0, p()); in javascript.

;NORMAL-ORDER:
;(Delays evaluation of procedure arguments until the actual argument values are needed)
;normal order would return 0 and never end up evaluating y since it was never needed.

