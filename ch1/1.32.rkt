#lang sicp


(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(sum identity 1 inc 100)
; => 5050

(define (product term a next b)
  (accumulate * 1 term a next b))

(product identity 1 inc 6)
; => 720



; Iterative Process
(define (accumulate-iter combiner null-value term a next b)
  (define (iter k result)
     (if (> k b)
         result
         (iter (next k) (combiner result (term k)))))
  (iter a null-value))


(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(sum-iter identity 1 inc 100)
; => 5050

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(product-iter identity 1 inc 6)
; => 720