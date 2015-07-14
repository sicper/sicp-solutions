(define (double x)
	(+ x x))

(define (half x)
	(/ x 2))

(define (mp a b)
	(cond ((= 0 b) 0)
	      ((even? b) (mp (double a) (half b)))
	      (else (+ (mp a (- b 1)) a))))
(define (even? a)
	(= 0 (remainder a 2)))

	

