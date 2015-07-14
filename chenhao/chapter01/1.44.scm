(define dx 0.0001)

(define (smooth f)
(lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3.0)))


;(define (fun x)
;(if en)
;)



(load "1.43.scm")

(((repeat (smooth) 5) abs)  1.0)
