#lang racket

(provide (all-defined-out))
(require "TDA_Date_20329093-4_PolancoRodriguez.rkt")

;************************ TDA (Publicacion) **********************

;---------------------------- CONSTRUCTOR ----------------------------

(define (Publicacion ID Autor Fecha Tipo Contenido Respuestas Reacciones ListaCompartida VCompartidas listaDirigido )
  (list ID Autor Fecha Tipo Contenido Respuestas Reacciones ListaCompartida VCompartidas listaDirigido))

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

(define (getDirigido Publicacion)
  (list-ref Publicacion 9))



;-------------------------------------------------------------------------

;------------------------------ MODIFICADOR ------------------------------

(define (addListaDirigido Lusuarios)
  (if (null? Lusuarios)
      null
      (cons (car Lusuarios) (addListaDirigido (cdr Lusuarios)))))

;------------------------------- EJEMPLOS --------------------------------

(define listaCompartida (list "juan" "pedro" "manuel"))
(define listaRespuestas (list "wow que interesante" "dislike"))
(define listaReacciones (list "like" "dislike"))
(define listaD (list "carla" "viviana" "polanco"))


(define Publicacion1 (Publicacion 0 "carla polanco" (Date 8 "noviembre" 1999) "link" "enlace a faebook" listaRespuestas listaReacciones listaCompartida 4 listaD))
