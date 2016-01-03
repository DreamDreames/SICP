(define (f g)
  (g 2))
 
(f square)

(f (lambda (z) (* z (+ z 1))))

;;(f f)

;; First invocation of f will attempt to apply its arugment (which is f) to 2.
;; This second invocation will attempt to apply its argument (which is 2) to 2, resulting in error
;; (f f)
;; (f 2)
;; (2 2)
;; Error
;; MIT Scheme reports: The object 2 is not applicable
