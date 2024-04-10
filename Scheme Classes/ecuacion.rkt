#lang racket

;; equation1 : number -> boolean
;; determines if n satisfies equation #1
(define (equation1 n)
  (= (+ (* 4 n) 2)
     62))

;; equation2 : number -> boolean
;; determines if n satisfies equation #2
(define (equation2 n)
  (= (* 2 (* n n))
     102))

;; equation3 : number -> boolean
;; determines if n satisfies equation #3
(define (equation3 n)
  (= (+ (* 4 (* n n)) (* 6 n) 2)
     462))

(equation1 10) "should be" false
(equation1 12) "should be" false
(equation1 14) "should be" false
(equation2 10) "should be" false
(equation2 12) "should be" false
(equation2 14) "should be" false
(equation3 10) "should be" true
(equation3 12) "should be" false
(equation3 14) "should be" false