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

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board nil)

(define (in? x seq)
  (cond ((null? seq) #f)
	((= x (car seq)) #t)
	(else (in? x (cdr seq)))))

(define (same-line-safe? k positions)
  (if (null? positions)
    #t
    (not (in? (car positions) (cdr positions)))))

(define (diff-line-safe? k positions)
  (define (iter x y index seq)
    (cond ((null? seq) #t)
	  ((or (= (- y index) (- x (car seq)))
	       (= (- y index) (- (car seq) x)))
	   #f)
	  (else
	    (iter x y (+ index 1) (cdr seq)))))
  (iter (car positions) k 2 (cdr positions)))

(define (safe? k positions)
  (define pos (car positions))
  (define (iter top bottom seq)
    (cond ((null? seq) 
	   #t) 
	  ((or (= top (car seq)) 
	       (= bottom (car seq)) 
	       (= pos (car seq))) 
	   #f) 
	  (else (iter (- top 1) (+ bottom 1) (cdr seq)))))
    (iter (- pos 1) (+ pos 1) (cdr positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (new-row)
	    (map (lambda (rest-of-queens)
		   (adjoin-position new-row k rest-of-queens))
		 (queen-cols (- k 1))))
	  (enumerate-interval 1 board-size))
	)
      ))
  (queen-cols board-size))

(newline)
(define ans (queens 8))
(display ans)
(newline)
(display (length ans))
