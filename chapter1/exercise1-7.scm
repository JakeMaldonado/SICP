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

; Small numbers:
; There are a few reasons why our funtion may not be suitable for small numbers. The first being that the limits that we put on our result
; in the `good-enough?` can make our estimate pretty inacurate.


; Large Numbers:
;


; An alternative for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change
; is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does it work better for small and large numbers?

(define (new-good-enough?)
  ())
