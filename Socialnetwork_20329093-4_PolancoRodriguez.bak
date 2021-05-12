#lang racket
(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")

;************************  TDA SocialNetwok **********************

; Funcion de encriptacion

(define encryptFn (lambda (s)
                    (list->string
                     (reverse (string->list s)))))


;---------------------------- CONSTRUCTOR ----------------------------

(define (socialnetwork NombreR Date encryptFunction decryptFunction)
  (list NombreR Date encryptFunction decryptFunction (list) (list)))

;---------------------------------------------------------------------

;------------------------------ SELECTORES ---------------------------

(define (getNombre socialnetwork)
  (list-ref 0))

(define (getDate socialnetwork)
  (list-ref 1))

(define (getEncry socialnetwork)
  (list-ref 2))

(define (getDecry socialnetwork)
  (list-ref 3))

(define (getUsuario socialnetwork)
  (list-ref 3))

(define (getPublicacion socialnetwork)
  (list-ref 4))

;-------------------------------------------------------------------------

;------------------------------- EJEMPLOS --------------------------------

(define fecha (list 25 10 2021))

;(socialnetwork "FB" fecha encryptFn encryptFn)

