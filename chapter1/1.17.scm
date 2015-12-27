(define (fast* a b)
  (define (double a)
    (* a 2))

  (define (halve a)
    (/ a 2))

  (define (even? n)
    (= (remainder n 2) 0))

  (define (iter n a b)
    (cond ((= a 0) n)
	  ((even? a) (iter n (halve a) (double b)))
	  (else (iter (+ n b) (- a 1) b))))

  (iter 0 a b))
	

