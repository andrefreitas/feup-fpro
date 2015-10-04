(require (lib "tabuleiro.scm" "user-feup"))

; -- prepara uma janela gráfica onde será visualizado um tabuleiro -------
(define largura-jan 390)  ; em pixels
(define altura-jan 240)   ; em pixels
;(define titulo-jan "experiencia com percursos simples")
(define titulo-jan "experiencia com percursos complexos")
;
(define jan-tab (janela largura-jan altura-jan titulo-jan)) 

; -- prepara um tabuleiro onde será visualizado um percurso --------------
(define lado-cel 15)    ; número de pixels do lado da célula quadrada
(define num-cel-x 5)   ; número de células em x
(define num-cel-y 5)   ; número de células em y
(define org-x 15)       ; coordenadas do canto inferior-esquerdo
(define org-y 235)      ; do tabuleiro
;
(define tab-teste (tabuleiro org-x org-y lado-cel num-cel-x  num-cel-y))

(require (lib "naves.scm" "user-feup"))

(define cor-rasto 18)        ; vermelho - cor do rasto da nave

(define x-nave 5)           	; entre 0 e 29 - coordenada x inicial da nave
(define y-nave 3)           	; entre 0 e 19 - coordenada y inicial da nave
(define ori-inicial 'n) ; pode ser 'n, 's, 'e, 'o - orientação inicial da nave
(define t-resposta 200)        ; tempo de resposta da nave, em ms

; ----------------
(define cor-perc 13)         ; verde amarelado

(celulas tab-teste 
         (list (cons 0 0)(cons 0 1)(cons 1 0)(cons 0 2) (cons 0 3)(cons 0 4) 
               (cons 0 4) (cons 1 0)(cons 4 3)(cons 4 0)(cons 4 2)(cons 4 1)
               (cons 1 4)(cons 0 0)(cons 2 0)(cons 3 0)(cons 4 0)(cons 0 0)
               (cons 4 4)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 4 3)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)(cons 0 0)
               (cons 0 0))
         'l 3 cor-perc)