(define nil '())

(define (folder-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(folder-right op initial (cdr sequence)))))

(define (folder-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

(define seq (list 1 2 3 4))

(define (reverse sequence)
  (folder-right (lambda (x y) (append y (list x))) nil sequence))

(newline)
(display (reverse seq))
; (4 3 2 1)

(define (reverse sequence)
  (folder-left (lambda (x y) (append (list y) x)) nil sequence))

(newline)
(display (reverse seq))
; (4 3 2 1)
