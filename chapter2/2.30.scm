(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	   (square-tree sub-tree)
	   (* sub-tree sub-tree)))
       tree))

(define (square-tree-iter tree) 
  (cond ((null? tree) tree) 
	((pair? tree) (cons (square-tree-iter (car tree)) (square-tree-iter (cdr tree)))) 
	(else (* tree tree))))

(define a-tree 
  (list 1 
	(list 2 (list 3 4) 5) 
	(list 6 7)))

(newline)
(display (square-tree a-tree))
; (1 (4 (9 16) 25) (36 49))

(newline)
(display (square-tree-iter a-tree))
