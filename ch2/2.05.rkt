#lang sicp

(define (square x) (* x x))
 

; helper method to find the bases of 2 and 3
(define (helper n x)
  (if (= (remainder n x) 0)
      (helper (/ n x) x)
      n))

(define n (* (expt 2 5) (expt 3 4)))
(helper n 2)
; => 81

(helper n 3)
; => 32

(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))
      


(car (cons 5 4))
; => 5.0
(cdr (cons 5 4))
; => 4.0

; edge case: works with 0
(car (cons 0 3))
; => 0
(cdr (cons 0 3))
; => 3.0

; edge case: works with large numbers (as exponents)
(car (cons 1150 1610))
; => 1150
(cdr (cons 1150 1610))
; => 1610
