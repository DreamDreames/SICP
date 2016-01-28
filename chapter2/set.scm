(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

(define (intersaction-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2) 
	 (cons (car set1) 
	       (intersaction-set (cdr set1) set2)))
	(else (intersaction-set (cdr set1) set2))))

(newline)
(display (element-of-set? 'a '(b a c)))
; true
(newline)
(display (element-of-set? 'a '(c d e)))
; false
(newline)
(display (intersaction-set '(a b c) '(a c e)))
; (a c)
