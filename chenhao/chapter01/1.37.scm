(define (cont-frac-resursive D N i k)
	(if (>  i k)
		0
		(/ (N i) (+ (D i) (cont-frac-resursive D N (+ i 1) k)))
	)
)


(define (cont-frac-iter D N k result)
	(if (= 0 k)
		result
		(cont-frac-iter D N (- k 1) (/ (N k) (+ (D k) result)))
	)
)
(newline)
(display (cont-frac-resursive (lambda (i) 1.0) (lambda (i) 1.0) 1.0 14))
(newline)
(display (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11 0.0))