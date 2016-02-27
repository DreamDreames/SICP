(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "FRONT called with an empty queue" queue)
    (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else
	    (set-cdr! (rear-ptr queue) new-pair)
	    (set-rear-ptr! queue new-pair)
	    queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "DELETE! called with an empty queue" queue))
	(else 
	  (set-front-ptr! queue (cdr (front-ptr queue)))
	  queue)))

(define (print-queue q)
  (car q))

(define q (make-queue))
(newline)
(print-queue (insert-queue! q 'a))
; a
(newline)
(print-queue (insert-queue! q 'b))
; a b
(newline)
(print-queue (delete-queue! q))
; b
(newline)
(print-queue (insert-queue! q 'c))
; b c
(newline)
(print-queue (insert-queue! q 'd))
; b c d
(newline)
(print-queue (delete-queue! q))
; c d

