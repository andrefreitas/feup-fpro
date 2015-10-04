(require (lib "tabuleiro.scm" "user-feup"))

 ; Criar Janela
(define jan-tab (janela 390 240 "Experiência com percurso"))

; Criar um Tabuleiro
(define lado-cel 20) ; número de pixels do lado de cada uma das células quadradas
(define num-cel-x 18) ; número de células em x
(define num-cel-y 10) ; número de células em y
(define org-x 15) ; coordenadas, da janela gráfica, do ponto correspondente
(define org-y 220) ; ao canto superior-esquerdo do tabuleiro
(define tab-teste (tabuleiro org-x org-y lado-cel num-cel-x num-cel-y))

;Criar a Nave
(require (lib "naves.scm" "user-feup"))
(define cor-rasto 18) ; vermelho - cor do rasto da nave
(define x-nave 5) ; entre 0 e 17 - coordenada x inicial da nave
(define y-nave 3) ; entre 0 e 9 - coordenada y inicial da nave
(define ori-inicial 'n) ; pode ser 'n, 's, 'e, 'o - orientação inicial da nave
(define t-resposta 200) ; tempo de resposta da nave, em ms, ao rodar ou
(define nave-k (cria-nave tab-teste x-nave y-nave ori-inicial cor-rasto t-resposta))


;Percurso a verde
(define cor-perc 18) ; verde amarelado

(celulas tab-teste
(list (cons 13 6) (cons 12 6) (cons 11 6) (cons 11 5)
(cons 11 4) (cons 11 3)
(cons 11 2) (cons 10 2) (cons 9 2)
(cons 9 3) (cons 8 3)(cons 7 3) (cons 6 3)
(cons 5 3) (cons 4 3)(cons 4 3) (cons 4 4)
(cons 4 5) (cons 4 6))
'l 300 cor-perc) ; 'l- limpa com cor-perc