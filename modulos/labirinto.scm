; acesso à abstracção tabuleiro.plus
(require (lib "tabuleiro.scm" "user-feup"))
; -- prepara uma janela gráfica onde será visualizado um tabuleiro -------
(define largura-jan 390)  ; em pixels
(define altura-jan 240)   ; em pixels
(define titulo-jan "O labirinto...")
;
(define jan-tab (janela largura-jan altura-jan titulo-jan)) 

; -- prepara um tabuleiro onde será visualizado um percurso --------------
(define lado-cel 20)    ; número de pixels do lado da célula quadrada
(define num-cel-x 18)   ; número de células em x
(define num-cel-y 10)   ; número de células em y
(define org-x 15)       ; coordenadas do canto inferior-esquerdo
(define org-y 220)      ; do tabuleiro
;
(define tab-teste (tabuleiro org-x org-y lado-cel num-cel-x  num-cel-y))

; acesso à abstracção naves
(require (lib "naves.scm" "user-feup"))

; ----------------
(define cor-perc 13)         ; verde amarelado

; células das paredes
(celulas tab-teste 
         (list (cons 0 0)(cons 0 1) (cons 0 2) (cons 0 3)(cons 0 4) 
               (cons 0 5)(cons 0 6)(cons 0 7)(cons 0 8)(cons 0 9)
               
               (cons 17 0)(cons 17 1) (cons 17 2) (cons 17 3)(cons 17 4) 
               (cons 17 5)(cons 17 6)(cons 17 7)(cons 17 8)(cons 17 9)
               
               (cons 1 0)(cons 2 0)(cons 3 0)(cons 4 0)(cons 5 0)(cons 6 0)
               (cons 7 0)(cons 8 0)(cons 9 0)(cons 10 0)(cons 11 0)(cons 12 0)
               (cons 13 0)(cons 14 0)(cons 15 0)(cons 16 0)
               
               (cons 1 9)(cons 2 9)(cons 3 9)(cons 4 9)(cons 5 9)(cons 6 9)
               (cons 7 9)(cons 8 9)(cons 9 9)(cons 10 9)(cons 11 9)(cons 12 9)
               (cons 13 9)(cons 14 9)(cons 15 9)(cons 16 9)
               
               
               )
         'l 3 cor-perc)


; labirinto
(define criadef
  (lambda ()
(celulas tab-teste 
         (list (cons 4 1) (cons 4 2) (cons 4 3)  (cons 3 1)  (cons 3 1)    
               
               (cons 14 1) (cons 14 2)  (cons 13 1)  (cons 12 1) 
               (cons 11 1) (cons 11 2) (cons 9 8)
               
               (cons 9 8) (cons 10 7) (cons 10 6)
               (cons 9 3) (cons 10 4) (cons 10 5) 
               (cons 8 2) (cons 9 3) (cons 10 5)
               
               (cons 15 6)  (cons 15 5) 
               (cons 15 7) (cons 15 8) (cons 16 8)
               
               (cons 2 6)  (cons 2 7) 
               (cons 2 8) (cons 3 8) (cons 3 6)
               
               (cons 1 3)  (cons 4 5)  (cons 4 6)
               
               (cons 7 5)  (cons 7 6)
               )
         'l 3 13)
    ))

; labirinto aleatorio
(define geralab
  (lambda (perc)
    (geralab-i (round (* perc 180)))
    ; célula do entrada
(celulas tab-teste 
         (list (cons 17 3)            
               )
         'l 3 15)
; célula da saída
(celulas tab-teste 
         (list (cons 0 5)            
               )
         'l 3 18)
    
    ))

(define geralab-i
  (lambda (n)
    (if (not (zero? n))
        (begin
          (celulas tab-teste 
                   (list
                    (cons (random 18) (random 10))
                    )
                   'l 3 13)
          (geralab-i (sub1 n))
          )
        )
    
    ))


; célula do entrada
(celulas tab-teste 
         (list (cons 17 3)            
               )
         'l 3 15)
; célula da saída
(celulas tab-teste 
         (list (cons 0 5)            
               )
         'l 3 18)


; percurso

(define percurso
  (lambda (nave)
    (if (and (= (nave-pos-x nave) 0) (= (nave-pos-y nave) 5))
        (display "*******************Cheguei!")
        (begin
          (cond 
             ((and (eq? (ve-dir nave) 13) (eq? (ve-frente nave) 13) (eq? (ve-esq nave) 13) )  (roda-esq nave 2) (frente nave 1)  (display "Eu volto para trás...")  (newline))
             
            ((not (eq? (ve-dir nave) 13) )  (roda-dir nave 1) (frente nave 1)  (display "Eu viro à direita") (newline))
            ((not (eq? (ve-frente nave) 13))  (frente nave 1) (display "Eu vou em frente")  (newline))
            ((and (eq? (ve-dir nave) 13) (eq? (ve-frente nave) 13) )  (roda-esq nave 1) (frente nave 1)  (display "Eu viro à esquerda...")  (newline))
            
           
            
            )
          (percurso nave))
        )
    ))
    ; criação de uma nave
(define n (cria-nave tab-teste 17 3 'o 18 20))