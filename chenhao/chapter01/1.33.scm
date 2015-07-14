;递归模板
(define (accumulate combiner null-value term next filter a b)
	(if  (> a b)
		 null-value
		 (  if (filter a) 
		 	(combiner (term a) (accumulate combiner null-value filter term next (next a) b))
		 	(accumulate combiner null-value filter term next (next a) b)
		 )
	)
)
;迭代模板
(define (accumulate_iter combiner null-value term next filter a b)
	(define (iter a result)
		(if (> a b)
			result
			( 	if (filter a)
				(iter (next a) (combiner (term a) result))
				(iter (next a) result)
			)
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

;取余求幂
(define (exp_remain base exp n)
	(cond ((= exp 0) 1)
		 ((even? exp) (remainder (square (exp_remain base (/ exp 2) n)) n))
		 (else (remainder (* base (exp_remain base (- exp 1) n)) n))
	)
)

(define (fema_test n)
	(define (try_it a n)
		(= (exp_remain a n n) a)
	)	
	(try_it (+ (random (- n 1)) 1) n)
)


(define (fast_prime? n times)
	(cond ((= times 0) true)
		  ((fema_test n) (fast_prime? n (- times 1)))
		  (else false)
	) 
)

;默认验证10次 有待改进
(define (prime? n)
	(fast_prime? n 10)
)	

(define (GCD a b)
	(if (= b 0)
		a
		(GCD b (remainder a b))
	)
)

;［a b］范围内的素数求和
(define  (sum_prime a b)
	(accumulate + 0 term next prime? a b)
)

;[1,n]之间与 n互素的数的乘积
(define (product_prime n)
	(define (co_prime? m)
		(= (GCD m n) 1)
	)
	(accumulate_iter * 1 term next co_prime? 1 n)
)


