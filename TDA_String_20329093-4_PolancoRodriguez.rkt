#lang racket
(provide (all-defined-out))
(require "TDA_Usuario_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Publicacion_20329093-4_PolancoRodriguez.rkt")
(require "Socialnetwork_20329093-4_PolancoRodriguez.rkt")
(require "TDA_UsuarioActivo_20329093-4_PolancoRodriguez.rkt")
(require "TDA_Date_20329093-4_PolancoRodriguez.rkt")


;IMPLEMENTACION DE STRING
;---------------------------------------------------------------------

;STRING PARA NOMBRE

(define (listNombre->string Nombre string)
  (string-append "NOMBRE: " Nombre " " string ))

;STRING PARA FECHA

(define (Fecha->string Lista string)
  (if (null? Lista) string
      (string-append "\nFECHA CREACION: " (number->string (getDia Lista)) " "
                     (number->string (getMes Lista)) " "
                     (number->string (getAnio Lista)) " " string )))


;STRING PARA LISTA DE USUARIO ACTIVO

(define (listUsuarioA->string Usuario ListaPublicaciones decry)
  (string-append "\n" "USUARIOS: \n" "ID: "(number->string (getidU Usuario)) "\n"
                 "NOMBRE: "(getNombreU Usuario) "\n"
                 "CONTRASEÑA: "(getContra Usuario) "\n"
                 "PUBLICACIONES COMPARTIDAS: "(listPublicacion->string (getP Usuario) " " decry) "\n"
                 "SEGUIDORES: "(listSeguidores->string (getSeguidores Usuario) " ") "\n"
                 "PUBLICACIONES: " (tusPublicaciones->string ListaPublicaciones (getNombreU Usuario) " " decry) "\n"))

;---------------------------------------------------------------------
;STRING PARA LISTA DE USUARIOS

  (define (listUsuario->string Lista ListaPublicaciones string decry)
    (if (null? Lista) string
        (listUsuario->string (cdr Lista) ListaPublicaciones
                             (string-append "\n" "USUARIOS: \n" "ID: "(number->string (getidU (car Lista))) "\n"
                                            "NOMBRE: "(getNombreU (car Lista)) "\n"
                                            "CONTRASEÑA: "(getContra (car Lista)) "\n"
                                            "PUBLICACIONES COMPARTIDAS: "(listPublicacion->string (getP (car Lista)) " " decry) "\n"
                                            "SEGUIDORES: "(listSeguidores->string (getSeguidores (car Lista)) " ") "\n"
                                            "PUBLICACIONES: " (tusPublicaciones->string ListaPublicaciones (getNombreU (car Lista)) " " decry ) "\n" string )decry)))

;---------------------------------------------------------------------
;STRING PARA PUBLICACIONES

(define (listPublicacion->string Lista string decry)
  (if (null? Lista) string
      (listPublicacion->string (cdr Lista) (string-append "\n" "PUBLICACION: " "\n" "     ID: "(number->string(getIDPublicacion(car Lista)))"\n"
                                                      "     NOMBRE AUTOR: "(getAutor (car Lista)) "\n"
                                                      "     DIA: "(number->string (getDia(getFecha (car Lista))))"\n"
                                                      "     MES: "(number->string(getMes(getFecha (car Lista)))) " \n"
                                                      "     AÑO: "(number->string(getAnio(getFecha (car Lista))))"\n"
                                                      "     TIPO: "(getTipo (car Lista)) " \n"
                                                      "     CONTENIDO: "(decry(getContenido (car Lista))) "\n"
                                                      "     VECES COMPARTIDA: "(number->string(getVCompartidas (car Lista))) "\n"
                                                      "     A QUIEN VA DIRIGIDA: "(listDirigida->string (getDirigido (car Lista)) "\n") " " string ) decry)))

;---------------------------------------------------------------------
;STRING PARA TUSPUBLICACIONES

(define (tusPublicaciones->string ListaP usuario string decry)
  (if (null? ListaP) string
      (if (ExisteU (getDirigido(car ListaP))usuario)
          (tusPublicaciones->string (cdr ListaP) usuario (string-append string "\n" "          AUTOR: " (getAutor (car ListaP)) "\n"
                                                                    "          CONTENIDO: " (decry(getContenido(car ListaP))) "\n") decry)
          (tusPublicaciones->string (cdr ListaP) usuario string decry))))

;---------------------------------------------------------------------
;STRING PARA SEGUIDORES

(define (listSeguidores->string Lista string)
  (if (null? Lista) string
      (listSeguidores->string (cdr Lista) (string-append "\n" "SEGUIDOR: "
                                                      (car Lista) " " string ))))

;---------------------------------------------------------------------
;STRING PARA DIRIGIDAS

(define (listDirigida->string Lista string)
  (if (null? Lista) string
      (listDirigida->string (cdr Lista) (string-append "\n" "          DIRIGIDO: "
                                                      (car Lista) " " string ))))
;---------------------------------------------------------------------

;OTRAS FUNCIONES: Funcion booleana
;Descripcion: Comprueba si existe el usuario
;Dominio: listaU = lista de usuarios, usuarios = nombre del usuario a buscar
;Recorrido: booleano
;Recursion: Natural

(define (ExisteU ListaU usuario)
  (if (null? ListaU)
      #f
      (if (equal? (car ListaU) usuario)
          #t
          (ExisteU (cdr ListaU) usuario))))
