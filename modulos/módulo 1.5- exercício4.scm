; Procedimento com if
(define comparador-com-if 
  (lambda (n1 n2)
   (if (> n1 n2)
       (begin
         (display n1)
         (display " maior que ")
         (display n2)
         )
       (if (> n2 n1)
           (begin
             (display n2)
             (display " maior que ")
             (display n1) )
           (begin
             (display "ambos iguais a ")
             (display n1) )
         ) ; Fim do 2º if
       ) ; Fim do 1º if
    ))
; Procedimento com cond
(define comparador-com-cond
  (lambda (n1 n2)
    (cond
      ((> n1 n2)
       (display n1)
       (display " maior que ")
       (display n2) )
      
      ((> n2 n1)
       (display n2)
       (display " maior que ")
       (display n1) )
      (else 
       (display "ambos iguais a ")
       (display n1))
    )
    ))