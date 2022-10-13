DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;
CREATE TABLE alumnos (
id INT PRIMARY KEY UNIQUE,
nombre VARCHAR (50),
apellido_paterno VARCHAR (50),
apellido_materno VARCHAR (50),
nota REAL);
DELIMITER $$
CREATE TRIGGER alumno_check_nota_BI BEFORE INSERT ON Alumnos
FOR EACH ROW
BEGIN
	IF NEW.nota < 0 THEN
		SET NEW.nota = 0;
	END IF;
	IF NEW.nota > 10 THEN
		SET NEW.nota = 10;
	END IF;
END;$$
DELIMITER $$
CREATE TRIGGER alumno_check_nota_BU BEFORE UPDATE ON Alumnos
FOR EACH ROW
BEGIN
	IF NEW.nota < 0 THEN
		SET NEW.nota = 0;
	END IF;
	IF NEW.nota > 10 THEN
		SET NEW.nota = 10;
	END IF;
END;$$
INSERT INTO alumnos
VALUES (12,"Pedro","Perez","Perez",58);
INSERT INTO alumnos
VALUES (26,"Maria","Lozano","Sierra",-5);
SELECT * FROM alumnos;
UPDATE alumnos
SET
nota = 89
WHERE id =26;
UPDATE alumnos
SET
nota = -30
WHERE id =12;
SELECT * FROM alumnos;