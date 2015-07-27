(load "../libs/common-lib.scm")
(define (reverse items)
  (define (do-reverse items pre)
    (if (null? items)
        pre
        (do-reverse (cdr items) (cons (car items) pre))))
  (do-reverse items nil))
