#lang sicp

; f(n) = n if n<3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3

; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(f -1)
; => -1
(f 0)
; => 0
(f 3)
; => 4
(f 4)
; => 11
(f 5)
; => 25

; iterative process
(define (f-iter n)
  (define (iter c p1 p2 p3)
    (if (< n c)
      p1
      (iter
        (+ c 1)
        (+ p1
           (* 2 p2)
           (* 3 p3))
        p1
        p2)))

  (if (< n 3)
      n
      (iter 3 2 1 0)))
      
(f-iter -1)
; => -1
(f-iter 0)
; => 0
(f-iter 3)
; => 4
(f-iter 4)
; => 11
(f-iter 5)
; => 25