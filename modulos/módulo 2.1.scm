; Conta o nº de dígitos
(define conta
  (lambda (num som)
    (if (< num 10)
        som
        (conta (quotient num 10) (add1 som)))
    ))
; Devolve o factorial de um número
(define factorial
  (lambda (num prod)
    (if (zero? num)
        prod
        (factorial (sub1 num) (* num prod))
        )
    ))
; Soma dígitos
(define soma-digitos-i
  (lambda (num soma)
    (if (zero? num)
        soma
        (soma-digitos-i (truncate (/ num 10)) (+ (remainder num 10) soma))
        )
    ))

(define soma-digitos
  (lambda (num)
  (soma-digitos-i num 0)
    ))
