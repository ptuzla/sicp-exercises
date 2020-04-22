#lang sicp

(define (cube x)
  (* x x x))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (iter k sum)
      ;(display k)(display " - ")(display sum)(display "\n")
      (if (> k n)
          (* (/ h 3.0) sum)
          (let ((y (f (+ a (* k h))))
                (m (cond ((= k 0) 1)
                         ((= k n) 1)
                         ((even? k) 2)
                         (else 4))))
            (iter (+ k 1) (+ sum (* m y))))))
    (iter 0 0)))

(simpson cube 0 1 100)
; => 0.25
(simpson cube 0 1 1000)
; => 0.25


; Second implementation

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))



(define (simpson2 f a b n)
  (define (term k)
    (let ((h (/ (- b a) n)))
      (let ((m (cond ((= k 0) 1)
                   ((= k n) 1)
                   ((even? k) 2)
                   (else 4)))
            (y (f (+ a (* k h)))))
        (* (/ h 3.0) m y ))))
  (define (next k)
    (+ k 1))
  (sum term 0 next n))


(simpson2 cube 0 1 100)
; => 0.25000000000000006
(simpson2 cube 0 1 1000)
; => 25000000000000006