;Ben Bitdiffle has invented a test to determine whether the interpreter he is faced with is using applicative-order
;evaluation or normal order evalueation. He defines the following two procedures:
(define (p) (p))

(define (tests x y)
  (if (= x 0)
    0
    y))

;Then he evaluates the expression
(test 0 (p))

;What behavior will ben observe with an interpreter that uses applicative order evaluation?
;With normal-order evaluation? (Assume the exaluation rule for the spceial form if is the same. Predicate first.)

