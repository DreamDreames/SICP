((lambda (n)
   ((lambda (fact)
      (fact fact n))
    ; the first arg ft is necessary 
    ; because this lambda needs to call itself recursively
    ; if there's no ft, it cannot reference to itself
    ; so in fact, ft is this lambda itself
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
   ; in this case, ev? is the 2nd lambda
   ; od? is the 3rd lambda
   ; actually we are using the parameter of lambda to refer to lambda
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))
; is even ?
; (f 10) -> #t
; (f 3) -> #f

