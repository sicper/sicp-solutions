;; accumulate recursive
(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recur combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))

(define (sum term a next b)
  (accumulate-recur + 0 term a next b))

(define (product term a next b)
  (accumulate-recur * 1 term a next b))


;; accumulate iterative
(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-iter combiner
                       (combiner (term a)
                                 null-value)
                       term
                       (next a)
                       next
                       b)))
