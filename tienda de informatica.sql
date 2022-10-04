drop schema if exists Tienda_de_informatica;
CREATE DATABASE Tienda_de_informatica; /*crear la base de datos*/
use Tienda_de_informatica; /*se usa la base de datos para modificarla o consultarla*/
/*empezamos a crear tablas definiendo su nombre y los de nombres de las columnas con sus restricciones */
create table fabricantes (
codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL UNIQUE);
CREATE TABLE Productos (
codigo INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
nombre VARCHAR (100) NOT NULL UNIQUE,
precio DOUBLE NOT NULL UNIQUE,
fabricantes_codigo INT NOT NULL,
CONSTRAINT Productos_fabricantes_codigo_fabricantes_codigo_fk FOREIGN KEY (fabricantes_codigo) REFERENCES Productos (codigo));
/*la restriccion con constraint se usa en este caso para relacionar las llaves foraneas */
DESCRIBE Productos; /*mostramos la tabla con sus especificaciones */
DESCRIBE fabricantes;
/*despues de crear las tablas con sus especificaciones, relaciones y restricciones, ya podemos empezar a insertar los datos */
INSERT INTO fabricantes
VALUES (NULL,"Asus");
INSERT INTO fabricantes(nombre,codigo) VALUES ("Lenovo",null);
/* si se modifica algun dato de cualquier tabla despues de crearla, debemos hacer un drop de la tabla y volverla a crear para que no nos mande algun tipo de error*/
SELECT *
FROM fabricantes;

