(define rectangulo-maior 
  (lambda (lado-a1 lado-a2 lado-b1 lado-b2)
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
    ))