(define (double f)
	(lambda (x) (f (f x))))

(define (repeat f n)
	(lambda (x)
	(cond ((= n 1) (f x))
		  ((even? n) ((double (repeat f (/ n 2))) x))
		  (else (f ((repeat f (- n 1)) x))))))

((repeat square 3) 5)		  
