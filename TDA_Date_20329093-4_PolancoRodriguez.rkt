#lang racket
(provide (all-defined-out))

;**************************** TDA (Date) ****************************

;--------------------------------------------------------
;REPRESENTACION: TDA Date
;listaDate: '(Dia Mes Año)
;--------------------------------------------------------

;---------------------------- CONSTRUCTOR ----------------------------
;CONSTRUCTOR: Contruye la fecha
;Descripcion: Construye la fecha
;Dominio: Dia = dia , Mes = mes, Anio = año
;Recorrido: list
;Recursion:-
(define (Date dia mes anio)
  (list dia mes anio))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------

;SELECTOR: Selecciona el dia de la fecha
;Descripcion:Selecciona el dia de la fecha
;Dominio: lista TDA Date
;Recorrido: list
;Recursion:-
(define (getDia Date)
  (car Date))

;SELECTOR: Selecciona el mes de la fecha
;Descripcion:Selecciona el mes de la fecha
;Dominio: lista TDA Date
;Recorrido: list
;Recursion:-
(define (getMes Date)
  (car(cdr Date)))

;SELECTOR: Selecciona el año de la fecha
;Descripcion:Selecciona el año de la fecha
;Dominio: lista TDA Date
;Recorrido: list
;Recursion:-
(define (getAnio Date)
  (car (cdr (cdr Date))))


;------------------------------- EJEMPLOS ---------------------------------

(define (date1) (Date 8 11 1999))