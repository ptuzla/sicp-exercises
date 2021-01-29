#lang sicp

(define (filter f xs)
  (if (null? xs)
      nil
      (if (f (car xs))
          (cons (car xs) (filter f (cdr xs)))
          (filter f (cdr xs)))))

(filter odd? (list 1 2 3 4 5 6))
; => (1 3 5)

(define (same-parity . x)
  (if (even? (car x))
      (filter even? x)
      (filter odd? x)))

(same-parity 1 2 3 4 5 6)
; => (1 3 5)

(same-parity 0 1 2 3 4 5 6)
; => (0 2 4 6)




(define (same-parity2 . ns)
  
  (define (same-p? a b)
  (= (remainder a 2)
     (remainder b 2)))
  
  (let ((first (car ns)))
    (define (helper items)
      (if (null? items)
          nil
          (if (same-p? first (car items))
              (cons (car items)
                    (helper (cdr items)))
              (helper (cdr items)))))
    
    (cons first (helper (cdr ns)))))


(same-parity2 1 2 3 4 5 6 7)
;(1 3 5 7)

(same-parity2 2 3 4 5 6 7)
;(2 4 6)