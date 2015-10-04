; Construtor
(define cria-relogio
  (lambda (horas min)
    (+ (* horas 60) min)
    ))

(define vis-horas
  (lambda (relogio)
    (quotient relogio 60)
    ))

(define vis-minutos
  (lambda (relogio)
    (remainder relogio 60)
    ))

(define vis-relogio
  (lambda (relogio)
    (display (vis-horas relogio)) (display ":")
    (if (< (vis-minutos relogio) 10)
        (display 0))
    (display (vis-minutos relogio))
    ))

(define relogio-avanca
  (lambda (relogio avanca)
    (let ((aux (+ relogio avanca)))
      ; Debuggging ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (display "relogio: ") (display relogio) (newline)
      (display "aux: ") (display aux) (newline)
      (display "quociente: ") (display (quotient (vis-horas aux) 24)) (newline)
      ; Fim Debuggging ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (if (zero? (quotient (vis-horas aux) 24)) 
          (begin  (vis-relogio aux) 
                  (newline) (display "Opcao 1")) ; Debugging
          (vis-relogio (remainder aux 1440))
          )
      (newline) (display "Método: ") 
      (vis-relogio   )  
      ; Debuggging ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (newline) (display "Aux ")  (display (vis-horas aux)) 
      (newline) (display "Remainder: ") (display(remainder (vis-horas aux) 24) )
      (newline) (display "Teste: ")(display (remainder (vis-horas aux) 24)) (display ":") (display (vis-minutos aux))
      ; Fim Debuggging ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      
                        )     
    ))

; Teste
(define relog1 (cria-relogio 23 10))