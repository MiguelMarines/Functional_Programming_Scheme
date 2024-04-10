#lang racket

(define (f n)
  (+ (/ n 3) 2))

(f 2) "should be" 8/3
(f 5) "should be" 11/3
(f 9) "should be" 5

;; 1.

(define (f n)
  (+ (* n n) 10))
(f 2) "should be" 14
(f 9) "should be" 91

;; 2.

(define (f n)
  (+ (* 1/2 n n) 20))
(f 2) "should be" 22
(f 9) "should be" 60.5

;; 3.

(define (f n)
  (- 2 (/ 1 n)))
(f 2) "should be" 1.5
(f 9) "should be" 17/9