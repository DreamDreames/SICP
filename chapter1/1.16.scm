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



;; the key is do not hold any status variable in the iter function

(define (fast-expt-sln b n)
  (define (even? n)
    (= (remainder n 2) 0))

  (define (iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (iter a (square b) (/ n 2)))
	  (else (iter (* a b) b (- n 1)))))

  (iter 1 b n))
	
