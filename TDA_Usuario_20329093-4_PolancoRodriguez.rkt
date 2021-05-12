#lang racket

(provide (all-defined-out))

;**************************** TDA (Usuario) ****************************


;---------------------------- CONSTRUCTOR ----------------------------

(define (usuario Act idU nombre contra listaA listaS)
  (list Act idU nombre contra listaA listaS))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------

(define (getAct usuario)
  (car usuario))

(define (getidU usuario)
  (car (cdr usuario)))

(define (getNombre usuario)
  (car (cdr (cdr usuario))))

(define (getContra usuario)
  (car (cdr (cdr (cdr usuario)))))

(define (getAmigos usuario)
  (car (cdr (cdr (cdr (cdr usuario))))))

(define (getSeguidores usuario)
  list-ref usuario 5)

;---------------------------------------------------------------------

(define (amigos) (list 1 2 3 4 5))
(define (seguidores) (list "juan" "carla" "fran"))

;(usuario 0 4 "Manuel" "banana2" (amigos) (seguidores))