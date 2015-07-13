;; sicp 1.40

(define (cubic a b c)
  (newton-transform (lambda (x)
                      (+ (cube x)
                         (* a (square x))
                         (* b x)
                         c))))
