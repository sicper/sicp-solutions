;; sicp 1.38

(define (N i) 1.0)
(define (D i)
  (let ((remain (remainder i 3)))
    (if (= remain 2)
        (* 2 (+ (/ (- i remain) 3) 1))
        1)))

(load "sicp-1.37.ss")
(+ 2 (cont-frac N D 100))
(+ 2 (cont-frac-iter N D 100))
