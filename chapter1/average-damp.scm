; average-damp returns a lambda
(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))


; 55
((average-damp square) 10)
