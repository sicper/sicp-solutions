(define (accumulate combiner null-value term next a b)
	(if  (> a b)
		 null-value
		 (combiner (term a) (accumulate combiner null-value term next (next a) b))
	)
)

(define (accumulate_iter combiner null-value term next a b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner (term a) result))
		)
	)

	(iter a null-value)
)

(define (term n)
	n
)

(define (next n)
	(+ n 1)
)	 

(define  (sum a b)
	(accumulate + 0 term next a b)
)

(define (product a b)
	(accumulate * 1 term next a b)
)
