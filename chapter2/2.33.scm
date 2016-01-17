(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(newline)
(display (accumulate + 0 (list 1 2 3)))
; 6
(newline)
(display (accumulate * 1 (list 2 3)))
; 6


(define (map p sequence)
  (accumulate (lambda (x y)
		(cons (p x) y))
	      nil
	      sequence))

(newline)
(display (map (lambda (t) (* t t)) (list 1 2 3)))
; (1 4 9)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(newline)
(display (append (list 12 2) (list 3 2)))
; (12 2 3 2)

(define (length sequence)
  (accumulate
    (lambda (x y)
      (+ 1 y))
    0
    sequence))

(newline)
(display (length (list 1 2 3)))
; 3


