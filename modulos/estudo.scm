(define direction
  (lambda (num)
    (if (not (integer? num))
        (display "invalid angle")
        (begin
          (cond
            ((<= 45 num 135) 'north)
            ((< 135 num 225) 'west)
            ((<= 225 num 315) 'south)
            ((or (< 315 num 360) (and (<= 0 num) (< num 45))) 'east)
            (else (display "invalid angle"))
            )
          )
        )
    ))

(define direction-n
  (lambda (ang)
    (cond
      ((and (<= ang 360) (>= ang 0)) (direction  ang))
      ((> ang 360) (direction (remainder ang 360)))
      ((negative? ang) (direction-n (- 360 (abs ang))))
      )
    ))


(define fruta
(lambda (laranjas peras)
  (cond
    ((> laranjas peras) 1) 
    ((< laranjas peras) 2) 
    ((and (not (zero? laranjas)) (not (zero? peras))(= laranjas peras)) 3) 
    ((and (zero? laranjas) (zero? peras)) 0)   
    )
  ))

(define fruta-com-negativos
(lambda (laranjas peras)
  (if (or (negative? laranjas) (negative? peras))
      -1
      (fruta laranjas peras)
      )
  ))

(define digito-f-verd
(lambda (d-f)
  (cond
    ((= d-f 0) 0)
    ((= d-f 1) 5)
    ((= d-f 2) 1)
    ((= d-f 3) 6)
    ((= d-f 4) 2)
    ((= d-f 5) 7)
    ((= d-f 6) 3)
    ((= d-f 7) 8)
    ((= d-f 8) 4)
    ((= d-f 9) 9)
    )
  ))

(define falso->verdadeiro
(lambda (num-falso)
  (if (< num-falso 10)
      (digito-f-verd num-falso)
     (+ (digito-f-verd  (remainder num-falso 10)) (* 10 (falso->verdadeiro (quotient num-falso 10))))
      )
  ))

(define digito-v-falso
(lambda (d-v)
  (cond
    ((= d-v 0) 0)
    ((= d-v 5) 1)
    ((= d-v 1) 2)
    ((= d-v 6) 3)
    ((= d-v 2) 4)
    ((= d-v 7) 5)
    ((= d-v 3) 6)
    ((= d-v 8) 7)
    ((= d-v 4) 8)
    ((= d-v 9) 9)
    )
  ))

(define verdadeiro->falso
(lambda (num-verd)
  (if (< num-verd 10)
      (digito-v-falso num-verd)
     (+ (digito-v-falso  (remainder num-verd 10)) (* 10 (verdadeiro->falso (quotient num-verd 10))))
      )
  ))

(define soma-falso
(lambda (n-falso1 n-falso2)
  (verdadeiro->falso (+ (falso->verdadeiro n-falso1)  (falso->verdadeiro n-falso2)))
  ))

(define max-falso
(lambda (n-falso1 n-falso2)
  (verdadeiro->falso (max (falso->verdadeiro n-falso1)  (falso->verdadeiro n-falso2)))
  ))