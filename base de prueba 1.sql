/*SHOW databases;*/
/*las bases de datos se crean con por lo menos 2 tipos de datos para relacionaros entre si */
CREATE DATABASE dept_emp;
USE dept_emp;
/*DROP DATABASE dept_emp;*/
/* primer prueba e creacion de BD con comando para consola */
/* crear tabla */
CREATE TABLE dept(
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11) NOT NULL);
DESCRIBE dept;
/*dept es el nombre de la tabla y despues describimos cada una de las columnas 
asignando un nombre al dato, dominio, su tamaño y su atributo para la insercion en las filas */
INSERT INTO dept (deptno, dname,loc)
VALUES(10,'ACCOUNTING','NEW_YORK');
INSERT INTO dept(deptno, dname,loc) 
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept(deptno, dname,loc) 
VALUES(30,'SALES','CHICAGO');
INSERT INTO dept(dname,deptno,loc) 
VALUES('OPERATIONS',40,'BOSTON');
SELECT *
FROM dept;
/* select se usa para hacer consultas por columnas */
/* el asteristo con select selecciona todas las columnas en una tabla */
/* from es el nombre de la tabla donde buscaremos el o los datos */
SELECT loc, dname
FROM dept;
SELECT *
FROM dept
WHERE deptno<30;
/* con where agregamos una condicion para realizar la consulta */
SELECT loc, dname
FROM dept
WHERE deptno <30;
CREATE TABLE emp(
empno NUMERIC(4) PRIMARY KEY,
ename VARCHAR(11) NOT NULL,
job VARCHAR(13) NOT NULL,
mgr NUMERIC(4),
hiredate DATE NOT NULL,
sal NUMERIC(7,2) NOT NULL,
comm NUMERIC(7,2),
deptno NUMERIC(2),
-- Restricción en emp_deptno_dept_deptno_fk llave foranea de la tabla dept
CONSTRAINT emp_deptno_dept_deptno_fk FOREIGN KEY (deptno) REFERENCES dept (deptno),
-- Restrcción en emp_mgr_fk llave forania de la tabla emp
CONSTRAINT emp_mgr_fk FOREIGN KEY (mgr) REFERENCES emp (empno));
/*se crea una nueva tabla pero con las restriciones y especificaciones con CONSTRAINT. Primero definimios de que tabla y de cual columna (T_C_) tomamos el dato, despues definimos a que tabla y 
cual columna pondremos el dato foraneo seguido de la primer especificacion (T_C). Completo seria: "T_C_T_C".FOREIGN KEY lo define como dato foraneo en la tabla y REFERENCES nos dice de donde se esta tomando el datoforaneo*/
INSERT INTO emp
VALUES(7839, 'KING', 'PRESIDENT', NULL, '2011-11-17', 5000, NULL, 10);
INSERT INTO emp
VALUES(7698, 'BLAKE','MANAGER',7839,'2011-05-01',2850,NULL,30);
INSERT INTO emp
VALUES(7782,'CLARK','MANAGER',7839,'2011-06-09',2450,NULL,10);
INSERT INTO emp
VALUES(7566,'JONES','MANAGER', 7839, '2011-04-02',2975,NULL,20);
INSERT INTO emp
VALUES(7654,'MARTIN','SALESMAN',7698, '2011-09-28',1250,1400,30);
INSERT INTO emp
VALUES(7499,'ALLEN', 'SALESMAN',7698, '2011-02-20',1600,300, 30);
INSERT INTO emp
VALUES(7844,'TURNER','SALESMAN',7698, '2011-09-08',1500,0, 30);
INSERT INTO emp
VALUES(7900,'JAMES', 'CLERK',7698, '2011-12-03',950,NULL,30);
INSERT INTO emp
VALUES(7521,'WARD','SALESMAN',7698, '2011-02-22',1250,500, 30);
INSERT INTO emp
VALUES(7902,'FORD','ANALYST', 7566, '2011-12-03',3000,NULL,20);
INSERT INTO emp
VALUES(7369,'SMITH', 'CLERK',7902, '2010-12-17',800,NULL, 20);
INSERT INTO emp
VALUES(7788,'SCOTT', 'ANALYST', 7566, '2012-12-09',3000,NULL,20);
INSERT INTO emp
VALUES(7876,'ADAMS', 'CLERK', 7788, '2012-01-12',1100,NULL,20);
INSERT INTO emp
VALUES(7934,'MILLER','CLERK',7782, '2012-01-23',1300,NULL,10);
SELECT *
FROM emp;
SELECT ename, hiredate, sal 
FROM emp;
CREATE TABLE salgrade(
    grade NUMERIC(1) PRIMARY KEY,
    losal NUMERIC(6,2) NOT NULL,
    hisal NUMERIC(6,2) NOT NULL
    );
INSERT INTO salgrade
VALUES(1,700,1200);
INSERT INTO salgrade
VALUES(2,1201,1400);
INSERT INTO salgrade
VALUES(3,1401,2000);
INSERT INTO salgrade
VALUES(4,2001,3000);
INSERT INTO salgrade
VALUES(5,3001,9999);
SELECT *
FROM salgrade
WHERE losal > 1400
AND hisal < 4000;
/* consulta por rango de dos atributos*/
SELECT ename, sal, sal+300
FROM emp;
/*select desde una cantidad o dato inicial */
SELECT ename, sal, 12*sal+100
FROM emp;
/*para convertir un valor en otro con una operacion primero se busca el valor y despues
se hace una operacion con el valor buscado como variable*/
SELECT ename, sal, 100+sal*12
FROM emp;
SELECT ename, sal, 12*(sal+100)
FROM emp;
SELECT ename, sal, 1.20*sal
FROM emp;
SELECT ename, job, sal, comm
FROM emp;
SELECT ename, sal, 12*(sal+100)
FROM emp
WHERE ename='KING';
/*condicionando con where alguan seleccion*/
SELECT ename, 12*sal+comm
FROM emp
WHERE ename='KING';
/*se pueden usar los atributos como variables para operaciones sin son numeros*/
SELECT ename AS nombre, sal salario
FROM emp;
SELECT ename AS nombre, sal popo
FROM emp;
/* se usa select para tomar un dato y AS para mostrarlo como otra columna*/
SELECT ename AS nombre, 12*sal AS "Salario Anual"
FROM emp;
/* para convertir mas de una columna se separan con comas y tambien se pueden incluir operaciones*/
SELECT CONCAT(ename,' ',job) AS empleado
FROM emp;
SELECT CONCAT(ename,' is a ',job) AS "Detalles de Empleo"
FROM emp;
SELECT DISTINCT deptno
FROM emp;
/* distinct muestra los datos en una columna sin repetirse*/
SELECT DISTINCT deptno, job
FROM emp;
SELECT ename,job,deptno
FROM emp
WHERE job = 'CLERK';
SELECT ename, sal, comm
FROM emp
WHERE sal <= comm;
/*where se puede condicionar con expresiones logicas*/
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 1500;
select empno, ename,sal, mgr
from emp
where mgr IN(7902,7566,7788);
/*where condiciona una columna con un rango o dato especifico*/
SELECT empno,ename,mgr,deptno
FROM emp
WHERE ename IN('FORD','ALLEN');
SELECT ename
FROM emp
WHERE ename LIKE 'S%';
/* like condiciona caracteres en especifico*/
SELECT ename, hiredate
FROM emp
WHERE hiredate LIKE '2011%';
SELECT ename
FROM emp
WHERE ename LIKE '_A%';
/* el _ antes del caracter significa que ese caracter puede estar en cualquier lugar del
dato*/