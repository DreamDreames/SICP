(define x (list 1 2 3))
(define y (list 4 5 6))

(newline)
(display (append x y))
;(1 2 3 4 5 6)

(newline)
(display (cons x y))
;((1 2 3) (4 5 6))
; The correct answer for this one should be
;((1 2 3) 4 5 6)
; (cons a (list b c d)) is the same as (list a b c d)

(newline)
(display (list x y))
;((1 2 3) (4 5 6))
