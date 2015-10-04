(define vencsemanal
  (lambda (nome h)
    (display nome)
    (display " trabalhou ")
    (display h)
    (display " horas durante a semana.")
    (newline)
    (display "O seu vencimento semanal foi de ")
    (cond
      ((< h 30)  ; Menos de 30 horas
       (display (* h 10)) )
      
      ((and (>= h 30) (<= h 36) ) ; Entre 30 a 36 horas
       (display (+ (* 29 10) (* 13 (- h 29)))) )
      
      ((> h 36)  ; Mais de 36 horas
       (display (+ (+ (* 29 10) (* 13 (- 36 29))) (* 11.5 (- h 36)))))
      
      ) ; Fim do Cond
     (display " euros.")
 ))

