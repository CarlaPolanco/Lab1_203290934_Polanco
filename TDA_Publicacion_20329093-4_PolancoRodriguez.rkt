#lang racket

(provide (all-defined-out))

;************************ TDA (Publicacion) **********************

;---------------------------- CONSTRUCTOR ----------------------------

(define (Publicacion ID Autor Fecha Tipo Contenido Respuestas Reacciones ListaCompartida VCompartidas )
  (list ID Autor Fecha Tipo Contenido (Respuestas) (Reacciones) (ListaCompartida) VCompartidas))

;------------------------------------------------------------------------

;------------------------------ SELECTORES ------------------------------

(define (getIDPublicacion Publicacion)
  (car Publicacion))

(define (getAutor Publicacion)
  (car (cdr Publicacion)))

(define (getFecha Publicacion)
  (car (cdr (cdr Publicacion))))

(define (getTipo Publicacion)
  (car (cdr (cdr (cdr Publicacion)))))

(define (getContenido Publicacion)
  (car (cdr (cdr (cdr (cdr Publicacion))))))

(define (getRespuestas Publicacion)
  (list-ref Publicacion 5))

(define (getReacciones Publicacion)
  (list-ref Publicacion 6))

(define (getListaCompartida Publicacion)
  (list-ref Publicacion 7))

(define (getVCompartidas Publicacion)
  (list-ref Publicacion 8))

;-------------------------------------------------------------------------

;------------------------------- EJEMPLOS --------------------------------

(define (listaCompartida) (list "juan" "pedro" "manuel"))
(define (listaRespuestas) (list "wow que interesante" "dislike"))
(define (listaReacciones) (list "like" "dislike"))


;(Publicacion 0 "carla polanco" "24/05/2020" "link" "enlace a faebook" listaRespuestas listaReacciones listaCompartida 4)
