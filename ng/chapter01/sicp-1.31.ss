;; define product

(define (product term a next b)
  (if (> a b)
      1.0
      (* (term a)
         (product term (next a) next b))))

(define (fact n)
  (product (lambda (x) x)
           1
           (lambda (a) (+ a 1))
           n))

(define (pi)
  (define (help i a b)
    (cond ((= i 1) (/ a b))
          ((even? i) (help (- i 1)
                           (+ a 2)
                           b))
          (else (help (- i 1)
                      a
                      (+ b 2)))))
  (define (term a)
    (help a 2.0 3.0))
  (define (next x)
    (+ x 1))
  (define (pi-n n)
    (product term 1 next n))
  (* 4 (pi-n 1000)))


(define (product-iter term a next b acc)
  (if (> a b)
      acc
      (product-iter term
                    (next a)
                    b
                    (* (term a)
                       acc))))
