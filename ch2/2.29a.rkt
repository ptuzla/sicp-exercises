#lang sicp


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (let ((l-struct (branch-structure (left-branch mobile)))
            (r-struct (branch-structure (right-branch mobile))))
        (+ (if (not (pair? l-struct))
               l-struct
               (total-weight l-struct))
           (if (not (pair? r-struct))
               r-struct
               (total-weight r-struct))))))

(define m1 (make-mobile (make-branch 2 9)
                        (make-branch 1 
                                     (make-mobile  (make-branch 10
                                                                (make-mobile  (make-branch 5 3)
                                                                              (make-branch 3 5)))

                                                   (make-branch 8 10)))))
;                          m1
;                          +
;                          |
;              2           |           1
;   +----------------------+-----------------------+
;   |                                              |
; +-+-+                                     10     |       8
; | 9 |                             +--------------+---------------+
; +---+                             |                              |
;                                   |                            +-+--+
;                               5   |     3                      | 10 |
;                          +--------+---------+                  +----+
;                          |                  |
;                        +-+-+              +-+-+
;                        | 3 |              | 5 |
;                        +---+              +---+
; 

(total-weight m1)
; => 27


(define (balanced? mobile)
  (let ((l-struct (branch-structure (left-branch mobile)))
        (r-struct (branch-structure (right-branch mobile)))
        (l-length (branch-length (left-branch mobile)))
        (r-length (branch-length (right-branch mobile))))
    (and (= (* (total-weight l-struct) l-length)
            (* (total-weight r-struct) r-length))
         (and (if (not (pair? l-struct))
                  true
                  (balanced? l-struct))
              (if (not (pair? r-struct))
                  true
                  (balanced? r-struct))))))

(balanced? m1)
; => #t

(define m2 (make-mobile (make-branch 3 9) ; changed 2 to 3 to make it unbalanced
                        (make-branch 1 
                                     (make-mobile  (make-branch 10
                                                                (make-mobile  (make-branch 5 3)
                                                                              (make-branch 3 5)))

                                                   (make-branch 8 10)))))
(balanced? m2)           
; => #f             


