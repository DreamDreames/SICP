(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (enumerate-tree (car tree))
		      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ y 1))
	      0
	      (map 
		(lambda (x) 1)
		(enumerate-tree t))))

(define a-tree (list (list 1 2) (list 3 4)))
(newline)
(display (count-leaves a-tree))
; 4

(define another-tree (list 1 2 (list 3 4) (list 5 (list 6 7))))
(newline)
(display (count-leaves another-tree))
