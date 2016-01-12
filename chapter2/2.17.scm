(define (last-pair items)
  (define (iter-pair pre items)
    (if (null? items)
      pre
      (iter-pair (car items) (cdr items))))
  (iter-pair '() items))

(define (last-pair2 items)
  (let ((rest (cdr items)))
    (if (null? rest)
      (car items)
      (last-pair2 rest))))

(last-pair (list 23 72 149 34))
(last-pair2 (list 23 72 149 34))
; (34)
