(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
	     (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
	     (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
	     (* s (ycor-vect v))))


(define make-segment list)
(define start-segment car)
(define end-segment cadr)
(define v1 (make-vect 1 2))
(define v2 (make-vect 3 4))

(define seg (make-segment v1 v2))
(newline)
(display v1)
(newline)
(display v2)
(newline)
(display seg)
(newline)
(display (start-segment seg))
(newline)
(display (end-segment seg))
