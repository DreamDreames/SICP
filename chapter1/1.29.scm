(define (cube x) (* x x x))

(define (simpson-integral f a b n)
  (define (sum term a next b)
    (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

  (define (inc x)
    (+ x 1))

  (define (even? x)
    (= (remainder x 2) 0))

  (define h (/ (- b a) n))

  (define (y k)
    (f (+ a (* k h))))

  (define (simpson k)
    (if (or (= k 0) (= k n)) 
      (y k)
      (if (even? k) (* 2 (y k)) (* 4 (y k)))))

  (* (/ h 3) (sum simpson 0 inc n)))


(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

