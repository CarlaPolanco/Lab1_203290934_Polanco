#lang racket

(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")

;**************************** TDA (Usuario Activo) ****************************

;--------------------------------------------------------
;REPRESENTACION: TDA Usuario Activo
;listaUsuarioActivo: '(Nombre Contraseña)
;--------------------------------------------------------

;---------------------------- CONSTRUCTOR ----------------------------

;Constructor: Crea un usuario activo
;Descripcion: Crea usuario activo
;Dominio: lista TDA usuarioActivo
;Recorrido: list
;Recursion:-
(define (AgregarUsuarioActivo nombre contra)
  (list nombre contra))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------

;SELECTOR: Selecciona el nombre del usuario activo
;Descripcion:Selecciona el nombre del usuario activo
;Dominio: lista TDA usuarioActivo
;Recorrido: list
;Recursion:-
(define (getusernameUA AgregarUsuarioActivo)
  (car AgregarUsuarioActivo))

;SELECTOR: Selecciona la contraseña del usuario activo
;Descripcion:Selecciona la contraseña del usuario activo
;Dominio: lista TDA usuarioActivo
;Recorrido: list
;Recursion:-
(define (getpasswordUA AgregarUsuarioActivo)
  (car (cdr AgregarUsuarioActivo)))

;------------------------------ EJEMPLOS --------------------------------


(define (UsuarioAC)(AgregarUsuarioActivo "Manuel" "banana2"))