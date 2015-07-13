(load "sicp-utils.ss")

;; old version
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;; new version
(define (smallest-divisor-new n)
  (find-divisor-new n 2))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (find-divisor-new n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-new n (next test-divisor)))))

;; help macros
(define-syntax time-wrapper
  (syntax-rules ()
    [(_ func args ...)
     (let ((start-time (current-inexact-milliseconds)))
       (func args ...)
       (display "elapsed time: ")
       (display (- (current-inexact-milliseconds) start-time))
       (newline))]))

(list-primes-n 100 1000 1)

(for ([n (list-primes-n 100 1000 1)])
  (smallest-divisor n))
