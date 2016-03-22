; http://stackoverflow.com/questions/14640833/how-is-the-sicp-cons-stream-implemented
; delay should be defined as a macro
; If it's a function, scheme will try to evaluate its args before exec
; So just use the system defined delay in this exercise

(define the-empty-stream '())

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low 
      (stream-enumerate-interval (+ low 1) high))))

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))
; 0

(newline)
(display "stream-ref 5")
(stream-ref x 5)
; 1 2 3 4 5
(newline)
(display "stream-ref 7")
(stream-ref x 7)
; 6 7
