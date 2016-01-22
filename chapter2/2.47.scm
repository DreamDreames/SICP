(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define origin-frame car)
(define edge1-frame cadr)
(define edge2-frame 
  ;(lambda (f) (cadr (cdr f))))
  caddr)

(define f (make-frame 0 1 2))
(newline)
(display (origin-frame f))
(newline)
(display (edge1-frame f))
(newline)
(display (edge2-frame f))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define origin-frame car)
(define edge1-frame cadr)
(define edge2-frame 
  ;(lambda (f) (cdr (cdr f))))
  cddr)

(define f (make-frame 0 1 2))
(newline)
(display (origin-frame f))
(newline)
(display (edge1-frame f))
(newline)
(display (edge2-frame f))
