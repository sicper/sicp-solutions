(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))
(define (weight-branch branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (weight-branch (left-branch mobile)) (weight-branch (right-branch mobile))))

(define (balance? mobile)
  (if (not (pair? mobile))
    1
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
   (and (balance? (branch-structure left)) (balance? (branch-structure right)) 
       (= (* (branch-length left) (weight-branch left))
          (* (branch-length right) (weight-branch right)))))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(total-weight a)
;Value: 6
(total-weight b)
;Value: 8
;创建个复杂的例子
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(total-weight c)
;Value: 14
(balance? c)
; 举一个平衡的例子
(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))
(balance? d)

  
