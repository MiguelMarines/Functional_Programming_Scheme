#lang racket

;; fahrenheit->celsius : number -> number
;; computes the celsius equivalent of t
(define (fahrenheit->celsius t)
  (* 5/9 (- t 32)))

;; celsius->fahrenheit : number -> number
;; computes the farenheit equivalent of t
(define (celsius->fahrenheit t)
  (+ (* 9/5 t) 32))

;; I : number -> number
;; to convert a Fahrenheight temperature to Celsuis and back
(define (I f)
  (celsius->fahrenheit (fahrenheit->celsius f)))

;; EXAMPLES AS TESTS
(I 32) "should be" 32

;; these two function compose to produce the identity
;; function on numbers. 
;; That is, a function that always returns I always returns
;; its input.