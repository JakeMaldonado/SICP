; Translate the following expression into prefix form
;(5 + 4 + (2 - (3 - (6 + 4/5)))) / (3(6 - 2)(2 - 7))
; = -0.2466666667

(/ (+ 5 4 (- 2
             (- 3
                (+ 6
                   (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

