;Alyssa defines her neew version of `if` as

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause))
        (else else-clause))

;Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
;5

(new-if (= 1 1) 0 5)
;0

;Delighted, Alyssa uses `new-if` to rewrite the `square-root` program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;What happens when Alyssa attempts to use this to compute square roots?
;Explain.

; Hypothesis:
; I think that this will cause a recursive loop, since both conditions will be called using the new method.
; so even if the guess is good enough, the new if will keep running the function.

