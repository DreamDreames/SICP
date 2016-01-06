(define (cont-frac n d k)
  (define (iter result i)
    (if (= i 0) 
      result
      (iter (/ (n i) (+ (d i) result)) (- i 1))))

  (iter 0 k))


(define k 20)

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   k)


