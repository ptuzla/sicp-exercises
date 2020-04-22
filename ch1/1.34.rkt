#lang sicp

(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)

(f f)
;application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
;  arguments...:

; Explanation
;(f f)
;(f 2)
;(2 2)
;2 is not a procedure