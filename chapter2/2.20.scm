(define nil '())
(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (same-parity head . tail)
  (define (iter parity items)
    (if (null? items)
      nil
      (if (= (remainder (car items) 2) parity)
	(append (cons (car items) nil) (iter parity (cdr items)))
	(iter parity (cdr items)))))

  (append (cons head nil) (iter (remainder head 2) tail)))


(same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
(same-parity 2 3 4 5 6 7)
; (2 4 6)
