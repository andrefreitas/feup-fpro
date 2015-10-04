;Cálculo da hipotenusa
(define hipotenusa
  (lambda (c1 c2)
    (sqrt 
     (+ 
      (* c1 c1) (* c2 c2)))
    ))
;Soma das hipotenusas de 2 triângulos
(define soma-hipotenusa-de-2-triangulos
  (lambda (c1t1 c2t1 c1t2 c2t2)
    (+ 
     (hipotenusa c1t1 c2t1) 
     (hipotenusa c1t2 c2t2))
     ))