; These are the previous square root functions

(define (square x) (* x x))

(define (abs x)
  (cond ((< x 0)(- x))
        (else x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; The `good-enough?` test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test
; inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.

; Notes: after doing some reading on newtons method, It seems that there are a lot of problems with it. One being that the initial
; guess is quite poor but this can be overcome using calculus. There is also a linear convergance rate if the multiplicity is greater
; than one.

; Convergence rate: The speed at which a convergent sequense approcahes it's limit
; Convergent sequence: A sequence is convergent if a limit exists. In functions like ours
;   we have to set our own limit or a function with a limit of infinity, will keep running infinitly.
; Linear convergence: Linear convergence is not optimal, we would like our function to be superlinear or logarithmic.
;   These convergence rates will approach the limit faster than a linear or sublinear rate.

; Small numbers:
; There are a few reasons why our funtion may not be suitable for small numbers. The first being that the limits that we put on our result
; in the `good-enough?` can make our estimate pretty inacurate.
; actually the good enough difference seems ok. This method seems better for small numbers than large
; because the large numbers are hitting 100000000 and returning that


; Large Numbers:
; with large numbers it seems to be getting stuck at 100000000


; An alternative for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change
; is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does it work better for small and large numbers?

; now we pass in our guess and our next guess and our next guess and compare them
(define (sqrt-two x)
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess prev)
    (< (abs (- (square guess) prev))
       0.001))
  (define (try guess prev)
    (if (good-enough? guess prev)
      guess
      (try (improve guess) x)))
  (try 1.0 2.0))

; the new method seems less accurate for small numbers since the answer for the first one
; is returned as scientific notation, it's a smaller number and that would seem more accurate.

; for big numbers it seems to be getting stuck at the same point as the original method (100000000)

(sqrt 9999999999999999)
(sqrt 0.000000000001)
(sqrt-two 9999999999999999)
(sqrt-two 0.00000000001)

