(define (cont-frac n d k)
  (define (iter i)
    (/ (n i) (iter (+ 1 i)
  )


(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   k)
