#lang sicp

(#%require "./exlib1.rkt")
(define (filtered-accumulate combiner null-value predicate term a next b)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a)
                    (filtered-accumulate combiner null-value predicate term (next a) next b))
          (filtered-accumulate combiner null-value predicate term (next a) next b))))


; ex: product of even numbers
(define (product-even a b)
  (filtered-accumulate * 1 even? identity a inc b))

; (* 2 4 6) => 48
(product-even 1 6)
; => 48


(define (sum-sqr-prime a b)
  (filtered-accumulate + 0 prime? square a inc b))

; (+ 1 4 9 25 49) => 88
(sum-sqr-prime 1 10)
; => 88



; e product of all the positive integers less than n that are relatively prime to n
; (i.e., all positive integers i<n such that GCD(i,n)=1)
(define (product-rel-prime n)
  (define (rel-prime-to-n? x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 rel-prime-to-n? identity 1 inc (- n 1)))


(product-rel-prime 10)
; => 189