(define (average a b)
  (/ (+ a b) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (display-stream s)
  (if (stream-null? s)
    '()
    (begin
      (newline)
      (display (stream-car s))
      (display-stream (stream-cdr s)))))

(define (stream-limit s tolerance)
  (if (< (abs (- (stream-car s) (stream-car (stream-cdr s)))) tolerance)
    (stream-car s)
    (stream-limit (stream-cdr s) tolerance)))

(define (stream-limit2 s tolerance)
  (if (< (abs (- (stream-ref s 0) (stream-ref s 1))) tolerance)
    (stream-ref s 0)
    (stream-limit (stream-cdr s) tolerance)))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(define (sqrt2 x tolerance)
  (stream-limit2 (sqrt-stream x) tolerance))

(newline)
(display (sqrt 2 0.000001))

(newline)
(display (sqrt2 2 0.000001))
