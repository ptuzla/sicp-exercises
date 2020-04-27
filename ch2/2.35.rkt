#lang sicp


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))


(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (not (pair? x))
                         1
                         (count-leaves x))) t)))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
; => 4

(define y (list 1 2 3))
(define z (list 4 5 6))

(count-leaves (cons y z))
; => 6