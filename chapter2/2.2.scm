(define (make-segment a b)
  (cons a b))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-point x y)
  (cons x y))

(define (x-point a)
  (car a))

(define (y-point a)
  (cdr a))

(define (midpoint-segment s)
  (let ((a (start-segment s))
	(b (end-segment s)))
    (make-point 
      (/ (+ (x-point a) (x-point b)) 2) 
      (/ (+ (y-point a) (y-point b)) 2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment
  (make-segment
    (make-point 1 1)
    (make-point 2 2))))
    
	
