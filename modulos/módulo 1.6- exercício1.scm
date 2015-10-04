(define custo-parafusos
  (lambda (quant custo)
    (display "O custo total de ")
    (display quant)
    (display " parafusos, com o custo unitário de ")
    (display custo)
    (display " euros é: ")
    ; Determinar custo total
    (cond
      ((<= quant 10) ; Inferior ou igual a 10 unidades
       (display (* quant custo)))
      
      ((and (> quant 10) (<= quant 50)) ; Superior a 10 e inferior ou igual a 50 unidades
       (display (- (* quant custo) (* 3 custo))))
      
      ((> quant 50) ; Superior a 50 unidades
       (display (* 0.9 (* quant custo))))
      ) ; Fim do Cond
    (display " euros.")
    
    ))