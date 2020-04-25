#lang sicp

(define (filter f xs)
  (if (null? xs)
      nil
      (if (f (car xs))
          (cons (car xs) (filter f (cdr xs)))
          (filter f (cdr xs)))))

(filter odd? (list 1 2 3 4 5 6))
; => (1 3 5)

(define (same-parity . x)
  (if (even? (car x))
      (filter even? x)
      (filter odd? x)))

(same-parity 1 2 3 4 5 6)
; => (1 3 5)

(same-parity 0 1 2 3 4 5 6)
; => (0 2 4 6)