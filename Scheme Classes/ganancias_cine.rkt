#lang racket

;; total-profit : number -> number
;; calculates the total profit of a showing, 
;; given the number of people attending

;; EXAMPLES
;; if 5 people come, they make $2.50
;; if 2 people come, they lose $11.
;; if 100 people come, they make $430

(define (total-profit customers)
  (- (* 5 customers) (+ 20 (* .50 customers))))

;; EXAMPLES TURNED INTO TESTS

(total-profit 5) "should be" 2.50
(total-profit 2) "should be" -11.00
(total-profit 100) "should be" 430.00