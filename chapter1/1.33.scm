(define (prime? n)
  (define (smallest-div n)
    (define (divides? a b)
      (= 0 (remainder b a)))
    (define (find-div n test)
      (cond ((> (square test) n) n) ((divides? test n) test)
	    (else (find-div n (+ test 1)))))
    (find-div n 2))

  (if (= n 1) false (= n (smallest-div n))))

(define (inc x) (+ x 1))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b) 
    null-value
    (if (filter a)
      (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
      (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))


(define (sum-of-prime-squares a b) (filtered-accumulate + 0 square a inc b prime?))

(sum-of-prime-squares 1 5)
