;(let ((a 1))
;  (define (f x)
;    (define b (+ a x))
;    (define a 5)
;    (+ a b))
;  (f 10)))

; I thought it is 20
; However, actually error on mit-scheme...

;(let ((a 1))
;  (define (f x)
;    (let ((b '*unassigned*)
;          (a '*unassigned*))
;      (let ((m (+ a x))
;            (n 5))
;        (set! b m)
;        (set! a n))
;      (+ a b)))
;  (f 10))
; This one also returns an error
; because when evaluating m, a was unassigned

(let ((a 1))
  (define (f x)
    (define b (delay (+ a x)))
    (define a (delay 5))
    (+ a b))
  (f 10))

; still an error: cannot pass promise to add...
