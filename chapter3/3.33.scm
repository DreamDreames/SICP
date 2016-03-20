(define (averager a b c)
  (define (process-new-value)
    (cond ((and (has-value? a) (has-value? b))
	   (set-value! c 
		       (/ (+ (get-value a) (get-value b)) 2)))
	  ((and (has-value? a) (has-value c))
	   (set-value! b 
		       (- (* 2 c) a)))
	  ((and (has-value? b) (has-value? c))
	   (set-value! a
		       (- (* 2 c) b)))))
  (define (process-forget-value)
    (forget-value! c me)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
	   (process-new-value))
	  ((eq? request 'I-lost-my-value)
	   (process-new-value))
	  (else
	    (error "Unknown request -- ADDER" request))))
  me)
