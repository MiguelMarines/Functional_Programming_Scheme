#lang racket

;; attendance : number -> number
;; to compute how many attendees we get at some price 
;; Examples:
;; at 5.0, we get 120
;; at 4.9, we get 135
(define (attendance price)
  (+ (* (/ 15 .10) (- 5.00 price))
     120))

;; at $5.00, 120 people will attend.
;; at $4.00, 270 people will attend.
;; at $3.00, 420 people will attend.

;; EXAMPLES AS TESTS
(attendance 5.0) "should be" 120
(attendance 4.9) "should be" 135
(attendance 4) "should be" 270
(attendance 3) "should be" 420