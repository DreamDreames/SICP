;; Solution from 
;; http://community.schemewiki.org/?sicp-ex-4.41

(define (flatmap proc li)
  (if (null? li)
    '()
    (let ((result (proc (car li)))
          (rest (flatmap proc (cdr li))))
      (if (pair? result)
        (append result rest)
        (cons result rest)))))

(define (permutations lists)
  (if (null? lists)
    '(())
    (flatmap (lambda (x)
               (map (lambda (y) (cons x y))
                    (permutations (cdr lists))))
             (cons lists))))

(define (restrictions l)
  (apply
    (lambda (baker cooper fletcher miller smith)
      (and (> miller copper)
           (not (= (abs (- smith fletcher)) 1))
           (not (= (abs (- fletcher cooper)) 1))
           (distinct? (list baker cooper fletcher miller smith))))
    l))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (multiple-dwelling)
  (let ((baker '(1 2 3 4))
        (cooper '(2 3 4 5))
        (fletcher '(2 3 4))
        (miller '(3 4 5))
        (smith '(1 2 3 4 5)))
    (filter restrictions (permutations (list baker cooper fletcher miller smith)))))
