(define funcao-recta
  (lambda (p1 p2)
    (if (= (car p1) (car p2)) (display "recta vertical") 
        (begin
          (let* ((m (/ (- (cdr p2) (cdr p1)) (- (car p1) (car p2))))
                 (b (- (cdr p1) (* m (car p1)))))
            
            (lambda (x)
              (+ b (* m x)))
            )))))

(define cima?
  (lambda (r1 r2 x)
    (if (> (r1 x) (r2 x)) #t #f)
    ))
(define r1 (funcao-recta (cons 1 2) (cons 5 4)))
(define r2 (funcao-recta (cons 1 1) (cons 4 4)))

(define esquerda
  (lambda (lis)
    (if (null? lis)
        '()
        (esq-aux (cdr lis) (car lis)))))

(define esq-aux
  (lambda (lis par-esq)
    (cond
      ((null? lis) par-esq)
      ((< (caar lis) (car par-esq)) (esq-aux (cdr lis) (car lis)))
      (else (esq-aux (cdr lis) par-esq)))))

(define lis-pontos
(list (cons 5 7)(cons -3 6)(cons 13 4)(cons 2 -8)
(cons -3 7)(cons 16 7)(cons -3 5)))

(define acima
  (lambda (lista)
    (letrec ((aux (lambda (lis acima)
                   (cond
      ((null? lis) acima)
      ((> (cdar lis) (cdr acima))
       
       
       (aux (cdr lis) (car lis)))
      (else (aux (cdr lis) acima))) 
                    )))
        
        (if (null? lista)
        '()
        (aux (cdr lista) (car lista))))))

(define faz-selector
(lambda (comparador fun-selector)
  (lambda (lista)
  (letrec ((aux (lambda (lis controlo)
                   (cond
      ((null? lis) controlo)
      ((comparador (fun-selector (car lis)) (fun-selector controlo)) (aux (cdr lis) (car lis)))
      (else (aux (cdr lis) controlo))) 
                    )))
        
        (if (null? lista)
        '()
        (aux (cdr lista) (car lista)))))))

(define acumula-e-ordena
  (lambda (vec)
    (letrec ((auxi 0)
             (soma (lambda (i total nome)
                     (cond 
                       ((>= i (vector-length vec)) (if (zero? total) #f total)) ; Chegou ao fim do vector?
                       ((equal? (car (vector-ref vec i)) nome) ; O nome é igual ao nome do elemento do vector?
                        (set! auxi (cadr (vector-ref vec i))) ; Valor de passagem
                        (vector-set! vec i (list ))
                        (soma (add1 i) (+ total  auxi) nome)
                        )
                       (else (soma (add1 i) total nome))) ; Senão
                     ))
      
      (aux (lambda (i) 
             (if (< i (vector-length vec))
                  (cons 
                   (if (not (null? (vector-ref vec i)))
                   (list (car (vector-ref vec i)) (+ (cadr (vector-ref vec i))
                        (let ((adiciona (soma (add1 i) 0 (car (vector-ref vec i)))))
                       (if (not (equal? #f adiciona)) adiciona 0))))
                   (list ))
                   
                       (aux (add1 i)))
                 (list ))
             ))
      (remove (lambda (lista ele)
               (cond
                 ((null? lista) (list ))
                 ((equal? (car lista) ele) (remove (cdr lista) ele))
                 (else (cons (car lista) (remove (cdr lista) ele)))
               )))
      (maior-aux (lambda (lista maior)
               (cond 
                 ((null? lista) maior)
                 ((> (cadar lista) (cadr maior)) (maior-aux (cdr lista) (car lista)))
                 (else (maior-aux (cdr lista) maior)))
               ))
      (ordena (lambda (lista)
                (if (null? lista) (list )
                    (let ((omaior (maior-aux lista (car lista))))
                    (cons  omaior (ordena (remove lista omaior)))))
      )))
      
(let ((final (remove (aux 0) (list))))
    
  (ordena final)
      ))))
(define todas-as-vendas '#((manuel 235) (manuel 45) (manuel 25) (ana 457) (adna 1000) (adna 25)))
