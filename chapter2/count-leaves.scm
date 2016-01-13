(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

(define x (cons (list 1 2) (list 3 4)))

(newline)
(display (length x))
;3

(newline)
(display (count-leaves x))
;4

(newline)
(display (list x x))
;(((1 2) 3 4) ((1 2) 3 4))

(newline)
(display (length (list x x)))
;2

(newline)
(display (count-leaves (list x x)))
;8
