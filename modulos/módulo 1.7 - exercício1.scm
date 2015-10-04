(require (lib "audio.scm" "user-feup"))
;Dizer as Centenas
(define dizer-centenas
  (lambda (n)
        (let ( (num (number->string (* (quotient n 100) 100))) )
          (if (and (> n 100) (< n 200))
          (som "c100")
          (if (not(= (* (quotient n 100) 100) 0)) (som num)))
          )  
    ))
;Dizer as dezenas
(define dizer-dezenas
  (lambda (n)
    (let (
    (d (remainder (quotient n 10) 10))
    (u (remainder n 10)) )
   (if (and (= d 1)(not(= d 0)))
      (som (number->string (+ 10 u)))
      (som (number->string (* d 10)))
      )
   ); Fim do let  
))
; Dizer unidades
(define dizer-unidades
  (lambda (n)
     (let (
    (d (remainder (quotient n 10) 10))
    (u (remainder n 10)) )
    (if (not(= u 0))  (som (number->string u)) )
       )
))
  
; Dizer número de 3 dígitos
(define diz-num-3dig
  (lambda (n)
    (dizer-centenas n)
     (som "e")
   (dizer-dezenas n)
       (som "e")
    (dizer-unidades n)
  ))

(define dizer-numero
  (lambda (n)   
    (dizer-centenas n)
    (som "e")
    (dizer-dezenas n)
    (som "e")
    (dizer-unidades n)

  ))
