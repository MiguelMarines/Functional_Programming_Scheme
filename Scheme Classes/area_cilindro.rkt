#lang racket

;; area-cylinder : number number -> number
;; to determine the area of a cylinder
(define (area-cylinder radius height)
  (+ (* (circumference-circle radius) height)
     (area-circle radius)
     (area-circle radius)))

;; area-circle : number -> number
;; to determine the area of a circle
(define (area-circle radius)
  (* pi radius radius))

;; circumference-circle : number -> number
;; to deteremine the circumference of a circle
(define (circumference-circle radius)
  (* radius 2 pi))

;; EXAMPLES AS TESTS
(circumference-circle 2) "should be" (* 4 pi)
(area-circle 3) "should be" (* pi 9)
(area-cylinder 2 3) "should be" (* 20 pi)
(area-cylinder 3 4) "should be" (* 42 pi)