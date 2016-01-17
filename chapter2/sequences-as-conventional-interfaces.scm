(define nil '())

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else
	  (filter predicate (cdr sequence)))))

(newline)
(display (filter odd? (list 1 2 3 4 5)))
; (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(newline)
(display (accumulate + 0 (list 1 2 3 4 5)))
; 15
(newline)
(display (accumulate * 1 (list 1 2 3 4 5)))
; 120
(newline)
(display (accumulate cons nil (list 1 2 3 4 5)))
; (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(newline)
(display (enumerate-interval 2 7))
; (2 3 4 5 6 7)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define a-tree (list 1 (list 2 (list 3 4)) 5))
(newline)
(display (enumerate-tree a-tree))
; (1 2 3 4 5)

(define fib
  (lambda (x) 
    (cond ((= x 0) 0)
	  ((= x 1) 1)
	  (else
	    (+ (fib (- x 1)) (fib (- x 2)))))))

(define (sum-odd-square tree)
  (accumulate +
	      0
	      (map square
		   (filter odd?
			   (enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate cons
	      nil
	      (filter even?
		      (map fib
			   (enumerate-interval 0 n)))))


(newline)
(display (sum-odd-square a-tree))

(newline)
(display (even-fibs 7))

(define (list-fib-squares n)
  (accumulate cons 
	      nil
	      (map square 
		   (map fib
			(enumerate-interval 0 n)))))

(newline)
(display (list-fib-squares 10))
; (0 1 1 4 9 25 64 169 441 1156 3025)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
	      1
	      (map square
		   (filter odd? sequence))))
(newline)
(display (product-of-squares-of-odd-elements (list 1 2 3 4 5)))
; 225

