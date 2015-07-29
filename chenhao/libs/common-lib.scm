(define (add-list items item)
 (cons item items ))

(define nil '())
(define (append a b)
  (if (null? a)
       b
      (cons (car a) (append (cdr a) b))))

(define (reverse l)
  (if (null? l)
       nil
      (append (cdr l) (cons (car l) nil))))
