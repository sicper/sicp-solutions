(load "2.10.scm")

(define (up-zero? x)
(> (lowwer-bound x) 0)
)

(define (below-zero? x)
(< (upper-bound x) 0)
)

;太晕了，无法保证代码正确。。。
;应该使用let定义临时变量
(define (mul-interval x y)
	(cond ((up-zero? x) (cond ((up-zero? y) (make-interval (* (lowwer-bound x) (lowwer-bound y)) (* (upper-bound x) (upper-bound y))))
							  ((below-zero? y) (make-interval (* (upper-bound x) (lowwer-bound y)) (* (lowwer-bound x) (upper-bound y))))
							  (else (make-interval (* (upper-bound x) (lowwer-bound y)) (* (upper-bound x) (upper-bound y))))))
		  ((up-zero? x) (cond ((lowwer-zero? y) (make-interval (* (lowwer-bound x) (upper-bound y)) (* (upper-bound x) (lowwer-bound y))))
							  ((below-zero? y) (make-interval (* (upper-bound x) (upper-bound y)) (* (lowwer-bound x) (lowwer-bound y))))
							  (else (make-interval (* (lowwer-bound x) (upper-bound y)) (* (lowwer-bound x) (lowwer-bound y))))))
		  (else         (cond ((lowwer-zero? y) (make-interval (* (lowwer-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))
							  ((below-zero? y) (make-interval (* (upper-bound x) (lowwer-bound y)) (* (lowwer-bound x) (lowwer-bound y))))
							  (else (make-interval (min (* (upper-bound x) (lowwer-bound y)) (* (lowwer-bound x) (upper-bound y))) 
							   (max (* (lowwer-bound x) (lowwer-bound y)) (* (upper-bound x) (upper-bound y)))))))))


