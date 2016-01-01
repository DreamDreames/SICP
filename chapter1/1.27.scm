(define (carmichael-test n expected)
  (define (square x) (* x x))

  (define (expmod base exp m)
    (cond ((= exp 0) 1)
	  ((even? exp)
	   (remainder (square (expmod base (/ exp 2) m)) m))
	  (else (remainder (* base (expmod base (- exp 1) m )) m ))))

  (define (full-fermat-prime? n)
    (define (iter a n)
      (if (= a n) true
	(if (= (expmod a n n) a) (iter (+ a 1) n) false)))

    (iter 1 n))

  (define (report-result n result expected)
    (newline)
    (display n)
    (display ": ")
    (display result)
    (display ": ")
    (display (if (eq? result expected) "OK" "FOOLED")))

  (report-result n (full-fermat-prime? n) expected))


(carmichael-test 2 true)
(carmichael-test 13 true)
(carmichael-test 14 false)


(carmichael-test 561 false)  ;; Carmichale number
(carmichael-test 1105 false) ;; Carmichale number
(carmichael-test 1729 false) ;; Carmichale number
(carmichael-test 2465 false) ;; Carmichale number
(carmichael-test 2821 false) ;; Carmichale number
(carmichael-test 6601 false) ;; Carmichale number

