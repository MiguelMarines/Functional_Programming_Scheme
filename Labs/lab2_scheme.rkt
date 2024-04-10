#lang racket

;; Miguel Marines
;; Lab 2


;; - - - - - - - - FUNCTION POWER HEAD RECURSION  - - - - - - - - ;;

;; power-head : number number  ->  number
;; Function that calculates the given power e of a given number b,
;; using head recursion.

(define (power-head b e)
  (cond
    [(= e 0) 1]
    [else (* b (power-head b ( - e 1)))]))

;; Example: (power-head 4 3)   should return 64


;; - - - - - - - - FUNCTION POWER TAIL RECURSION  - - - - - - - - ;;

;; power-tail : number number  ->  number
;; Function that calculates the given power e of a given number b,
;; using tail recursion.

(define (power-tail b e)
  (power-aux b e 1))

(define (power-aux b e product)
  (if (= e 0)
      product
      (power-aux b (- e 1) (* b product))))

;; Example: (power-tail 4 3)   should return 64


;; - - - - - - - - - - - - FUNCTION THIRD - - - - - - - - - - - - ;;

;; third : list -> number
;; Function that returns the third element of a list.

(define (third list)
  (first (rest (rest list))))

;; Example: (third (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty))))))   should return 3


;; - - - - - - - - - - - - FUNCTION JUST TWO - - - - - - - - - - ;;

;; just-two? : list -> boolean
;; Function that returns true if a list contains only two elements,
;; if it contains more elements it returns false.

(define (just-two? list)
  (count-list list 0))

(define (count-list list counter)
  (cond
    [(empty? list)
     (cond
       [(= counter 2)true]
       [else false])]
    [else (count-list (rest list)(+ counter 1))]))



;; Example: (just-two? (cons 1 empty))   should return  #f
;; Example: (just-two? (cons 1 (cons 4 empty)))   should return #t


;; - - - - - - - - - - - FUNCTION HOW MANY  - - - - - - - - - - - ;;

;; how-many-x? : list -> number
;; Function that receives a list and returns the number of elements that match x

(define (how-many-x? list x)
  (how-many list x 0))

(define (how-many list x counter)
  (cond
    [(empty? list) counter]
    [else
     (cond
       [(eq? (first list) x) (how-many (rest list) x (+ counter 1))]
       [else (how-many (rest list) x counter)])]))

;; Example:
 (define list (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
;; (how-many-x? list 3)   should return 2


;; - - - - - - - - - - - - FUNCTION ALL  - - - - - - - - - - - - - ;;

;; all-x? : list -> boolean
;; Function that returns true if every element of the list is x
;; otherwise the function returns false.

(define (all-x? list x)
  (compare list x 0))

(define (compare list x counter)
  (cond
    [(empty? list)
     (cond
       [(> counter 0)false]
       [else true])]
    [else
     (cond
       [(eq? (first list) x) (compare (rest list) x counter)]
       [else (compare (rest list) x (+ counter 1))])]))

;; Example: (all-x? (cons 1 (cons 2 (cons 1 empty))) 2)   should return #f
;; Example: (all-x? (cons 2 (cons 2 (cons 2 empty))) 2)   should return #t
;; Example: (all-x? (cons 'x (cons 'y (cons 'z empty))) 'x)   should return #f
;; Example: (all-x? (cons 'x (cons 'x (cons 'x empty))) 'x)   should return #t


;; - - - - - - - - - - - FUNCTION GET ELEMENT  - - - - - - - - - - ;;

;; get : list number -> number
;; Function that receives a list and a position and returns
;; the value in that position of the list.

(define (get list n)
  (cond
    [(<= n 1) (first list)]
    [else (get (rest list) (- n 1))]))

;; Example:
   (define list1 (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
;; (get list1 2)   should return 2
;; (get list1 5)   should return 3


;; - - - - - - - - - - - FUNCTION DIFFERENCE  - - - - - - - - - - - ;;

;; difference : list list -> list
;; Function that receives 2 lists A and B and returns a new list
;; that contains the elements in A that are not present in B.

(define (difference listA listB)
  (cond
    ((empty? listA) '())
    ((not (member (first listA) listB))
     (cons (first listA) (difference (rest listA) listB)))
    (else (difference (rest listA) listB))))

; Example: (difference '(12 44 55 77 66 1 2 3 4) '(1 2 3))  should return '(12 44 55 77 66 4)

;; - - - - - - - - - - - - FUNCTION APPEND  - - - - - - - - - - - - ;;

;; append : list list -> list
;; Function that receives 2 lists A and B, and returns only 1 list
;; with the elements of A followed by the elements of B.

(define (append listA listB)
  (cond [(empty? listA)  listB]
        [else (cons (first listA) (append (rest listA) listB))]))

;; Example: (append '(a b c d) '(e f g))   should return (a b c d e f g)
;; Example: (append  '( ) '(a b c))   should return (a b c)

;; - - - - - - - - - - - FUNCTION INVERT LIST  - - - - - - - - - - - ;;

;; invert : list -> list
;; Function that inverts the order of the elements in a list.

(define (invert list)
  (invert-2 list '()))
  
  (define (invert-2 list list2)
    (if (empty? list)
      list2
      (invert-2 (rest list) (cons (first list) list2))))

;; Example: (invert '(a b c d)) should return (d c b a)
;; Example: (invert '( )) should return ( )


;; - - - - - - - - - - - - - FUNCTION SIGN  - - - - - - - - - - - - - ;;

;; sign: list -> list
;; Function that receives a list of numbers and returns a list
;; of 1 or -1 depending on whether each number is greater or lesser than 0.

(define (sign list)
  (cond
    [(empty? list) list]
    [else
      (cond
        [(> (first list) 0) (cons 1 (sign (rest list)))]
        [else (cons -1 (sign (rest list)))])]))

;; Example: (sign '(2 -4 -6))   should return (1 -1 -1)


;; - - - - - - - - - - - - FUNCTION NEGATIVES  - - - - - - - - - - - - ;;

;; negatives : list -> list
;; Function that receives a list of positive numbers and returns
;; a list with the corresponding negative numbers.

(define (negatives list)
  (if (empty? list)
      list
      (cond
        [(> (first list) 0) (cons (- (- (first list) (first list))(first list)) (negatives (rest list)))]
        [else (cons (first list) (negatives (rest list)))])))

;; Example: (negatives '(2 -4 6))   should return  (-2 -4 -6)