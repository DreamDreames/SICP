(define (smallest-divisor a)
  (define (iter n a)
    (cond ((> (square n) a) a)
	  ((divid? n a) n)
	  (else (iter (+ n 1) a))))
  (define (divid? x y)
    (= (remainder y x) 0))

  (iter 2 a))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

