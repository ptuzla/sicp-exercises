#lang sicp

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate 
                       (cdr sequence))))
        (else  (filter predicate 
                       (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high))))


(define (find-triplets n s)
  (filter (lambda (triplet)
            (= (accumulate + 0 triplet) s))
          (flatmap (lambda (i)
                     (flatmap (lambda (j)
                            (map (lambda (k) (list i j k))
                                 (enumerate-interval 1 (- j 1))))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(find-triplets 10 15)
; => ((6 5 4) (7 5 3) (7 6 2) (8 4 3) (8 5 2) (8 6 1) (9 4 2) (9 5 1) (10 3 2) (10 4 1))