;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ALGORITMO DE ORDENAÇÃO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1) Usar o método iterativo para constantemente devolver o menor valor da lista.
; 2) A operação de redução é retirar o menor da lista.
; 3) Usa-se um procedimendo  auxiliar que devolve o menor valor da lista e um outro 
; que retira esse mesmo valor, EM CADA ITERAÇÃO.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define menor-lista
  (lambda (lista menor)
    (if (null? lista)
        menor
        (begin
          (if (< (car lista) menor) 
              (menor-lista (cdr lista) (car lista))
              (menor-lista (cdr lista) menor))) ) 
    ))

(define retira-num-lista
  (lambda (lista num)
    (cond
      ((null? lista) lista)
      ((not (equal? num (car lista))) 
       (cons (car lista) (retira-num-lista (cdr lista) num)))
      (else (retira-num-lista (cdr lista) num))
      )
    ))

(define ordena-lista
  (lambda (lista)
    (if (null? lista) lista
        (cons (menor-lista lista 99)  (ordena-lista (retira-num-lista lista (menor-lista lista 99)))))
    ))

(define junta-lista
  (lambda (novo lista)
    (if (null? lista) (cdr lista)
        (list novo (car lista) (ordena-lista (cdr lista)))) 
    ))


(define l4 (list 20 12))