; Newtons method:
;   - orginally developed by Heron of Alexandria in the first century A.D.
;   - find the square root by averaging `y` with `x/y`
;
; example
;
; guess: 1
; quotient: 2/1 = 2
; average: (2+1)/2 = 1.5

; second iteration
; guess: 1.5
; quotient: 2/1.5 = 1.3333
; average: (1.3333+1.5)/2 = 1.4142

; using this method, each iteration will bring us closer to the true square root.
; until we decide we're close enough (it may be impossible to get to the true number so we get something that is very close)

; basic sqrt guessing function using Newtons method
; we don't need loops since we can do this recursively(we wont use loops for this whole course)
; this definition is a 'recursive definition' (the ability to make recursive definitions allows you to do infinite computations
; until somthing goes through, without needing any other constructs other than calling a procedure)
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

; improve the guess by averaging the quotient of the radicand and the old guess
(define (improve guess x)
  (average guess (/ x guess)))

; where

(define (average x y)
  (/ (+ x y) 2))

; now we define good-enough? which checks if our guess deffers less than our tolerance (0.001)
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; now we can make our square root function to get started. We start with 1.0 instead of 1 since MIT scheme differntiates the two
; dividing integers might produce a rational number and we want decimals
(define (sqrt x)
  (sqrt-iter 1.0 x))

; we can define square root using block structure, so that we don't get the system confused with our methods
; we package our procedures inside of our sqrt procedure.
(define (sqrt x)
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       .001))
  (define (try guess)
    (if (good-enough? guess)
      guess
      (try (improve guess))))
  (try 1))

; we will need to bring in our other math functions in order for square and abs to work
