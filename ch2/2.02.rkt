#lang sicp

(define (average x y)
  (/ (+ x y) 2.0))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (make-point (average (x-point (end-segment segment))
                       (x-point (start-segment segment)))
              (average (y-point (end-segment segment))
                       (y-point (start-segment segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define p1 (make-point 1 2))
(define p2 (make-point 5 10))

(print-point p1)
(print-point p2)

(define segment (make-segment p1 p2))
(print-point (midpoint-segment segment))