#lang sicp


(define (cube x)
  (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))



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
; => 0.25
(simpson2 cube 0 1 1000)
; => 0.2499999999999998
