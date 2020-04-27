#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(define (reverse-fr sequence)
  (fold-right 
   (lambda (x y)
     (append y (list x))) nil sequence))

; (op 1 (op 2 (op 3 ()))


(define (reverse-fl sequence)
  (fold-left 
   (lambda (x y) (cons y x)) nil sequence))

;(op (op (op () 1) 2) 3)


(reverse-fr (list 1 2 3 4))
; => (4 3 2 1)

(reverse-fl (list 1 2 3 4))
; => (4 3 2 1)
