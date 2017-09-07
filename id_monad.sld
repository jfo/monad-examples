(define unit
 (lambda (x)
  (cons x '())))

(define bind
 (lambda (f)
   (lambda (Mx)
      (f (car Mx)))))

(define push
  (lambda (el)
    (lambda (x) (unit (cons 'a x)))))

(define pop
  (lambda (x) (unit (cdr x))))

(define compose (lambda (g f)
  (lambda (m) (bind f (bind g m)))))

(define y '(a b c))
(define My (unit y ))


; left identity
(display ((bind pop) My))  ; ((b c) hello_monads)
(display (pop y))        ; ((b c) hello_monads)

; right identity
; (display (bind unit My)) ; ((a b c) hello_monads)
; (display My)             ; ((a b c) hello_monads)

; ; associativity
; (display (bind (push 'c) ((compose (push 'a) pop) My))) ; ((c a b c) hello_monads)
; (display ((compose pop (push 'c)) (bind (push 'a) My))) ; ((c a b c) hello_monads)

