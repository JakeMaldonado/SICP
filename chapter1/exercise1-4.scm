;Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation
;to describe the behaviour of the following procedure
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;The if statement in a-plus-abs-b checks if b is greater than 0 then it will return the `+` operator if that is true
;and apply it to a and b. The `if` operator is a higher order function that is returning `+` or `-`.
;This shows that operators can be returned and assigned as values.

