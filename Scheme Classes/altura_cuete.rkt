#lang racket

;; height : number number -> number
;; to determine the height a rocket reaches in a time t.
(define (height g t)
  (height-from-speed t (speed-from-time g t)))

;; height-from-speed : number number -> number
;; to determine the height a rocket reaches from its speed and time
(define (height-from-speed t v)
  (* 1/2 v t))

;; speed-from-time : number number -> number
;; to determine the speed a rocket reaches in time t
(define (speed-from-time g t)
  (* g t))

;; EXAMPLES AS TESTS
(speed-from-time 10 1) "should be" 10
(height-from-speed 10 5) "should be" 25
(height 10 10) "should be" 500