DESCRIBE dept;
SELECT *
FROM dept;
SELECT loc, dname
FROM dept;
SELECT *
FROM dept
WHERE deptno<30;
SELECT loc, dname
FROM dept
WHERE deptno <30;
SELECT *
FROM emp;
SELECT ename, hiredate, sal 
FROM emp;
SELECT *
FROM salgrade
WHERE losal > 1400
AND hisal < 4000;
SELECT ename, sal, sal+300
FROM emp;
SELECT ename, sal, 12*sal+100
FROM emp;
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
SELECT ename, 12*sal+comm
FROM emp
WHERE ename='KING';
SELECT ename AS nombre, sal salario
FROM emp;
SELECT ename AS nombre, sal popo
FROM emp;
SELECT ename AS nombre, 12*sal AS "Salario Anual"
FROM emp;
SELECT CONCAT(ename,' ',job) AS empleado
FROM emp;
SELECT CONCAT(ename,' is a ',job) AS "Detalles de Empleo"
FROM emp;
SELECT DISTINCT deptno
FROM emp;
SELECT DISTINCT deptno, job
FROM emp;
SELECT ename,job,deptno
FROM emp
WHERE job = 'CLERK';
SELECT ename, sal, comm
FROM emp
WHERE sal <= comm;
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 1500;
select empno, ename,sal, mgr
from emp
where mgr IN(7902,7566,7788);
SELECT empno,ename,mgr,deptno
FROM emp
WHERE ename IN('FORD','ALLEN');
SELECT ename
FROM emp
WHERE ename LIKE 'S%';
SELECT ename, hiredate
FROM emp
WHERE hiredate LIKE '2011%';
SELECT ename
FROM emp
WHERE ename LIKE '_A%';