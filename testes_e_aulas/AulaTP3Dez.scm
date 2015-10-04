; Gera uma linha com n colunas
(define gera-linha 
  (lambda (ncol)
    (if (zero? ncol) ()
        (cons (- 99 (random 199)) (gera-linha (sub1 ncol))))
    ))
; Gera uma matriz com n linhas e m colunas
(define gera-mapa
  (lambda (nlinhas ncol)
    (if (zero? nlinhas) ()
        (cons (gera-linha ncol) (gera-mapa (sub1 nlinhas) ncol)))
    ))
; Define valor em mapa
(define valor-em-mapa
  (lambda (mapa lin col)
    (list-ref (list-ref mapa (sub1 lin)) (sub1 col))
    ))
; Gera direcção
(define gera-cardeal
  (lambda ()
    (case (random 4)
      ((0) 'n)
      ((1) 's)
      ((2) 'o)
      ((3) 'e)
      )
    ))
; Gera distância
(define gera-distancia
  (lambda (n)
    (add1 (random n))
    ))
; Nova linha
(define nova-lin
  (lambda (lin ori dist maxlin maxcol)
    (cond
     ((or (zero? dist) (equal? ori 'e) (equal? ori 'o)) lin)
     ((equal? ori 'n)
      (if (= lin 1)
          (nova-lin lin 's dist maxlin maxcol)
          (nova-lin (sub1 lin) 'n (sub1 dist) maxlin maxcol)))
     ((equal? ori 's) 
      (if (= lin maxlin)
          (nova-lin lin 'n dist maxlin maxcol)
          (nova-lin (add1 lin) 's (sub1 dist) maxlin maxcol)
      )
     )
    )))
; Nova coluna
(define nova-col
  (lambda (col ori dist maxlin maxcol)
  (cond 
    ((or (zero? dist) (equal? ori 'n) (equal? ori 's)) col)
    ((equal? ori 'o)
     (if (= col 1)
         (nova-col col 'e dist maxlin maxcol)
         (nova-col (sub1 col) 'o (sub1 dist) maxlin maxcol)
     ))
    
     ((equal? ori 'e)
     (if (= col maxcol)
         (nova-col col 'o dist maxlin maxcol)
         (nova-col (add1 col) 'e (sub1 dist) maxlin maxcol)
     ))
  )))

; imprime elementos
(define impelementos
  (lambda (lista)
    (if (not (null? lista))
        (begin 
          
         (if (not (negative? (car lista))) (display " "))
         (display (car lista))
         (if (< (abs (car lista)) 10) (display " "))
               (display " ")
        (impelementos (cdr lista)))
        )
    ))

; Apresenta mapa
(define apresenta-mapa
  (lambda (mapa)
    (if (not (null? mapa)) 
       (begin (impelementos (car mapa)) (newline) (apresenta-mapa (cdr mapa)))
        )
    ))

; Define minas
(define minas
  (lambda (njog col-ini lin-in)
    (letrec ((aux (lambda (mapa njogs col lin pontos)
                 (display "------------------------------")(newline)
                    (display "Número restante de jogadas: ") (display njogs) 
                    (newline)
                    (newline)
                    (display "Terreno de minas:") (newline)
                 (apresenta-mapa mp1) (newline)
                    (display "Localizacao do mineiro: col. ") (display col) (display ", lin. ")(display lin)(newline)
                    (display "Situacao do mineiro: ") (display pontos) (newline) (newline)
                    (display "Indicar pista para a proxima mina") (newline)
                    
                    (let ((input (begin
                                   (display "N/S/E/O/numero? ") (read)
                                   ))
                          (dist (gera-distancia 8))
                          (ori (gera-cardeal))
                          )
                      (cond
                        ((zero? njogs) (display "O jogo acabou!"))
                        ((number? input) 
                         (display "Cardeal Gerado: ")  (display ori) (newline)
                         (aux mapa (sub1 njogs) (nova-col col ori input 8 8) (nova-lin col ori input 8 8) (+ pontos (valor-em-mapa mapa  (nova-lin col ori input 8 8) (nova-col col ori input 8 8) ))))
                        (else 
                         (display "Distancia Gerada: ")  (display dist) (newline)
                         (aux mapa (sub1 njogs) (nova-col col input dist 8 8) (nova-lin col input dist 8 8) (+ pontos(valor-em-mapa mapa  (nova-col col input dist 8 8) (nova-lin col input dist 8 8) ))))
                        )
                      
                    ))))
      (aux mp1 njog col-ini lin-in 0)
      )
    
    ))
(define mp1 (gera-mapa 8 8))