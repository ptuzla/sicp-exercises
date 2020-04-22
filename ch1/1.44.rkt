#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

; another implementation   
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (dec n)))))
        
        
;((repeated (lambda (x) (* x x)) 2) 5)
; => 625


(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3.0)))

(define (cube x) (* x x x))

((smooth cube) 3)
; => 27.000000000599996
((smooth (smooth cube)) 3)
; => 27.000000001199997

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth cube 2) 3)
; => 27.000000001199997