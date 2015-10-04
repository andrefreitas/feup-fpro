(define pi 3.141592653589793); definir o PI

(define deg->rad
  (lambda (ang-deg)
    (/ (* pi ang-deg)
       180.0)))

(define rad->deg
  (lambda (ang-rad)
    (/ (* ang-rad 180.0)
       pi)))