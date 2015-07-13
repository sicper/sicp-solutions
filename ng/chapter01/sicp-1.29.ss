;; 辛普森规则 求积分
(load "sicp-utils.ss")

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f
          (+ a (/ dx 2.0))
          add-dx
          b)
     dx))


(define (simpson-rule f a b n)
  (define h (/ (- b a) (* 1.0 n)))
  (define (y k) (f (+ a (* k h))))
  (define (term i)
    (cond ((or (= i 0) (= i n)) (y i))
          ((even? i) (* 2 (y i)))
          (else (* 4 (y i)))))
  (define (next x) (+ x 1))
  (* (/ h 3.0)
     (sum term 0 next n)))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)
