(define conta-letras
  (lambda (st ch)
    (letrec ((aux (lambda (i c)
                    (cond
                      ((>= i (string-length st)) c)
                      ((char-ci=? (string-ref st i) ch) (aux (add1 i) (add1 c)))
                      (else (aux (add1 i) c))))))
      (aux 0 0))
    ))

(define conta-vogais
  (lambda (vec)
    (letrec ( (ocorr-vogais (make-vector 5 0))
              (vogais (vector #\a #\e #\i #\o #\u))
              (aux-vec (lambda (i)
                         (if (< i (vector-length vec))
                             (begin (aux-str (vector-ref vec i) 0) (aux-vec (add1 i))))))
              (aux-str (lambda (str i)
                         (if (< i 5) (begin
                                       (vector-set! ocorr-vogais i (+ 
                                                                    (vector-ref ocorr-vogais i)
                                                                    (conta-letras str (vector-ref vogais i))))
                                       (aux-str str (add1 i)))
                             )
                         )))
      (aux-vec 0)
      ocorr-vogais)
    ))

(define acumula!
  (lambda (vendas)
    (letrec ((varpass 0)
             ; Devolva a soma de um elemento e retira-o da lista
             (aux-soma (lambda (lista ele soma)
                   (let ((varpass 0))
                     (if (null? (cdr lista)) soma
                         (begin
                           ; Debugging
                           ;(display lista) (display " O Car da Lista: ") (display (cadr lista))(newline) 
                           ;(display ele) (display " é igual a ") (display (caadr lista)) (display " ? ") (display (equal? (caadr lista) ele)) (newline)  (newline)
                           ; Debugging
                         (if (equal? (caadr lista) ele)  ; compara o próximo
                            (begin #t 
                                   (set! varpass (cdadr lista))
                                   (set-cdr! lista (cddr lista))
                                   (aux-soma  lista ele (+ varpass soma))) ; tem de ser lista e não (cdr lista)
                             (aux-soma (cdr lista) ele soma)))))))

             ; Verificar se o elemento existe
             (existe? (lambda (nome lista estado) ; Funciona bem
                        (cond
                          ((null? lista) estado)
                          ((equal? (caar lista) nome) #t)
                          (else (existe? nome (cdr lista) estado)))                            
                        
                        ))
             ; Percorre a lista, modificando os valores das vendas
             (aux (lambda (lista)
                    (if (not (null? lista))
                        (if (existe? (caar lista) (cdr lista) #f) 
                            (let ((soma (aux-soma lista (caar lista) 0)))
                            (begin (set-cdr! (car lista) (+ (cdar lista) soma))) (if (zero? soma) (aux (cdr lista)) (aux  lista)))
                        (aux (cdr lista)))))
             ))
      (if (null? vendas) (list )
      (aux vendas))
      )))