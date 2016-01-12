(define nil '())
; Construct a list
; 1 -> 2 -> 3 -> 4 -> nil
(cons 1
      (cons 2
	    (cons 3
		  (cons 4 nil))))

; Scheme also provided a operator list
; The list above can be constructed with the following
(list 1 2 3 4)

(define one-through-four (list 1 2 3 4))

one-through-four
; (1 2 3 4)

(car one-through-four)
; 1

(cdr one-through-four)
; (2 3 4)

(cons 10 one-through-four)
; (10 1 2 3 4)
