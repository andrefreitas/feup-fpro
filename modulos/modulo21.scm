; Soma todos os dígitos
(define soma-digitos-positivos
  (lambda (num som)
    (if (zero? num)
        som
        (soma-digitos-positivos (quotient num 10) (+ (remainder num 10) som))
        )
    ))

(define soma-digitos
  (lambda (num)
    (if (negative? num)
        (display "O número é negativo!")
        (soma-digitos-positivos num 0)
        )
    ))

; Soma n dígitos

(define soma-n-digitos-positivos
  (lambda (num cont som)
    (if (zero? cont)
        som
        (soma-n-digitos-positivos (quotient num 10) (sub1 cont) (+ (remainder num 10) som))
        )
    ))

(define soma-n-digitos
  (lambda (num cont)
    (if (negative? num)
        (display "O número é negativo!")
        (soma-n-digitos-positivos num cont 0)
        )
    ))

; Auxiliar para contar dígitos
(define contdig
  (lambda (num)
    (conta num 0)
    ))

(define conta
  (lambda (num som)
    (if (zero? num)
        som
        (conta (quotient num 10) (add1 som))
        )
    ))

; Soma n dígitos mais significativos

(define soma-n-significativos-digitos-positivos
  (lambda (num cont)
    (if (negative? num)
        (display "O número é negativo!")
         (soma-digitos (quotient num (expt 10 (- (contdig num) cont)))))
    ))  