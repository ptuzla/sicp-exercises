#lang sicp

(define (reverse-iter items)
  (define (iter lst result)
    (if (null? lst)
        result
        (iter (cdr lst) (cons (car lst) result))))
  (iter items nil))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) 
            (append (cdr list1) 
                    list2))))

(define (reverse-rec items)
  (if (null? items)
      items
      (append (reverse-rec (cdr items)) (list (car items)))))
      


(reverse-iter (list 1 4 9 16 25))
; => (25 16 9 4 1)
(reverse-rec (list 1 4 9 16 25))
; => (25 16 9 4 1)