(define (timed-search-for-primes start)
  (define (search-for-primes start start-time) 
    (define (even? n) 
      (= (remainder n 2) 0))

    (define (report-prime p elapsed-time)
      (display p)
      (display " *** ")
      (display elapsed-time))

    (if (even? start) 
      (search-for-primes (+ 1 start) start-time) 
      (if (prime? start) 
	(report-prime start (- (runtime) start-time)) 
	(search-for-primes (+ 2 start) start-time))))

  (search-for-primes start (runtime)))

