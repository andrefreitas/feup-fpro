(define digito-f-verd
  (lambda (d-f)
    (cond
      ((= d-f 0) 0)
      ((= d-f 2) 1)
      ((= d-f 4) 2)
      ((= d-f 6) 3)
      ((= d-f 8) 4)
      ((= d-f 1) 5)
      ((= d-f 3) 6)
      ((= d-f 5) 7)
      ((= d-f 7) 8)
      ((= d-f 9) 9)
      )
    ))

(define convert-num
  (lambda (num soma dec)
    (if (zero? num)
        soma
        (convert-num (quotient num 10) (+ (* (digito-f-verd (remainder num 10)) dec) soma) (* dec 10))            
        )    
    ))


(define converte
  (lambda (num)
    (convert-num num 0 1)
    
    ))