-------CONSULTAS SOBRE LA BASE DE DATOS EMPORIO MOTOQUERO----------------------------------------

--Muestra las ganacias obtenidas en el mes-------------------------------------------------------

SELECT
	month(V.fecha) AS 'Numero del mes', 
	sum((pos.precio_compra)-(P.precio_venta*POS.cantidad)) AS 'Ganacias'
FROM
	VENTAS V,
	POSEE POS,
	PRODUCTOS P	
WHERE
	POS.codigo_venta= V.codigo_venta 
	AND POS.codigo_producto=P.codigo_producto
	AND month(V.fecha)=7
	GROUP BY month(V.fecha);
-------------------------------------------------------------------------------------------------

-------------------Muestra el producto más vendido-----------------------------------------------
SELECT TOP 1
	P.codigo_producto AS 'Codigo del producto',
	P.codigo_marca AS 'Codigo de marca',
	P.precio_venta AS 'Precio de compra'
FROM
	VENTAS V,
	POSEE POS,
	PRODUCTOS P	
WHERE
	POS.codigo_venta= V.codigo_venta 
	AND POS.codigo_producto=P.codigo_producto
	GROUP BY P.codigo_producto,P.codigo_marca,P.precio_venta
	ORDER BY COUNT(P.codigo_producto) DESC;
-------------------------------------------------------------------------------------------------

 -----------------Muestra los 3 clientes que más compras han hecho-------------------------------
SELECT TOP 3
	C.nombre AS 'NOMBRE DEL CLIENTE',count(*) AS 'CANTIDAD DE COMPRAS HECHAS'	
FROM
	CLIENTES C,
	VENTAS V
WHERE
	C.codigo_cliente=V.codigo_cliente
GROUP BY C.nombre
ORDER BY 'CANTIDAD DE COMPRAS HECHAS' DESC
-------------------------------------------------------------------------------------------------

------------------Muestra los productos menos vendidos-------------------------------------------
SELECT
	PR.codigo_producto AS 'Codigo del producto',
	PR.codigo_marca AS 'Codigo de marca',
	PR.precio_venta AS 'Precio de compra'
FROM
	PRODUCTOS PR
WHERE
PR.codigo_producto NOT IN (SELECT DISTINCT
							P.codigo_producto
						   FROM
							VENTAS V,
							POSEE POS,
							PRODUCTOS P	
						   WHERE
							POS.codigo_venta= V.codigo_venta 
							AND POS.codigo_producto=P.codigo_producto)
-------------------------------------------------------------------------------------------------

---------------Muestra las 3 marcas más vendidas-------------------------------------------------
SELECT TOP 3
	M.nombre_marca AS MARCA
		
FROM
	PRODUCTOS P,
	MARCAS M,
	POSEE POS,
	VENTAS V
WHERE
	M.codigo_marca=P.codigo_marca 
	AND POS.codigo_producto = P.codigo_producto
	AND V.codigo_venta=POS.codigo_venta
GROUP BY M.nombre_marca
ORDER BY COUNT(M.nombre_marca)DESC;
-------------------------------------------------------------------------------------------------

----------------muestra la cantidad de ventas realizadas en el mes-------------------------------
SELECT
	month(V.fecha)AS 'NUMERO MES',
	COUNT(v.codigo_venta) AS 'CANTIDAD DE VENTAS'
FROM
	VENTAS V
WHERE
	month(v.fecha)=5
GROUP BY month(v.fecha)