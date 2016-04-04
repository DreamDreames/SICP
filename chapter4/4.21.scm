((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
        1 
        (* k (ft ft (- k 1)))))))
 10)
; 10!

((lambda (n)
   ((lambda (fib)
      (fib fib n))
    (lambda (fi k)
      (if (< k 2) 
        k
        (+ (fi fi (- k 1)) (fi fi (- k 2)))))))
 6)
; fib 6 = 8
