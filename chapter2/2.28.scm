(define (fringe tree)
  (define (append-ex left right)
    (if (pair? left)
      (append left right)
      (append (list left) right)))
  (if (pair? tree)
    (append-ex (fringe (car tree))
	    (fringe (cdr tree)))
    tree))

(define x (list (list 1 2) (list 3 4)))

(newline)
(display (fringe x))
; (1 2 3 4)

(newline)
(display (fringe (list x x)))
; (1 2 3 4 1 2 3 4)
