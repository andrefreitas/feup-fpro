; Procedimento Auxiliar: Converte o mês para o formato do algoritmo
; Março -> 1 Abril -> 2 Dezembro -> 10 Janeiro -> 11 Fevereiro -> 12
(define convmes
  (lambda(mes)
    (if (<= mes 2)
        (+ 10 mes)
        (- mes 2)
        )
    ))
; Procedimento Auxiliar: imprime o nome do dia
(define diasemana
  (lambda (d)
    (cond
      ((= d 1) (display "Domingo"))
      ((= d 2) (display "Segunda-Feira"))
      ((= d 3) (display "Terça-Feira"))
      ((= d 4) (display "Quarta-Feira"))
      ((= d 5) (display "Quinta-Feira"))
      ((= d 6) (display "Sexta-Feira"))
      ((= d 7) (display "Sábado"))
      )
    ))
; Procedimento Principal
(define dia-da-semana
  (lambda ()
    (define debug 1)
    (display "dia: ")
    (let ((d (read)))
      (display "mês: ")
      (let ((m (convmes (read))))
        (display "ano: ")
        (let ((a (read)))
          (let ((s (truncate (/ a 100))))
            (let ((mint (truncate (/ (- (* 13 m) 1) 5))) (aint (truncate (/ a 4))) (sint (truncate(/ s 4))))
              (let ( (x (- (+ mint aint sint d a) (* 2 s))))
              (let (  (dia (remainder x 7)))
               ; Imprimir Variáveis
              (if (= 1 debug)
                  (begin    
                    (display "********* DEBUGGING *********") (newline)
                    (display "mint: ") (display mint) (newline) 
                    (display "aint: ") (display aint) (newline) 
                    (display "sint: ") (display sint) (newline) 
                    (display "d: ") (display d) (newline) 
                    (display "a: ") (display a) (newline) 
                    (display "s: ") (display s) (newline)
                    (display "m: ") (display m) (newline)
                    (display "********* FIM DEBUGGING *********") (newline)))
              ; Resultado 
             (display "Dia da semana: ")
             (diasemana dia)
                )  ; fim do 7º let
                ) ; fim do 6º let
              ); fim do 5º let
            ); fim do 4º let
          ) ; fim do 3º let
        ); fim do 2º let
      ); fim do 1º let
    ))