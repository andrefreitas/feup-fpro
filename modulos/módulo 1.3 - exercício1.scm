; Gerar Números de 1 a 49
(define roleta-1-49
  (lambda ()
    (display (+ 1 (random 49)))
    ))
; Imprimir uma linha da aposta
(define linha-aposta
  (lambda (li)
    (display "Numero ")
    (display li)
    (display ": ")
    (roleta-1-49)
    (newline)
    ))
; Procedimento para a aposta do totoloto
(define aposta-totoloto
  (lambda ()
    (linha-aposta 1)
    (linha-aposta 2)
    (linha-aposta 3)
    (linha-aposta 4)
    (linha-aposta 5)
    (linha-aposta 6)
    ))