; Parte 1 
   (define funcao-recta
  (lambda (p1 p2)
    ( if (= (car p1) (car p2))
         (display "recta vertical")
         (begin
    (lambda (x)
    (let* (
           (m (/ (- (cdr p2) (cdr p1)) (- (car p2) (car p1))))
           (b (- (cdr p1) (* m (car p1)))))
      (+ b (* m x))))))
    ))

(define cima?
  (lambda (r1 r2 x)
    (> (r1 x) (r2 x))    
    ))
; Testes
(define r1 (funcao-recta (cons 1 2) (cons 5 4)))
(define r2 (funcao-recta (cons 1 1) (cons 4 4)))

; Parte 2

(define cria-jogo
(lambda (clube1 golos1 clube2 golos2)
  (cons (cons clube1 clube2) (cons golos1 golos2))
  ))

(define vencedor-jogo
(lambda (jogo)
  (cond
    ((> (cadr jogo) (cddr jogo)) (caar jogo))
    ((< (cadr jogo) (cddr jogo)) (cdar jogo))
    (else 'empate))
  ))
(define j1 (cria-jogo 'a 3 'b 2))

(define cria-pontuacao
(lambda (clubes)
  (if (null? clubes) ()
      (cons (cons (car clubes) 0) (cria-pontuacao (cdr clubes))))
  ))

(define actualiza-pontuacao
(lambda (pontuacao clube pontos)
  (cond
    ((null? pontuacao) ())
    ((equal? (caar pontuacao) clube) (cons (cons clube (+ pontos (cdar pontuacao))) (cdr pontuacao)))
    (else (cons (car pontuacao) (actualiza-pontuacao (cdr pontuacao) clube pontos))))
      
  ))

(define p1 (cria-pontuacao '(a b c d)))

(define primeiros
(lambda (pontuacao)
(letrec ((aux
          (lambda (lista clubes pontos)
            (cond
              ((null? lista) (cons clubes pontos))
              ((>= (cdar lista) pontos) (aux (cdr lista) (append clubes (list (caar lista))) (cdar lista)))
              (else (aux (cdr lista) clubes pontos))
                )
            )))
  (if (null? pontuacao) 'pontuacao_invalida
  (aux pontuacao () (cdar pontuacao))))
  ))
(define p2 (list (cons 'a 13) (cons 'b 4) (cons 'c 13) (cons 'd 10)))