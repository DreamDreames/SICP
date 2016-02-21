(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
      balance)
  (define (dispatch m pwd)
    (cond ((not (eq? pwd password)) 
	   (lambda (x) "Incorrect password"))
	  ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request -- MAKE-ACCOUNT" m ))))
  dispatch)

(define (make-joint acc password new-password)
  (lambda (m pwd)
    (if (not (eq? pwd new-password))
      (lambda (x) "Incorrect password")
      (acc m password))))

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

(newline)
(display ((peter-acc 'withdraw 'open-sesame) 50))
; 50
(newline)
(display ((paul-acc 'withdraw 'rosebud) 20))
; 30

(newline)
(display ((paul-acc 'withdraw 'open-sesame) 10))
; Incorrect password
