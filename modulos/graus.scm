(define converte-Fahrenheit
  (lambda (f)
    (define c (* (- f 32) (/ 5 9))) 
    (display "Fahrenheit: ")
    (display f)
    (newline)
    (display "Centígrados: ")
    (display c)
    (newline)
    (display "Kelvin: ")
    (display (+ c 273.16))        
))