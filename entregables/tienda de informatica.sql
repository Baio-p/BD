/*
https://www.db-fiddle.com/f/pMAmiRwivBrhERRbVePftE/0
*/
/* 
Base de Datos
Practica 6.- Creacion de una Base de Datos
Benjamin Angulo Correa
6016RN066
05-10-2022 
*/


/* Eliminamos la base de datos si existe para poder ejecutar todo el script desde el principio con los cambios aplicados */
DROP DATABASE IF EXISTS Tienda_de_informatica;
/*creamos la base de datos*/
CREATE DATABASE Tienda_de_informatica; 
/*seleccionamos cual base de datos vamos a usar para modificarla o consultarla*/
USE Tienda_de_informatica; 
/*empezamos a crear tablas definiendo su nombre y los de nombres de las columnas con sus restricciones */
CREATE TABLE fabricantes (
codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL UNIQUE);
CREATE TABLE Productos (
codigo INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL UNIQUE,
precio DOUBLE NOT NULL UNIQUE,
fabricantes_codigo INT NOT NULL,
CONSTRAINT fk_Productos_fabricantes_codigo FOREIGN KEY (fabricantes_codigo) REFERENCES fabricantes (codigo));
/*especificamos cual columna tendra la condicion, despues cual condicion, que dato sera y por ultimo de donde se refiere ese dato */
DESCRIBE Productos; /*mostramos la tabla con sus especificaciones */
DESCRIBE fabricantes;
/*despues de crear las tablas con sus especificaciones y relaciones, ya podemos empezar a insertar los datos */
/* especificamos la tabla y listamos los datos segun el orden de las columnas que tenga la tabla*/
INSERT INTO fabricantes
VALUES (NULL,"Asus");
/* tambien podemos insertar datos en desorden pero especificando cual es cada dato antes de definir los valores */
INSERT INTO fabricantes (nombre,codigo)
 VALUES ("Lenovo",null);
/* si se modifica alguna tabla o dato que ya se haya creado podrian aparecer errores */
/*podemos hacer consultas periodicas para revisar los datos*/
SELECT *
FROM Productos;
SELECT nombre
FROM fabricantes;
INSERT INTO fabricantes 
VALUES (NULL,"Hewlett-Packard");
INSERT INTO fabricantes 
VALUES (NULL,"Samsung");
INSERT INTO fabricantes 
VALUES (NULL,"Seagate");
INSERT INTO fabricantes 
VALUES (NULL,"Crucial");
INSERT INTO fabricantes 
VALUES (NULL,"Gigabyte");
INSERT INTO fabricantes 
VALUES (NULL,"Huawei");
INSERT INTO fabricantes 
VALUES (NULL,"Xiaomi");
INSERT INTO Productos
VALUES (NULL,"Disco duro SATA3 1TB",86.99,"5");
INSERT INTO Productos
VALUES (NULL,"Memoria RAM DDR4 8GB",120,6);
INSERT INTO Productos
VALUES (NULL,"Disco SSD 1TB",150.99,"4");
INSERT INTO Productos
VALUES (NULL,"GeForce GTX 105Ti",185,"7");
INSERT INTO Productos
VALUES (NULL,"GeForce GTX 1080 Xtreme",755,"6");
INSERT INTO Productos
VALUES (NULL,"Monitor 24 LED Full HD",202,1);
INSERT INTO Productos
VALUES (NULL,"Monitor 27 LED Full HD",245.99,1);
INSERT INTO Productos
VALUES (NULL,"Portatil Yoga 520",559,2);
INSERT INTO Productos
VALUES (NULL,"Portatil Ideapd 320",444,2);
INSERT INTO Productos
VALUES (NULL,"impresora HP Deskjet 3720",59.99,3);
INSERT INTO Productos
VALUES (NULL,"impresora HP Laserjet Pro M26nw",180,3);