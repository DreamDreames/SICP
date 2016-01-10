(define (make-rat n d) 
  (define (gcd a b)
    (if (= b 0) 
      a
      (gcd b (remainder a b))))
  (let ((g (gcd n d)))
    (if (< (* n d) 0) 
      (cons (-(abs (/ n g))) (abs (/ d g)))
      (cons (abs (/ n g)) (abs (/ d g))))))
     ;cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 1 2))
(print-rat (make-rat -1 2))
(print-rat (make-rat -1 -2))
(print-rat (make-rat 1 -2))
