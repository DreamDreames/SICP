(define nil '())
(define (reverse items)
  (if (null? items)
    nil
    (append (reverse (cdr items)) (cons (car items) nil))))

(define (leaf? items) 
  (if (= (length items) 1) 
    (pair? (car items))
    #t))

(define (deep-reverse x)
  (if (pair? x)
    (append (deep-reverse (cdr x))
	    (list (deep-reverse (car x))))
    x))

(define x (list (list 1 2) (list 3 4)))

(newline)
(display (reverse x))
;((3 4) (1 2))

(newline)
(display (deep-reverse x))
;((4 3) (2 1))
