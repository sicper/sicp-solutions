;; sicp 1.36

(define (fixed-point f first-guess)
  (define tolerance 0.000001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (report-fixed-point x)
    (newline)
    (display " fixed point: ")
    (display x)
    (newline))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          (begin
            (report-fixed-point next)
            next)
          (begin
            (newline)
            (display " tried point: ")
            (display next)
            (try next)))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000)
                            (log x)))
             2.0)

(fixed-point (lambda (x) (average x (/ (log 1000)
                                       (log x))))
             2.0)
