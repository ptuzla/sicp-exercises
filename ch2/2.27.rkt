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
            (append (deep-reverse (cdr items)) (list (deep-reverse first)))
            (append (deep-reverse (cdr items)) (list first))))))
      
(define x 
  (list (list 1 2) (list 3 4)))

x
; => ((1 2) (3 4))

(reverse x)
; => ((3 4) (1 2))

(deep-reverse x)
; => ((4 3) (2 1))

; a more elegant solution
(define (deep-reverse2 items)
  (if (not (pair? items))
      items
      (map deep-reverse2 (reverse items))))


(deep-reverse2 x)
; => ((4 3) (2 1))

(define y (list (list 5 6) (list 7 8)))
(define xy (list x y))
xy
; => (((1 2) (3 4)) ((5 6) (7 8)))
; => ((1 2) (3 4))

(deep-reverse2 xy)
; => (((8 7) (6 5)) ((4 3) (2 1)))