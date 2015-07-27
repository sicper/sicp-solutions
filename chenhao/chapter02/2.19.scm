(load "../libs/common-lib.scm")
(define us-coins (list 50 10 25 1 5))
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more coin-values)) 0)
        (else ( + (cc (- amount (first-denomination coin-values)) coin-values)
           (cc amount (except-first-denomination coin-values))))))
(define (no-more items)
  (null? items))
(define (first-denomination items)
  (car items))
(define (except-first-denomination items)
  (cdr items))




