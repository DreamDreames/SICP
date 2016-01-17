(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (begin
    ;(bkpt branch) 
    (car (cdr branch))))

; b)
(define (structure-is-mobile? structure)
  (pair? structure))

(define (branch-weight branch)
  (let ((struct (branch-structure branch))) 
    (if (structure-is-mobile? struct) 
      (total-weight struct)
      struct)))

(define (total-weight mobile)
    (+ (branch-weight (left-branch mobile))
       (branch-weight (right-branch mobile))))

; c)
(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))

(define (balance? mobile)
  (let ((left (left-branch mobile))
	(right (right-branch mobile))) 
    (and ((= (branch-torque (left-branch mobile)) 
	     (branch-torque (right-branch mobile))))
	 (balance? left)
	 (balance? right))))

(define mobile1 (make-mobile (make-branch 2 1)
			     (make-branch 1 2)))
(newline)
(display mobile1)

(define mobile2 (make-mobile (make-branch 3 mobile1)
			     (make-branch 9 1)))
(newline)
(display mobile2)

(define mobile3 (make-mobile (make-branch 4 mobile2)
			     (make-branch 8 2)))
(newline)
(display mobile3)

(newline)
(display (total-weight mobile1))
(newline)
(display (total-weight mobile2))
(newline)
(display (total-weight mobile3))

