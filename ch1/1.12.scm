#lang sicp

(define (pascal r c)
  (cond ((= c 1) 1)
        ((= c r) 1)
        (else (+ (pascal (- r 1) (- c 1))
                 (pascal (- r 1) c)))))

(pascal 1 1)
;1
(pascal 2 1)
;1
(pascal 2 2)
;1
(pascal 3 1)
;1
(pascal 3 2)
;2
(pascal 3 3)
;1
(pascal 4 1)
;1
(pascal 4 2)
;3
(pascal 4 3)
;3
(pascal 4 4)
;1
