(define nil '())
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
	    (cons answer
		  (square (car things))))))
  (iter items nil))

(square-list (list 1 2 3 4))
;(1 4 9 16)
; Actually the answer is
; ((((() . 1) . 4) . 9) . 16)
; The reason is that when using 
; (cons (list 1 4) 9)
; Map to the definition of cons (cons x . y)
; Then (list 1 4) becomes x and 9 becoms y
; So we get
; (cons (list 1 4) 9) => ((1 4) . 9)
