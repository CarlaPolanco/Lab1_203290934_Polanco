#lang racket

(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")

;**************************** TDA (Usuario Activo) ****************************


;---------------------------- CONSTRUCTOR ----------------------------

(define (usuarioActivo username password)
  (list username password))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------

(define (getusernameUA usuarioActivo)
  (car usuarioActivo))

(define (getpasswordUA usuarioActivo)
  (car (cdr usuarioActivo)))

;---------------------------------------------------------------------

;---------------------------- MODIFICADOR ----------------------------

(define (AgregarUsuarioActivo nombre contra)
  (list nombre contra))
  


;---------------------------------------------------------------------



(define (UsuarioAC)(usuarioActivo "Manuel" "banana2"))