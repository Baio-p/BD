/*SHOW databases;*/
CREATE DATABASE dept_emp;
USE dept_emp;
/*DROP DATABASE dept_emp;*/
/* primer prueba e creacion de BD con comando para consola */
/* crear tabla */
CREATE TABLE dept(
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11) NOT NULL);
/*DESCRIBE dept;*/
INSERT INTO dept (deptno, dname,loc)
VALUES(10,'ACCOUNTING','NEW_YORK');