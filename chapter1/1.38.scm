(define (cont-frac n d k)
  (define (iter result i)
    (if (= i 0) 
      result
      (iter (/ (n i) (+ (d i) result)) (- i 1))))

  (iter 0 k))

(define (euler-e k)
  (+ 2.0 (cont-frac (lambda (i) 1.0)
	     (lambda (i) 
	       (if (= (remainder (+ 1 i) 3) 0)
		 (/ (+ i 1) 1.5)
		 1))
	     k)))

(define k 20)

(euler-e k)
