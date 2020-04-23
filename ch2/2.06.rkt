#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(define one (add-1 zero))
;(define one (add-1 (lambda (f) (lambda (x) x))))
;(define one (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))
;(define one (lambda (f) (lambda (x) (f ( (lambda (x) x) x)))))
;(define one (lambda (f) (lambda (x) (f x))))
;(define one (lambda (f) (lambda (x) (f x))))

(define one (lambda (f) (lambda (x) (f x))))

;(define two (add-1 one))
;(define two (add-1 one))
;(define two (add-1 (lambda (f) (lambda (x) (f x)))))
;(define two (lambda (f) (lambda (x) (f (( (lambda (f) (lambda (x) (f x))) f) x)))))
;(define two (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))
;(define two (lambda (f) (lambda (x) (f (f x)))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; From dhess (https://github.com/dhess/sicp-solutions/blob/master/chap2/ex2.06.scm)
;(define (+ a b)
;  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
