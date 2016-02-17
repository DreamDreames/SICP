(define (range start end)
  (if (> start end)
    '()
    (cons start (range (+ start 1) end))))

(define (aggregate op array1 array2)
  (map (lambda (k) 
	(map (lambda (x) (op x k)) array2))
    array1))
(define (add array1 array2)
  (aggregate + array1 array2))

(define (mul array1 array2)
  (if (pair? array2) 
    (aggregate * array1 array2))
    (map (lambda (x) (* x array2)) array1))

(define (ge array threshold)
  (filter (lambda (x) (>= x threshold))
    array))

(define a1 (range 1 9))
(define a2 (range 0 9))
(newline)
(define temp (mul a1 10))
(display temp)
(newline)
(display (add a1 temp))
(display (add a2 (mul a1 10)))
(define b1 (range 1 9))
(define b2 (range 0 9))

(define c1 (range 0 9))
(define c2 (range 0 9))

;(define rule1 (ge (mul b2 (add (mul a1 10) a2)) 100))
;(define rule2 (ge (mul b1 (add (mul a1 10) a2)) 100))

;;(rule2 (rule1))


