(define (product term a next b)
    (define (iter a result)
      (if (> a b)
	result
	(iter (next a) (* result (term a)))))

    (iter a 1))



(define (factorial n)
  (define (inc x) (+ x 1))

  (define (f i) i)

  (product f 1 inc n))


(factorial 3)
