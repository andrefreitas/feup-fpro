;;;;;;;;;;;;;;;
; Exercício 4 ;
;;;;;;;;;;;;;;;
(define junta-ordenado
  (lambda (crescente-1 crescente-2)
   (letrec ((ordena
             (lambda (lista)
               (if (null? lista) lista
                   (cons (aux-menor lista 10000) (ordena (aux-remove lista (aux-menor lista 10000))))
                   )
               )))
     (ordena (aux-junta crescente-1 crescente-2))
     )
    ))

; Auxiliar que junta
(define aux-junta
  (lambda (crescente-1 crescente-2)
    (if (null? crescente-1)  crescente-2 
        (cons (car crescente-1) (aux-junta (cdr crescente-1) crescente-2))
        )
  ))
; Auxiliar que devolve o menor
(define aux-menor
  (lambda (lista menor)
    (cond((null? lista) menor)
        ((< (car lista) menor) (aux-menor (cdr lista) (car lista)))
        (else (aux-menor (cdr lista) menor))
        )
    ))

;Auxiliar que remove um N elemento (só uma vez)
(define aux-remove
  (lambda (lista ele)
    (if (equal? (car lista) ele) (cdr lista)
        (cons (car lista) (aux-remove (cdr lista) ele)))
        ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Junta ordenados sem repetidos ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define junta-ordenado-sem-repetidos
  (lambda (crescente-1 crescente-2)
       (letrec ((ordena
             (lambda (lista)
               (if (null? lista) lista
                   (cons (aux-menor lista 10000) (ordena (aux-remove-todos lista (aux-menor lista 10000))))
                   )
               )))
     (ordena (aux-junta crescente-1 crescente-2))
     )
    ))

;Auxiliar que remove todas as ocorrências de um n elemento
(define aux-remove-todos 
  (lambda (lista ele)
    (cond ((null? lista) lista)
      ((equal? (car lista) ele) (aux-remove-todos (cdr lista) ele)) 
        (else (cons (car lista) (aux-remove-todos (cdr lista) ele)))
        )
        ))


(define l1 '(2 3 40 70))
(define l2 '(1 3 34 60 68 47))
(define l3 (list 2 2 3 34 60 68 47))
