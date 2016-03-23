(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define ones (cons-stream 1 ones))

(define integers (cons-stream 1 (add-streams ones integers)))
(define factorials (cons-stream 1 (mul-streams factorials (stream-cdr integers))))

(newline)
(display (stream-ref factorials 1))
; 2
(newline)
(display (stream-ref factorials 2))
; 6
(newline)
(display (stream-ref factorials 3))
; 24
(newline)
(display (stream-ref factorials 4))
; 120

