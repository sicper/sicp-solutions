(load "../libs/common-lib.scm")
(define (same-party x . y)
  (define rs (cons x nil))
  (define (build-list item items rs)
     (if (null? items) 
         rs
         (if (even? (+ item (car items)))
              (build-list item (cdr items) (add-list rs (car items)))
              (build-list item (cdr items) rs))))
  (build-list x y rs))

