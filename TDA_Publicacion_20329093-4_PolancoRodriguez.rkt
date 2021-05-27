#lang racket

(provide (all-defined-out))
(require "TDA_Date_20329093-4_PolancoRodriguez.rkt")

;************************ TDA (Publicacion) **********************

;--------------------------------------------------------
;REPRESENTACION: TDA Publicacion
;listaPublicacion: '(ID Autor Fecha Tipo Contenido VCompartida Lista dirigida)
;--------------------------------------------------------


;---------------------------- CONSTRUCTOR ----------------------------

;CONSTRUCTOR: TDA lista Publicacion
;Descripcion:Genera una Publicacion 
;Dominio: Publicacion
;Recorrido: lista Publicacion
;Recursion:-
(define (Publicacion ID Autor Fecha Tipo Contenido VCompartidas listaDirigido )
  (list ID Autor Fecha Tipo Contenido VCompartidas listaDirigido))

;------------------------------------------------------------------------

;------------------------------ SELECTORES ------------------------------

;SELECTOR: ID de la publicacion
;Descripcion:Retorna el ID de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: Entero
;Recursion:-
(define (getIDPublicacion Publicacion)
  (car Publicacion))

;SELECTOR: Autor de la publicacion
;Descripcion:Retorna el autor de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: string
;Recursion:-
(define (getAutor Publicacion)
  (car (cdr Publicacion)))

;SELECTOR: Fecha de la publicacion
;Descripcion:Retorna una lista con la fecha de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: list
;Recursion:-

(define (getFecha Publicacion)
  (car (cdr (cdr Publicacion))))

;SELECTOR: Fecha de la publicacion
;Descripcion:Retorna una lista con la fecha de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: list
;Recursion:-

(define (getTipo Publicacion)
  (car (cdr (cdr (cdr Publicacion)))))

;SELECTOR: Contenido de la publicacion
;Descripcion:Retorna el contenido de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: String
;Recursion:-
(define (getContenido Publicacion)
  (car (cdr (cdr (cdr (cdr Publicacion))))))

;SELECTOR: Veces compartida la publicacion
;Descripcion:Retorna las veces compartida la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: numero
;Recursion:-

(define (getVCompartidas Publicacion)
  (car (cdr (cdr (cdr (cdr (cdr Publicacion)))))))

;SELECTOR: Usuarios a quien va dirigida la publicacion
;Descripcion:Retorna una lista con nommbre de usuarios de la publicacion
;Dominio: lista TDA Publicacion
;Recorrido: list
;Recursion:-

(define (getDirigido Publicacion)
  (car (cdr (cdr (cdr (cdr (cdr (cdr Publicacion))))))))

;SELECTOR: Encontrar una publicacion segun ID
;Descripcion:Funcion Añadir una publicacion a la lista de publicaciones
;Dominio: ID = Identificador de la funcion a buscar, ListaPublicaciones = lista de publicaciones
;Recorrido: list
;Recursion: Natural
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

;MODIFICADOR: Añade una publicacion
;Descripcion:Funcion Añadir una publicacion a la lista de publicaciones
;Dominio: ListaP = lista de publicaciones, Publicacion = lista con la publicacion 
;Recorrido: list
;Recursion: Cola
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

