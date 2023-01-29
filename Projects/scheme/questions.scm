(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  (cond
      ((null? pairs) 
              '(nil nil))
      (else 
            (cons (append (list (caar pairs)) (car (zip (cdr pairs)))) 
                  (cons (append (cdar pairs) (cadr (zip (cdr pairs)))) nil)))
      )
  )


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  
  (define (helper s counter)
      (cond 
            ((null? s) nil)
            (else (cons (list counter (car s)) (helper (cdr s) (+ counter 1)) ))
            )
      )
  
  (helper s 0)

  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond 
        ((and (null? list1) (null? list2)) nil)
        ((null? list1) (cons (car list2) (merge comp list1 (cdr list2))))
        ((null? list2) (cons (car list1) (merge comp (cdr list1) list2)))
        (else (if (comp (car list1) (car list2)) (cons (car list1) (merge comp (cdr list1) list2)) 
                  (cons (car list2) (merge comp list1 (cdr list2)))))
        )
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (cond 
          ((null? (cdr s)) (list s))
          ((> (car s) (cadr s)) (cons (list (car s)) (nondecreaselist (cdr s))))
          (else (let
                    ((next_list (nondecreaselist (cdr s))))
                    (cons (cons (car s) (car next_list)) (cdr next_list))
                    )
                )
          )
    )
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))


;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (cons form (cons params (let-to-lambda body)))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           (let ((params (car (zip values)))
                 (values (cdr (zip values))))
             (cons (cons 'lambda (cons params (let-to-lambda body))) (let-to-lambda (car values)))
            )
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         ; what else does is that every other expr apart form above ones should be evaluated for every sub-exprs
         (map let-to-lambda expr)
         ; END PROBLEM EC
         )))

