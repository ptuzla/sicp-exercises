#lang sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((nabs (/ (abs n) g))
          (dabs (/ (abs d) g)))
      (cond ((and (positive? n) (positive? d))
             (cons nabs dabs))
            ((and (positive? n) (negative? d))
             (cons (- nabs) dabs))
            ((and (negative? n) (positive? d))
             (cons (- nabs) dabs))
            ((and (negative? n) (negative? d))
             (cons nabs dabs))))))
      
                
        

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 10 30))
(print-rat (make-rat 10 -30))
(print-rat (make-rat -10 30))
(print-rat (make-rat -10 -30))

; =>
;1/3
;-1/3
;-1/3
;1/3