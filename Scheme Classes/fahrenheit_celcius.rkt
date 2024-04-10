#lang racket

;; fahrenheit->celsius : number -> number
;; computes the celsius equivalent of t

;; EXAMPLES
;; 32 degrees fahrenheit is 0 degrees celsius
;; 212 degrees fahrenheit is 100 degrees celsius
;; -40 degrees fahrenheit is -40 degrees celsuis

(define (fahrenheit->celsius t)
  (* 5/9 (- t 32)))

;; EXAMPLES TURNED INTO TESTS
(fahrenheit->celsius 32) "should be" 0
(fahrenheit->celsius 212) "should be" 100
(fahrenheit->celsius -40) "should be" -40