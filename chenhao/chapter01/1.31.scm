(define (factorial a b term next)
	(if  (> a b)
		 1
		 (* (term a) (factorial (next a) b term next))
	)
)

(define (factorial_iter a b term next)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a)))
		)
	) 
	(iter a 1.0)
)

(define (next n)
	(+ n 1)
)

(define (even_term n)
	(if(even? n)
		n
		(- n 1)
	)
)

(define (odd_term n)
	(if(odd? n)
		n
		(- n 1)
	)
)

(define (term n)
	(/  (* 1.0 (even_term n))
		(odd_term n)
	)
)






;会出现整型过大的问题
;(define (run n)
;	(/  (* 1.0 (factorial 3 n even_term next))
;		(factorial 3 n odd_term next))
;)

;(define (run-iter n)
;	(/  (* 1.0 (factorial_iter 3 n even_term next))
;		(factorial_iter 3 n odd_term next))
;)


			