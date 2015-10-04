(define a-subir 
  (lambda (num)
    (if (or (= (a-subir-i num 0) 1) (zero? num))
        (display "sobe")
        (display "nao sobe")
        )
    
    
    ))

(define a-subir-i
  (lambda (num control) 
    (if (= 0 1) ; debugging
        (begin
          (display "Número: ") (display num) 
          (display " || Primeiro: ") (display (remainder num 10)) 
          (display " Segundo: ") (display (quotient (remainder num 100) 10))
          (newline)(display "-------------------------------------")(newline)))
    
    (if (or (< num 10) (= control 2) )
        control
        (if  (< (remainder num 10) (quotient (remainder num 100) 10)) 
             (a-subir-i (quotient num 10) 1)
             (a-subir-i (quotient num 10) 2)
             )
        )
    ))

(define teste
  (lambda ()
    (display "Introduza o número: ")
    (let* ((num (read)) (total (+ 10 num)))
      (display total)
      )
    ))