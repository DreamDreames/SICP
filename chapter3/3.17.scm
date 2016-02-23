(define (count-pairs x)
  (let ((counted '()))
    (define (counted? v)
      (if (memq v counted)
	0
	(begin
	  (set! counted (cons v counted)) 
	  1)))
    (define (count p)
      (if (not (pair? p))
	0
	(+ (count (car p))
	   (count (cdr p))
	   (counted? p))))
    (count x)))

(newline)
(display (count-pairs '(a b c)))




