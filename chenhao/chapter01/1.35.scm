(define (fixed-point f first)
	(define tolorance 0.00001)
	(define (close_enough? a b)
		(< (abs (- a b)) tolorance)
	)
	(define (try test)
		(let ((y (f test)))
		(if (close_enough? test y)
			(/ (+ test y) 2.0)
			(try (/ (+ test y) 2.0))
		))
	)
	(try first)
)


(fixed-point (lambda (x) (+ (/ 1 x) 1)) 1.0)