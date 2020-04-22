#lang sicp

(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
                (if (= x 1)
                   x
                    (- (* x x))))
             (lambda (i)
               (- (* 2 i) 1))
                   
             k))

(define pi 3.14159265)

; tan pi/3 real value: 1.73205080757
(tan (/ pi 3))
; => 1.7320508027824868

(tan-cf (/ pi 3) 10)
(tan-cf (/ pi 3) 100)
(tan-cf (/ pi 3) 1000)

