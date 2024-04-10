#lang racket

;; Miguel Marines
;; Lab 1

;; - - - - - - - - FUNCTION TRIANGLE AREA  - - - - - - - - ;;

;; triangle-area : number number  ->  number

;; Function which receives the base b and the height h of
;; a traingle and returns the area of the triangle.

(define (triangle-area b h)
  (/ (* b h) 2))

;; Example: (triangle-area 2 3) should produce 3.

;; - - - - - - - - - - - FUNCTION A  - - - - - - - - - - - ;;

;; a : number  ->  number

;; Function to compute a given number n to the power of two
;; plus ten.

(define (a n)
  (+ (expt n 2) 10))

;; Example: (a 2) should produce 14.


;; - - - - - - - - - - - FUNCTION B  - - - - - - - - - - - ;;

;; b : number  ->  number

;; Function to compute one over two, times a given numbre n
;; to the power of two, plus twenty.

(define (b n)
  (+ (* (expt n 2) 1/2) 20))

;; Example: (b 2) should produce 22.


;; - - - - - - - - - - - FUNCTION C  - - - - - - - - - - - ;;

;; c : number  ->  number

;; Function to compute two minus one over a given number n.

(define (c n)
  (- 2 (/ 1 n)))

;; Example: (c 1) should produce 1.


;; - - - - - - - - - FUNCTION SOLUTIONS  - - - - - - - - - ;;

;; solutions : number number number  ->  number

;; Function to calculate the possible number of solutions of
;; a single variable quadratic equation, given three numbers a, b and c corresponding
;; to the quadratic equation form ax^2 + bx + c = 0

(define (solutions a b c)
  (cond
    [(>(expt b 2)(* 4 a c))2]
    [(=(expt b 2)(* 4 a c)) 1]
    [(<(expt b 2)(* 4 a c)) 0]
  )
 )

;; Example: (solutions 1 0 -1) should produce 2.
;; Example: (solutions 2 4 2) should produce 1.
;; Example: (solutions 4 2 2) should produce 0.