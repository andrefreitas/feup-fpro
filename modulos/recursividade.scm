;---------------------------------------------------------------------
; Procedimento que devolve o produto dos dígitos de um número inteiro
;---------------------------------------------------------------------
(define produto ; Versão Recursiva
  (lambda (num)
    (if (< num 10)
        num
        (* (remainder num 10) (produto (quotient num 10))))
    ))

(define produto-i ; Versão Iterativa
  (lambda (num prod) ; ATENÇÃO: precisa de 2 argumentos
    (if (< num 10)
        (* num prod)
        (produto-i (quotient num 10) (* prod (remainder num 10))))
    ))

(define produto-i-lr ; Versão Iterativa implementada com o letrec
  (lambda (num) ; ATENÇÃO: precisa de apenas 1 argumento
    (letrec ((aux
              (lambda (num prod) 
                (if (< num 10)
                    (* num prod)
                    (aux (quotient num 10) (* prod (remainder num 10))))
                )))
      (aux num 1))
    ))