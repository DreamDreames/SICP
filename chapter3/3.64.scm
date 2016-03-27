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

;(display-stream (sqrt-stream 2))

(define (stream-limit s tolerance)
  (if (< (abs (- (stream-car s) (stream-car (stream-cdr s)))) tolerance)
    (stream-car s)
    (stream-limit (stream-cdr s) tolerance)))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(newline)
(display (sqrt 2 0.000001))
