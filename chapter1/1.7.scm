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



;; another good enough. Quote from one solution
;; "in real computers, arithmetic operations are almost always performed with limited precision".
;; Given that it's done with limited precision, at some point, improve doesn't actually change the guess any more.
(define (another-good-enough? guess x)
  (= guess (improve guess x) ))
