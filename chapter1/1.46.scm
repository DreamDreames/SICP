(define (iterative-improve good-enough? improve)
  (lambda (x) 
    ;(let ((ix (improve x)))
      ;(if (good-enough? x ix)
	;ix
	;((iterative-improve good-enough? improve) ix)))))
    (if (good-enough? x (improve x))
      x
      ((iterative-improve good-enough? improve) (improve x)))))

(define (good-enough? v1 v2) 
  (define tolerance 1.e-6)
  (< (/ (abs (- v1 v2)) v2) tolerance))

(define (sqrt x)
  ((iterative-improve 
    good-enough?
    (lambda (y) 
      (/ (+ (/ x y) y) 2.0))) 1.0))


(newline)
(display (sqrt 2))

