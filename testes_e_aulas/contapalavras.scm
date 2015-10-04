(define conta-palavras
  (lambda (st)
    (letrec ((aux (lambda (i c)
                    (if (< i (string-length st))
                        (if (not (equal? #\space (string-ref st i))) (aux (add1 i) c)
                            (aux (add1 i) (add1 c)))
                        c)
                    )))
      (if (zero? (string-length st)) 'Erro!
          (if (equal?  #\space  (string-ref st (sub1 (string-length st))))
              (aux 0 0)
              (aux 0 1)))
      )
))