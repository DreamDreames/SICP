(define (product term a next b)
  ;;(if (> a b)
    ;;1
    ;;(* (term a) (product term (next a) next b))))
    (define (iter a result)
      (if (> a b)
	result
	(* result (term a) (product term (next a) next b))))

    (iter a 1))



(define (factorial n)
  (define (inc x) (+ x 1))

  (define (f i) i)

  (product f 1 inc n))


(factorial 3)
