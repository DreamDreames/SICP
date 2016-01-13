(define nil '())
(define (reverse items)
  (if (null? items)
    nil
    (append (reverse (cdr items)) (cons (car items) nil))))

(define (leaf? items) 
  (if (= (length items) 1) 
    (pair? (car items))
    #t))

(define (get-left tree)
  (if (null? tree)
    nil
    (car tree)))
(define (get-right tree)
  (if (null? tree)
    nil
    (cdr tree)))

(define (deep-reverse tree)
  (let ((left (get-left tree))
	(right (get-right tree)))
    (append 
      (if (leaf? right)
	(if (null? right) 
	  nil
	  (car right))
	(deep-reverse right))

      (if (pair? left) 
	(deep-reverse left)
	left))))

(define x (list (list 1 2) (list 3 4)))

(newline)
(display (reverse x))
;((3 4) (1 2))

(newline)
(display (deep-reverse x))
;((4 3) (2 1))
