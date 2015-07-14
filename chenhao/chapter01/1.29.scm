(define (cube n)
	(* n n n)
)

(define (even? a)
	(= (remainder a 2) 0)
)

(define (item i n f)
	(if (even? i)
		(* 4 (f n))
		(* 2 (f n))
	)	
)

(define (simpson_sum i a b h f)
	(if (>= a b)
		0
		(+ (item i a f) (simpson_sum (+ i 1) (+ a h) b h f))
	)
)

(define (simpson a b n f)
	(* (/ (/ (- b a) n) 3) 
	   (+ (f a) (simpson_sum 0 a b (/ (- b a) n) f) (f b))
	)
)


