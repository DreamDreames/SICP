(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var) 
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	   (make-product (multiplier exp)
			 (deriv (multiplicand exp) var))
	   (make-product (deriv (multiplier exp) var)
			 (multiplicand exp))))
	(else (error "unknown expression type -- DERIV" exp))))

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
					   var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-sum-package)
  (define (make-sum x y) (cons x y))
  (define (addend s) (cadr s))
  (define (augend s) (caddr s))
  (define (deriv-sum s)
    (make-sum (deriv (addend a)) 
	      (deriv (augend s))))
  (define (tag x) (attach-tag '+ x))
  (put 'deriv '(+) deriv-sum)
  (put 'make-sum '+
       (lambda (x y) (tag (make-sum x y))))
  'done)

(define (make-sum x y)
  ((get 'make-sum '+) x y))

(define (install-product-package)
  (define (make-product x y) (cons x y))
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))
  (define (deriv-product p)
    (make-sum
      (make-product (multiplier exp)
		    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
		    (multiplicand exp))))
  (define (tag x) (attach-tag '* x))
  (put 'deriv '(*) deriv-product)
  (put 'make-product '*
       (lambda (x y) (tag (make-product x y))))
  'done)

(define (make-product x y)
  ((get 'make-product '*) x y))
(define (deriv x) (apply-generic 'deriv x))

