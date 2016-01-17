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

(newline)
(display (folder-right / 1 (list 1 2 3)))
; 3/2 

(newline)
(display (folder-left / 1 (list 1 2 3)))
; 1/6

(newline)
(display (folder-right list nil (list 1 2 3)))
; (1 (2 (3 ()))) 

(newline)
(display (folder-left list nil (list 1 2 3)))
; (((() 1) 2) 3)

; op must be commutative to make sure folder-left and folder-right
; generate the same results for the same sequence
