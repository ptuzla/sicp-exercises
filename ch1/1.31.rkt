#lang sicp

(define (square x) (* x x))

; recurive process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (factorial n)
  (product identity 1 inc n))

(factorial 4)
(factorial 5)
(factorial 6)
; =>
;24
;120
;720

(define (pi-term k)
  (/ (* (* 2 k)
        (- (* 2 k) 2))
     (square (- (* 2.0 k) 1))))

(define (pi iterations)
  (* 4
     (product pi-term 2 inc iterations)))

; real π value 3.14159265359
(pi 100)
;=> 3.1494564280813044
(pi 1000)
;=> 3.1423781499034225
(pi 10000)
;=> 3.1416711943878752
(pi 1000000)
;=> 3.141593438981855

; iterative process
(define (product-iter term a next b)
  (define (iter k result)
     (if (> k b)
         result
         (iter (next k) (* result (term k)))))
  (iter a 1))

(define (pi2 iterations)
  (* 4
     (product-iter pi-term 2 inc iterations)))


; real π value 3.14159265359
(pi2 100)
;=> 3.1494564280813035
(pi2 1000)
;=> 3.1423781499034176
(pi2 10000)
;=> 3.1416711943878926
(pi2 1000000)
;=> 3.141593438988083