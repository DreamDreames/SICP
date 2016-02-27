(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '())) 
    (define (empty-queue?) (null? front-ptr)) 
    (define (set-front-ptr item) (set! front-ptr item)) 
    (define (set-rear-ptr item) (set! rear-ptr item)) 
    (define (insert-queue item) 
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?) 
	       (set-front-ptr new-pair) 
	       (set-rear-ptr new-pair)) 
	      (else 
		(set-cdr! rear-ptr new-pair) 
		(set-rear-ptr new-pair))))) 

    (define (delete-queue) 
      (cond ((empty-queue?) 
	     (error "DELETE called with an empty queue")) 
	    (else 
	      (set-front-ptr (cdr front-ptr)))))

    (define (front-queue) 
      (if (empty-queue?) 
	(error "FRONT called with an empty queue") 
	(car front-ptr))) 

    (define (dispatch m) 
      (cond ((eq? m 'insert-queue) insert-queue) 
	    ((eq? m 'front-queue) front-queue) 
	    ((eq? m 'delete-queue) delete-queue) 
	    (else (error "ERROR function call" m)))) 
    dispatch))

(define q (make-queue))

((q 'insert-queue) 'a)
((q 'insert-queue) 'b)

(newline)
(display ((q 'front-queue)))
; a

((q 'delete-queue))

(newline)
(display ((q 'front-queue)))
; b
