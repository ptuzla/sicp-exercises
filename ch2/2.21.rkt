#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-m items)
  (map square items))


(square-list (list 1 2 3 4))
; => (1 4 9 16)
(square-list-m (list 1 2 3 4))
; => (1 4 9 16)
