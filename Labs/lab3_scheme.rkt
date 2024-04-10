#lang racket

;; Miguel Marines
;; Lab 3


;; - - - - - - - - - - - - - - FUNCTION DEEP ALL X  - - - - - - - - - - - - - - ;;

;; deep-all-x? : nested list  ->  boolean
;; Function that receives a list containing other lists (deep list) and an element x,
;; the function returns true if every single element in the list of lists is x,
;; otherwise it returns false.

(define (deep-all-x? list target)
  (compare (count-target list target) (count-elements list)))


(define (compare x y)
  (cond
   [(= x y) true]
   [else false]))


(define (count-target lst target)
  (if (empty? lst)
      0
      (+ (count-target (rest lst) target) 
         (let ((x (first lst)))
           (if (list? x)
               (count-target x target) 
               (if (eqv? x target) 1 0))))))

(define (count-elements list)
  (cond
    [(empty? list) 0]
    [(not (pair? list)) 1]
    [else (+ (count-elements (first list)) (count-elements (rest list)))]))

;; Example: (deep-all-x? '(1 (2 (1 1)) 3 (1 1)) 1)   should return #f
;; Example: (deep-all-x? '(1 (1 (1 1)) 1 (1 1)) 1)   should return #t
;; Example: (deep-all-x? '(a (a (a b)) a (a a) (a)) 'a) shoul return #f
;; Example: (deep-all-x? '(a (a (a a)) a (a a) (a)) 'a) shoul return #t


;; - - - - - - - - - - - - - - - - - DEEP REVERSE - - - - - - - - - - - - - - - - - ;;

;; deep-reverse : nested list -> nested list
;; Function that receives a list containing other lists (deep list or nested list) and
;; returns a list of lists (deep list or nested list) with its elements in reverse order.

(define (deep-reverse list)
  (deep-reverse-helper list '()))

(define (deep-reverse-helper list resultList)
  (if (empty? list)
      resultList
      (if (pair? (first list))
          (let ((x (deep-reverse-helper (first list) '())))
            (deep-reverse-helper (rest list) (cons x resultList)))
          (deep-reverse-helper (rest list) (cons (first list) resultList)))))

;; Example: (deep-reverse '(a (b (c d)) e (f g)))   should return '((g f) e ((d c) b) a)
;; Example: (deep-reverse '(1 (2 (3 4)) 5 (6 7)))   should return '((7 6) 5 ((4 3) 2) 1)


;; - - - - - - - - - - - - - - - - - FLATTEN - - - - - - - - - - - - - - - - - ;;

;; flatten : nested list -> list
;; Function that recives a list containing other lists (deep list or nested lists),
;; and returns a list containing all the elements in a single 1 level list.

(define (flatten lst)
  (cond
    [(empty? lst) lst]
    [(list? (first lst)) (function-append (flatten (first lst)) (flatten (rest lst)))]
    [else (function-append (list (first lst)) (flatten (rest lst)))]))


(define (function-append listA listB)
  (cond [(empty? listA)  listB]
        [else (cons (first listA) (function-append (rest listA) listB))]))

;; Example: (flatten  '(a (b (c d)) e (f g)))   should return '(a b c d f g)
;; Example: (flatten  '(1 (2 (3 4)) 5 (6 7)))   should return '(1 2 3 4 5 6 7)


;; - - - - - - - - - - - - - - - - - COUNT LEVELS - - - - - - - - - - - - - - - - - ;;

;; count-levels : nested list -> number
;; Function that recives a list containing other lists (deep list or nested lists), 
;; that reprecent a tree, and returns the count of the max depth of the tree
;; (deep list or nested lists).

(define (count-levels list)
  (count-levels-helper list 1))

(define (count-levels-helper list counter)
  (cond
   [(empty? list) counter]
   [(symbol? (first list)) (count-levels (rest list))]
   [else (maximum (+ (count-levels (first list)) counter) (count-levels (rest list)))]))

(define (maximum x y)
  (cond
    [(> x y) x]
    [(< x y) y]
    [else x]))

;; Example: (count-levels '(a (b (c) (d)) (e (f) (g))))   should return 3
;; Example: (count-levels '(a (b (c (d) (d) (d (e (f))))) (b (c) (c) (c (d (e (f (g))))))))   should return 7

;; - - - - - - - - - - - - - - - COUNT MAX ARITY - - - - - - - - - - - - - - - ;;

;; count-max-arity : nested list -> number
;; Function that recives a list containing other lists (deep list or nested lists),
;; and returns the count of the maximum number of children thah a single node of the
;; tree has.

(define (count-max-arity list)
  (cond
    [(empty? list) 0]
    [else (count-max-arity-helper (rest list) 0)]))

(define (count-max-arity-helper list nodes)
  (cond
    [(empty? list) nodes]
    [else
     (maximum_number_nodes (count-max-arity-helper (rest (first list)) 0) (count-max-arity-helper (rest list) (+ nodes 1)))]))

(define (maximum_number_nodes x y)
  (cond
    [(> x y) x]
    [(< x y) y]
    [else x]))

;; Example: (count-max-arity '(a (b (c) (d)) (e (f) (g) (h) (i))))   should return 4
;; Example: (count-max-arity '(a (b (c) (d) (e) (f) (g) (h) (i)) (e (f) (g) (h) (i)))) should return 7