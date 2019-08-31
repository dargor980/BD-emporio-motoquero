/* INFORMÁTICA SOBRE RUEDAS
	SCRIPT PROYECTO BASE DE DATOS
	INTEGRANTES: BRAULIO IGNACIO ARGANDOÑA CARRASCO
			     GERMÁN CONTRERAS AMÉSTICA
				 FELIPE IGNACIO GONZÁLEZ DUARTE
				 FABIÁN ANDRÉS URRIOLA POISSON
	ASIGNATURA:  BASE DE DATOS
	SECCION:	 411
	PROFESOR:	 LUIS ALBERTO GUTIÉRREZ SALAZAR
	N°GRUPO:	 4
*/

--------------------Creación de la Base de datos --------------------------------------------------------------------------------------
CREATE DATABASE EMPORIO;
GO
---------------------------------------------------------------------------------------------------------------------------------------

USE EMPORIO;
---------------------Creación de las tablas--------------------------------------------------------------------------------------------

CREATE TABLE PROVEEDORES(
	codigo_proveedor VARCHAR(10) NOT NULL,
	direccion VARCHAR(40),
	telefono VARCHAR(11),
	nombre_local varchar(40)
	PRIMARY KEY(codigo_proveedor)
);
CREATE TABLE TIPO_CATEGORIA
(
	tipo_categoria VARCHAR(40) PRIMARY KEY NOT NULL,
	descripcion VARCHAR (40)
);
CREATE TABLE CATEGORIAS(
	codigo_categoria VARCHAR(10) NOT NULL,
	tipo_categoria VARCHAR(40),
	PRIMARY KEY(codigo_categoria),
	FOREIGN KEY(tipo_categoria) REFERENCES TIPO_CATEGORIA(tipo_categoria)
);
CREATE TABLE MARCAS(
	codigo_marca VARCHAR(10) NOT NULL,
	nombre_marca VARCHAR(40),
	codigo_categoria VARCHAR(10), 
	PRIMARY KEY(codigo_marca),
	FOREIGN KEY(codigo_categoria) REFERENCES CATEGORIAS(codigo_categoria)
);
CREATE TABLE TIPO_CARGO
(
	tipo_cargo VARCHAR(40) PRIMARY KEY NOT NULL,
	descripcion VARCHAR (80)
);
CREATE TABLE CARGOS(
	codigo_cargo VARCHAR(10) NOT NULL,
	tipo_cargo varchar(40),
	PRIMARY KEY(codigo_cargo),
	FOREIGN KEY(tipo_cargo) REFERENCES TIPO_CARGO(tipo_cargo)
);
CREATE TABLE PRODUCTOS(
	codigo_producto VARCHAR(10) NOT NULL,
	codigo_marca VARCHAR(10),
	codigo_categoria VARCHAR(10),
	precio_venta INT,
	PRIMARY KEY(codigo_producto),
	FOREIGN KEY(codigo_marca) REFERENCES MARCAS(codigo_marca),
	FOREIGN KEY(codigo_categoria) REFERENCES CATEGORIAS(codigo_categoria)
);
CREATE TABLE ENCARGADOS(
	codigo_encargado VARCHAR(10) NOT NULL,
	codigo_proveedor VARCHAR(10),
	codigo_producto VARCHAR(10),
	precio_compra INT,
	cantidad INT,
	PRIMARY KEY(codigo_encargado),
	FOREIGN KEY(codigo_proveedor) REFERENCES PROVEEDORES(codigo_proveedor),
	FOREIGN KEY(codigo_producto) REFERENCES PRODUCTOS(codigo_producto)

);
CREATE TABLE TRABAJADORES(
	codigo_trabajador VARCHAR(10) NOT NULL,
	codigo_cargo VARCHAR(10),
	nombre VARCHAR(40),
	PRIMARY KEY(codigo_trabajador),
	FOREIGN KEY(codigo_cargo) REFERENCES CARGOS(codigo_cargo)
);


