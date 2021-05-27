#lang racket

(provide (all-defined-out))
(require "TDA_Date_20329093-4_PolancoRodriguez.rkt")

;************************ TDA (Publicacion) **********************

;---------------------------- CONSTRUCTOR ----------------------------

(define (Publicacion ID Autor Fecha Tipo Contenido VCompartidas listaDirigido )
  (list ID Autor Fecha Tipo Contenido VCompartidas listaDirigido))

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

(define (getVCompartidas Publicacion)
  (car (cdr (cdr (cdr (cdr (cdr Publicacion)))))))

(define (getDirigido Publicacion)
  (car (cdr (cdr (cdr (cdr (cdr (cdr Publicacion))))))))

; devuelva la publicacion con cierto id

(define (findP id ListaPublicacion)
  (if (null? ListaPublicacion)
      #f
      (if (eqv? (getIDPublicacion(car ListaPublicacion)) id)
          (Publicacion
           (getIDPublicacion (car ListaPublicacion))
           (getAutor (car ListaPublicacion))
           (getFecha (car ListaPublicacion))
           (getTipo (car ListaPublicacion))
           (getContenido (car ListaPublicacion))
           (getVCompartidas (car ListaPublicacion))
           (getDirigido (car ListaPublicacion)))
          (findP id (cdr ListaPublicacion)))))



;-------------------------------------------------------------------------

;------------------------------ MODIFICADOR ------------------------------
;ESTO NO HACE NADA


;RETORNA LISTA PUBLICACION
(define (addP ListaP Publicacion)
  (if (null? ListaP)
      (cons Publicacion null)
      (cons (car ListaP) (addP (cdr ListaP) Publicacion))))

;------------------------------- EJEMPLOS --------------------------------

(define listaCompartida (list "juan" "pedro" "manuel"))
(define listaRespuestas (list "wow que interesante" "dislike"))
(define listaReacciones (list "like" "dislike"))
(define listaD (list "carla" "viviana" "polanco"))


(define Publicacion1 (Publicacion 0 "carla polanco" (Date 8 "noviembre" 1999) "link" "enlace a faebook" 4 listaD))

(define Publicacion2 (Publicacion 1 "Francisca Marquez" (Date 30 "noviembre" 1998) "link" "enlace a faebook" 4 listaD))

(define p3 (append Publicacion1 Publicacion2));

