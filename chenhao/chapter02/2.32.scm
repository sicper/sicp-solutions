(load "../libs/common-lib.scm")
(define (sub-sets s)
  (if (null? s)
      (list nil)
      (let ((rest (sub-sets (cdr s))))
           (append rest (map (lambda (x) (append  (list (car s))  x)) rest)))))

(define s (list 1 3 4 5))
(sub-sets s)
