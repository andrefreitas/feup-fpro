(define somacat
  (lambda (ct1 ct2)
    (+ (* ct1 ct1) (* ct2 ct2))
    ))


(define hipotenusa
  (lambda (c1 c2)
    (sqrt(somacat c2 c2) )
    ))

(define soma-hipotenusas-de-2-triangulos
  (lambda (c1tr1 c2tr1 c1tr2 c2tr2)
    
    (+ (hipotenusa c1tr1 c2tr1) (hipotenusa c1tr2 c2tr2))
 
  ))