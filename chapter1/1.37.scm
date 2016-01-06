(define (cont-frac n d k)
  (define (iter result i)
    (if (= i 0) 
      result
      (iter (/ (n i) (+ (d i) result)) (- i 1))))

  (iter 0 k))


(define (cont-frac-recur n d k)
  (define (recur i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (recur (+ i 1))))))
    ;;(cond ((= i 1) (/ (n i) (recur n d (+ i 1))))
	  ;;((= i k) (/ (n i) (d i)))
	  ;;(else (/ (n i) (+ (d i) (recur n d (+ i 1)))))))

  (recur 1))


(define k 20)

(newline)
(display 
  (cont-frac (lambda (i) 1.0) 
	     (lambda (i) 1.0) 
	     k))
(newline)
(display 
  (cont-frac-recur (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   k))


