(define pi 3.141592653589793); definir o PI

(define deg->rad
  (lambda (ang-deg)
    (/ (* pi ang-deg)
       180.0)))

(define rad->deg
  (lambda (ang-rad)
    (/ (* ang-rad 180.0)
       pi)))

; Determinar seno de um ângulo
(define ang
  (lambda (sp l1 l2)
  (rad->deg
   (* 2  (asin
         (sqrt 
         (/ 
         (* 
         (- sp l1)
         (- sp l2))
         (* l1 l2))))))
    ))


(define briggs
  (lambda (a b c)
(define sp (/ (+ a b c) 2))
    
   (display "O Triangulo com os lados de comprimento: ")
   (display a) 
   (display ", ")
   (display b) 
   (display ", ")
   (display c)
   (newline)
   (display "tem os seguintes angulos: ")
   (display (ang sp b c))
   (display ", ")
   (display (ang sp a c))
   (display ", ")
   (display (ang sp b b))
   (display ", ")
    ))

