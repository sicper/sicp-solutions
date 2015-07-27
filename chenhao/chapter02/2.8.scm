(load "2.7.scm")

(define (sub-interval a b)
	(let ((lower (- (lower-bound a) (upper-bound b)))
		  (uppder (- (upper-bound a) (lower-bound b))))
	(make-interval lower uppder)))


