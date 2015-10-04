(define a-subir
  (lambda (num)
    (if (zero? (a-subir-i num 0))
        (display "A subir")
        (display "A descer")
        )

    ))

(define a-subir-i
  (lambda (num control)
    ; Debugging
    (display "Primeiro: ") (display (remainder num 10))
    (display " Segundo: ")  (display (quotient (remainder num 100) 10))
    (newline)
     ; Debugging
    (if (or (zero? num) (zero? (quotient (remainder num 100) 10)) (= 2 control))
        control
        
        (if (> (remainder num 10) (quotient (remainder num 100) 10))
            (a-subir-i (quotient num 10) 0)
            (if (< (remainder num 10) (quotient (remainder num 100) 10))
                (a-subir-i (quotient num 10) 1)
                (a-subir-i (quotient num 10) 2) 
                )
            )
        )
    ))