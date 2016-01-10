(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(newline)
(display ((double inc) 1))
(newline)
(define answer
  (((double (double double)) inc) 5))
(display answer)
