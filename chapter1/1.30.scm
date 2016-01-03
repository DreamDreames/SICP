(define (cube x) (* x x x))

(define (simpson-integral f a b n)
  (define (sum term a next b)
    (define (iter a result)
      (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
    (iter a 0))

  (define (inc x)
    (+ x 1))

  (define (even? x)
    (= (remainder x 2) 0))

  (define h (/ (- b a) n))

  (define (simpson k) 
    (define y (f (+ a (* k h))))
    (if (or (= k 0) (= k n)) 
      y
      (if (even? k) (* 2 y) (* 4 y))))

  (* (/ h 3) (sum simpson 0 inc n)))


(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

