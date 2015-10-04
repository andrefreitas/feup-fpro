(require (lib "audio.scm" "user-feup"))
;Dizer as Centenas
(define dizer-centenas
  (lambda (n)
        (let ( (num (number->string (* (quotient n 100) 100))) )
          (if (and (> n 100) (< n 200))
          (som "c100")
          (som num))
          )  
    ))
;Dizer as dezenas
(define dizer-dezenas
  (lambda (n)
    (let (
    (d (remainder (quotient n 10) 10))
    (u (remainder n 10)) )
   (if (= d 1)
      (som (number->string (+ 10 u)))
      (som (number->string (* d 10)))
      )
   ); Fim do let  
))
; Dizer unidades
(define dizer-unidades
  (lambda (n)
      (som (number->string n))   
))