(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 0))

(define (partial-sums S)
  (cons-stream (stream-car S)
               (stream-map + (partial-sums S) (stream-cdr S))))

(define sum (partial-sums integers))

(newline)
(display (stream-ref sum 0))
; 0
(newline)
(display (stream-ref sum 1))
; 1
(newline)
(display (stream-ref sum 2))
; 3
(newline)
(display (stream-ref sum 3))
; 6
(newline)
(display (stream-ref sum 4))
; 10
