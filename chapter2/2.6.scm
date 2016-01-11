(define zero 
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  ; one is add-1 zero
  ;(add-1 zero)
  ; so we have
  ;(lambda (f) (lambda (x) (f ((zero f) x))))
  ; zero is a function that takes one arg and returns
  ; a function that takes one arg and just returns the arg
  ; so ((zero f) x) is just x
  ; so we have
  (lambda (f) (lambda (x) (f x))))

(define two
  ; two is add-one one
  ;(add-1 one)
  ; that is
  ;(lambda (f) (lambda (x) (f ((one f) x)))))
  ; replace one with its definition
  ; we have
  (lambda (f) (lambda (x) (f (f x)))))


(define three
  ;(add-1 two))
  ; that is
  ;(lambda (f) (lambda (x) (f ((two f) x)))))
  ; that is
  ;(lambda (f) (lambda (x) (f ((lambda (x) (f (f x))) x))))
  (lambda (f) (lambda (x) (f (f (f x))))))

; To use the numbers
(define (church-to-int cn)
  ((cn (lambda (n) (+ n 1))) 0))

(newline)
(display (church-to-int zero))
(newline)
(display (church-to-int one))
(newline)
(display (church-to-int two))
(newline)
(display (church-to-int three))
