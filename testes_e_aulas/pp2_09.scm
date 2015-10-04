(define cria-carta
  (lambda (valor naipe)
    (cons valor naipe)
    ))

(define valor-carta
  (lambda (carta)
    (car carta)
    ))

(define naipe-carta
  (lambda (carta)
    (cdr carta)
    ))

(define figura-carta?
  (lambda (carta)
    (symbol? (valor-carta carta))
    ))

(define cria-jogador
  (lambda (nome)
    (list nome 0)))

(define adiciona-carta-jogador
  (lambda (jogador carta)
    (cons (car jogador) (cons (add1 (cadr jogador)) (cons carta (cddr jogador))))
    ))
(define naipe-jogador
  (lambda (jogador naipe)
    (letrec ((aux
              (lambda (lista naipe c)
                (cond
                  ((null? lista) c)
                  ((equal? naipe (cdar lista)) (aux (cdr lista) naipe (add1 c))) 
                  (else (aux (cdr lista) naipe c)))
                )))
      (aux (cddr jogador) naipe 0)
      )
    ))

(define remove-carta-jogador
  (lambda (jogador carta)
    (letrec ((aux
              (lambda (lista carta)
                (cond
                  ((equal? carta (car lista)) (cdr lista))
                  (else (cons (car lista) (aux (cdr lista) carta)))
                  ))
              )) 
      (cons (car jogador) (cons (sub1 (cadr jogador))
                                (aux (cddr jogador) carta)))
      )))

(define ordinal-carta
  (lambda (naipe)
    (case naipe
      ((2) 1)
      ((3) 2)
      ((4) 3)
      ((5) 4)
      ((6) 5)
      ((7) 6)
      ((8) 7)
      ((9) 8)
      ((10) 9)
      ((dama) 10)
      ((valete) 11)
      ((rei) 12)
      ((as) 13)
      )))

(define jogada-jogador
  (lambda (jogador naipe)
    (letrec ((aux (lambda (lista maior naipe) ; maior do naipe
                    (cond 
                      ((null? lista) maior)
                      ((and (equal? (naipe-carta (car lista)) naipe) 
                            (> (ordinal-carta (caar lista)) (ordinal-carta (car maior))))
                       (aux (cdr lista) (car lista) naipe))
                      (else (aux (cdr lista) maior naipe))
                      )))
             (aux2 (lambda (lista menor) ; menor absoluto
                     (cond 
                       ((null? lista) menor)
                       ((< (ordinal-carta (caar lista)) (ordinal-carta (car menor)))
                        (aux2 (cdr lista) (car lista)))
                       (else (aux2 (cdr lista) menor))
                       )
                     )))
      (if (zero? (naipe-jogador jogador naipe))
          (aux2 (cddr jogador) (cons 'as naipe)) ; Se zero vai para o maior absoluto   
          (aux (cddr jogador) (cons 2 naipe) naipe))) ; Se tem algum do naipe, vai para o maior do naipe
    ))


(define c1 (cria-carta 1 'copas))
(define j1 (cria-jogador "Joao"))
(define j2 (adiciona-carta-jogador j1 c1))
(define j3 (adiciona-carta-jogador j2 c1))
(define j4 (list 'Maria 5 (cons 7 'paus) (cons 'as 'paus) (cons 2 'ouros) (cons 7 'copas) (cons 2 'copas)))