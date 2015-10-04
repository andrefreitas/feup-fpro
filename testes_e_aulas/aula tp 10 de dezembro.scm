; Somatório, recebe uma função Ex: > (somatorio (lambda (x) (expt x 2)) 1 100 add1)
(define somatorio
  (lambda (fun inf sup passo)
    (letrec ((aux
              (lambda (i total)
                (if (> i sup)
                    total
                    (aux (passo i) (+ total (fun i)))))))
      (if (> inf sup)
          0
          (aux (passo inf) (fun inf))))))

(define pi-aprox
  (lambda (x)
    (* 4 (somatorio (lambda (n) (* (expt -1 (add1 n)) (/ 1 (sub1 (* n 2.0))))) 1 (* 2 x) add1))))

(define factorial
  (lambda (x)
    (if (zero? x)
        1
        (* x (factorial (sub1 x))))
    ))

(define e-aprox
  (lambda (x)
    (somatorio (lambda (n) (/ 1.0 (factorial (sub1 n)))) 1 x add1)
    ))

(define compoe3
  (lambda (p1 p2 p3)
    (lambda (x)
      (p1 (p2 (p3 x))))))

(define compoe-muitas
  (lambda lista
    (lambda (x)
      (trata-lista lista x)
      )
    ))

(define trata-lista
  (lambda (lista x)
    (if (null? lista) x
        ((car lista) (trata-lista (cdr lista) x)))
    ))
(define soma3 (compoe-muitas add1 add1 add1))

(define faz-funcao-acesso-a-lista
  (lambda (x)
    (lambda (lista)
      (if (>= x (length lista))
          (display "erro: lista pequena")
          (list-ref lista x)
          )
      )
    ))

(define decimo (faz-funcao-acesso-a-lista 9))
(decimo '(p0 p1 p2 p3 p4 p5 p6 p7 p8))