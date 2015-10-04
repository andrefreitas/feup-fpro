(define elimina-primeira-ocorrencia
  (lambda (lista i)
    (cond ((null? lista) lista)
          ((equal? (car lista) i) (cdr lista))
          (else (cons (car lista) (elimina-primeira-ocorrencia (cdr lista) i))) 
          )
    ))

(define elimina-todas-ocorrencias
  (lambda (lista i)
    (cond ((null? lista) lista)
          ((equal? (car lista) i) (elimina-todas-ocorrencias (cdr lista) i))
          (else (cons (car lista) (elimina-todas-ocorrencias (cdr lista) i))) 
          )
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Versão com um contador de posição e remove a posição;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define elimina-ultima-ocorrencia-1
  (lambda (lista i)
      (remove-ele l1 (pos lista i  1 0))
      ))

(define pos
  (lambda (lista i cont ord)
    (cond 
      ((null? lista) ord)
      ((equal? (car lista) i) (pos (cdr lista) i (add1 cont) cont))
        (else (pos (cdr lista) i (add1 cont) ord)) 
        )
    ))

(define remove-ele
  (lambda (lista cont)
    (if (= 1 cont) (cdr lista)
        (cons (car lista) (remove-ele (cdr lista) (sub1 cont)))
        )
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Versão com inverte a lista ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define elimina-ultima-ocorrencia
  (lambda (lista i)
      (display "Em desenvolvimento!!!")
      ))

; Testes
(define l1 (list 1 2 3 1 4 5))