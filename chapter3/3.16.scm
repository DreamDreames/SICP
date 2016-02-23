(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

(define first (cons 'a 'b))
(define second (cons 'a 'b))
(define third (cons first second))
(newline)
(display (count-pairs third))
; 3
(newline)
(set-car! second first)
(display (count-pairs third))
; 4
(newline)
(define first (cons 'a 'b))
(define second (cons first first))
(define third (cons second second))
(display (count-pairs third))
; 7

(define li '(a b c))
(set-cdr! (cddr li) li)
;(display (count-pairs li))
; never return

