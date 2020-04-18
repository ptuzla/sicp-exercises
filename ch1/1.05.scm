#lang sicp


(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Applicative order evaluation
(test 0 (p))
; p is called infinitely

;; Normal order evaluation

(test 0 (p))
;(test 0 (p))
;(if (= x 0)
;    0
;    (p))
;0