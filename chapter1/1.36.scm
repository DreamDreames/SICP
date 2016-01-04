(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))

  (try first-guess))


;; Find one answer of x^x = 1000
(define log-1000 
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

;; Use average damping technic
;; average damping is much faster than the previous solution
(define log-1000-average-damping
  (fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2.0))


(newline)
(display log-1000)
(newline)
(display "done")
(newline)
(display "Using average damping...")
(newline)
(display log-1000-average-damping)
(newline)
(display "done")

