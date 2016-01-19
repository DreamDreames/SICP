(define nil '())
(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define empty-board nil)

(define (safe? k positions)
  (define (conflict? p li)
    (= (length (filter (lambda (existing) 
			 (or (= (car p) (car existing))
			     (= (abs (- (car p) (car existing))) 
				(abs (- (cadr p) (cadr existing)))))) 
		       li)) 0))
  (filter (lambda (pos)
	    (let ((cur (car pos)))
	      (conflict? cur (cdr pos))))
	  positions))

(define (adjoin-position row col rest-of-queens)
  (map (lambda (x)
	 (cons (cons row col) x))
       rest-of-queens))


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      ;(list empty-board)
      (list )
      ;(filter
	;(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1)))
	;)
      ))
  (queen-cols board-size))

(queens 8)
