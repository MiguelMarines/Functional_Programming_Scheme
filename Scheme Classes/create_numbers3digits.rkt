#lang racket

;; convert3 : number number number -> number
;; builds a three digit number from its digits

;; EXAMPLES
;; convert3 of 1, 2, and 3 produces 321.
;; convert3 of 5, 3, and 9 produces 935.

(define (convert3 ones tens hundreds)
  (+ ones
     (* 10 tens)
     (* 100 hundreds)))

;; EXAMPLES TURNED INTO TESTS
(convert3 1 2 3) "should be" 321
(convert3 5 3 9) "should be" 935