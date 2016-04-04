; an interesting way to check odd/even...
(define (f x)
  (define (even? n)
    (if (= n 0)
      true
      (odd? (- n 1))))
  (define (odd? n)
    (if (= n 0)
      false
      (even? (- n 1))))
  (if (even? x)
    (display "even")
    (display "odd")))
