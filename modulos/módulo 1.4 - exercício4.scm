; Procedimento Auxiliar da Área
(define area
  (lambda (a b c)
    (define sp (/ (+ a b c) 2))
    (sqrt
     (*
      sp
      (- sp a)
      (- sp b)
      (- sp c)))
))

; Procedimento Principal
(define area-triangulo
  (lambda()
    (display "lado1: ")
    (let ((l1 (read)))
          (display "lado2: ")
          (let ((l2 (read)))
                (display "lado1: ")
                (let ((l3 (read)))
                  (display (area l1 l2 l3))
                  (display " m2")
                  ); Fim do 3º let    
            ); Fim do 2º let 
      ); Fim do 1º let
    ))