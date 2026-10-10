#lang racket

(define (range-list x y)
  (define (helper current my-list)
    (if (< current x)
        my-list
        (helper (- current 1) (cons current my-list))))
  (if (> x y)
      '()
      (helper y '())))

(define (sum-by-key lst)
  (define (helper remaining sum0 sum1)
    (if (empty? remaining)
        (list sum0 sum1)
        (let ([key (car (car remaining))]
              [value (car (cdr (car remaining)))])
          (if (= key 0)
              (helper (cdr remaining) (+ sum0 value) sum1)
              (if (= key 1)
                  (helper (cdr remaining) sum0 (+ sum1 value))
                  (error "Bad key"))))))
  (helper lst 0 0))

(define (sum-pairs lst)
  (define (helper remaining my-list)
    (if (empty? remaining)
        (reverse my-list)
        (if (empty? (cdr remaining))
            (reverse (cons (car remaining) my-list))
            (let ([first-num (car remaining)]
                  [second-num (car (cdr remaining))])
              (helper (cdr (cdr remaining)) 
                      (cons (+ first-num second-num) my-list))))))
  (helper lst '()))

(define (class-averages students)
  (define (student-avg student)
    (let ([grade1 (list-ref student 0)]
          [grade2 (list-ref student 1)]
          [grade3 (list-ref student 2)]
          [grade4 (list-ref student 3)]
          [grade5 (list-ref student 4)])
      (+ (* grade1 0.2) (* grade2 0.2) (* grade3 0.2) (* grade4 0.2) (* grade5 0.2))))
  (map student-avg students))

(define (remove-vowels str)
  (define (is-vowel? c)
    (if (char=? c #\a) #t
    (if (char=? c #\A) #t
    (if (char=? c #\e) #t
    (if (char=? c #\E) #t
    (if (char=? c #\i) #t
    (if (char=? c #\I) #t
    (if (char=? c #\o) #t
    (if (char=? c #\O) #t
    (if (char=? c #\u) #t
    (if (char=? c #\U) #t
        #f)))))))))))
  (list->string (filter (lambda (c) (not (is-vowel? c))) (string->list str))))

(define (reversed-words str)
  (define (process chars current-word words)
    (if (empty? chars)
        (if (empty? current-word)
            (reverse words)
            (reverse (cons (list->string current-word) words)))
        (if (char-whitespace? (car chars))
            (if (empty? current-word)
                (process (cdr chars) '() words)
                (process (cdr chars) '() (cons (list->string current-word) words)))
            (process (cdr chars) (cons (car chars) current-word) words))))
  (process (string->list str) '() '()))