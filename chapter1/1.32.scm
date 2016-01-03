(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))


(define (inc x) (+ x 1))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-integers a b)
  (define (identity x) x)
  (sum identity a inc b))


(sum-integers 1 10)
