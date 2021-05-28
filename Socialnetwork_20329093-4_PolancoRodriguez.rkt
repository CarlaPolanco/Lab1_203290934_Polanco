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

;--------------------------------------------------------
;REPRESENTACION: TDA Socialnetwork
;listaUsuarioActivo: '(Nombre Date encryptFunction decryptFunction UsuarioActivo Usuarios Publicacion)
;--------------------------------------------------------

;---------------------------- CONSTRUCTOR ----------------------------

;Constructor: Crea una socialnetwork
;Descripcion: Crea socialnetwork
;Dominio: lista TDA socialnetwork
;Recorrido: list socialnetwork
;Recursion:-
(define (socialnetwork NombreR Date encryptFunction decryptFunction)
  (list NombreR Date encryptFunction decryptFunction (list)(list)(list)))

;---------------------------------------------------------------------

;------------------------------ SELECTORES ---------------------------

;SELECTOR: Nombre de la socialnetwork
;Descripcion:Retorna el nombre de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: String
;Recursion:-
(define (getNombre socialnetwork)
  (car socialnetwork))

;SELECTOR: fecha de la socialnetwork
;Descripcion:Retorna el fecha de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getDate socialnetwork)
  (car (cdr socialnetwork)))

;SELECTOR: funcion para encriptar 
;Descripcion:Retorna funcionEncry de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getEncry socialnetwork)
  (car (cdr (cdr socialnetwork))))

;SELECTOR: funcion para Desinncriptar 
;Descripcion:Retorna funcionDecry de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getDecry socialnetwork)
  (car (cdr (cdr (cdr socialnetwork)))))

;SELECTOR: seccionActiva de la socialnetwork
;Descripcion:Retorna la seccion activa de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getSeccionActiva socialnetwork)
  (car (cdr (cdr (cdr (cdr socialnetwork))))))

;SELECTOR: Usuarios de la socialnetwork
;Descripcion:Retorna los usuario de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getUsuarios socialnetwork)
  (car (cdr (cdr (cdr (cdr (cdr socialnetwork)))))))

;SELECTOR: Publicacion de la socialnetwork
;Descripcion:Retorna las Publicaciones de la socialnetwork
;Dominio: lista TDA Socialnetwork
;Recorrido: list
;Recursion:-
(define (getPublicacion socialnetwork)
  (car (cdr (cdr (cdr (cdr (cdr (cdr socialnetwork))))))))

;-------------------------------------------------------------------------

;---------------------------- MODIFICADORES ------------------------------

;Modificador: Asigna el id correcto
;Descripcion:Retorna El id correcto
;Dominio: lista Usuarios
;Recorrido: list
;Recursion:-
(define (getUltimoID listaU)
  (+ (length listaU) 1 ))

;Modificador: Agrega usuario
;Descripcion:Retorna la lista con los usuario
;Dominio: nombre = nombre user,  contra = contraseña , listaUsuario = lista con los usuario, idU = id del usuario
;Recorrido: list
;Recursion: Cola

(define (AgregarUsuario nombre contra listaUsuario idU)
  (if (null? listaUsuario)
      (cons (usuario idU nombre contra (list) (list)) null)
      (cons  (car listaUsuario) (AgregarUsuario nombre contra (cdr listaUsuario) idU))))

;Modificador: Agrega post
;Descripcion:Retorna la lista de post
;Dominio: nombre = listaPublicacion 
;Recorrido: list
;Recursion: Cola

(define (AgregarPost ID Autor Fecha Tipo Contenido ListaPublicacion ListaUserPost)
  (if (null? ListaPublicacion)
      (if (null? ListaUserPost)
          (cons (list ID Autor Fecha Tipo Contenido  0 (list Autor))null)
          (cons (list ID Autor Fecha Tipo Contenido  0  ListaUserPost)null))
      (cons (car ListaPublicacion) (AgregarPost ID Autor Fecha Tipo Contenido (cdr ListaPublicacion) ListaUserPost))))

;---------------------------------------------------------------------

;Retorna la lista de usuario modificada
;Modificador: Añade un seguidor
;Descripcion:Añade un seguidor 
;Dominio: ListaUsuario = lista de usuarios, username = nombre del login  seguido = nombre de que quiero seguir 
;Recorrido: lista de usuario
;Recursion: Cola

(define (addSeguidor ListaUsuario username seguido)
  (if (null? ListaUsuario) null
      (if(eqv? (getNombreU (car ListaUsuario)) seguido)
         (cons(list (getidU (car ListaUsuario))
                    (getNombreU (car ListaUsuario))
                    (getContra (car ListaUsuario))
                    (getP (car ListaUsuario))
                    (AñadirS (getSeguidores (car ListaUsuario)) username seguido))
              (addSeguidor (cdr ListaUsuario) username seguido))
         (cons (car ListaUsuario)(addSeguidor (cdr ListaUsuario) username seguido)))))

;Modificador: Concadena al nuevo seguidor
;Descripcion: Concadena al nuevo seguidor
;Dominio: ListaSeguidores = lista de seguidores, username = nombre, seguido = a quien voy a seguir 
;Recorrido: Lista con los seguidores
;Recursion: Cola

(define (AñadirS ListaSeguidores username seguido)
    (if (null? ListaSeguidores)
      (cons username null)
      (cons (car ListaSeguidores) (AñadirS (cdr ListaSeguidores) username seguido))))

;------------------------------ EJEMPLOS ----------------------------

(define fecha (Date 20 10 1999))
(define emptyFB (socialnetwork "fb" fecha encryptFn encryptFn))

