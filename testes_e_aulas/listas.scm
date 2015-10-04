(define cria-produto
  (lambda (nome quant)
    (cons nome quant)
    ))

(define produto-total
  (lambda (produto)
    (case (car produto)
      ((ovos) (* (cdr produto) 0.75))
      ((carne) (* (cdr produto) 2.35))
      ((leite) (* (cdr produto) 0.6))
      ((arroz) (* (cdr produto) 1.1))
      )
    ))
(define cria-lista-compras
  (lambda (nome)
    (list nome)
    ))

(define adiciona-produto
  (lambda (lista produto)
    (if (null? (cdr lista))
    (list (car lista) produto)
    (append (list (car lista)) (cons produto (cdr lista)))
    ))) 
(define total-lista
  (lambda (lista)
    (letrec ((aux 
              (lambda (lista soma)
                (if (null? lista) soma
                    (aux (cdr lista) (+ soma (produto-total (car lista))))
                ))))
      (aux (cdr lista) 0)) 
    ))

(define p1 (cria-produto 'arroz 4))
(define p2 (cria-produto 'ovos 2))
(define l1 (cria-lista-compras 'lista1))
(define l3 (adiciona-produto (adiciona-produto l1 p1) p2)) 