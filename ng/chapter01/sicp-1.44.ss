;; sicp 1.44

(load "sicp-utils.ss")

(define (smooth f)
  (define dx 0.000001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3.0)))

(define (smooth-n f n)
  ((repeated smooth n) f))
