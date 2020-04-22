#lang sicp

(#%require "./exlib2.rkt")

(fixed-point (lambda (y) (+ 1 (/ 1.0 y))) 1)
; => 1.6180327868852458