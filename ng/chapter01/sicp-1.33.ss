;; define filtered-accumulate
(define (filtered-accumulate combiner null-value filter term a next b)
  (cond ((> a b) null-value)
        ((filter a) (filtered-accumulate combiner
                                         (combiner (term a)
                                                   null-value)
                                         filter
                                         term
                                         (next a)
                                         next
                                         b))
        (else (filtered-accumulate combiner
                                   null-value
                                   filter
                                   term
                                   (next a)
                                   next
                                   b))))

(load "sicp-utils.ss")

(filtered-accumulate +
                     0
                     primes?
                     (lambda (x) x)
                     3
                     (lambda (x) (+ x 1))
                     100)
