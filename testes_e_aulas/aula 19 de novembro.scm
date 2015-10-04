; Módulo 3.0
(define faz-ponto
  (lambda (x y )
    (cons x y)))

(define x-coord
  (lambda (ponto2d)
    (car ponto2d) ))

(define y-coord
  (lambda (ponto2d)
    (cdr ponto2d) ))

(define faz-rectangulo
  (lambda (vert1 vert2)
    (cons vert1 vert2)
    ))

(define area-rectangulo
  (lambda (rect)
    (let (
          (base (- (x-coord (y-coord rect)) (x-coord (x-coord rect))) )
          (altura (- (y-coord (y-coord rect)) (y-coord (x-coord rect)))))
      (abs (* base altura))
      )
    ))

(define distancia
  (lambda (ponto1 ponto2)
    (let ((comprimento (abs (-  (x-coord ponto1) (x-coord ponto2))) )
          (altura (abs (- (y-coord ponto2) (y-coord ponto1)))) )
      (sqrt (+ (* comprimento comprimento)  (* altura altura))) 
      )
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;; EM CONSTRUÇÃO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define area-de-interseccao
  (lambda (rec1 rec2)
    (let (
          (Xmin2 (x-coord (x-coord rec2)))  
          (Xmax1 (x-coord (y-coord rec1))) 
          (Ymax1 (y-coord (y-coord rec1))) 
          (Ymin2 (y-coord (x-coord rec2)))
          )
      (display "xmin2: ") (display Xmin2) (newline)
      (display "xmax1: ") (display Xmax1) (newline)
      (display "ymax1: ") (display Ymax1) (newline)
      (display "ymin2: ") (display Ymin2) (newline)
      )
    
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;; FIM CONSTRUÇÃO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define substitui-primeira-ocorrencia
  (lambda (lista novo velho)
    (cond
      ((null? lista) lista) ; Caso não encontre nada, devolve a lista
      ((equal? velho (car lista)) (cons novo (cdr lista))) ; Caso seja igual devolve o novo e o resto da lista
      (else (cons (car lista) (substitui-primeira-ocorrencia (cdr lista) novo velho))) ; Senão, continua a chamar o procedimento
      )
    ))

(define substitui-primeira-ocorrencia
  (lambda (lista novo velho)
    (cond
      ((null? lista) lista) ; Caso não encontre nada, devolve a lista
      ((equal? velho (car lista)) (cons novo (cdr lista))) ; Caso seja igual devolve o novo e o resto da lista
      (else (cons (car lista) (substitui-primeira-ocorrencia (cdr lista) novo velho))) ; Senão, continua a chamar o procedimento
      )
    ))

(define p1 (faz-ponto 2 3))
(define p2 (faz-ponto 5 8))
(define rect1 (faz-rectangulo p1 p2))

(define p3 (faz-ponto 3 6))
(define p4 (faz-ponto 7 9))
(define rect2 (faz-rectangulo p1 p2))