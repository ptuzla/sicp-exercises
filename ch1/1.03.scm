#lang sicp

(define (square x)
  (* x x))

(define (sum-of-squares-of-two-larger x y z)
  (cond ((and (>= x z) (>= y z)) (+ (square x) (square y)))
        ((and (>= y x) (>= z x)) (+ (square y) (square z)))
        ((and (>= x y) (>= z y)) (+ (square x) (square z)))))

(sum-of-squares-of-two-larger 1 2 3) ; 13
(sum-of-squares-of-two-larger 2 1 3) ; 13
(sum-of-squares-of-two-larger 2 3 1) ; 13
(sum-of-squares-of-two-larger 3 2 1) ; 13
(sum-of-squares-of-two-larger 1 2 2) ; 8
(sum-of-squares-of-two-larger 3 3 2) ; 18