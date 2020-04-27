#lang sicp

(define (square x) (* x x))

; direct implementation
; (i.e. wihtout using any higher-order procedures)
(define (tree-map f tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map f (car tree))
                    (tree-map f (cdr tree))))))

(define (square-tree tree)
  (tree-map square tree))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))



; implementation with map
(define (tree-map-m f tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (f sub-tree)
             (tree-map-m f sub-tree)))
       tree))

(define (square-tree-m tree) 
  (tree-map-m square tree))

(square-tree-m
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))