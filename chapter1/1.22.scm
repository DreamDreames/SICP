(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes start end)
  (define (even? n)
    (= (remainder n 2) 0))

  (define (search-iter cur last)
    (if (<= cur last) (timed-prime-test cur))
    (if (<= cur last) (search-iter (+ cur 2) last)))

  (search-iter (if (even? start) (+ start 1) start)
	       (if (even? end) (- end 1) end)))


(search-for-primes 1000 1019)
(search-for-primes 10000 1037)
(search-for-primes 100000 100043)
(search-for-primes 1000000 1000037)

(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)
