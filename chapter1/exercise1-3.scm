;Define a procedure that takes 3 numbers as arguments then returns the sum of the squares of the 2 larger numbers

(define (sum-squares a b)
  (+ (* a a)
     (* b b)))

(define (sum-larger-squares a b c)
  (cond ((or (and(> a b) (> b c))
             (and(> b a) (> a c)))
         (sum-squares a b))
        ((or (and(> a c) (> c b))
             (and(> c a) (> a b)))
         (sum-squares a c))
        (else (sum-squares b c))))

;tests

;a
(sum-larger-squares 2 4 6)
;output should be 52

;b
(sum-larger-squares 2 4 1)
;output should be 20

;b
(sum-larger-squares 2 1 3)
;output should be 13
