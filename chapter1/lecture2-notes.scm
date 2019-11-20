(define (sos x y)
  (+ (sq x) (sq y)))
(define (sq x)
  (* x x))

(sos 3 4)
; -> 25

; Substitution model
;
; This is the simplest model, it becomes impossible to sustain the
; illusion that this is how the machine works.
;
; Kinds of expressions
; - Numbers
; - Symbols
; - Combinations
;
; these are special cases, we will worry about these later
; - Lambda expressions
; - Definitions
; - Conditionals

; Substitution rule,
; Application has several parts
; Evaluate an operator to get a procedure
; Evaluate the operands to get arguments
; Apply the procedure to the arguments
;  copy the body of the procedure,
;   substituting the arguments supplied for the formal parameters of the procedure.
;  Evaluate the resulting new body.

; Simple rule, we will use it for a while. If you don't understand something, be very mechanichal and do this.
; Using our above function, we can substitute:
; (sos 3 4)
; (+ (sq 3) (sq 4))
; (+ (* 3 3) (* 4 4))

; The key to understand complicated things is to know what not to look at, what to ignore.
; We'll assume operators are primitives and not go deeper. We know what they will do.
; This is not how machines actually work but it's what we will use for now.

; order doesn't matter for now
;
; Conditionals:
;
; (if <predicate>
;     <consiquent>
;     <alternative>)

; learn the names of expressions so we can discuss these things.
; To evaluate an If
;   Evaluate the predicate expression
;     if true
;       evaluate the consequent expression
;     otherwise
;       evaluate the alternative expression

; piano arithmetic
(define (+ x y)
  (if (= x 0)
    y
    (+ (-1+ x) (1+ y))))


; lets use the rule on this
(+ 3 4)

(if (= 3 0) 4 (+ (-1+ 4) (1+ 4)))
; we ignore the consequent expression in the if since we dont need it
(+ (-1+ 3) (1+ 4))
(+ (-1+ 3) 5)
(+ 2 5)

; -1+ is the decrementor, i-- in javascript
; 1+ is the incrementor, i++ in javascript

; As a photographer the key to being creative is you should be able to imagine what you will produce before you press the button.

; lets look at an alternative to our above function
(define (+ x y)
  (if (= x 0)
    y
    (1+ (+ (-1+ x) y))))

; this is is one way to look at it
(+ 3 4)
(+ 2 5)
(+ 1 6)
(+ 0 7)
7

; we can expand this out

(+ 3 4)
(1+ (+ 2 4))
(1+ (1+ (+ 1 4)))
(1+ (1+ (1+ (+ 0 4))))
(1+ (1+ (1+ 4)))
(1+ (1+ 5))
(1+ 6)
(1+)
7

; These are two different ways at looking at it
; The second way, expands then retracts while the first one looks linear
; The length of the pyramid is time, since that is each step
; The width is how much we have to remember, the space


; Iteration
; time = O(x)
; since the space doesn't expand we get
; space = O(1)
(+ 3 4)
(+ 2 5)
(+ 1 6)
(+ 0 7)
7

; we dont care about the time at the top or the line at the bottom,
; constants like these don't matter as out equation expands
; our time = O(x)
; our space looks to be directly related to our x
; space = O(x)
(+ 3 4)
(1+ (+ 2 4))
(1+ (1+ (+ 1 4)))
(1+ (1+ (1+ (+ 0 4))))
(1+ (1+ (1+ 4)))
(1+ (1+ 5))
(1+ 6)
(1+)
7

; This is a linear recursion since it it proportionate to the
; input argument in both time and space. The other example could have been a linear iteration.

; an iteration has all of its state in explicit variables, in a recursion, if you lose the arguments then you do not
; have enough information to complete the execution.

; Fibonacci :)
; start with
; 0 1
; Then every number after is the sum of the previous

; let get the nth fib number

(define (fib n)
  (if (< n 2)
    n
    (+ (fib (- n 1))
       (fib (- n 2))))

; looking at the sub tree, this is a horrible way to run this
; we have to run every number up to our number
; time = O(fib(n))
; the amount of space this takes up is the longest path we have to follow in the tree
; so space = O(n)

; the hard part of programming is writing rules.
;   we have to think of all the possible variable that will be inputed
;   and we have to get the solution we want from all of these variables
; similar to knowing what a picture will look like before you click the button.

; Towers of hanoi algo

(define (move n from to spare)
  (cond ((= n 0) "done")
        (else
          (move (-1+ n) from spare to)
          (print-move from to)
          (move (-1+ n) spare to from))))

(move-tower 4 1 2 3)
; this algo has to take exponential time
; can you write this iteravely?
; fib can be simpler by remembering the answers from a db, it can be linear.

