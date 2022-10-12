/*
dept_registro_AI
Cuando se realice un registro, que guarde en una tabla reg_dept_insert la fecha, usuario y el nuevo registro
*/

create table reg_dept_i(
fecha datetime,
usuario varchar (50),
deptno numeric (2),
dname varchar (12),
loc varchar (11));

create trigger dept_registro_AI after insert on dept
for each row
insert into reg_dept_i
values (
current_timestamp(),
current_user(),
new.deptno,
new.dname,
new.loc);


create table reg_dept_u(
fecha datetime,
usuario varchar (50),
deptno numeric (2),
dname varchar (12),
loc varchar (11),
deptno_old numeric (2),
dname_old varchar (12),
loc_old varchar (11));

create trigger dept_registro_BU before update on dept
for each row
insert into reg_dept_u
values (
current_timestamp(),
current_user(),
new.deptno,
new.dname,
new.loc,
old.dname,
old.deptno,
old.loc);

select * from reg_dept_u;
select * from reg_dept_i;




