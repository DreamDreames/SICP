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

(define (pi n)
  (define (inc x) (+ x 1))

  (define (pi-term n)
    (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

  (* (product pi-term 1 inc n) 4.0))


(factorial 3)

(pi 10000)
