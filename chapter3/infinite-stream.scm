(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

; all integers...
(define integers (integers-starting-from 1))

(define (divisible? x y) (= (remainder x y) 0))

(define no-sevens
  (stream-filter (lambda (x) (not (divisible? x 7)))
                 integers))

(newline)
(display "the 100th positive number that is not divisible by 7 is: ")
(display (stream-ref no-sevens 100))
; 117

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))

; the fibs that never ends...
(define fibs (fibgen 0 1))

(define (sieve stream)
  (cons-stream
    (stream-car stream)
    (sieve (stream-filter
             (lambda (x)
               (not (divisible? x (stream-car stream))))
             (stream-cdr stream)))))

; all the prime numbers in the world...
(define primes (sieve (integers-starting-from 2)))

(newline)
(display "the 50th prime number is: ")
(display (stream-ref primes 50))
; 233


; define an infinite stream implicitly...
(define ones (cons-stream 1 ones))
; 1 1 1 1 1 1...

(define (add-streams s1 s2)
  (stram-map + s1 s2))

; another way to define all the positive integers...
(define integers (cons-stream 1 (add-streams ones integers)))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs)
                                         fibs))))

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define double (cons-stream 1 (scale-stream double 2)))
; 1 2 4 8 16 ...

(define primes
  (cons-stream
    2
    (stream-filter prime? (integers-starting-from 3))))
(define (primes? n)
  (define (iter ps)
    (cond ((> (square (stream-car ps)) n) true)
          ((divisible? n (stream-car ps)) false)
          (else (iter (stream-cdr ps)))))
  (iter primes))


