(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define (last-pair x)
  (if (null? (cdr x))
    x
    (last-pair (cdr x))))

(define z (make-cycle '(a b c)))

(define (cycle? x) 
  (let ((flag '())) 
    (define (visited? v)
      (if (memq v flag)
	#t
	(begin
	  (set! flag (cons v flag))
	  #f))) 
    (define (check x) 
      (if (pair? x) 
	(or (visited? (car x)) (check (cdr x))) 
	(visited? x)))
    (check x)))

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
