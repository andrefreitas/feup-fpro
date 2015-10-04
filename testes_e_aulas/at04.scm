(define decimal->outra
  (lambda (d-f)
    (cond
      ((= d-f 0) 0)
      ((= d-f 1) 1)
      ((= d-f 2) 2)
      ((= d-f 3) 3)
      ((= d-f 4) 4)
      ((= d-f 5) 5)
      ((= d-f 6) 6)
      ((= d-f 7) 7)
      ((= d-f 8) 8)
      ((= d-f 9) 9)
      ((= d-f 10) 'a)
      ((= d-f 11) 'b)
      ((= d-f 12) 'c)
      ((= d-f 13) 'd)
      ((= d-f 14) 'e)
      ((= d-f 15) 'f)
      ((= d-f 16) 'g)
      ((= d-f 17) 'h)
      ((= d-f 18) 'i)
      ((= d-f 19) 'j)
      (else '?)
      )
    ))

(define imprime-atebase-20
  (lambda (num base)
    (cond ((< num base)  (display (decimal->outra num)))
          (else
           (imprime-na-base (quotient num base) base)
           (display (decimal->outra (remainder num base)))))))
  