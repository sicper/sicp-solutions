; utils procedures


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; basic procedures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (abs x)
  (if (> x 0)
      x
      (- 0 x)))

(define (average x y)
  (/ (+ x y) 2.0))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (even? n) (= (remainder n 2) 0))

(define (divides? b a)
  (= (remainder a b) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (primes? n)
  (= (smallest-divisor n) n))

;; recursive version sum
(define (sum-recur term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; iterative version sum
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ result (term a)))))
  (iter a 0))

;; sum
(define (sum term a next b)
  (sum-iter term a next b))

;; sicp 1.3.3 half-interval-method
(define (negative? x) (< x 0))
(define (positive? x) (> x 0))

(define (search f negpoint pospoint)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))
  (let ((midpoint (average negpoint pospoint)))
    (if (close-enough? negpoint pospoint)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f negpoint midpoint))
                ((negative? test-value)
                 (search f midpoint pospoint))
                (else midpoint))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value)
                (positive? b-value))
           (search f a b))
          ((and (positive? a-value)
                (negative? b-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))


;; 1.3.3 fixed-point
(define (fixed-point f first-guess)
  (define tolerance 0.000001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


;; 1.3.4 newton transform
(define (deriv g)
  (define dx 0.000001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method f guess)
  (fixed-point (newton-transform g) guess))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; high-level procedures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (list-primes start end)
  (define (next x)
    (if (even? x)
        (+ x 1)
        (+ x 2)))
  (define (help a b lst)
    (cond ((> a b) lst)
          ((primes? a) (cons a
                             (help (next a)
                                   b
                                   lst)))
          (else (help (next a)
                      b
                      lst))))
  (help start end '()))

(define (list-primes-n start end n)
  (define (next x)
    (if (even? x)
        (+ x 1)
        (+ x 2)))
  (define (help a b cnt lst)
    (cond ((or (> a b)
               (> cnt n)) lst)
          ((primes? a) (cons a
                             (help (next a)
                                   b
                                   (+ cnt 1)
                                   lst)))
          (else (help (next a)
                      b
                      cnt
                      lst))))
  (help start end 1 '()))


(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((= n 0) (lambda (x) x))
        ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic macros
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-syntax define/trace
  (syntax-rules ()
    [(_ (func args ...) body ...)
     (define (func args ...)
       (let* ([real-func func]
              [old-args (list args ...)]
              [func (lambda (args ...)
                      (define new-args (list args ...))
                      (print-trace 'func old-args new-args)
                      (real-func args ...))])
         body ...))]))

(define (print-trace func old-args new-args)
  (display `(,func ,@old-args))
  (display " -> ")
  (display `(,func ,@new-args))
  (newline))
