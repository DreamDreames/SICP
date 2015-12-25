(define (f n)
  (cond ((< n 3) n)
	(else ( + (f (- n 1)) 
		  (* 2 (f (- n 2))) 
		  (* 3(f (- n 3)))))))


(define (iter-f n)
  (define (iter a b c count)
    (if (= count 0) 
      	a
	(iter b c (+ (* 3 a) (* 2 b) c) (- count 1))))
  (iter 0 1 2 n))

     


