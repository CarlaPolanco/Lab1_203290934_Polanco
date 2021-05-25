#lang racket
(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Date_20329093-4_PolancoRodriguez.rkt")

;************************  TDA SocialNetwok **********************

; Funcion de encriptacion

(define encryptFn (lambda (s)
                    (list->string
                     (reverse (string->list s)))))


;---------------------------- CONSTRUCTOR ----------------------------

(define (socialnetwork NombreR Date encryptFunction decryptFunction)
  (list NombreR Date encryptFunction decryptFunction (list)(list)(list)))

;---------------------------------------------------------------------

;------------------------------ SELECTORES ---------------------------

(define (getNombre socialnetwork)
  (car socialnetwork))

(define (getDate socialnetwork)
  (car (cdr socialnetwork)))

(define (getEncry socialnetwork)
  (car (cdr (cdr socialnetwork))))

(define (getDecry socialnetwork)
  (car (cdr (cdr (cdr socialnetwork)))))

(define (getSeccionActiva socialnetwork)
  (car (cdr (cdr (cdr (cdr socialnetwork))))))

(define (getUsuarios socialnetwork)
  (car (cdr (cdr (cdr (cdr (cdr socialnetwork)))))))

(define (getPublicacion socialnetwork)
  (car (cdr (cdr (cdr (cdr (cdr (cdr socialnetwork))))))))

(define (getUltimoID listaU)
  (+ (length listaU) 1 ))

;-------------------------------------------------------------------------

;---------------------------- MODIFICADORES --------------------------

(define (AgregarUsuario nombre contra listaUsuario idU)
  (if (null? listaUsuario)
      (cons (usuario 0 idU nombre contra (list) (list)) null)
      (cons  (car listaUsuario) (AgregarUsuario nombre contra (cdr listaUsuario) idU))))

(define (AgregarPost ID Autor Fecha Tipo Contenido ListaPublicacion ListaUserPost)
  (if (null? ListaPublicacion)
      (if (null? ListaUserPost)
          (cons (list ID Autor Fecha Tipo Contenido (list) (list) (list) 0 (list (car Autor)))null)
          (cons (list ID Autor Fecha Tipo Contenido (list) (list) (list) 0  ListaUserPost)null))
      (cons (car ListaPublicacion) (AgregarPost ID Autor Fecha Tipo Contenido (cdr ListaPublicacion) ListaUserPost))))

;---------------------------------------------------------------------

;Retorna la lista de usuario modificada

(define (addSeguidor ListaUsuario username seguido)
  (if (null? ListaUsuario) null
      (if(eqv? (getNombreU (car ListaUsuario)) seguido)
         (cons(list (getidU (car ListaUsuario))
                    (getNombreU (car ListaUsuario))
                    (getContra (car ListaUsuario))
                    (getAmigos (car ListaUsuario))
                    (AñadirS (getSeguidores (car ListaUsuario)) username seguido))
              (addSeguidor (cdr ListaUsuario) username seguido))
         (cons (car ListaUsuario)(addSeguidor (cdr ListaUsuario) username seguido)))))


(define (AñadirS ListaSeguidores username seguido)
    (if (null? ListaSeguidores)
      (cons username null)
      (cons (car ListaSeguidores) (AñadirS (cdr ListaSeguidores) username seguido))))


