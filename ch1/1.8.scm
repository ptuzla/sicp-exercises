#lang sicp

(define (square x) (* x x))

(define (cube x) (* x x x))
  
(define (good-enough? guess x)
  (< (abs (- (cube guess) x))  (* x 0.001)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
      3.0))


(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                 x)))

(cubert-iter 1 8)
; => 2.000004911675504

(cubert-iter 1 27)
; => 3.0000005410641766