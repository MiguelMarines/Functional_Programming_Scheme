#lang racket

;; The dollar/euro conversion rate was roughly 1.17 euros per dollar
;; when the euro was introduced on January 1, 1999.
;; (source: The Economist).

;; dollar->euro : number -> number
;; computes the value of d dollars in euros

;; EXAMPLES
;; one dollar is 1.17 euros
;; one dollar is 2.34 euros

(define (dollar->euro d)
  (* 1.17 d))

;; EXAMPLES TURNED INTO TESTS
(dollar->euro 1) "should be" 1.17
(dollar->euro 2) "should be" 2.34