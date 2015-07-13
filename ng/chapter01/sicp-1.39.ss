;; sicp 1.39

(define (tan-cf x k)
  (define (D n) (+ (* 2 (- n 1)) 1))
  (define (help D i)
    (if (= i k)
        (/ (square x) (D i))
        (/ (square x)
           (- (D i)
              (help D (+ i 1))))))
  (/ (help D 1) x))

(tan-cf (/ 3.1415926 4) 100)
