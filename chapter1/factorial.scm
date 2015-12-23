(define (factorial n)
  (if (= 1 n)
    1
    (* n (factorial (- n 1)))))
