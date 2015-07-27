(load "2.8.scm")
(define (do-div-interval x y)
(mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))))


(define (div-interval x y)
(let ((a (lower-bound y))
	  (b (upper-bound y)))
	 (cond ((<= a 0)((if (>= b 0) (error "meaningless div!") (do-div-interval x y))))
		   (else (do-div-interval x y)))))
