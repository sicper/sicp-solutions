(load "2.10.scm")

(define (make-center-width c w)
(make-interval (- c w) (+ c w)))

(define (center i)
(/ (+ (upper-bound i) (lower-bound i)) 2.0))

(define (width i)
(/ (- (upper-bound i) (lower-bound i)) 2.0)) 

(define (make-center-percent c p)
	(make-center-width c (* c p)))

(define (percent i)
	(/ (width i) (center i)))

	