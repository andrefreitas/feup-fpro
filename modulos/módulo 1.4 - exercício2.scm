(define experiencia-com-let-2
(lambda (x y)
  (let ((local1 (+ x y))
        (local2 (* x y)))
    
   (let ((maislocal (- local1 local2)))
     (* (+ local1 local2)
        maislocal) ) ; Fim do Segundo Let 
 ) ; Fim do Primeiro Let
 ))