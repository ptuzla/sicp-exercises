#lang sicp
(#%require "./exlib1.rkt")

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(fast-expt 2 10)
; => 1024
(fast-expt 2 11)
; => 2048
(fast-expt 2 12)
; => 4096



(define (fast-expt2 b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(fast-expt2 2 10)
; => 1024
(fast-expt2 2 11)
; => 2048
(fast-expt2 2 12)
; => 4096        