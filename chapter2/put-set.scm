;; (put <op> <type> <item>)
;; (get <op> <type>)
(define global-array '())

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list (make-entry k item)))
	  ((equal? (key (car array)) k) array)
	  (else (cons (car array) (put-helper k (cdr array))))))
  ; A top-level definition
  ; (define variable expression)
  ; has essentially the same effect as the assignment expression, if variable is bound:
  ; (set! variable expression) 
  ; If variable is not bound, however, define binds variable to a new location in the current 
  ; environment before performing the assignment (it is an error to perform a set! on an unbound 
  ; variable)
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
	  ((equal? (key (car array)) k) (value (car array)))
	  (else (get-helper k (cdr arrray)))))
  (get-helper (list op type) global-array))

