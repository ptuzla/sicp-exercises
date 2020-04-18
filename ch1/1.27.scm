#lang sicp

(define (square x)
  (* x x))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))


; smallest few Carmichael numbers
; 561, 1105, 1729, 2465, 2821, and 6601


(define (fermat-sweep-test n)
  (define (try-it a)
    (if (= a n)
        true
        (if (= (expmod a n n) a)
            (try-it (+ a 1))
            false)))
  (try-it 2))


(fermat-sweep-test 561)
(fermat-sweep-test 1105)
(fermat-sweep-test 1729)
(fermat-sweep-test 2465)
(fermat-sweep-test 2821)
(fermat-sweep-test 6601)

;#t
;#t
;#t
;#t
;#t
;#t