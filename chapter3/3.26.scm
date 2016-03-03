(define (make-tree entry left right)
  (list entry left right))
(define (entry tree) (car tree))
(define (left-branch tree) (caar tree))
(define (right-branch tree) (caddr tree))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((< (car x) (car (entry set)))
	 (let ((left (left-branch set)))
	   (set! left (adjoin-set x left))))
	((> (car x) (car (entry set)))
	 (let ((right (right-branch set)))
	   (set! right (adjoin-set x right))))))
(define (assoc key tree)
  (cond ((null? tree) false)
	((eq? key (car (entry tree)) (entry tree)))
	((< key (car (entry tree)) (assoc key (left-branch tree))))
	((> key (car (entry tree)) (assoc key (right-branch tree))))))

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key) 
      (let ((record (assoc key (cdr local-table)))) 
	(if record 
	  (cdr record) 
	  false))) 
    (define (insert! key value) 
      (let ((record (assoc key (cdr local-table)))) 
	(if record 
	  (set-cdr! record value) 
	  (adjoin-set (cons key value) (cdr local-table)))
	'ok))
    (define (dispatch m)
      (cond ((eq? m 'look-up) lookup)
	    ((eq? m 'insert!) insert!)
	    (else (error "Operation not defined!" m))))
    dispatch))


(define tbl (make-table))
((tbl 'insert!) 1 'a)
((tbl 'insert!) 3 'c)
((tbl 'insert!) 2 'b)
(newline)
(display ((tbl 'look-up) 'c))
; 3
