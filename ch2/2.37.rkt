#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

; first implementation
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product col row))
                cols))
         m)))

; second implementation
(define (matrix-*-matrix2 m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix-*-vector cols row))
         m)))

(define m (list (list 2 -1 3 5) (list 1 3 0 4) (list 3 0 -1 -2) (list 0 0 0 1)))
(define v (list 2 0 -1 1))

(matrix-*-vector m v)
; => (6 6 5 1)

(define m1 (list (list 1 2 3) (list 4 5 6)))
(define m2 (list (list 7 8) (list 9 10) (list 11 12)))

(transpose m1)
; => ((1 4) (2 5) (3 6))

(matrix-*-matrix m1 m2)
; => ((58 64) (139 154))

(matrix-*-matrix2 m1 m2)
; => ((58 64) (139 154))