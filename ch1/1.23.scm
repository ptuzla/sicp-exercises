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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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
;1009 *** 3
;1011
;1013 *** 3
;1015
;1017
;1019 *** 3
(search-for-primes 10000 10037)
;10001
; ...
;10007 *** 8
;10009 *** 8
;10011
; ...
;10035
;10037 *** 8
(search-for-primes 100000 100043)
;100001
;100003 *** 24
; ...
;100019 *** 24
;100021
; ...
;100043 *** 24
(search-for-primes 1000000 1000037)
;1000001
;1000003 *** 75
;...
;1000031
;1000033 *** 75
;1000035
;1000037 *** 75


; The speed did not improve by 2 as expected, but buy a factor of 1.1
; This is due to extra procedure call and if comparison for every divisor