CREATE TABLE ENVIADO(
	codigo_envio VARCHAR(10) NOT NULL,
	codigo_producto VARCHAR(10),
	codigo_trabajador VARCHAR(10),
	fecha DATETIME,
	PRIMARY KEY(codigo_envio),
	FOREIGN KEY(codigo_producto) REFERENCES PRODUCTOS(codigo_producto),
	FOREIGN KEY(codigo_trabajador) REFERENCES TRABAJADORES(codigo_trabajador)
);


CREATE TABLE CLIENTES(
	codigo_cliente VARCHAR(10) NOT NULL,
	nombre VARCHAR(40),
	direccion VARCHAR(100),
	telefono VARCHAR(11),
	PRIMARY KEY(codigo_cliente)
);

CREATE TABLE VENTAS(
	codigo_venta VARCHAR(10) NOT NULL,
	codigo_cliente VARCHAR(10),
	codigo_trabajador VARCHAR(10),
	fecha DATETIME,
	descripcion VARCHAR(40),
	PRIMARY KEY(codigo_venta),
	FOREIGN KEY(codigo_cliente) REFERENCES CLIENTES(codigo_cliente),
	FOREIGN KEY(codigo_trabajador) REFERENCES TRABAJADORES(codigo_trabajador)
);
CREATE TABLE POSEE(
	codigo_posee VARCHAR(10) NOT NULL,
	codigo_venta VARCHAR(10),
	codigo_producto VARCHAR(10),
	cantidad INT,
	precio_compra INT,
	PRIMARY KEY(codigo_posee),
	FOREIGN KEY(codigo_venta) REFERENCES VENTAS(codigo_venta),
	FOREIGN KEY(codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

---------------------------------------------------------------------------------------------------------------------------------------



--seteo del formato de la fecha en dia/mes/año-----------------------------------------------------------------------------------------
SET DATEFORMAT dmy;
---------------------------------------------------------------------------------------------------------------------------------------
GO
-------------------Inserción de los registros a la tabla PROVEEDORES-------------------------------------------------------------------

INSERT INTO PROVEEDORES VALUES('CV100','Padre Mariano 430','972114714','CVMOTOS');
INSERT INTO PROVEEDORES VALUES('UB100','Lira 650','972166793','U-BIKE');
INSERT INTO PROVEEDORES VALUES('PR100','Av. Vitacura 9390','955829027','Procirciut');
INSERT INTO PROVEEDORES VALUES('PA100','Lira 606','276829887','PalmaxKTM');
INSERT INTO PROVEEDORES VALUES('IM100','Lira 669','265649627','Imoto SA');
---------------------------------------------------------------------------------------------------------------------------------------

----------------------Inserción de los registros a la tabla TIPO_CATEGORIA-------------------------------------------------------------
INSERT INTO TIPO_CATEGORIA VALUES('Neumatico','Camaras,LLantas,Aros y Neumaticos');
INSERT INTO TIPO_CATEGORIA VALUES('Accesorio','Guantes, Micas y Ropa');
INSERT INTO TIPO_CATEGORIA VALUES('Lubricante','Liquidos para mejoras el deslizamiento');
INSERT INTO TIPO_CATEGORIA VALUES('Plástico','Parrillas, Mascaras y Frontales');
INSERT INTO TIPO_CATEGORIA VALUES('Repuesto','Frenos, Espejos y Bujias');

---------------------------------------------------------------------------------------------------------------------------------------

-----------------------Inserción de los registros a la tabla CATEGORIAS----------------------------------------------------------------
 
INSERT INTO CATEGORIAS VALUES('CA10','Neumatico');
INSERT INTO CATEGORIAS VALUES('CA20','Neumatico');
INSERT INTO CATEGORIAS VALUES('CA30','Neumatico');
INSERT INTO CATEGORIAS VALUES('LL10','Neumatico');
INSERT INTO CATEGORIAS VALUES('LL20','Neumatico');
INSERT INTO CATEGORIAS VALUES('AR10','Neumatico');
INSERT INTO CATEGORIAS VALUES('AR20','Neumatico');
INSERT INTO CATEGORIAS VALUES('AR30','Neumatico');
INSERT INTO CATEGORIAS VALUES('NE10','Neumatico');
INSERT INTO CATEGORIAS VALUES('NE20','Neumatico');

INSERT INTO CATEGORIAS VALUES('GU10','Accesorio');
INSERT INTO CATEGORIAS VALUES('GU20','Accesorio');
INSERT INTO CATEGORIAS VALUES('MI10','Accesorio');
INSERT INTO CATEGORIAS VALUES('MI20','Accesorio');
INSERT INTO CATEGORIAS VALUES('MI30','Accesorio');
INSERT INTO CATEGORIAS VALUES('RO10','Accesorio');
INSERT INTO CATEGORIAS VALUES('RO20','Accesorio');

INSERT INTO CATEGORIAS VALUES('LU10','Lubricante');
INSERT INTO CATEGORIAS VALUES('LU20','Lubricante');
INSERT INTO CATEGORIAS VALUES('LU30','Lubricante');

INSERT INTO CATEGORIAS VALUES('PA10','Plástico');
INSERT INTO CATEGORIAS VALUES('PA20','Plástico');
INSERT INTO CATEGORIAS VALUES('MA10','Plástico');
INSERT INTO CATEGORIAS VALUES('MA20','Plástico');
INSERT INTO CATEGORIAS VALUES('MA30','Plástico');
INSERT INTO CATEGORIAS VALUES('FR10','Plástico');
INSERT INTO CATEGORIAS VALUES('FR20','Plástico');
INSERT INTO CATEGORIAS VALUES('FR30','Plástico');

INSERT INTO CATEGORIAS VALUES('FRE10','Repuesto');
INSERT INTO CATEGORIAS VALUES('FRE20','Repuesto');
INSERT INTO CATEGORIAS VALUES('FRE30','Repuesto');
INSERT INTO CATEGORIAS VALUES('ES10','Repuesto');
INSERT INTO CATEGORIAS VALUES('ES20','Repuesto');
INSERT INTO CATEGORIAS VALUES('ES30','Repuesto');
INSERT INTO CATEGORIAS VALUES('BU10','Repuesto');
INSERT INTO CATEGORIAS VALUES('BU20','Repuesto');
INSERT INTO CATEGORIAS VALUES('BU30','Repuesto');
---------------------------------------------------------------------------------------------------------------------------------------

-------------------------Insercion de los registros a la tabla MARCAS------------------------------------------------------------------
INSERT INTO MARCAS VALUES('MN1','Michelin','NE10');
INSERT INTO MARCAS VALUES('CN1','Cross Guangli','NE20');
INSERT INTO MARCAS VALUES('MC1','Michelin','CA10');
INSERT INTO MARCAS VALUES('SC1','Scooter','CA20');
INSERT INTO MARCAS VALUES('SC2','Scooter','CA30');
INSERT INTO MARCAS VALUES('PL1','Pitbike','LL10');
INSERT INTO MARCAS VALUES('PL2','Pitbike','LL20');
INSERT INTO MARCAS VALUES('SA1','Sin marca','AR10');
INSERT INTO MARCAS VALUES('SA2','Sin marca','AR20');
INSERT INTO MARCAS VALUES('SA3','Sin marca','AR30');

INSERT INTO MARCAS VALUES('SG1','Spyder','GU10');
INSERT INTO MARCAS VALUES('PG1','Probiker','GU20');
INSERT INTO MARCAS VALUES('AM1','Ahumada','MI10');
INSERT INTO MARCAS VALUES('TM1','Trups','MI20');
INSERT INTO MARCAS VALUES('PM1','Plain','MI30');
INSERT INTO MARCAS VALUES('FR1','Falcon','RO10');
INSERT INTO MARCAS VALUES('RR1','Rider','RO20');

INSERT INTO MARCAS VALUES('LA1','Advance','LU10');
INSERT INTO MARCAS VALUES('LE1','Elaion','LU20');
INSERT INTO MARCAS VALUES('LM1','Motul','LU30');

INSERT INTO MARCAS VALUES('SP1','Scooter','PA10');
INSERT INTO MARCAS VALUES('SP2','Scooter','PA20');
INSERT INTO MARCAS VALUES('RM1','Rider','MA10');
INSERT INTO MARCAS VALUES('SM1','Scooter','MA20');
INSERT INTO MARCAS VALUES('SM2','Scooter','MA30');
INSERT INTO MARCAS VALUES('EF1','ENDURO','FR10');
INSERT INTO MARCAS VALUES('EF2','ENDURO','FR20');
INSERT INTO MARCAS VALUES('EF3','ENDURO','FR30');

INSERT INTO MARCAS VALUES('SFR1','SUPER LIGHT','FRE10');
INSERT INTO MARCAS VALUES('HFR1','Honda','FRE20');
INSERT INTO MARCAS VALUES('KFR1','Kawasaki','FRE30');
INSERT INTO MARCAS VALUES('CE1','Chopper','ES10');
INSERT INTO MARCAS VALUES('CE2','Chopper','ES20');
INSERT INTO MARCAS VALUES('CE3','Chopper','ES30');
INSERT INTO MARCAS VALUES('NB1','NGK','BU10');
INSERT INTO MARCAS VALUES('NB2','NGK','BU20');
INSERT INTO MARCAS VALUES('NB3','NGK','BU30');
---------------------------------------------------------------------------------------------------------------------------------------

----------------------------------Inserción de los registros a la tabla TIPO_CARGO-----------------------------------------------------
INSERT INTO TIPO_CARGO VALUES('Vendedor','Trabajador que se encarga de las ventas');
INSERT INTO TIPO_CARGO VALUES('Adm. web','Encargado de administrar la pagina web de la empresa');
-----------------------------------------------------------------------
-----------------------------------Inserción de los registros a la tabla CARGOS--------------------------------------------------------
INSERT INTO CARGOS VALUES('V1','Vendedor');
INSERT INTO CARGOS VALUES('W1','Adm. web');

---------------------------------------------------------------------------------------------------------------------------------------

-------------------------------Inserción de los registros a la tabla PRODUCTOS---------------------------------------------------------
INSERT INTO PRODUCTOS VALUES('MNNE','MN1','NE10',40000);
INSERT INTO PRODUCTOS VALUES('CNNE','CN1','NE20',70000);
INSERT INTO PRODUCTOS VALUES('MCCA','MC1','CA10',3000);
INSERT INTO PRODUCTOS VALUES('SCCA','SC1','CA20',3500);
INSERT INTO PRODUCTOS VALUES('SCCA2','SC2','CA30',2000);
INSERT INTO PRODUCTOS VALUES('PLLL','PL1','LL10',20000);
INSERT INTO PRODUCTOS VALUES('PLLL2','PL2','LL20',10000);
INSERT INTO PRODUCTOS VALUES('SAAR','SA1','AR10',14000);
INSERT INTO PRODUCTOS VALUES('SAAR2','SA2','AR20',10000);
INSERT INTO PRODUCTOS VALUES('SAAR3','SA3','AR30',9000);

INSERT INTO PRODUCTOS VALUES('SGGU','SG1','GU10',9000);
INSERT INTO PRODUCTOS VALUES('PGGU','PG1','GU20',15000);
INSERT INTO PRODUCTOS VALUES('AMMI','AM1','MI10',10000);
INSERT INTO PRODUCTOS VALUES('TMMI','TM1','MI20',8000);
INSERT INTO PRODUCTOS VALUES('PMMI','PM1','MI30',7000);
INSERT INTO PRODUCTOS VALUES('FRRO','FR1','RO10',15000);
INSERT INTO PRODUCTOS VALUES('RRRO','RR1','RO20',12000);

INSERT INTO PRODUCTOS VALUES('LALU','LA1','LU10',2000);
INSERT INTO PRODUCTOS VALUES('LELU','LE1','LU20',1500);
INSERT INTO PRODUCTOS VALUES('LMLU','LM1','LU30',5000);

INSERT INTO PRODUCTOS VALUES('SPPA','SP1','PA10',5000);
INSERT INTO PRODUCTOS VALUES('SPPA2','SP2','PA20',4000);
INSERT INTO PRODUCTOS VALUES('RMMA','RM1','MA10',10000);
INSERT INTO PRODUCTOS VALUES('SMMA','SM1','MA20',13000);
INSERT INTO PRODUCTOS VALUES('SMMA2','SM2','MA30',11000);
INSERT INTO PRODUCTOS VALUES('EFFR','EF1','FR10',3500);
INSERT INTO PRODUCTOS VALUES('EFFR2','EF2','FR20',2000);
INSERT INTO PRODUCTOS VALUES('EFFR3','EF3','FR30',1500);

INSERT INTO PRODUCTOS VALUES('SFRFRE','SFR1','FRE10',4000);
INSERT INTO PRODUCTOS VALUES('HFRFRE','HFR1','FRE20',11000);
INSERT INTO PRODUCTOS VALUES('KFRFRE','KFR1','FRE30',15000);
INSERT INTO PRODUCTOS VALUES('CEES','CE1','ES10',3000);
INSERT INTO PRODUCTOS VALUES('CEES2','CE2','ES20',4000);
INSERT INTO PRODUCTOS VALUES('CEES3','CE3','ES30',5000);
INSERT INTO PRODUCTOS VALUES('NBBU','NB1','BU10',600);
INSERT INTO PRODUCTOS VALUES('NBBU2','NB2','BU20',800);
INSERT INTO PRODUCTOS VALUES('NBBU3','NB3','BU30',900);
---------------------------------------------------------------------------------------------------------------------------------------

--------------------------------Inserción de los registros a la tabla ENCARGADOS-------------------------------------------------------
INSERT INTO ENCARGADOS VALUES('FN201','CV100','SFRFRE',40000,10);
INSERT INTO ENCARGADOS VALUES('FN202','UB100','EFFR',315000,9);
INSERT INTO ENCARGADOS VALUES('FN203','IM100','LELU',22500,15);

--------------------------------Inserción de los registros a la tabla TRABAJADORES-----------------------------------------------------
INSERT INTO TRABAJADORES VALUES('101A','V1','Christopher Pizarro');
INSERT INTO TRABAJADORES VALUES('102A','W1','Francisco Ramirez');
---------------------------------------------------------------------------------------------------------------------------------------

--------------------------------Inserción de los registros a la tabla ENVIADO----------------------------------------------------------
INSERT INTO ENVIADO VALUES('Y21913','PGGU','101A','25/03/2019');
INSERT INTO ENVIADO VALUES('Y21914','NBBU3','101A','29/03/2019');
INSERT INTO ENVIADO VALUES('Y21915','PMMI','101A','07/04/2019');
INSERT INTO ENVIADO VALUES('Y21916','PLLL2','101A','12/04/2019');
INSERT INTO ENVIADO VALUES('Y21917','PLLL2','101A','17/04/2019');
INSERT INTO ENVIADO VALUES('Y21918','MNNE','101A','23/04/2019');
---------------------------------------------------------------------------------------------------------------------------------------

--------------------------------Inserción de los registros a la tabla CLIENTES---------------------------------------------------------
INSERT INTO CLIENTES VALUES('5196991K','Victoria Ortiz','Luis Matte Larraín 3456, Puente Alto, Santiago','56978654321');
INSERT INTO CLIENTES VALUES('171044014','Patricio San Martín','Av. Cardenal José María Caro 6578, Conchalí, Santiago','56223419076');
INSERT INTO CLIENTES VALUES('154580131','Emilia Pereira','Av. Walker martínez 2354,La Florida, Santiago','56952346754');
INSERT INTO CLIENTES VALUES('169600872','Claudio Cerpa','Av. Vicuña Mackenna 4534,Santiago','56987653452');
INSERT INTO CLIENTES VALUES('135511374','Andrés Aguila','José Vitorina Lastarria, Rancagua','56923436578');
INSERT INTO CLIENTES VALUES('137129043','Héctor Herrera','Av Los Carrera 785, Concepción','56932564565');
INSERT INTO CLIENTES VALUES('139007654','Pamela Nuñez','Av Apoquindo, Las Condes, Santiago','56999897678');
INSERT INTO CLIENTES VALUES('125087531','Miguel Aravena','Av San Pablo 9209, Pudahuel, Santiago','56924157634');
INSERT INTO CLIENTES VALUES('118704371','Leonardo Catalán','Av. Portales 401, Maipú, Santiago','56223436578');
INSERT INTO CLIENTES VALUES('111087865','Ivonne Flores','Psje Santa María 503, El Bosque, Santiago','56934546590');
INSERT INTO CLIENTES VALUES('118591364','Marco Borquez','Av. Concha y toro 597, Puente Alto, Santiago','56923122156');
---------------------------------------------------------------------------------------------------------------------------------------

----------------------------------Inserción de los resgistros de la tabla VENTAS-------------------------------------------------------

INSERT INTO VENTAS VALUES('V01','154580131','101A','02/05/2019','Boleta');
INSERT INTO VENTAS VALUES('V02','137129043','101A','02/05/2019','Factura');
INSERT INTO VENTAS VALUES('V03','111087865','101A','02/05/2019','Factura');
INSERT INTO VENTAS VALUES('V04','5196991K','101A','4/05/2019','Factura');
INSERT INTO VENTAS VALUES('V05','118591364','101A','10/05/2019','Factura');
INSERT INTO VENTAS VALUES('V06','111087865','101A','10/05/2019','Factura');
INSERT INTO VENTAS VALUES('V07','111087865','101A','10/05/2019','Factura');
INSERT INTO VENTAS VALUES('V08','111087865','101A','12/05/2019','Boleta');
INSERT INTO VENTAS VALUES('V09','125087531','101A','12/05/2019','Factura');
INSERT INTO VENTAS VALUES('V10','137129043','101A','30/05/2019','Factura');
INSERT INTO VENTAS VALUES('V11','118591364','101A','01/06/2019','Boleta');
INSERT INTO VENTAS VALUES('V12','125087531','101A','01/06/2019','Boleta');
INSERT INTO VENTAS VALUES('V13','171044014','101A','04/07/2019','Boleta');
INSERT INTO VENTAS VALUES('V14','169600872','101A','09/07/2019','Boleta');

--------------------------------Inserción de los registros a la tabla POSEE------------------------------------------------------------
INSERT INTO POSEE VALUES('11','V01','MNNE',2,140000);
INSERT INTO POSEE VALUES('22','V02','RRRO',3,57000);
INSERT INTO POSEE VALUES('33','V03','LMLU',7,63000);
INSERT INTO POSEE VALUES('44','V04','MNNE',2,140000);
INSERT INTO POSEE VALUES('55','V05','NBBU',10,19000);
INSERT INTO POSEE VALUES('66','V06','RRRO',5,95000);
INSERT INTO POSEE VALUES('77','V07','NBBU',20,38000);
INSERT INTO POSEE VALUES('88','V08','SMMA2',3,57000);
INSERT INTO POSEE VALUES('99','V09','RRRO',1,19000);
INSERT INTO POSEE VALUES('12','V10','LMLU',3,27000);
INSERT INTO POSEE VALUES('13','V11','SGGU',4,42000);
INSERT INTO POSEE VALUES('14','V12','PMMI',6,71400);
INSERT INTO POSEE VALUES('15','V13','LMLU',5,45000);
INSERT INTO POSEE VALUES('16','V14','LMLU',9,81000);