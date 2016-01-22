(define (equal? item1 item2)
  (cond ((and (pair? item1) (pair? item2))
	 (and (eq? (car item1) (car item2))
	      (equal? (cdr item1) (cdr item2))))
	((and (not (pair? item1)) (not (pair? item2)))
	 (eq? item1 item2))
	(else
	  #f)))


(newline)
(display (equal? '(this is a list) '(this is a list)))
(newline)
(display (equal? '(this is a list) '(this (is a) list)))
