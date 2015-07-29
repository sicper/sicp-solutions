(load "../libs/common-lib.scm")
(define (fringe l)
  (cond ((null? l) nil)
        ((not (pair? (car l))) (cons (car l) (fringe (cdr l))))
        ((append (fringe (car l)) (fringe (cdr l))))))
(define x (list (list 1 2) (list 3 4)))
;x
(fringe (list x x))

