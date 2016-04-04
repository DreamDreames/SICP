; not implemented yet...
(define (f x)
  ; mit-scheme has a build-in letrec
  (letrec ((even?
             (lambda (n)
               (if (= n 0)
                 true
                 (odd? (- n 1)))))
           (odd?
             (lambda (n)
               (if (= n 0)
                 false
                 (even? (- n 1))))))
    (if (even? x)
      (display "even")
      (display "odd"))))

(newline)
(display (f 10))
; even
(newline)
(display (f 3))
; odd

