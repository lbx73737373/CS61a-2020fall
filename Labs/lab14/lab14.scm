(define (split-at lst n)
  (cond
      ((null? lst) (cons nil nil))
      ((= n 0) (cons nil lst))
      ((= n 1) (cons (list (car lst)) (cdr lst)))
      (else (cons 
                  (append (list (car lst)) (car (split-at (cdr lst) (- n 1)))) 
                  (cdr (split-at (cdr lst) (- n 1)))))
              )
)


(define (compose-all funcs)
  (define (helper x)
      (cond 
            ((null? funcs) x)
            (else ((compose-all (cdr funcs)) ((car funcs) x))))
        )  
  helper
)

