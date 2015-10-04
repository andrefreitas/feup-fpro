(define factorial
  (lambda (num)
    (if (zero? num)
        1
        (* num (factorial (sub1 num))))
    )) 

(define soma-digitos
  (lambda (num)
    (if (negative? num)
        (display "Número negativo!!")
        (begin
          (if (< num 10)
              num
              (+ (remainder num 10) (soma-digitos (quotient num 10)))
              )
          )
        )
    ))

(define soma-n-digitos
  (lambda (num nd)
    (if (= 0 nd)
        num
        (+ (quotient num (/ (expt 10 (contadig num)) 10)) (soma-n-digitos (remainder (quotient num (expt 10 (- (contadig num) nd))) (expt 10 (sub1 nd))) (sub1 nd))) 
        )
    ))

(define contadig
  (lambda (num)
    (if (< num 10)
        1
        (add1 (contadig (quotient num 10)))
        )
    ))