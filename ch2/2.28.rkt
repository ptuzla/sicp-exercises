#lang sicp

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) 
            (append (cdr list1) 
                    list2))))

(define x 
  (list (list 1 2) (list 3 4)))

(define (fringe2 items)
  (define (print x)
    (if (not (pair? x))
        (and (display x) (display ", "))
        (and (print (car x)) (print (cdr x)))))
  (print (car x))
  (print (cdr x)))

(define (fringe x)
  (cond ((null? x) nil)
        ((pair? x) (append (fringe (car x)) (fringe (cdr x))))
        (else (list x))))
            
    

x  
(fringe x)
; => (1 2 3 4)


(list x x)
(fringe (list x x))
; => (1 2 3 4 1 2 3 4)