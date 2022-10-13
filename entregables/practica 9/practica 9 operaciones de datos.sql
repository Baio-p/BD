
select * from productos;
select * from fabricantes;

/*
1
Lista los nombres y los precios de todos los productos de la tabla producto.
*/
select nombre, precio from productos;

/*
2
Lista todas las columnas de la tabla producto
*/
select * from productos;

/*
3
Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
*/
select productos.nombre as nombre_producto, productos.precio as precio, fabricantes.nombre as nombre_fabricante
from fabricantes right join productos
on fabricantes.codigo = productos.fabricantes_codigo
group by productos.nombre;

/*
4
Devuelve todos los productos del fabricante Lenovo.
*/
select productos.nombre
from productos 
where fabricantes_codigo = (select fabricantes.codigo from fabricantes where fabricantes.nombre = "Lenovo");

/*
5
Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo.
*/
INSERT INTO Productos
VALUES (NULL,"SOLO PARA LA CONSULTA",559,"4");
select * 
from productos 
where precio = (
	select max(precio) from productos where fabricantes_codigo = (
		select fabricantes.codigo from fabricantes where fabricantes.nombre = "Lenovo"));

/*
6
Lista el nombre del producto más caro del fabricante Lenovo
*/
select productos.nombre
from productos 
where precio = (
	select max(precio) from productos where fabricantes_codigo = (
		select fabricantes.codigo from fabricantes where fabricantes.nombre = "Lenovo"));
        
        select * from productos;
        select * from fabricantes;