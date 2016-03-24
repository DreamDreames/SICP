; a)
(define (integrate-series s)
  (stream-map * (stream-map / ones integers) s))


; b)
(define sine-series (cons-stream 0 
                                 (integrate-series consine-series)))

(define cosine-series (cons-stream 1 
                                   (integrate-series (scale-stream sine-series -1))))
