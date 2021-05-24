#lang racket

(provide (all-defined-out))

;**************************** TDA (Usuario) ****************************


;---------------------------- CONSTRUCTOR ----------------------------

(define (usuario Act idU nombre contra listaA listaS)
  (list idU nombre contra listaA listaS))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------


(define (getidU usuario)
  (car usuario))

(define (getNombreU usuario)
  (car (cdr usuario)))

(define (getContra usuario)
  (car (cdr (cdr usuario))))

(define (getAmigos usuario)
  (car (cdr (cdr (cdr usuario)))))

(define (getSeguidores usuario)
  (car (cdr (cdr (cdr (cdr usuario))))))

;---------------------------------------------------------------------


(define (addUsuario listaUsuarios username password)
  (cond((null? listaUsuarios)
         null)
       ((and (equal? (getNombreU (car listaUsuarios))username) (equal? (getContra (car listaUsuarios)) password))
         (car listaUsuarios))
       (else (addUsuario (cdr listaUsuarios) username password ))))

;---------------------------- PERTENENCIA ----------------------------

(define (existeUsuario? listaUsuarios nombre)
  (if(null? listaUsuarios)
         #f
        (if (eqv? (getNombreU (car listaUsuarios)) nombre)
         #t
        (existeUsuario? (cdr listaUsuarios) nombre))))

;---------------------------------------------------------------------


(define (amigos) (list 1 2 3 4 5))
(define (seguidores) (list "juan" "carla" "fran"))

(define (Usuario1)(usuario 0 4 "Manuel" "banana2" (amigos) (seguidores)))