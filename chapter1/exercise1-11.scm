; A function `f` is defined by the rule that
;   `f(n) = n` if `n < 3` and `f(n) = f(n-1) + 2f(n - 2) + 3f(n-3)` if `n >= 3`
; Write a procedure that computes `f` by, means of a recursive process. Write a procedure that computes `f`
; by means of an iterative process.

; Recursive
(define (fnc n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (fnc (- n 1))
                    (* 2
                       (fnc (- n 2)))
                    (* 3
                       (fnc (- n 3)))))))

(fnc 3)


; Iterative

; (define (fnc2 n)
;  (cond ((< n 3) n)
;        ((>= n 3) (+ (fnc2 (- n 1))
;                    (* 2
;                       (fnc2 (- n 2)))
;                    (* 3
;                       (fnc2 (- n 3)))))))
;
;(define (fnc2-iter a b n)
;  (if (< n 3)
;      n
;      (fnc2-iter (-))))
;
;(fnc2 3)

; Static

(define (fnc3 n)
  (expt (+ (- n 1)
           ((* 2
               (- n 2))
            (* 3
               (- n 3))))
        n))

(fnc3 3)


;f(n) = ((n - 1) + 2(n - 2) + 3(n - 3))^n

;f(2) =  ((2 - 1) + 2(2 - 2) + 3(2 - 3))^2
;f(2) =  ((1) + 2(0) + 3(-1))^2
;f(2) =  (1 - 3)^2
;f(2) =  (-2)^2
;f(2) =  (4)^2


;f(3) =  ((3 - 1) + 2(3 - 2) + 3(3 - 3))^3
;f(3) =  (2 + 2)^3
;46 WRONG should be 4

