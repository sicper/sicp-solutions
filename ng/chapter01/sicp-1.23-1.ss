(load "sicp-utils.ss")

(define (find-divisor-old n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-old n (+ test-divisor 1)))))

(define (smallest-divisor-old n)
  (find-divisor-old n 2))


(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor-new n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor-new n (next test-divisor)))))

(define (smallest-divisor-new n)
  (find-divisor-new n 2))

(require racket/trace)
(trace find-divisor-old)
(trace find-divisor-new)


(define prime-1000 (list-primes-n 1000 10000 3))
(define prime-10000 (list-primes-n 10000 1000000 3))
(define prime-100000 (list-primes-n 100000 1000000 3))
(define prime-list (append prime-1000
                           prime-10000
                           prime-100000))

(for ([n (list-primes-n 100 1000 1)])
  (display "process ")
  (display n)
  (newline)
  (smallest-divisor-old n)
  (smallest-divisor-new n)
  (newline))
