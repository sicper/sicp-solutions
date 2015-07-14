
(define (even? n)
(= (remainder n 2)  0)
)



(define (fast-expt-iter b n acc)
        (cond ((= 0 n) acc)
                  ((even? n) (fast-expt-iter (* b b) (/ n 2) acc))
                  (else (fast-expt-iter  b (- n 1) (* acc b)))
        ))


(define (expt b n)
(fast-expt-iter b n 1)
)
