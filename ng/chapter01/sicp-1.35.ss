;; sicp 1.35

(load "sicp-utils.ss")

(fixed-point (lambda (x) (+ 1 (/ 1.0 x)))
             1.0)

;; => 1.6180339901755971
