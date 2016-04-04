((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1 
        (* k (ft ft (- k 1)))))))
 10)
; 10!

; a)
((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fi k)
      (if (< k 2) 
        k
        (+ (fi fi (- k 1)) (fi fi (- k 2)))))))
 6)
; fib 6 = 8

; b)
(define (f x)
  ((lambda (new-even? new-odd?)
     (new-even? new-even? new-odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))


