(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))

(define z (make-cycle '(a b c)))

(define (cycle? x) 
  (if (not (pair? x))
    #f
    (let ((head (car x)))
      (define (loop l)
	(if (pair? l)
	  (or (eq? head (car l))
	      (loop (cdr l)))
	  (eq? head l)))
      (loop (cdr x)))))

(newline)
(display (cycle? '(a b c)))
; #f

(newline)
(display (cycle? z))
; #t

(define t1 (cons 'a 'b))
(define t2 (cons t1 t1))
(newline)
(display (cycle? t2))
; #f
