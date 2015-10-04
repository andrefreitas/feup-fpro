(define cria-utilizador
  (lambda (login pw)
    (list login pw 0)))

 (define utilizadores (list (cria-utilizador "administrador" "x1y2z3w4")))
 
 (define acrescenta-utilizador!
   (lambda (lista user pw)
     (letrec ((existe? (lambda (lista user)
                       (if (null? lista) #f
                           (if (equal? (caar lista) user) #t
                               (existe? (cdr lista) user))))))
              (if (existe? lista user) #f
(begin  (append! lista (list(cria-utilizador user pw))) #t)))))
 
 (define valida-login
   (lambda (lista user pw)
     (letrec ((existe? (lambda (lista)
                       (if (null? lista) #f
                           (if (equal? (caar lista) user) #t
                               (existe? (cdr lista))))))
              
       (bloqueada? (lambda (lista)
                     (if (null? lista) #f
                         (if (equal? (caar lista) user)
                             (if (> (caddar  lista) 2) 
                                 #t
                            (bloqueada? (cdr lista) ))
                             (bloqueada? (cdr lista) )))))
       
       (validar (lambda (lista)
                  (if (not (null? lista))
                      (if (equal? (caar lista) user)
                         (if (equal? pw (cadar lista))
                          'sucesso
                          (begin
                            (set-car! (cddar lista) (add1 (caddar lista)))
                            'password-errada
                            ))
                         (validar (cdr lista))))
                          
                  )))
                     
       (if (existe? lista)
             (if (bloqueada? lista) 'conta-bloqueada
                 (validar lista))
           'login-inexistente)
     )))
 (acrescenta-utilizador! utilizadores "abel" "leba")
 (acrescenta-utilizador! utilizadores "hugo" "the-boss")
 (acrescenta-utilizador! utilizadores "carlos" "ie4wh6iC")
 
 (define validar (lambda (lista user pw)
                  (if (not (null? lista))
                      (if (equal? (caar lista) user)
                         (if (equal? pw (cadar lista))
                          'sucesso
                          (begin
                            (set-car! (cddr lista) (add1 (caddr(caddr lista))))
                            'password-errada
                            ))
                         (validar (cdr lista) user pw)))))