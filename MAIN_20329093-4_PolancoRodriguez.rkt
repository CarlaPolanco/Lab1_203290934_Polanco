#lang racket

(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")
(require "Socialnetwork_20329093-4_PolancoRodriguez.rkt")
(require "TDA_UsuarioActivo_20329093-4_PolancoRodriguez.rkt")

;REGISTER

(define(register socialnetwork date username password)
  (if (null? (getUsuarios socialnetwork))
      (list (getNombre socialnetwork)
            (getDate socialnetwork)
            (getEncry socialnetwork)
            (getDecry socialnetwork)
            (getSeccionActiva socialnetwork)
            (cons (usuario 1 username password (list) (list))
                                                  (getUsuarios socialnetwork))(getPublicacion socialnetwork))
      (list (getNombre socialnetwork)
            (getDate socialnetwork)
            (getEncry socialnetwork)
            (getDecry socialnetwork)
            (getSeccionActiva socialnetwork)
            (AgregarUsuario username password (getUsuarios socialnetwork)
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
                           (AgregarUsuarioActivo user pass)
                           (getUsuarios socialnetwork) 
                           (getPublicacion socialnetwork)))
          socialnetwork)
      (operacion socialnetwork)))


;POST

(define post (lambda (socialnetwork)
              (lambda (date)
                (lambda (tipo resp . usuarios)
      (list (getNombre socialnetwork)
            (getDate socialnetwork)
            (getEncry socialnetwork)
            (getDecry socialnetwork)
            (list)
            (getUsuarios socialnetwork)
            (AgregarPost (getUltimoID (getPublicacion socialnetwork))
                   (getusernameUA (getSeccionActiva socialnetwork))
                   date
                   tipo
                   resp
                   (getPublicacion socialnetwork)
                   usuarios)))))) 

; FOLLOW

(define follow (lambda (socialnetwork)
                 (lambda (date)
                   (lambda (user)
                    (list (getNombre socialnetwork)
                          (getDate socialnetwork)
                          (getEncry socialnetwork)
                          (getDecry socialnetwork)
                          (list)
                          (addSeguidor (getUsuarios socialnetwork)(car(getSeccionActiva socialnetwork)) user)
                          (getPublicacion socialnetwork))))))

; SHARE

(define share (lambda (socialnetwork)
                (lambda (date)
                  (lambda (ID . user)
                    (if (null? user)
                        (list (getNombre socialnetwork)
                          (getDate socialnetwork)
                          (getEncry socialnetwork)
                          (getDecry socialnetwork)
                          (list)
                          (addSeguidor (getUsuarios socialnetwork)(car(getSeccionActiva socialnetwork)) user) 
                          (addPublicacion (getUsuarios socialnetwork)
                                          (getusernameUA (getSeccionActiva socialnetwork))
                                          (findP ID (getPublicacion socialnetwork))))
                        (list (getNombre socialnetwork)
                          (getDate socialnetwork)
                          (getEncry socialnetwork)
                          (getDecry socialnetwork)
                          (list)
                          (addSeguidor (getUsuarios socialnetwork)(car(getSeccionActiva socialnetwork)) user) 
                          (segregacion (getUsuarios socialnetwork)
                                     (getusernameUA (getSeccionActiva socialnetwork)) user
                                     (findP ID (getPublicacion socialnetwork)))))))))
                        

;SOCIALNETWORK->STRING

(define (socialnetwork->string socialnetwork) 5)




;------------------------------- EJEMPLOS --------------------------------

(define fecha (list 25 10 2021))

;(define fb (socialnetwork "FB" fecha encryptFn encryptFn ))

(define emptyFB (socialnetwork "fb" fecha encryptFn encryptFn))

(define emptyTwitter (socialnetwork "twitter" fecha encryptFn encryptFn))

(define emptyInstagram (socialnetwork "instagram" fecha encryptFn encryptFn))

(define listaUsuarios (list (usuario  4 "marcos" "banana2"  (list) (seguidores)) (usuario  4 "pia" "banana2" (list) (seguidores)) (usuario  4 "marcos" "banana2"  (list) (seguidores))))


;REGISTROS

(define fb (register (register (register emptyFB fecha "user1" "pass1") fecha "user2" "pass2") fecha "user3" "pass3"))

; LOGIN POST

(define fb1(((login fb "user2" "pass2" post)fecha)"text" "hola como estas"  "user1" "user2"))
(define fb2(((login fb1 "user2" "pass2" post)fecha)"text" "hola como estas"))

;LOGION FOLLOW

(define fb3 (((login fb2 "user1" "pass1" follow) fecha)"user2"))
(define fb4 (((login fb3 "user3" "pass3" follow) fecha)"user2"))

