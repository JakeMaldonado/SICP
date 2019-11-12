;Exercise 1.1

;a)
10
;output
10

;b)
(+ 5 3 4)
;output
12

;c)
(- 9 1)
;output
8

;d)
(/ 6 2)
;output
3

;e)
(+ (* 2 4) (- 4 6))
;output
6

;f)
(define a 3)
;output
a

;g)
(define b (+ a 1))
;output
b

;h)
(+ a b (* a b))
;output
19

;i)
(= a b)
;output
#f

;j)
(if (and (> b a) (< b (* a b)))
  b
  a)
;output
4

;k)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;output
16

;l)
(+ 2 (if (> b a) b a))
;output
6

;m)
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;output
16

