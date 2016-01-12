(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? items)
    '() 
    (append (reverse (cdr items)) (cons (car items) '()))))


(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)
