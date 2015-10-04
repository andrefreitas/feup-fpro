(define visu-classifica
(lambda (cla)
  (display "classificacao = ")
  (display cla)
  (newline)
  ))

(define calcula-classifica
(lambda (pp1 pp2 pp3 ad pe)
  (+ (* pp1 0.1) (* pp2 0.15) (* pp3 0.3) (* ad 0.05) (* pe 0.4))
  ))

(define classificacao
(lambda (pp1 pp2 pp3 ad pe)
  (if (>= (+ (* pp1 0.1) (* pp2 0.15) (* pp3 0.3) (* ad 0.05)) 3.6)
     (if ( >= pe 6)  (visu-classifica (calcula-classifica pp1 pp2 pp3 ad pe)) (visu-classifica "pe"))
     (visu-classifica "sf")
    )
  ))

(define comprimento
(lambda (x1 y1 x2 y2)
(let ((x1-menos-x2 (- x1 x2))
(y1-menos-y2 (- y1 y2)))
(sqrt (+ (* x1-menos-x2 x1-menos-x2)
(* y1-menos-y2 y1-menos-y2))))))

(define lado-mais-comprido
(lambda (x1 y1 x2 y2 x3 y3)
  (let (
  (l1 (round (comprimento x1 y1 x2 y2)))
  (l2 (round (comprimento x2 y2 x3 y3)))
  (l3 (round (comprimento x3 y3 x1 y1)))
  )
    (cond 
      ((and (> l1 l3)(> l1 l2)) (display 1))
      ((and (> l2 l1)(> l2 l3)) (display 2))
      ((and (> l3 l1)(> l3 l2)) (display 3))
      (else (display 0))
    )
 
  )
  ))