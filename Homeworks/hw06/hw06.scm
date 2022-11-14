(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (cond
      ((< num 0) -1)
      ((= num 0) 0)
      (else 1)
      )
)


(define (square x) (* x x))

(define (even_pow x y) 
    (cond
        ((= y 0) 1)
        ((= y 1) x)
        (else (square (even_pow x (/ y 2))))
        )
    )

(define (pow x y)
    (cond
        ((= x 1) 1)
        ((even? y) (even_pow x y))
        (else (* x (even_pow x (- y 1))))
         )
)

