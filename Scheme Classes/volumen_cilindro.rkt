#lang racket

;; volume-cylinder : number number -> number
;; to determine to volume of a cylinder from its radius and height
(define (volume-cylinder radius height)
  (* (area-circle radius) height))

;; area-circle : number -> number
;; to determine the area of a circle
(define (area-circle radius)
  (* radius radius pi))

;; EXAMPLES AS TESTS
(area-circle 1) "should be" pi
(volume-cylinder 3 2) "should be" (* 18 pi)