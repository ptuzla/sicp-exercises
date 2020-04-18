#lang sicp

(define (square x)
  (* x x))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes start end)
  (define (iter n)
    (if (<= n  end)
      (cond ((odd? n)
             (timed-prime-test n)
             (iter (+ n 1)))
            (else
             (iter (+ n 1))))))
  (iter start))



(search-for-primes 1000 1019)
;1001
; ...
;1009 *** 17
;1011
;1013 *** 19
;1015
;1017
;1019 *** 19
(search-for-primes 10000 10037)
;10001
; ...
;10007 *** 21
;10009 *** 20
;10011
; ...
;10035
;10037 *** 23
(search-for-primes 100000 100043)
;100001
;100003 *** 28
; ...
;100019 *** 24
;100021
; ...
;100043 *** 24
(search-for-primes 1000000 1000037)
;1000001
;1000003 *** 27
;...
;1000031
;1000033 *** 26
;1000035
;1000037 *** 28


; Performing Fermat test 10 times
; Time increases by a factor of log(n) where n is the number of digits










