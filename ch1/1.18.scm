#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mul a b)
  (define (iter a b prod)
    (cond ((= b 0) prod)
          ((even? b) (iter (double a) (halve b) prod))
          (else (iter a (- b 1) (+ prod a)))))
  (iter a b 0))

(fast-mul 0 5)
; => 0
(fast-mul 1 5)
; => 5
(fast-mul 5 0)
; => 0
(fast-mul 5 1)
; => 5
(fast-mul 5 150)
; => 750
(fast-mul 5 15)
; => 75
(fast-mul 5 10)
; => 50
(fast-mul 10 150)
; => 1500
(fast-mul 10 3)
; => 30 