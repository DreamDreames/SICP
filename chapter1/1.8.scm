(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))


(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (square guess))) 3))


(define (good-enough? guess x)
  (<= (/ (abs (- (improve guess x) guess)) guess) 0.0001))



(define (cube-root x)
  (cube-root-iter 1.0 x))
