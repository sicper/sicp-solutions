(load "2.12.scm")
(define (par1 x y)
	(div-interval (mul-interval x y) (add-interval x y)))

(define (par2 x y)
	(let ((one (make-interval 1 1)))
		(div-interval one (add-interval (div-interval one x) (div-interval one y)))))

(define a (make-center-percent 100.0 0.001))
(define b (make-center-percent 50.0 0.0001))




