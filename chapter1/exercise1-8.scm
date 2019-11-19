; Newtons method for cube roots is based on the fact that if y is an approximation of the cube root of x, 
; then a better apprixumation is given by the value (x/y^(2) + 2y) / 3

; use this formula to implement a cube-root procedure analogous to the square root procedure.
; alalogous: similar
; note: the type of recursion we are doing here is a `tail call` since we arent calling the outer function again
;   this is not to be used in modern JS currently since its not supported in a lot of browsers and not in node.
(define (cube-root x)
  (define (improve guess prev)
    (/ (+ (/ prev
             (square guess))
          (* 2 guess))
       3))
  (define (good-enough? guess prev)
    (< (abs (- (square guess) prev))
       0.001))
  (define (try guess prev)
    (if (good-enough? guess prev)
      guess
      (try (improve guess prev) x)))
  (try 1.0 2.0))

(cube-root 27)

; "import" our pre requisite functions

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (abs x)
  (cond ((< x 0)(- x))
        (else x)))


