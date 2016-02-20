(define (make-accumulator initial)
  (lambda (value)
    (set! initial (+ initial value))
    initial))

(define A (make-accumulator 5))
(newline)
(display (A 10))
; 15

(newline)
(display (A 10))
; 25
