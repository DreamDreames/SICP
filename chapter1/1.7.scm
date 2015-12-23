(define (sqrt-iter preguess guess x)
  (if (good-enough? preguess guess x)
    guess
    (sqrt-iter guess (improve guess x)
	       x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? preguess guess x)
  (<= ( / (abs (- preguess guess)) preguess ) 0.0001))

(define (sqrt x)
  (sqrt-iter 2.0 1.0 x))
