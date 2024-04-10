#lang racket

;; tax : number -> number
;; computes the tax, given a wage.

;; EXAMPLES
;; the tax on $100 is $15

(define (tax w)
  (* 0.15 w))

;; netpay : number -> number
;; computes the net pay, given the number of hours worked

;; EXAMPLES
;; the net pay for 40 hours is 408 dollars.

(define (netpay h)
  (- (wage h)
     (tax (wage h))))

;; wage : number -> number
;; computes the wage for a given number of hours

;; EXAMPLES
;; the wage for 2 hours is 24 dollars.

(define (wage h)
  (* h 12))


;; EXAMPLES TURNED INTO TESTS
(tax 100) "should be" 15
(wage 2) "should be" 24
(netpay 40) "should be" 408