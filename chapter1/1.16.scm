(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))

  (define (fast-expt-iter b2 counter product)
    (if (= counter 0) 
      product 
      (fast-expt-iter b2 (- counter 1) (* product b2))))

  (cond ((= n 0) 1)
	((even? n) (fast-expt-iter (square b) (/ n 2) 1))
	(else ( * b (fast-expt b (- n 1))))))
	
