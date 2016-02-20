(define (make-monitored f)
  (define count 0)
  (define if f)
  (lambda (input)
    (cond ((eq? input 'how-many-calls?) count)
	  ((eq? input 'reset-count) 
	   (set! count 0)
	   count)
	  (else 
	    (set! count (+ count 1))
	    (if input)))))

(define s (make-monitored sqrt))

(newline)
(display (s 100))
; 10

(newline)
(display (s 'how-many-calls?))
; 1


(s 'reset-count)
(newline)
(display (s 'how-many-calls?))
; 0

(newline)
(display (s 100))
; 10

(newline)
(display (s 'how-many-calls?))
; 1
