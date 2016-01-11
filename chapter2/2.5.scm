(define (cons a b)
  (define (ex base p)
    (cond ((= p 0) 1)
	  ((= p 1) base)
	  (else (* base (ex base (- p 1))))))
  (* (ex 2 a) (ex 3 b)))


(define (div num base) 
  (cond ((= num 1) num)
	((= (remainder num base) 0) (div (/ num base) base))
	(else num)))

(define (count-div num base)
  (define (iter value counter)
    (if (= value 1)
      counter
      (iter (/ value base) (+ counter 1))))
  (iter num 0))

(define (car x)
  (count-div (div x 3) 2))

(define (cdr x)
  (count-div (div x 2) 3))

(define n (cons 4 5))
(newline)
(display "car: ")
; 4
(display (car n))
(newline)
(display "cdr: ")
;5
(display (cdr n))



;; Another implementation from SICP-Solutions
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (if (= (gcd x 2) 1)
    0
    (+ 1 (car (/ x 2)))))

(define (cdr x)
  (if (= (gcd x 3) 1)
    0
    (+ 1 (cdr (/ x 3)))))

(define n (cons 4 5))
(newline)
(display "car: ")
(display (car n))
(newline)
(display "cdr: ")
(display (cdr n))
