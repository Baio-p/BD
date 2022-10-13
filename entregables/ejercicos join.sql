/*ejercicios de consultas con join*/
select *
from productos join fabricantes
on productos.fabricantes_codigo = fabricantes.codigo
group by productos.codigo;
/*
1
Calcula el número total de productos que hay en la tabla productos.
*/
select count(codigo) as numero_de_productos
from productos;
/*
2
Muestra el número total de productos que tiene cada uno de los fabricantes. 
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número deproductos.
*/
select fabricantes.nombre as fabricante, count(productos.codigo) as numero_de_productos
from fabricantes left join productos
on productos.fabricantes_codigo = fabricantes.codigo
group by fabricantes.codigo;
/* aqui me falto agruparlos por orden descendente. No supe como hacerle*/
/*
3
Muestra el precio máximo, precio mínimo y precio promedio de los productos de cada uno de los fabricantes.
El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
*/
select fabricantes.nombre as nombre, max(precio) as precio_maximo, min(precio) as precio_minimo, avg(precio) as promedio
from productos left join fabricantes
on productos.fabricantes_codigo = fabricantes.codigo
group by fabricantes.codigo;
/*
4
Muestra el nombre de cada fabricante, junto con el precio máximo, 
precio mínimo,precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a $200. 
Es necesario mostrar el nombre del fabricante.
*/
select fabricantes.nombre as nombre, max(precio) as precio_maximo, min(precio) as precio_minimo, count(productos.codigo), avg(precio) as media_de_precio
from productos left join fabricantes
on productos.fabricantes_codigo = fabricantes.codigo
where productos.precio>200
group by fabricantes.codigo;