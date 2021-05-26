#lang racket

(provide (all-defined-out))
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")

;**************************** TDA (Usuario) ****************************


;---------------------------- CONSTRUCTOR ----------------------------

(define (usuario idU nombre contra listaP listaS)
  (list idU nombre contra listaP listaS))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------


(define (getidU usuario)
  (car usuario))

(define (getNombreU usuario)
  (car (cdr usuario)))

(define (getContra usuario)
  (car (cdr (cdr usuario))))

(define (getP usuario)
  (car (cdr (cdr (cdr usuario)))))

(define (getSeguidores usuario)
  (car (cdr (cdr (cdr (cdr usuario))))))


;------------------------- MODIFICADOR --------------------------------


(define (addUsuario listaUsuarios username password)
  (cond((null? listaUsuarios)
         null)
       ((and (equal? (getNombreU (car listaUsuarios))username) (equal? (getContra (car listaUsuarios)) password))
         (car listaUsuarios))
       (else (addUsuario (cdr listaUsuarios) username password ))))

(define (addPublicacion ListaUsuario user Publicacion)
  (if (null? ListaUsuario)
      null
      (if (eqv? (getNombreU (car ListaUsuario)) user)
          (cons (list
                 (getidU (car ListaUsuario))
                 (getNombreU (car ListaUsuario))
                 (getContra (car ListaUsuario))
                 (addP (getP (car ListaUsuario))Publicacion)
                 (getSeguidores (car ListaUsuario))) (addPublicacion (cdr ListaUsuario) user Publicacion))
          (cons (car ListaUsuario) (addPublicacion (cdr ListaUsuario) user Publicacion)))))

;---------------------------- PERTENENCIA ----------------------------

(define (existeUsuario? listaUsuarios nombre)
  (if(null? listaUsuarios)
         #f
        (if (eqv? (getNombreU (car listaUsuarios)) nombre)
         #t
        (existeUsuario? (cdr listaUsuarios) nombre))))

;---------------------------------------------------------------------

;Comprueba si user esta dentro de los seguidodes de seguidor

(define (findUser ListaUsuario user seguidor )
  (if (null? ListaUsuario)
      #f
      (if (eqv? (getNombreU (car ListaUsuario))seguidor)
          (findSeguidor (getSeguidores (car ListaUsuario)) user)
          (findUser (cdr ListaUsuario) user seguidor))))

; Existe usuario en lista seguidos
(define(findSeguidor ListaSeguidores usuario)
  (if (null? ListaSeguidores)
      #f
      (if (eqv? (car ListaSeguidores) usuario)
          #t
          (findSeguidor (cdr ListaSeguidores) usuario))))

;Pasa solamente 1 parametro de usuario

(define (segregacion ListaUsuario user listSeguidores Publicacion)
  (if (null? listSeguidores)
      ListaUsuario
      (if (findUser ListaUsuario user (car listSeguidores))
          (segregacion (addPublicacion ListaUsuario (car listSeguidores) Publicacion) user (cdr listSeguidores) Publicacion)
          (segregacion ListaUsuario user (cdr listSeguidores) Publicacion))))


(define (seguidores) (list "juan" "carla" "fran"))

(define (Usuario1)(usuario 4 "Manuel" "banana2" (list) (seguidores)))