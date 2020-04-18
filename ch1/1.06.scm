#lang sicp

(define (square x) (* x x))
  
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
;5

(new-if (= 1 1) 0 5)
;0

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(sqrt-iter 1 2)
; because of the applicative order of evaluation
; 3rd argument to new-if, which is sqrt-iter call, is evaluated before being passed to new-if
; this results in an inifinite call loop of sqrt-iter and new-if
; sqrt-iter
;   new-if
;     sqrt-iter
;       new-if
;         ...
;         ...