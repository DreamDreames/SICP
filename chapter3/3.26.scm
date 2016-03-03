(define (make-tree entry left right)
  (list entry left right))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((eq? (car x) (car (entry set))) set)
	((< (car x) (car (entry set)))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> (car x) (car (entry set)))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define (make-table)
  (let ((local-table '()))

    (define (lookup-rec key set) 
      (cond ((null? set) false)
	    ((eq? key (car (entry set))) (entry set))
	    ((< key (car (entry set))) (lookup-rec key (left-branch set)))
	    ((> key (car (entry set))) (lookup-rec key (right-branch set)))))

    (define (insert! key value) 
      (let ((record (lookup-rec key local-table))) 
	(if record 
	  (set-cdr! record value) 
	  (set! local-table (adjoin-set (cons key value) local-table)))))

    (define (lookup key)
      (lookup-rec key local-table))
    (define (print-table)
      (display local-table))
    (define (dispatch m)
      (cond ((eq? m 'look-up) lookup)
	    ((eq? m 'insert!) insert!)
	    ((eq? m 'print) print-table)
	    (else (error "Operation not defined!" m))))
    dispatch))


(define tbl (make-table))
((tbl 'insert!) 1 'a)

((tbl 'insert!) 3 'c)

((tbl 'insert!) 2 'b)

(newline)
((tbl 'print))

(newline)
(display ((tbl 'look-up) 3))
; c
