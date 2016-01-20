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
  (define (same-line-iter start seq status)
    (if (> start k) 
      #t
      (cond ((in? (car seq) (cdr seq)) #f)
	    ((= (car seq) start) (if status #f (same-line-iter (+ start 1) (cdr seq) #t)))
	    (else (same-line-iter (+ start 1) (cdr seq) status)))))

  (same-line-iter 1 positions #f))

(define (diff-line-safe? k positions)
  (define (diff-line-iter start seq)
    (if (> start k)
      #f
      (if (not (in? start seq))
	#t
	(diff-line-iter (+ start 1) (cdr seq)))))
  (diff-line-iter 1 positions))

(define (safe? k positions)
  (and (same-line-safe? k positions) 
       (diff-line-safe? k positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1)))
	)
      ))
  (queen-cols board-size))

(newline)
(define ans (queens 8))
(ans)
