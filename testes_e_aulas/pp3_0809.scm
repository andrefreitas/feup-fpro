(define inclui-numero?
  (lambda (pw)
    (letrec ((aux (lambda (i)
                    (cond ((= i (string-length pw)) #f)
                          ((char-numeric? (string-ref pw i)) #t)
                          (else (aux (add1 i)))))))
      (aux 0))))

(define tamanho-minimo?
  (lambda (pw)
    (>= (string-length pw) 8) ))

(define inclui-letra?
  (lambda (pw)
    (letrec ((aux (lambda (i)
                    (cond ((= i (string-length pw)) #f)
                          ((char-alphabetic? (string-ref pw i)) #t)
                          (else (aux (add1 i)))))))
      (aux 0))))

(define cumpre?
  (lambda (dados lista-pred)
    (cond
      ((null? lista-pred) #t)
      ((not ((car lista-pred) dados)) #f)
      (else (cumpre? dados (cdr lista-pred))))))

(define qualificador
  (lambda (lista-pred m)
    (lambda (x)
    (letrec ((aux
              (lambda (lis i)
                (cond
                  ((null? lis) #t)
                  ((zero? i) #f)
                  ((not ((car lis) x))
                   (aux (cdr lis) (sub1 i)))
                  (else (aux (cdr lis) i))))))
      (aux lista-pred m))
    )))

(define fib-vector
  (lambda (n)
    (letrec ((vec (make-vector n 0))
             (preenche (lambda (i)
                         (if (< i (vector-length vec))
                             (begin 
                               (vector-set! vec i (+ (vector-ref vec (sub1 i)) (vector-ref vec (- i 2))))
                                    (preenche (add1 i)))
                         ))))
      (vector-set! vec 0 0) (vector-set! vec 1 1) ; 2 primeiras posições
      (if (> n 2)
          (preenche 2))
      vec)
    ))
             
    
    