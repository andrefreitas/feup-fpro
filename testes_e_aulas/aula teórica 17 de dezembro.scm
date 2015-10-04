(define procura-no-vector
  (lambda (vec ele)
    (letrec ((aux (lambda (c)
                    (cond
                      ((= c (vector-length vec)) -1) ; Quando chega ao fim 
                      ((equal? (vector-ref vec c) ele) c)
                      (else (aux (add1 c)))))))
      (aux 0))
    ))

(define precos (vector 15.50 8.95 12.00))
(define quantidades (vector 2 5 3))

(define gasto-total
  (lambda (prec quant)
    (letrec ((aux (lambda (i total)
                    (if (< i (vector-length prec))
                        (aux (add1 i) (+ total (* (vector-ref prec i) (vector-ref quant i))))
                        total))))
      (aux 0 0))
    ))

(define soma-elementos-de-vector
  (lambda (vec)
    (letrec ((aux (lambda (i total)
                    (if (< i (vector-length vec))
                        (aux (add1 i) (+ total (vector-ref vec i)))
                        total
                        ))))
      (aux 0 0))
    ))

(define ocorrencia-de-digitos
  (lambda ()
    (let ((n (begin (display "Indicar um inteiro: ") (read) ))) ; Receber o número
      (define v1 (make-vector 10 0)) ; Definir um vector nulo de 10 posições
      (letrec ((aux (lambda (num) ; Procedimento que altera as posições do vector
                      (if (not (zero? num))       
                          (begin (vector-set! v1 (remainder num 10) (add1 (vector-ref v1 (remainder num 10)))) 
                                 (aux (quotient num 10)))
                          )))
               
               (mostra-vec (lambda (i) ; Procedimento que imprime o conteúdo do vector
                             (if (< i (vector-length v1))  
                                 (begin
                                   (display "digito ") (display i) (display " : ") (display (vector-ref v1 i)) (newline)
                                   (mostra-vec (add1 i))
                                   )
                                 )
                             )))
        (aux n)
        (mostra-vec 0)) 
      )))
(define teste-da-tabuada
  (lambda (i)
    (letrec ((aux (lambda (n err)
                    (let* ((n1 (add1 (random 10))) 
                           (n2 (add1 (random 10)))
                           (prod (* n1 n2))
                           (user (begin
                                   (display n1) (display " x ") (display n2) 
                                   (display " = ") (read)
                                   )))
                      
                      (cond
                        ((zero? n) err)
                        ((= user prod) (display "Resposta certa") (newline)
                                       (aux (sub1 n) err)
                                       )
                        (else (display "Resposta errada") (newline)
                              (aux (sub1 n) (add1 err)))
                        )
                      ))))
      
      (if (zero? (aux i 0))
          (display "Muito bem")
          (display "Deve estudar melhor a tabuada!"))
      
      )))

(define cria-equi-fute-vec
  (lambda ()
    (list (make-vector 11 '?) (make-vector 6 '?) '?)
    ))

(define entra-equi-vec!
  (lambda (equi i jogador)
    (vector-set! (car equi) (sub1 i) jogador)
    'ok
    ))

(define entra-sup-vec!
  (lambda (equi i jogador)
    (vector-set! (cadr equi) (sub1 i) jogador)
    'ok
    ))

(define entra-treina-vec!
  (lambda (equi treinador)
    (set-car! (cddr equi) treinador)
    'ok
    ))

(define sai-equi-vec!
  (lambda (equi jogador)
    (letrec (
             (principal (lambda (i) 
                    (cond
                      ((= i (vector-length (car equi))) #f)
                      ((equal? (vector-ref (car equi) i) jogador)
                       (vector-set! (car equi) i '?))
                      (else (principal (add1 i))))))
       
             (suplentes (lambda (i) 
                     (cond
                       ((= i (vector-length (cadr equi))) #f)
                       ((equal? (vector-ref (cadr equi) i) jogador)
                         (vector-set! (cadr equi) i '?))
                         (else (suplentes (add1 i))))
                     )))
      ; Se não existe na equipa principal, vai para a suplente
      (if (not (principal 0)) 
          (if (not (suplentes 0))
              (if (equal? (caddr equi) jogador) 
                  (begin (set-car (cddr equi) '?) 'ok)
                  (display "este jogador nao esta na equipa!..."))
              'ok
              )
          'ok
          ) 
      
)))

(define fcp (cria-equi-fute-vec))
(entra-equi-vec! fcp 11 'artur)
(entra-equi-vec! fcp 1 'rui-correia)
(entra-sup-vec! fcp 4 'folha)
(entra-treina-vec! fcp 'oliveira)