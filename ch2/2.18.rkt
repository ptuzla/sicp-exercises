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


(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
; (last-pair (list 6 7 8 9))
; (9)


(define (but-last-pair items)
  (if (null? (cdr items))
      nil
      (cons (car items)
            (but-last-pair (cdr items)))))
             
;(but-last-pair (list 1 2 3 4 5))
; (1 2 3 4)


(define (reverse3 items)
  (if (null? items)
      nil
      (cons (car (last-pair items))
            (reverse3 (but-last-pair items)))))

(reverse3 (list 1 4 9 16 25))
;(25 16 9 4 1)