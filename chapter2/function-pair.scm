(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
	  ((= m 1) y)
	  (else error "Invalid argument")))
  dispatch)

(define (car x)
  (x 0))

(define (cdr x)
  (x 1))

(define x (cons 1 2))
(newline)
(display (car x))
(newline)
(display (cdr x))
