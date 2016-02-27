(define (make-deque) (cons '() '()))
(define (front-ptr q) (car q))
(define (rear-ptr q) (cdr q))
(define (empty-deque? q) (null? (front-ptr q)))
(define (set-front! q item) (set-car! q item))
(define (set-rear! q item) (set-cdr! q item))

(define (front-insert-deque! q item)
  (let ((new-pair (cons (cons item '()) '())))
    (cond ((empty-deque? q)
	   (set-front! q new-pair)
	   (set-rear! q new-pair))
	  (else 
	    (set-cdr! new-pair (front-ptr q))
	    (set-cdr! (car (front-ptr q)) new-pair)
	    (set-front! q new-pair)))))

(define (rear-insert-deque! q item)
  (let ((new-pair (cons (cons item '()) '())))
    (cond ((empty-deque? q)
	   (set-front! q new-pair)
	   (set-rear! q new-pair))
	  (else
	    (set-cdr! (rear-ptr q) new-pair)
	    (set-cdr! (car new-pair) (rear-ptr q))
	    (set-rear! q new-pair)))))

(define (front-delete-deque! q)
  (cond ((empty-deque? q) (error "FRONT-DELETE-DEQUE with an empty deque"))
	(else (set-front! q (cdr (front-ptr q)))
	      (or (empty-deque? q) (set-cdr! (car (front-ptr q)) '())))))
(define (rear-delete-deque! q)
  (cond ((empty-deque? q) (error "REAR-DELETE-DEQUE with an empty deque"))
	(else (set-rear! q (cdar (rear-ptr q)))
	      (if (null? (rear-ptr q)) (set-front! q '())
		(set-cdr! (rear-ptr q) '())))))

(define (front-deque q)
  (if (empty-deque? q)
    (error "FRONT-DEQUE with an empty deque")
    (caar (front-ptr q))))

(define (rear-deque q)
  (if (empty-deque? q)
    (error "REAR-DEQUE with an empty deque")
    (caar (rear-ptr q))))

(define q (make-deque))

(front-insert-deque! q 'a)
(rear-insert-deque! q 'b)
(rear-insert-deque! q 'c)
(newline)
(display (front-deque q))
; a
(newline)
(display (rear-deque q))
; c
(front-delete-deque! q)
(newline)
(display (front-deque q))
; b

(rear-delete-deque! q)
(newline)
(display (rear-deque q))
; b
