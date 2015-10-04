(define linha-aposta
  (lambda (linha)
    (display "Numero ")
    (display linha)
    (display ": ")
    (display (roleta-1-n 49))
    (newline)))
 
(define roleta-1-n
  (lambda (n)
         (+ 1 (random n))))

(define aposta-totoloto
  (lambda ()
    (linha-aposta 1)
    (linha-aposta 2)
    (linha-aposta 3)
    (linha-aposta 4)
    (linha-aposta 5)
    (linha-aposta 6)
    ))