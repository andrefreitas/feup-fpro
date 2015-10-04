; Construtor da Produção
(define cria-producao
  (lambda (ano litros)
    (cons ano litros)
    ))
; Selectores da produção
(define ano-producao
  (lambda (prod)
    (car prod)
    ))
(define quantidade-producao
  (lambda (prod)
    (cdr prod)
    ))
; Construtor da Parcela
(define cria-parcela
  (lambda (geocodigo nif nome)
    (list geocodigo (cons nif nome) (list ))
    ))
; Adicionar produção a uma parcela
(define adic-prod-parcela
  (lambda (parcela producao)
    (list (car parcela) (cadr parcela) (cons producao (caddr parcela))) ; muito importante o caddr
    ))
; Devolve a produção de um X ano
(define prod-ano-parcela
  (lambda (parcela ano)
    (letrec ((aux
              (lambda (lista)
                (cond 
                  ((null? lista) 0)
                  ((equal? ano (caar lista)) (cdar lista)) 
                  (else (aux (cdr lista)))
                  )
                )))
      (if (null? (caddr parcela)) 0
      (aux (caddr parcela)))
      )
    ))
; Devolve a média da produção da parcela
(define media-prod-parcela
  (lambda (parcela)
    (letrec ((aux
              (lambda (lista soma conta)
                (if (null? lista) (/ soma conta)
                    (aux (cdr lista) (+ soma (cdar lista)) (add1 conta))
                    )
                )))
      (if (null? (caddr parcela)) 0
          (aux (caddr parcela) 0 0)))
    ))
; Devolve o ano em que houve maior produção
(define ano-max-prod-parcela
  (lambda (parcela)
    (letrec ((aux
              (lambda (lista maior)
                (cond ((null? lista) maior)
                      ((> (cdar lista) maior) (aux (cdr lista) (caar lista)))
                      (else (aux (cdr lista) maior))
                      )
                )))
      (if (null? (caddr parcela)) 0
          (aux (caddr parcela) 0))
      )
    ))
