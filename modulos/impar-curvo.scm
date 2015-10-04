(define impar-curvo?
  (lambda (n)
    (let ((u (remainder n 10)))
      (or (= u 3) (= u 5) (= u 9))
        )
  ))