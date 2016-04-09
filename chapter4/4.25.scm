(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1) 
    (* n (factorial (- n 1)))
    1))

(factorial 5)
; maximun recursion depth exceeded
; every time factorial is called, it evaluates (factorial (- n 1))
; there's never a chance to reach the terminating condition
