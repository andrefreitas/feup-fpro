(define cadeia-ao-contrario
  (lambda (st)
    (letrec (
             (aux (lambda (i)
                    (if (>= i 0 ) (begin
                        (display (string-ref st i)) (aux (sub1 i))))
                    )))
      (aux (sub1 (string-length st))))
    )) 
(define capicua
  (lambda (st)
    (letrec ((nov-st (make-string (string-length st) #\*))
             (inverte (lambda (i j)
                        (if (< i (string-length st))
                            (begin (string-set! nov-st j (string-ref st i)) 
                                   (inverte (add1 i) (sub1 j))
                        )))))
             (inverte 0 (sub1 (string-length st)))
       (equal? st nov-st))
    ))

(define capicua2
  (lambda (st)
    (letrec ((aux (lambda (i j)
                    (if (>= i j) ; Pode ficar cruzado em "anna"
                        #t
                    (if (equal? (string-ref st i) (string-ref st j))
                        (aux (add1 i) (sub1 j))
                        #f))
                    )))
      (if (zero? (string-length st)) #t
      (aux 0 (sub1 (string-length st)))))))