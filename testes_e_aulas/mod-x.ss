(define mod-x
  (lambda (mult modulus quo)
    ; 12x = 15 mod 22
    ; mult  modulus quo
    (letrec ((aux (lambda (i)
                    (if (<= i modulus)
                        (begin 
                          ; Mostra as contas
                          (newline) (display "x= ") (display i) (display " : ") (display (* i mult)) (display " = ") (display modulus) (display " mod ") (display quo) (display " ")
                          (display " => Resto: ") (display (remainder (- (* i mult) modulus) quo)) 
                          ; Se encontrar um resto 0
                          (if (zero? (remainder (- (* i mult) modulus) quo)) (begin (newline)(newline) (display "*************************") (newline) (display " Solução: x= ") (display i) (newline) 
                                                                                    (display "*************************"))
                              
                              
                              (aux (add1 i)))
                          )
                        ) 
                    )))
      (aux 1))
    
    ))