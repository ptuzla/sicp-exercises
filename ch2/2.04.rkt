#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 3 4))
; => 3
(cdr (cons 3 4))
; => 4

; verification with substitution model
;(car z)
;(car (cons x y))
;(car (lambda (m) (m x y)))
;((lambda (m) (m x y)) (lambda (p q) p))
;((lambda (p q) p) x y)
;x

     