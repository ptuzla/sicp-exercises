#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))


; one implementation
(define (repeated1 f n)
  (lambda (x)
    (define (helper k)
      (if (= k n)
          (f x)
          (f (helper (+ k 1)))))
    (helper 1)))

((repeated1 square 2) 5)
; => 625

; another implementation   
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (dec n)))))
        
        
((repeated square 2) 5)
; => 625

