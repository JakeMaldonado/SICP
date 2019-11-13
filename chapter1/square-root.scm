;Newtons method:
; - orginally developed by Heron of Alexandria in the first century A.D.
; - find the square root by averaging `y` with `x/y`
;
;example
;
;guess: 1
;quotient: 2/1 = 2
;average: (2+1)/2 = 1.5

;second iteration
;guess: 1.5
;quotient: 2/1.5 = 1.3333
;average: (1.3333+1.5)/2 = 1.4142

;basic sqrt guessing function using Newtons method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

;improve the guess by averaging the quotient of the radicand and the old guess
(define (improve guess x)
  (average guess (/ x guess)))

;where

(define (average x y)
  (/ (+ x y) 2))

; now we define good-enough? which checks if our guess deffers less than our tolerance (0.001)
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; now we can make our square root function to get started. We start with 1.0 instead of 1 since MIT scheme differntiates the two
; dividing integers might produce a rational number and we want decimals
(define (sqrt x)
  (sqrt-iter 1.0 x))

; we will need to bring in our other math functions in order for square and abs to work
