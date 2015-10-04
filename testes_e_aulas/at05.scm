;Exercício 1
(define raccons
  (lambda (num denom)
    (cons num denom)
    ))

(define racnum
  (lambda (rac)
    (car rac)
    ))

(define racdenom
  (lambda (rac)
    (cdr rac)
    ))

(define racvisu
  (lambda (rac)
    (display (racnum rac))
    (display "/")
    (display (racdenom rac))
    ))

(define racreduz
  (lambda (rac)
    (raccons (/ (racnum rac)(gcd (racnum rac) (racdenom rac)))
             (/ (racdenom rac)(gcd (racnum rac) (racdenom rac))))
    ))

; Exercício 2
(define faces '(as duques tres quatro cinco seis sete oito nove dez dama valete rei))
(define naipes '(coupas ouros paus espadas))

(define devolve-elemento
  (lambda (n lista)
    (if (zero? n)
        (car lista)
        (devolve-elemento (sub1 n) (cdr lista)) )
    ))

(define da-carta
  (lambda ()
    (list (devolve-elemento (random 13) faces)
          (devolve-elemento (random 4) naipes)
        )        
    ))

