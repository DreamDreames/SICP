; average-damp returns a lambda
(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))


; 55
((average-damp square) 10)


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
	       1.0))


(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
	       1.0))
