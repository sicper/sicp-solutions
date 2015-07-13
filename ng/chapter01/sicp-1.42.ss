;; sicp 1.42

(define (compose f g)
  (lambda (x)
    (f (g x))))

((compose (lambda (x) (* x x)) inc) 6)
