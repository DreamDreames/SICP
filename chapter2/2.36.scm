(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (first-dimon sequence)
  (map car sequence))

(define (rest-dimon sequence)
  (map cdr sequence))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (first-dimon seqs))
	  (accumulate-n op init (rest-dimon seqs)))))

(define seq (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(newline)
(display (accumulate-n + 0 seq))
; (22 26 30)


