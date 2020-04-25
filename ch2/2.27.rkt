#lang sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) 
            (append (cdr list1) 
                    list2))))

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (if (null? items)
      items
      (let ((first (car items)))
        (if (pair? first)
            (append (deep-reverse (cdr items)) (list (deep-reverse (car items))))
            (append (deep-reverse (cdr items)) (list (car items)))))))
      
(define x 
  (list (list 1 2) (list 3 4)))

x
; => ((1 2) (3 4))

(reverse x)
; => ((3 4) (1 2))

(deep-reverse x)
; => ((4 3) (2 1))