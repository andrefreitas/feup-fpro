(define soma-digitos-positivos
  (lambda (numero)
    (cond ((< numero 10) numero)
          (else (+ (dms numero)
                   (soma-digitos-positivos (retira-digito numero)))))))

(define dms
  (lambda (num)
    (remainder num 10)))
(define retira-digito
  (lambda (num)
    (quotient num 10)))

(define soma-digitos-melhorado
  (lambda (num)
    (cond ((negative? num) (display "Número Negativo!"))
          (else (soma-digitos-positivos num)))))

(define n-digitos
  (lambda (numero nd)
    (cond ((= nd 0) 0) 
          ((= nd 1) (dms numero))
          (else (+ (dms numero) (nd-menos-significativo (retira-digito numero)(- nd 1)))))))

(define DMS
  (lambda (numero)
    (quotient numero
              (expt 10 (sub1 (conta-digitos numero))))))

(define retira-DMS
  (lambda (numero)
    (remainder numero
               (expt 10 (sub1 (conta-digitos numero))))))

(define soma-digitos-mais-significativos
 (lambda (numero nd)
    (cond ((= nd 0) 0) 
          ((= nd 1) (DMS numero))
          (else (+ (DMS numero) (soma-digitos-mais-significativos (retira-DMS numero)(- nd 1)))))))

(define conta-digitos
  (lambda (num)
    (cond ((< num 10) 1)
     (else (+ 1 (conta-digitos (retira-digito num)))))))
