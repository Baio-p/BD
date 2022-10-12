-- 1 
SELECT count(*) FROM emp;
-- 2
SELECT dept.dname , count(emp.ename) 
FROM dept left join emp 
on dept.deptno = emp.deptno 
group by dept.deptno;
-- 3
SELECT dept.dname as departamento, min(sal) as salario_minimo, max(sal) as salario_max, avg(sal) as promedio
FROM emp right join dept
ON dept.deptno = emp.deptno
GROUP BY emp.deptno;

-- 4
SELECT job as Cargo, min(sal) as salario_min, max(sal) as salario_max,count(empno), avg(sal)
FROM emp
GROUP BY job
HAVING avg(sal) < 1100;

-- 5
SELECT ename , sal
FROM emp;

-- 6
SELECT * FROM emp;

/* 7
Muestra una lista con el nombre del empleado, salario y nombre del departamento al que pertenece.
*/

SELECT emp.ename as nombre, emp.sal as salario, dept.dname as departamento
FROM emp join dept
ON emp.deptno = dept.deptno;

/* 8
Listar todos los empleados que tienen el cargo “ANALYST”.
*/
SELECT * FROM emp WHERE job = 'ANALYST';

/* 9
Devuelve todos los empleados del departamento “SALES” 
*/
SELECT *
FROM emp join dept
ON emp.deptno = dept.deptno
WHERE dept.dname = 'SALES'; 

SELECT *
FROM emp 
WHERE deptno = (SELECT deptno FROM dept  WHERE dname = 'SALES'); 

/* 10
Muestra quién gana más en el departamento “ACCOUNTING”.
*/

SELECT ename, sal
FROM emp
WHERE sal = (
	SELECT max(sal) FROM emp WHERE deptno = (
		SELECT deptno FROM dept WHERE dname = 'ACCOUNTING')
        );