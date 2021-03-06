(define direction
(lambda (num)
  (if (not (integer? num))
      (display "invalid angle")
      (begin
  (cond
    ((<= 45 num 135) 'north)
    ((< 135 num 225) 'west)
    ((<= 225 num 315) 'south)
    ((or (< 315 num 360) (and (<= 0 num) (< num 45))) 'east)
    (else (display "invalid angle"))
    )
  )
      )
  ))

(define direction-n
(lambda (num)
  (if (not (integer? num))
      (display "invalid angle")
      (begin
  (cond
    ((<= 45 num 135) 'north)
    ((< 135 num 225) 'west)
    ((<= 225 num 315) 'south)
    ((or (< 315 num 360) (and (<= 0 num) (< num 45))) 'east)
    (else (display "invalid angle"))
    )
  )
      )
  ))