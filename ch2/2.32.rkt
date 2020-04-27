#lang sicp


(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x))
                            rest)))))


(subsets (list 1 2 3))
; => (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

; explanation
;we can find the set of all the subsets of a set S recursively as follows:
;- if the set is an empty set, its sole subset is a set containing empty set
;- else it's equal to the set (A) of all the subsets of the set containing all
;  the elements of the Set S but the first (E), plus the sets formed by adding
;  E to all of them.
