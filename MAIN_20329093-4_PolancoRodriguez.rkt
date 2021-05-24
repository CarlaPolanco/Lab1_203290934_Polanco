#lang racket

(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")
(require "Socialnetwork_20329093-4_PolancoRodriguez.rkt")

;REGISTER

(define(register socialnetwork date username password)
  (if (null? (getUsuarios socialnetwork))
      (list (getNombre socialnetwork)(getDate socialnetwork)(getEncry socialnetwork)(getDecry socialnetwork)
            (getSeccionActiva socialnetwork)(cons (usuario 0 1 username password (list) (list))
                                                  (getUsuarios socialnetwork))(getPublicacion socialnetwork))
      (list (getNombre socialnetwork)(getDate socialnetwork)(getEncry socialnetwork)(getDecry socialnetwork)
            (getSeccionActiva socialnetwork)(AgregarUsuario username password (getUsuarios socialnetwork)
                                                            (getUltimoID(getUsuarios socialnetwork)))
            (getPublicacion socialnetwork))))

;LOGIN

(define (login socialnetwork user pass operacion)
  (if (existeUsuario? (getUsuarios socialnetwork) user)
      (if (or (equal? operacion post) (equal? operacion follow) (equal? operacion share) (equal? operacion socialnetwork->string))
          (operacion (list (getNombre socialnetwork)
                           (getDate socialnetwork)
                           (getEncry socialnetwork)
                           (getDecry socialnetwork)
                           (AgregarUsuarioA username password (getSeccionActiva socialnetwork))
                           (getUsuarios socialnetwork) 
                           (getPublicacion socialnetwork)))
          socialnetwork)
      (operacion socialnetwork)))

; FALTA LIMPIAR USUARIO ACTIVO
;POST

;(define post (lambda (socialnetwork)
;              (lambda ())))






;------------------------------- EJEMPLOS --------------------------------

(define fecha (list 25 10 2021))

(define fb (socialnetwork "FB" fecha encryptFn encryptFn ))

(define emptyFB (socialnetwork "fb" fecha encryptFn encryptFn))

(define emptyTwitter (socialnetwork "twitter" fecha encryptFn encryptFn))

(define emptyInstagram (socialnetwork "instagram" fecha encryptFn encryptFn))

(define listaUsuarios (list (usuario 0 4 "marcos" "banana2"  (amigos) (seguidores)) (usuario 0 4 "pia" "banana2" (amigos) (seguidores)) (usuario 0 4 "marcos" "banana2"  (amigos) (seguidores))))

;REGISTROS

;(define fb (register (register (register emptyFB fecha “user1” “pass1”) fecha “user2” “pass2”) fecha "user3" "pass3"))



