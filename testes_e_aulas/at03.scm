(define fruta
  (lambda (laranjas peras)
    (cond
      ((> laranjas peras) 1)
      ((< laranjas peras) 2)
      ((and (= laranjas peras)(not (zero? laranjas)) (not (zero? peras))) 3)
      ((and (zero? laranjas)  (zero? peras)) 0)
      )
    ))

(define fruta-com-negativos
  (lambda (laranjas peras)
    (if (and (>= laranjas 0) (>= peras 0))
        (cond
          ((> laranjas peras) 1)
          ((< laranjas peras) 2)
          ((and (= laranjas peras)(not (zero? laranjas)) (not (zero? peras))) 3) 
          ((and (zero? laranjas)  (zero? peras)) 0) )  
        (if (or (negative? laranjas)  (negative? peras)) -1)
        )
    ))

(define muita-fruta
  (lambda (laranjas peras mangas bananas figos)
    (if (and (>= laranjas 0) (>= peras 0) (>= mangas 0) (>= bananas 0) (>= figos 0))
        (cond
          ((and (> (+ laranjas peras) (+ mangas bananas figos)) (< figos bananas)) 1)
          ((and (<= (+ laranjas peras) (+ mangas bananas figos))(< figos bananas)) 2)
          ((> (+ laranjas peras) (+ mangas bananas figos)) 3)
          ((<= (+ laranjas peras) (+ mangas bananas figos)) 4)
          )
        -1 )
    ))


(define falso->verdadeiro
  (lambda (num-falso)
    (cond
      ((<= num-falso 9)
       (digito-f-verd num-falso)
       )
      ((<= num-falso 99)
       (display (digito-f-verd (quotient num-falso 10)))
       (display(digito-f-verd (remainder num-falso 10)))
       )
       ((<= num-falso 999)
       (display (digito-f-verd (quotient num-falso 100)))
       (display (digito-f-verd (remainder (quotient num-falso 10) 10)))
       (display (digito-f-verd (remainder num-falso 10)))
       )
       
        ((<= num-falso 9999)
       (display (digito-f-verd (quotient num-falso 1000)))
       (display (digito-f-verd(remainder (remainder (quotient num-falso 100) 100) 10)))
       (display (digito-f-verd (remainder (quotient num-falso 10) 10)))
       (display (digito-f-verd (remainder num-falso 10)))
       )
      )
 
    ))

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