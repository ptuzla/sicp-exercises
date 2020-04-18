#lang sicp
(#%require "./exlib1.scm")

(sqrt-iter 1 0.0009)
; with small numbers, there's not enough precision
; => 0.04030062264654547

(define very-large-num 1e+56)
(sqrt-iter 1 very-large-num)
; with very large numbers, since floating point numbers
; don't have enough precision, the result it never close enough
; and the process runs indefinitely
; => ...

; having defined the improved version of the good-enough? procedure
(define (good-enough? guess x)
  (< (abs (- (square guess) x))  (* x 0.001)))

(sqrt-iter 1 0.0009)
; enough precision
; => 0.030000012746348552


(sqrt-iter 1 very-large-num)
; => 1.0000002626390475e+28
