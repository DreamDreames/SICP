(define withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))))

(newline)
(display (withdraw 10))
; 90
(newline)
(display (withdraw 10))
; 80

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds")))

(define w1 (make-withdraw 100))
(define w2 (make-withdraw 100))

(newline)
(display (w1 50))
; 50
(newline)
(display (w2 70))
; 30
(newline)
(display (w2 40))
; "insufficient funds"
(newline)
(display (w1 40))
; 10

