(define quantos
  (lambda (lista predicado)
    (letrec ((aux (lambda (li c)
                    (if (null? li) c
                        (if (predicado (car li)) (aux (cdr li) (add1 c))
                            (aux (cdr li) c))))))
      (aux lista 0))
    ))

(define purifica!
  (lambda (lista predicado transformador)
    (if (not (null? lista))
        (if (predicado (car lista)) (purifica! (cdr lista) predicado transformador) 
            (begin (set-car! lista (transformador (car lista))) (purifica! (cdr lista) predicado transformador))))
    ))

(define cria-encontro 
  (lambda (jogador1 jogador2) 
    (list (cons jogador1 jogador2))))

(define novo-encontro! 
  (lambda (competicao num-encontro jogador1 jogador2) 
    (vector-set! competicao (sub1 num-encontro) (cria-encontro jogador1 jogador2))
    (cria-encontro jogador1 jogador2)))
 
 (define nova-partida! 
  (lambda (competicao num-encontro partida) 
    (vector-set! competicao (sub1 num-encontro) (append (vector-ref competicao (sub1 num-encontro)) (list partida)))
    (vector-ref competicao (sub1 num-encontro))
    ))
 
(define vencedores-defrontam-se! 
  (lambda (competicao num-encontro1 num-encontro2 num-encontro-novo)
    (letrec ((aux (lambda (lista v1 v2 j1 j2)
                    (cond
                      ((null? lista)  (if (> v1 v2) j1 
                                          (if (< v1 v2) j2
                                              #f)))
                      ( (> (caar lista) (cdar lista)) (aux (cdr lista) (add1 v1) v2 j1 j2))
                      ( (< (caar lista) (cdar lista)) (aux (cdr lista)  v1 (add1 v2) j1 j2))
                       (else (aux (cdr lista) v1 v2 j1 j2)) 
                    
                    )))
             (vencedor1 (aux (cdr (vector-ref competicao (sub1 num-encontro1))) 0 0 (caar (vector-ref competicao (sub1 num-encontro1))) (cdar (vector-ref competicao (sub1 num-encontro1)))))
             (vencedor2 (aux (cdr (vector-ref competicao (sub1 num-encontro2))) 0 0 (caar (vector-ref competicao (sub1 num-encontro2))) (cdar (vector-ref competicao (sub1 num-encontro2)))))
                       ) 
   (if  (or (equal? #f vencedor1) (equal? #f vencedor2)) (list)
        (begin
    (novo-encontro! competicao num-encontro-novo vencedor1 vencedor2)
    (vector-ref competicao (sub1 num-encontro-novo))))
    )))

; ***********************************************
; Testes dos Procedimentos
; ***********************************************
(define FEUPOpen (make-vector 7 null))
(novo-encontro! FEUPOpen 1 "Federer" "Del Potro")
(novo-encontro! FEUPOpen 2 "Agassi" "Djokovic")
(nova-partida! FEUPOpen 1 (cons 6 4))
(nova-partida! FEUPOpen 2 (cons 2 6)) 
(nova-partida! FEUPOpen 1 (cons 5 7))
; ***********************************************