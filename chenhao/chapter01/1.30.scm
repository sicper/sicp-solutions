(define (next a)
	(+ a 1)
)

(define (term a)
	a
)

(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ result (term a))) 
		)
	)
	(iter a 0)	
)