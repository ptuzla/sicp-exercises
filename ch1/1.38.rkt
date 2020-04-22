#lang sicp

(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i)
              (cf (+ i 1))))))
  (cf 1))
    

; The function that computes d
;(define d (lambda (i)
;               (if (= 0 (remainder (+ i 1) 3))
;                   (* (/ (+ i 1) 3) 2)
;                   1)))
;(d 1) => 1
;(d 2) => 2
;(d 3) => 1
;(d 4) => 1
;(d 5) => 4
;(d 6) => 1
;(d 7) => 1
;(d 8) => 6

(define (approx-e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
             (lambda (i)
               (if (= 0 (remainder (+ i 1) 3))
                   (* (/ (+ i 1) 3) 2)
                   1))
                   
             k)))

; real e value 2.7182818284
(approx-e 10)
; 2.7182817182817183
(approx-e 100)
; => 2.7182818284590455
(approx-e 1000)
; => 2.7182818284590455

