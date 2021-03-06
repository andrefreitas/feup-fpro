(require (lib "tabuleiro.scm" "user-feup"))

; -- prepara uma janela gráfica onde será visualizado um tabuleiro -------
(define largura-jan 390)  ; largura da janela em pixels
(define altura-jan 240)   ; altura da janela em pixels
(define titulo-jan "Jogo do Tabuleiro")  ; titulo da janela

; cria uma janela com a designação jan-tab, usando o procedimento janela
(define jan-tab (janela largura-jan altura-jan titulo-jan))

; -- prepara um tabuleiro onde se deslocará a nave --------------
(define lado-cel 20)    ; número de pixels do lado de cada uma das células quadradas
(define num-cel-x 18)   ; número de células em x
(define num-cel-y 10)   ; número de células em y
(define org-x 15)       ; coordenadas, da janela gráfica, do ponto correspondente
(define org-y 220)      ; ao canto superior-esquerdo do tabuleiro

; cria um tabuleiro com a designação tab-teste, usando o procedimento tabuleiro
(define tab-teste (tabuleiro org-x org-y lado-cel num-cel-x  num-cel-y))

; para ter acesso à funcionalidade associada 
; à abstracção naves
(require (lib "naves.scm" "user-feup"))

; a preparação de naves com as quais irá continuar o teste desta abstracção.
(define cor-rasto 18)        ; vermelho - cor do rasto da nave
(define x-nave 5)           	; entre 0 e 17 - coordenada x inicial da nave
(define y-nave 3)           	; entre 0 e 9 - coordenada y inicial da nave
(define ori-inicial 'n) ; pode ser 'n, 's, 'e, 'o - orientação inicial da nave

(define t-resposta 20)        ; tempo de resposta da nave, em ms, ao rodar ou
                               ; ao avançar para a próxima célula

; cria uma nave com a designação nave-k, usando o procedimento cria-nave
(define nave-k (cria-nave tab-teste x-nave y-nave ori-inicial cor-rasto t-resposta))


(define posiciona-nave
(lambda (nave x-dest y-dest)
  (let ((delta-x (- x-dest (nave-pos-x nave)))
        (delta-y (- y-dest (nave-pos-y nave))) )
    ;Delta X
    (if (positive? delta-x)
        (orienta-nave nave 'e)
        (if (negative? delta-x)
            (orienta-nave nave 'o)
            )
    )
    (frente nave (abs delta-x))
    ;Delta Y
     (if (positive? delta-y)
        (orienta-nave nave 's)
        (if (negative? delta-y)
            (orienta-nave nave 'n)
            )
    )
    (frente nave (abs delta-y))
    ; Teste da posição
    ;(teste-pos nave-k (nave-pos-x nave) (nave-pos-y nave) x-dest y-dest )
    )
 ))

(define orienta-nave
  (lambda (nave ori-nova)
    (if (not (eq? ori-nova (nave-ori nave)))
        (begin
          (roda-dir nave 1)
          (orienta-nave nave ori-nova)
          )
        )
           ))

(define teste-pos
  (lambda (nave x y x-dest y-dest)
    (display "Coordenada x introduzida: ")
    (display x-dest)
    (newline)
    
    (display "Coordenada y introduzida: ")
    (display y-dest)
    (newline)
    
    (display "Coordenada x: ")
    (display x)
    (newline)
    
      (display "Coordenada y: ")
    (display y)
    (newline)
    
    
    (if (and (= x x-dest)(= y y-dest))
        (display "Coordenadas certas")
        (display "Coordenadas erradas")
        )
    (newline)
    ))

(define insere-cord
  (lambda (nave)
    (display "Introduza o x: ")
    (let ((x (read)))
      (display "Introduza o y: ")
        (let ((y (read)))
          (posiciona-nave nave x y)
          )
      )
      (insere-cord nave-k)
      )
    )

; (insere-cord nave-k)
(define segue-percurso-desconhecido
  (lambda (nave cor-percurso)
    (display "teste")
    ))