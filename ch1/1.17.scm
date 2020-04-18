#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))

(* 0 5)
; => 0
(* 1 5)
; => 5

(* 5 0)
; => 0
(* 5 1)
; => 5
(* 5 150)
; => 750