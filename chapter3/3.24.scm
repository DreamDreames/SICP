(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))

    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc key-2 (cdr subtable))))
	    (if record
	      (cdr record)
	      false))
	  false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	  (let ((record (assoc key-2 (cdr subtable))))
	    (if record 
	      (set-cdr! record value) 
	      (set-cdr! subtable 
			(cons (cons key-2 value) 
			      (cdr subtable))))) 
	  (set-cdr! local-table 
		    (cons (list key-1 
				(cons key-2 value)) 
			  (cdr local-table))))) 
      'ok) 
    (define (dispatch m) 
      (cond ((eq? m 'lookup-proc) lookup) 
	    ((eq? m 'insert-proc!) insert!) 
	    (else (error "Unknown operation -- TABLE" m )))) 
    
    dispatch))

(define tbl (make-table (lambda (x y) 
			  (if (not (number? x))
			    (equal? x y)
			    (< (abs (- x y)) 0.0001)))))

((tbl 'insert-proc!) 'letters 'a 97)
((tbl 'insert-proc!) 'letters 'b 98)
((tbl 'insert-proc!) 'math '+ 43)
((tbl 'insert-proc!) 'math '- 45)
((tbl 'insert-proc!) 'math '* 42)
((tbl 'insert-proc!) 'double 3.13 'd1)
((tbl 'insert-proc!) 'double 4.13 'd2)
(newline)
(display ((tbl 'lookup-proc) 'letters 'a))
; 97
(newline)
(display ((tbl 'lookup-proc) 'math '-))
; 45
(newline)
(display ((tbl 'lookup-proc) 'double 3.1300001))
; d1
