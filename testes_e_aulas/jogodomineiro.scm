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

(define mp1 (gera-mapa 8 8))