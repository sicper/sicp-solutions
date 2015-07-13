;; sicp 1.43

(define (repeated f n)
  (lambda (x)
    (if (= n 1)
        (f x)
        (compose f (repeated f (- n 1))))))

((repeated (lambda (x) (* x x)) 2) 5)
