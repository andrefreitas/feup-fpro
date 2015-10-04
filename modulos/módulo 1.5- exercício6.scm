(define rectangulo-maior 
  (lambda ()
    (display "Lados do Rectângulo A: ")
    (let ((lado-a1 (read)) (lado-a2 (read)) )
      (display "Lados do Rectângulo B: ")
       (let ((lado-b1 (read)) (lado-b2 (read)) )
    (define areaa (* lado-a1 lado-a2))
    (define areab (* lado-b1 lado-b2))
    (display "Rectângulo A: ")
    (display areaa)
    (newline)
    (display "Rectângulo B: ")
    (display areab)
    (newline)
    (cond 
      ((> areaa areab)
       (display "O rectângulo A é maior ")
       (display (- areaa areab))
       (display " unidades."))
      
      ((> areab areaa)
       (display "O rectângulo B é maior ")
       (display (- areab areaa))
       (display " unidades."))
      
      (else (display "Os rectângulos apresentam áreas iguais."))
      )
         ) ; Fim do 2º let
      ); Fim do 1º let
    ))