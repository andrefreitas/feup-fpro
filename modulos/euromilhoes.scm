(define gerar
  (lambda (n)
    (+ 1 (random n))
    ))

(define euromilhoes
(lambda ()
  (display "Numero 1: ")
  (display (gerar 50))
  (newline)
  
    (display "Numero 2: ")
   (display (gerar 50))
  (newline)
  
    (display "Numero 3: ")
   (display (gerar 50))
  (newline)
  
    (display "Numero 4: ")
   (display (gerar 50))
  (newline)
  
    (display "Numero 5: ")
  (display (gerar 50))
  (newline)
 

   (display "Estrela 1: ")
   (display (gerar 9))
  (newline)

   (display "Estrela 2: ")
   (display (gerar 9))
  (newline)
  
))  