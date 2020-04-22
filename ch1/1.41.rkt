#lang sicp

(define (double f)
  (lambda (x)
    (f (f x))))

(((double (double double)) inc) 5)
; => 21

;(((double (lambda (x) (double (double x)))) inc) 5)
;
;((( (lambda (x) (double (double (double (double x)))))  ) inc) 5)
;
;(double (double (double (inc (inc 5)))))
;
;(double (double (inc (inc (inc (inc  5))))))
;
;(double (inc (inc (inc (inc (inc (inc (inc (inc 5)))))))))
;
;(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5))))))))))))))))
; => 21
