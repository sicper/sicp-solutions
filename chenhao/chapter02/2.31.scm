(load "2.30.scm")
(define (tree-map func tree)
  (cond ((null? tree) nil)
        ((pair? tree) (cons (tree-map func (car tree)) (tree-map func (cdr tree))))
        (else  (func tree) )))

(define (square-tree tree)
  (tree-map (lambda (x) (expt x 2)) tree))
x
(square-tree x)
