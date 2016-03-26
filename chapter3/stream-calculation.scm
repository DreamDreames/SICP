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

(define (partial-sums s)
  (cons-stream (stream-car s)
               (stream-map + (partial-sums s) (stream-cdr s))))

(define (scale-stream s factor)
  (cons-stream (* (stream-car s) factor)
               (scale-stream (stream-cdr s) factor)))


(define (pi-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (pi-summands (+ n 2)))))
(define pi-stream
  (scale-stream (partial-sums (pi-summands 1)) 4))

;(display-stream pi-stream)

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
        (s1 (stream-ref s 1))
        (s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
                          (+ s0 (* -2 s1) s2)))
                 (euler-transform (stream-cdr s)))))

;(display-stream (euler-transform pi-stream))

(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform 
                             (transform s))))
(define (accelerated-sequence transform s)
  (stream-map stream-car
              (make-tableau transform s)))
(display-stream (accelerated-sequence euler-transform
                                      pi-stream))
