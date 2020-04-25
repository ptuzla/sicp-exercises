#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(square-list (list 1 2 3 4))
; => (16 9 4 1)
; this doesn't work because it prepends every next item to the
; beginning of the result list i.e. answer, by cons'ing.

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(square-list-2 (list 1 2 3 4))
; => ((((() . 1) . 4) . 9) . 16)
; this doesn't work either, because the first parameter to cons
; is a list , and the second is a number (list element)
; this is the opposite of what should be