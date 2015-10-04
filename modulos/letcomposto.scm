(define mostranum
  (lambda ()
    (let ( (num (begin
                  (display "Num: ")
                  (read)
                  ) 
                )
           )
      (display num)
      ) 
    ))