(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
      (cdr record)
      false)))

(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
      (set-cdr! record value)
      (set-cdr! table
		(cons (cons key value) (cdr table))))))

(define (make-table)
  (list '*table*))

(define tbl (make-table))
(insert! '(key1 key2) 'foo tbl)
(insert! '(key1 key3) 'bar tbl)
(newline)
(display (lookup '(key1 key2) tbl))
; foo
