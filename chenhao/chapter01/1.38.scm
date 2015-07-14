(load "1.37.scm")

(define (D i)
	(let ((tmp (remainder i 3)))
	(if (= 2 tmp)
		(* 2 (+ 1 (/ (- i tmp) 3)))
		1
	)
	)	
)

(define (get-e k)
(+ 2 (cont-frac-iter D (lambda (i) 1.0) k 0.0))
)
(newline)
(display (get-e 50))