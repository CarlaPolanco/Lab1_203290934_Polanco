#lang racket
(provide (all-defined-out))

;**************************** TDA (Date) ****************************


;---------------------------- CONSTRUCTOR ----------------------------

(define (Date dia mes anio)
  (list dia mes anio))

;---------------------------------------------------------------------

;---------------------------- SELECTORES -----------------------------

(define (getDia Date)
  (car Date))

(define (getMes Date)
  (car(cdr Date)))

(define (getAnio Date)
  (car (cdr (cdr Date))))


;---------------------------------------------------------------------

(define (date1) (Date 8 "noviembre" 1999))