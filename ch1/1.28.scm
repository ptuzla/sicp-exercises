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

(define (nontrivial-sqrtof1? n)
  (cond ((= n 1) false)
        ((= (remainder (square (- n 1)) n) 1) true)
        (else false)))

; TODO Fix below program
(define (expmod-mr base exp m)
  (cond ((nontrivial-sqrtof1? base) 0)
        ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))


(define (miller-rabin-test n)
  (define (try-it a)
    ((lambda (x)
      (cond ((= x 1) true)
            ((= x 0) false)))
     (expmod-mr a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(miller-rabin-test 1009)
(miller-rabin-test 10033)
(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)