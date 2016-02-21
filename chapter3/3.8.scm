(define f
  (let ((initial (/ 1 2)))
    (lambda (x) 
      (set! initial (- x initial))
      initial)))

(newline)
(display (+ (f 0) (f 1)))

