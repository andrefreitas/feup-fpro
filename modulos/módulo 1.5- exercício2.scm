(define pi (acos -1))
(define circulo
  (lambda ()
    (display "raio (indicar um valor numérico positivo):")
    (let ((raio (read))) 
     (if (and (number? raio) (positive? raio))
         (begin
           (display "Área do círculo é: ")
           (display (* pi raio raio))
           (newline)
           (display "Perímetro do círculo é: ")
           (display(* 2 pi raio))
          )
          (display "Erro: Deve indicar um valor numérico positivo.")
      ); Fim do if
     ) ; Fim do let
 ))