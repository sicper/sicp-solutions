(load "../libs/common-lib.scm")
(define x (list (list 1 2) (list (list 3 4 ) (list 5 6))))
;x

;(reverse x)

(define (deep-reverse l)
(cond ((null? l) nil) 
      ((not (pair? l)) l)
      (else (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))))
(deep-reverse x)
