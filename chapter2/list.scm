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

(define (list-ref items n)
  (if (= n 0)
    (car items)
    (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))
(list-ref squares 3)
; 16

(define (length items)
  (if (null? items)
    0
    (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))
(length odds)
; 4

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(append odds squares)
; (1 3 5 7 1 4 9 16 25)


