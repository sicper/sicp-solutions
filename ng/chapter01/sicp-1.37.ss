;; sicp 1.37

(define (cont-frac n d k)
  (define (help i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i)
           (+ (d i)
              (help (+ i 1))))))
  (help 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
;; => 0.6180339887498948


;; iterative cont-frac
(define (cont-frac-iter n d k)
  (define (help-iter i acc)
    (if (= i 0)
        acc
        (help-iter (- i 1)
                   (/ (n i)
                      (+ (d i) acc)))))
  (help-iter k 0))
