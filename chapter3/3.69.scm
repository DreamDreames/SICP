(define (interleave s1 s2)
  (if (stream-null? s1)
    s2
    (cons-stream (stream s1)
                 (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream 
    (list (stream-car s) (stream-car t))
    (interleave 
      (stream-map (lambda (x) (list (stream-car s) x))
                  (stream-cdr t))
      (pairs (stream-cdr s) (stream-cdr t)))))

(define (triples s t u)
  (cons-stream
    (list (stream-car s) (stream-car t) (stream-car u))
    (interleave
      (stream-map (lambda (x) (cons (stream-car s)))
                  (stream-cdr (pairs t u)))
      (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (yanghui t)
  (stream-filter (lambda (x)
                   (= (square (caddr x))
                      (+ (square (car x))
                         (square (cadr x)))))
                 t))
