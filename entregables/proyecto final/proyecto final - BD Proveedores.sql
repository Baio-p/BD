/*
BASES DE DATOS
PROYECTO FINAL
BENJAMIN ANGULO CORREA
6016RN066
18-10-2022
*/
/*
eliminamos la base de datos si existe antes de crearla
*/
DROP SCHEMA IF EXISTS proveedores;
/*
creamos la nueva base de datos
*/
CREATE DATABASE proveedores;
/*
indicamos sobre cual base de datos vamos a trabajar
*/
USE proveedores;
/*
empezamos a crear las tablas con las caracteristicas nescesarias
*/
CREATE TABLE proveedores (
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL);
/*
tenemos que crear las tablas en orden para poder llamar a otras tablas las llaves foraneas
*/
CREATE TABLE categoria (
  codigo INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(45) NULL);
/*
definimos en que tabla y cual columna sera la condicion, cual sera la columna donde ira nuestra
llave foranea y de que tabla se refiere el dato foraneo
*/
CREATE TABLE IF NOT EXISTS piezas (
  codigo INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  color VARCHAR(45) NOT NULL,
  precio FLOAT NOT NULL,
  categoria_codigo INT NOT NULL,
  CONSTRAINT fk_piezas_piezas_categoria
    FOREIGN KEY (categoria_codigo)
    REFERENCES Proveedores.categoria (codigo));
/* 
cuando la relacion es N:M, se crea una tabla adicional para llevar el control de esos datos
*/
CREATE TABLE suministros (
  fecha DATE PRIMARY KEY NOT NULL,
  proveedores_codigo INT NOT NULL,
  piezas_codigo INT NOT NULL,
  cantidad INT NOT NULL,
  CONSTRAINT fk_suministros_proveedores_codigo
    FOREIGN KEY (proveedores_codigo)
    REFERENCES proveedores(codigo),
  CONSTRAINT fk_suministros_piezas_codigo
    FOREIGN KEY (piezas_codigo)
    REFERENCES piezas (codigo));