(define a-subir
  (lambda (num)
    (if (< num 10)
        (display "sobe") ; se todos cumprirem a condição devolve "sobe"
        (if (< (remainder num 10) (quotient (remainder num 100) 10))
            (a-subir (quotient num 10))
            (display "não sobe") ) ) ; basta um não ser menor do que o próximo e devolve "não sobe"
    ))



