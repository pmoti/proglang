
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high) 
      null 
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (x)
         (string-append x suffix)) xs))
  
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
         [(null? xs) (error "list-nth-mod: empty list")]
         [#t (car (list-tail xs (remainder n (length xs))))]))
           
(define (stream-for-n-steps s n)
  (if (= n 0) 
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

(define funny-number-stream
  (letrec ([f (lambda (x) (cons (if (= (remainder x 5) 0) (- x) x) (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))
  

(define dan-then-dog
  (letrec ([f (lambda () (cons "dan.jpg" g))]
           [g (lambda () (cons "dog.jpg" f))])
    (lambda () (f))))

(define (stream-add-zero s)
  (letrec ([f (lambda (x) (cons (cons 0 (car (x))) (lambda () (f (cdr (x))))))])
    (lambda () (f s))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (n) (cons (cons (list-nth-mod xs n) (list-nth-mod ys n)) (lambda () (f (+ n 1)))))])
        (lambda () (f 0))))

(define (vector-assoc v vec)
  (letrec ([f (lambda (n) (
                           if (< n (vector-length vec))
                              (let ([x (vector-ref vec n)])
                                (if (and (pair? x) (equal? (car x) v)) x (f (+ n 1))))
                              #f))])
    (f 0)))

(define (cached-assoc xs n)
  (letrec ([cache (make-vector n)]
    [i 0]
    [f (lambda(v)
         (let ([anslk (vector-member v cache)])
           (if anslk
               (vector-ref cache anslk)
               (let ([new-ans (assoc v xs)])
                 (if (null? new-ans)
                     (#f)
                     (begin
                       (vector-set! cache i new-ans)
                       (set! i (remainder (+ i 1) n))
                       new-ans))))))])
    (lambda(v) (f v))))

(define-syntax while-less
  (syntax-rules (do)
    [(while-less e1 do e2)
     (letrec ([f (lambda(x) (if (> x e2)
                              (f x)
                              #t))])
              (f e1))]))