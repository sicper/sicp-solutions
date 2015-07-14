(define (cubic a b c)
	(lambda (x) ( + (* x x x) (* a x x) (* b x) c)))

(define (newtown-method f start)
	(fix-point (newtown-transform f) start))

(define tolerance 0.0001)

(define (close-engough? a b)
	(< (abs (- a b)) tolerance))

(define (half-next f x)
	(/ (+ x (f x)) 2.0))

(define (fix-point f start)
	(define next (half-next f start))
	(if (close-engough? start next)
		next
		(fix-point f next)))

(define (derive f)
	(define dx 0.00001)
	(lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newtown-transform f)
	(lambda (x) (- x (/ (f x) ((derive f) x)))))

(define res (newtown-method (cubic 2 3 4) 1.0))
((cubic 2 3 4) res)




