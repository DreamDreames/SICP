(define (make-serializer)
  (let ((sep (make-semaphore 2)))
    (lambda (p)
      (define (serialized-p . args)
        (sep 'acquire)
        (let ((val (apply p args)))
          (sep 'release)
          val))
      serialized-p)))

(define (make-semaphore n)
  (define (the-semaphore m)
    (cond ((eq? m 'acquire)
           (if (test-and-set! n)
             (the-semaphore 'acquire)))
          ((eq? m 'release) (clear! n))))
  the-semaphore)

(define (clear! cell)
  (set! cell (+ 1 cell)))

(define (test-and-set! cell)
  (if (<= cell 0)
    true
    (begin (set! cell (- cell 1))
           false)))


