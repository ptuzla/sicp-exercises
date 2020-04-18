#lang sicp

(define (square x)
  (* x x))

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
;10007 *** 10
;10009 *** 9
;10011
; ...
;10035
;10037 *** 9
(search-for-primes 100000 100043)
;100001
;100003 *** 27
; ...
;100019 *** 26
;100021
; ...
;100043 *** 27
(search-for-primes 1000000 1000037)
;1000001
;1000003 *** 76
;...
;1000031
;1000033 *** 73
;1000035
;1000037 *** 74


; As we increase the tested number with a factor 10, the required time increases roughly of a factor 3
; 3 ~= sqrt(10)
; So order of growth is O(sqrt(n))









