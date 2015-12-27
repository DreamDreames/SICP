(define (pascal r c)
    (cond ((or (< c 0) (> c r)) 0)
	  ((or (= c 0) (= c r)) 1)
	  (else (+ (pascal (- r 1) (- c 1) ) (pascal (- r 1) c )))))


(pascal 0 0)
(pascal 1 0)
(pascal 1 1)
(pascal 2 0)
(pascal 2 1)
(pascal 2 2)



