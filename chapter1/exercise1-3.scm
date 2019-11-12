;Define a procedure that takes 3 numbers as arguments then returns the sum of the squares of the 2 larger numbers
(define (sum-squares a b)
  (+ (* a a)
     (* b b)))

(sum-squares 2 4)
