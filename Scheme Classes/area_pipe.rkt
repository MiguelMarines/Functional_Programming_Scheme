#lang racket

;; area-pipe-one-def : number number number -> number
;; to determine the area of a pipe with given inner radius, length, and thickness
;; this version does not use any helper functions
(define (area-pipe-one-def inner len thickness)
  (+ (* 2 (- (* pi (+ inner thickness) (+ inner thickness))
             (* pi inner inner)))
     (* len (* 2 pi (+ inner thickness)))
     (* len (* 2 pi inner))))

;; area-pipe : number number number -> number
;; to determine the area of a pipe with given inner radius, length, and thickness
(define (area-pipe inner len thickness)
  (+ (* 2 (area-donut inner (+ inner thickness)))  ; s.a. of rings on ends
     (* len (circumference (+ inner thickness)))   ; s.a. of outer cylinder
     (* len (circumference inner))))               ; s.a. of inner cylinder

;; area-donut : number number -> number
;; finds the area of a circle with a chunk missing
;; the entire circle has radius outer and the missing
;; middle portion has radius inner.
(define (area-donut inner outer)
  (- (area-circle outer)
     (area-circle inner)))

;; area-circle : number -> number
;; determines the area of a circle with given radius
(define (area-circle r)
  (* pi r r))

;; circumference : number -> number
;; determines the circumference of a circle with given radius
(define (circumference r)
  (* 2 pi r))

;; EXAMPLES AS TESTS
(area-circle 3) "should be" (* 9 pi)
(circumference 3) "should be" (* 6 pi)
(area-donut 3 5) "should be" (* 16 pi)
(area-pipe 2 3 4) "should be" (* 112 pi)
(area-pipe-one-def 2 3 4) "should be" (* 112 pi)