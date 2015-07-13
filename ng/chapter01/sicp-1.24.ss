(load "sicp-utils.ss")

;; procedure fast-prime?
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (10-times-fast-prime? n)
  (fast-prime? n 10))

;; procedure prime?
(define (prime? n)
  (= (smallest-divisor n) n))


;; timed-prime-test
(define (calculate-test-prime-time test-prime-fn n)
  (let ((start-time (current-inexact-milliseconds)))
    (if (test-prime-fn n)
        (- (current-inexact-milliseconds) start-time)
        0)))

(for ([i '(1009 1013 1019 10007)])
  (let ((normal (calculate-test-prime-time prime? i))
        (fast (calculate-test-prime-time 10-times-fast-prime? i)))
    (printf "prime? elapsed time: ~a\n" normal)
    (printf "fast-prime? elapsed time: ~a\n" fast)
    (printf "ratio: ~a\n\n" (/ fast normal))))
