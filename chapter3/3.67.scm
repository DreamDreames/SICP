(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream s1)
                 (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream 
    (list (stream-car s) (stream-car t))
    (interleave 
      (interleave 
        (stream-map (lambda (x) (list (stream-car s) x)) 
                    (stream-cdr t)) 
        (pairs (stream-cdr s) (stream-cdr t)))
      (stream-map (lambda (x) (list (stream-car t) x))
                  (stream-cdr s)))))

(define (integers-start-from n)
  (cons-stream n
               (integers-start-from (+ n 1))))

(define integer
  (integers-start-from 0))

(define (display-stream s)
  (newline)
  (display (stream-car s))
  (display-stream (stream-cdr s)))
