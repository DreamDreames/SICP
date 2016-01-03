(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))))


(define (factorial n)
  (define (inc x) (+ x 1))

  (define (f i) i)

  (product f 1 inc n))


(factorial 3)
