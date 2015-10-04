; Número Aleatório de 1 a n
(define aleatorio-n
  (lambda (n)
   (+ 1 (random n)) ; ATENÇÃO: Não colocar a função display, pois retorna #<void>
    ))
; Linha de Aposta (número ou estrela)
(define linha-aposta
  (lambda (nr nome alea) ; Número da linha, Nome da Linha, Limite do Random
    (display nome)
    (display " ")
    (display nr)
    (display ": ")
    (display (aleatorio-n alea))
    (newline)
    ))
; Procedimento do Euromilhões
(define aposta-euromilhoes
  (lambda ()
    ; Números
   (linha-aposta 1 "Número" 50)
   (linha-aposta 2 "Número" 50)
   (linha-aposta 3 "Número" 50)
   (linha-aposta 4 "Número" 50)
   (linha-aposta 5 "Número" 50)
   ;Estrelas
   (linha-aposta 1 "Estrela" 9)
   (linha-aposta 2 "Estrela" 9)
    ))