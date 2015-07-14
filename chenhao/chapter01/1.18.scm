
(define (double x)
        (+ x x))

(define (half x)
        (/ x 2))

(define (even? x)
	(= 0 (remainder x 2)))


(define (mp_iter a b acc)
	(cond  ((= 0 b) acc)
		   ((even? b) (mp_iter (double a) (half b) acc))
		   (else (mp_iter a (- b 1) (+ acc a)))))


(define(* a b)
	(mp_iter a b 0))
