#lang sicp

(#%require "./exlib2.1.rkt")

(define (make-rect origin width height)
  (let ((segment-vert (make-segment (make-point (x-point origin) (- (y-point origin) height))
                                    origin))
                      
        (segment-hor (make-segment origin
                                   (make-point (+ (x-point origin) width) (y-point origin)))))
    (cons segment-vert segment-hor)))

(define (vertseg-rect rect)
  (car rect))

(define (horseg-rect rect)
  (cdr rect))

(define (width-rect rect)
  (abs (- (x-point (end-segment (horseg-rect rect)))
          (x-point (start-segment (horseg-rect rect))))))

(define (height-rect rect)
  (abs (- (y-point (end-segment (vertseg-rect rect)))
          (y-point (start-segment (vertseg-rect rect))))))

(define my-rect (make-rect (make-point 0 3) 4 3))

(width-rect my-rect)
; => 4
(height-rect my-rect)
; => 3

(define (area-rect rect)
  (* (width-rect rect)
     (height-rect rect)))

(define (perimeter-rect rect)
  (* (+ (width-rect rect)
        (height-rect rect))
     2))

(area-rect my-rect)
; => 12
(perimeter-rect my-rect)
; => 14

(define (make-rect2 hor-segment vert-segment)
  (cons hor-segment vert-segment))

(define my-rect2 (make-rect2 (make-segment (make-point 0 0) (make-point 0 3))
                             (make-segment (make-point 0 0) (make-point 4 3))))


(area-rect my-rect2)
; => 12
(perimeter-rect my-rect2)
; => 14









