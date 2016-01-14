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
  (car (cdr branch)))

; b)
(define (structure-is-mobile? structure)
  (pair? structure))

(define (branch-weight branch)
  (let ((struct (branch-structure branch))) 
    (if (structure-is-mobile? struct) 
      (total-weight branch)
      struct)))

(define (total-weight mobile)
  (let ((left (left-branch mobile))
	(right (right-branch mobile)))
    (+ (branch-weight left)
       (branch-weight right))))

(define mobile1 (make-mobile (make-branch 2 1)
			     (make-branch 1 2)))

(define mobile2 (make-mobile (make-branch 3 mobile1)
			     (make-branch 9 1)))

(define mobile3 (make-mobile (make-branch 4 mobile2)
			     (make-branch 8 2)))

(newline)
(display (total-weight mobile1))
(newline)
(display (total-weight mobile2))
(newline)
(display (total-weight mobile3))

