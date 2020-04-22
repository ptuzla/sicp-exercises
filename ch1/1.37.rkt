#lang sicp


(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))
    

(define phi 1.61803398875)
; real value of 1/phi 
(/ 1 phi)
; 0.6180339887498547

(define (approx-1-over-phi k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(approx-1-over-phi 10)
; => 0.6179775280898876
(approx-1-over-phi 11)
; => 0.6180555555555556
(approx-1-over-phi 1000)
; => 0.6180339887498948
(approx-1-over-phi 100000)
; => 0.6180339887498948

;11 iterations gives four digits of accuracy