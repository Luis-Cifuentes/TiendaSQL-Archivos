/*--------------------Creamos la base de datos--------------------*/
CREATE DATABASE electronichomes;

/*Creamos los esquemas a utilizar*/
CREATE SCHEMA ControlInmuebles;
CREATE SCHEMA ControlPersonal;
CREATE SCHEMA ControlTienda;

/*Creamos las tablas sobre las entidades presentes*/

/*Tablas En Esquema ControlInmuebles*/
CREATE TABLE ControlInmuebles.Instalacion(
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (nombre)
);

/*Tablas En Esquema ControlPersonal*/
CREATE TABLE ControlPersonal.Empleado (
    codUsuario BIGINT NOT NULL,
    contrasenia VARCHAR(10) NOT NULL,
    nombreEmpleado VARCHAR(45) NOT NULL,
    instalacion VARCHAR(20) NOT NULL,
    cargo VARCHAR(15) NOT NULL,
    salario DECIMAL NOT NULL,
    fechaNacimiento DATE NOT NULL,
    FOREIGN KEY (instalacion) REFERENCES ControlInmuebles.Instalacion(nombre),
    PRIMARY KEY (codUsuario)
);

/*Tablas En Esquema ControlTienda*/
CREATE TABLE ControlTienda.Cliente (
    NIT INTEGER NOT NULL,
    nombreCliente VARCHAR(45) NOT NULL,
    PRIMARY KEY (NIT)
);

CREATE TABLE ControlTienda.Producto (
    codigoPdt VARCHAR(12) NOT NULL,
    nombrePdt VARCHAR(30) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    disponibleEn VARCHAR(20) REFERENCES ControlInmuebles.Instalacion(nombre) NOT NULL,
    cantidad INTEGER NOT NULL,
    precioUnidad DECIMAL NOT NULL,
    PRIMARY KEY (codigoPdt, disponibleEn)
);

CREATE TABLE ControlTienda.Venta (
    idVenta SERIAL,
    realizadaEn VARCHAR(20) NOT NULL,
    fechaVenta DATE NOT NULL,
    codigoEmpleado BIGINT NOT NULL,
    NIT INTEGER,
    CF BOOLEAN NOT NULL,
    total DECIMAL NOT NULL,
    FOREIGN KEY (codigoEmpleado) REFERENCES ControlPersonal.Empleado(codUsuario),
    FOREIGN KEY (NIT) REFERENCES ControlTienda.Cliente(NIT), 
    PRIMARY KEY (idVenta)
);

CREATE TABLE ControlTienda.DetalleVenta (
    idDtll SERIAL,
    idVenta INTEGER NOT NULL,
    codigoPdt VARCHAR(12) NOT NULL,
    nombrePdt VARCHAR(30) NOT NULL,
    marca VARCHAR(20) NOT NULL,
    cantidadComprada INTEGER NOT NULL,
    subTotal DECIMAL NOT NULL,
    FOREIGN KEY (idVenta) REFERENCES ControlTienda.Venta(idVenta),
    PRIMARY KEY (idDtll)
);

/*--------------------Inserciones--------------------*/

/*Insercion en las instalaciones*/
INSERT INTO ControlInmuebles.Instalacion VALUES ('Electronic-Homes', 'Es la empresa que contiene todas las sucursales');
INSERT INTO ControlInmuebles.Instalacion VALUEs ('Bodega', 'Inmueble que almacena todos los productos que pueden ser distribuidos en las demas sucursales');
INSERT INTO ControlInmuebles.Instalacion VALUES ('Sucursal-Central', 'Instalacion ubicada en la region central');
INSERT INTO ControlInmuebles.Instalacion VALUES ('Sucursal-Norte', 'Instalacion ubicada en la region norte');
INSERT INTO ControlInmuebles.Instalacion VALUES ('Sucursal-Sur', 'Instalacion ubicada en la region sur');

/*Insercion de Empleados Sucursal Central*/
INSERT INTO ControlPersonal.Empleado VALUES (5732480196, 'xU6nM7zK!t', 'Jose Javier Tzicap Lopez', 'Sucursal-Central', 'Vendedor', 3500.00, '1996/03/22');
INSERT INTO ControlPersonal.Empleado VALUES (2194650378, 'fA8pN3qY#k', 'Gerardo Alejando Lopez Guzman', 'Sucursal-Central', 'Vendedor', 3500.00, '1991/09/17');
INSERT INTO ControlPersonal.Empleado VALUES (6850392741, 'gS5mZ4jX@w', 'Simon Asturios Guerrero Guerrero', 'Sucursal-Central', 'Vendedor', 3500.00, '1998/12/08');
INSERT INTO ControlPersonal.Empleado VALUES (9108275634, 'dH2bR1vT$p', 'Pedro Ricardo Morales Barrios', 'Sucursal-Central', 'Inventario', 3200.00, '2000/02/29');

/*Insercion de Empleados Sucursal Norte*/
INSERT INTO ControlPersonal.Empleado VALUES (3762951840, 'lQ9rE6tF#s', 'Angel Eduardo Mejia Reyes', 'Sucursal-Norte', 'Vendedor', 3500.00, '1992/06/11');
INSERT INTO ControlPersonal.Empleado VALUES (1029384756, 'kW1sV7pI$h', 'Juan Antonio Tzic Vasquez', 'Sucursal-Norte', 'Vendedor', 3500.00, '1994/07/26');
INSERT INTO ControlPersonal.Empleado VALUES (4987320165, 'tD3uJ8nG#e', 'Ana Gabriela Rodas Sagastume', 'Sucursal-Norte', 'Vendedor', 3500.00, '2002/01/03');
INSERT INTO ControlPersonal.Empleado VALUES (8217369054, 'mY6hC5xZ!f', 'Adriana Emilia Santos Quiroa', 'Sucursal-Norte', 'Inventario', 3200.00, '1997/04/14');

/*Insercion de Empleados Sucursal Sur*/
INSERT INTO ControlPersonal.Empleado VALUES (3079584612, 'sB2tL7yQ#n', 'Maria Alejandra Monterroso Montenegro', 'Sucursal-Sur', 'Vendedor', 3500.00, '1993/11/05');
INSERT INTO ControlPersonal.Empleado VALUES (5649382071, 'pJ1fX9zG$k', 'Silvia Julieta Reyes Reyes', 'Sucursal-Sur', 'Vendedor', 3500.00, '1990/08/16');
INSERT INTO ControlPersonal.Empleado VALUES (8730952461, 'vO4wM5aT#d', 'Ana Elisa Rodas Cifuentes', 'Sucursal-Sur', 'Vendedor', 3500.00, '1999/05/19');
INSERT INTO ControlPersonal.Empleado VALUES (3458796210, 'cU6zK7nS!e', 'Sandra Noemi Sanchez Sanchez', 'Sucursal-Sur', 'Inventario', 3200.00, '2001/12/07');

/*Insercion de Empleados en Bodega*/
INSERT INTO ControlPersonal.Empleado VALUES (6570281493, 'rF3gH8jP$k', 'Roberto Gilberto Rodriguez de Leon', 'Bodega', 'Bodeguero', 3800.00, '1995/10/23');
INSERT INTO ControlPersonal.Empleado VALUES (1205498736, 'bE2tV1xN#y', 'Jose Alfredo Garcia Maldonado', 'Bodega', 'Bodeguero', 3800.00, '1991/02/10');
INSERT INTO ControlPersonal.Empleado VALUES (8763452190, 'zI9sT6qY$h', 'Daniel Leandro Giron Giron', 'Bodega', 'Bodeguero', 3800.00, '1992/09/20');
INSERT INTO ControlPersonal.Empleado VALUES (4629580371, 'nL7mG4fX!p', 'Pablo David Minera Ortiz', 'Bodega', 'Bodeguero', 3800.00, '1996/11/28');

/*Insercion de Empleado Administrador*/
INSERT INTO ControlPersonal.Empleado VALUES (2020304820, 'Nbpjxdxd%2', 'Luis Nery Cifuentes Rodas', 'Electronic-Homes', 'Administrador', 4000.00, '2000/12/20');

/*Insercion de Clientes*/
INSERT INTO ControlTienda.Cliente VALUES (73921548, 'Esna Alexandra Martinez Gamarro');
INSERT INTO ControlTienda.Cliente VALUES (68230917, 'Oscar Miguel Tebalan Garrido');
INSERT INTO ControlTienda.Cliente VALUES (45082731, 'Rudy Napoleon Jimenez Alvarado');
INSERT INTO ControlTienda.Cliente VALUES (89217653, 'Marlin Casimira Argueta Itzep');
INSERT INTO ControlTienda.Cliente VALUES (21549783, 'Londra Natasha Cuc Rodriguez');
INSERT INTO ControlTienda.Cliente VALUES (67310824, 'David Robelo Fuentes Cifuentes');
INSERT INTO ControlTienda.Cliente VALUES (98123546, 'Joel Abdiel Barrios Barrios');
INSERT INTO ControlTienda.Cliente VALUES (37689012, 'Angela Paulina Salanic Estrada');

/*Insercion de Productos En Bodega*/
INSERT INTO ControlTienda.Producto VALUES ('01234567H890', 'Refrigerador', 'Oster', 'Bodega', 15, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234I5678901', 'Estufa', 'Hoover', 'Bodega', 10, 4700.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678J9012', 'Horno Electrico', 'Hoover', 'Bodega', 10, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('3456K7890123', 'Microondas', 'Black and Decker', 'Bodega', 10, 3900.00);
INSERT INTO ControlTienda.Producto VALUES ('456L8901234K', 'Lavadora', 'Whirlpool', 'Bodega', 15, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('56789M012345', 'Secadora', 'Whirlpool', 'Bodega', 15, 3000.00);
INSERT INTO ControlTienda.Producto VALUES ('678N90123456', 'Aspiradora', 'Samsung', 'Bodega', 10, 850.00);
INSERT INTO ControlTienda.Producto VALUES ('789O1234567P', 'Batidora', 'Oster', 'Bodega', 20, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890P23456789', 'Licuadora', 'Oster', 'Bodega', 20, 400.00);
INSERT INTO ControlTienda.Producto VALUES ('90120Q345678', 'Tostadora', 'Black and Decker', 'Bodega', 20, 250.00);
INSERT INTO ControlTienda.Producto VALUES ('1234R5678901', 'Cafetera', 'Philips', 'Bodega', 15, 300.00);
INSERT INTO ControlTienda.Producto VALUES ('23456S789012', 'Plancha de Ropa', 'Nordika', 'Bodega', 25, 150.00);
INSERT INTO ControlTienda.Producto VALUES ('345T6789012U', 'Ventilador', 'Philips', 'Bodega', 20, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('45678U012345', 'Calefactor', 'Samsung', 'Bodega', 10, 650.00);
INSERT INTO ControlTienda.Producto VALUES ('56789V123456', 'Extractor de Jugos', 'Oster', 'Bodega', 30, 450.00);
INSERT INTO ControlTienda.Producto VALUES ('W8901234567X', 'Televisor 50 pulgadas', 'LG', 'Bodega', 25, 2400.00);
INSERT INTO ControlTienda.Producto VALUES ('X9012345678Y', 'Equipo Stereo', 'Sony', 'Bodega', 10, 1000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234Z5678901', 'Telefono de Casa', 'Nordika', 'Bodega', 30, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678A012B', 'Videocasetera', 'Sony', 'Bodega', 10, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('3456C7890123', 'Triturador de Alimentos', 'Oster', 'Bodega', 30, 225.00);
INSERT INTO ControlTienda.Producto VALUES ('456D8901234E', 'Televisor 30 pulgadas', 'Samsung', 'Bodega', 15, 1600.00);
INSERT INTO ControlTienda.Producto VALUES ('56789F012345', 'Lavadora', 'Philips', 'Bodega', 15, 2600.00);
INSERT INTO ControlTienda.Producto VALUES ('678G90123456', 'Refrigerador', 'Dyson', 'Bodega', 15, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('789H1234567I', 'Licuadora', 'KitchenAid', 'Bodega', 20, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890I23456789', 'Microondas', 'Panasonic', 'Bodega', 10, 2500.00);
INSERT INTO ControlTienda.Producto VALUES ('9012J3456780', 'Equipo Stereo', 'Panasonic', 'Bodega', 5, 950.00);
INSERT INTO ControlTienda.Producto VALUES ('1234K5678901', 'Repetidor de Wifi', 'Steren', 'Bodega', 30, 500.00);
INSERT INTO ControlTienda.Producto VALUES ('23456L789012', 'Dispensador de Agua', 'Whirlpool', 'Bodega', 20, 330.00);
INSERT INTO ControlTienda.Producto VALUES ('345M6789012N', 'Lampara de Mesa', 'Nordika', 'Bodega', 35, 100.00);
INSERT INTO ControlTienda.Producto VALUES ('45678N012345', 'Plancha de Ropa', 'Oster', 'Bodega', 30, 250.00);

/*Incersion de Productos En Sucursal Central*/
INSERT INTO ControlTienda.Producto VALUES ('01234567H890', 'Refrigerador', 'Oster', 'Sucursal-Central', 10, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234I5678901', 'Estufa', 'Hoover', 'Sucursal-Central', 5, 4700.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678J9012', 'Horno Electrico', 'Hoover', 'Sucursal-Central', 10, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('3456K7890123', 'Microondas', 'Black and Decker', 'Sucursal-Central', 5, 3900.00);
INSERT INTO ControlTienda.Producto VALUES ('456L8901234K', 'Lavadora', 'Whirlpool', 'Sucursal-Central', 5, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('56789M012345', 'Secadora', 'Whirlpool', 'Sucursal-Central', 5, 3000.00);
INSERT INTO ControlTienda.Producto VALUES ('678N90123456', 'Aspiradora', 'Samsung', 'Sucursal-Central', 5, 850.00);
INSERT INTO ControlTienda.Producto VALUES ('789O1234567P', 'Batidora', 'Oster', 'Sucursal-Central', 15, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890P23456789', 'Licuadora', 'Oster', 'Sucursal-Central', 15, 400.00);
INSERT INTO ControlTienda.Producto VALUES ('90120Q345678', 'Tostadora', 'Black and Decker', 'Sucursal-Central', 15, 250.00);
INSERT INTO ControlTienda.Producto VALUES ('1234R5678901', 'Cafetera', 'Philips', 'Sucursal-Central', 10, 300.00);
INSERT INTO ControlTienda.Producto VALUES ('23456S789012', 'Plancha de Ropa', 'Nordika', 'Sucursal-Central', 10, 150.00);
INSERT INTO ControlTienda.Producto VALUES ('345T6789012U', 'Ventilador', 'Philips', 'Sucursal-Central', 20, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('45678U012345', 'Calefactor', 'Samsung', 'Sucursal-Central', 5, 650.00);
INSERT INTO ControlTienda.Producto VALUES ('56789V123456', 'Extractor de Jugos', 'Oster', 'Sucursal-Central', 20, 450.00);
INSERT INTO ControlTienda.Producto VALUES ('W8901234567X', 'Televisor 50 pulgadas', 'LG', 'Sucursal-Central', 15, 2400.00);
INSERT INTO ControlTienda.Producto VALUES ('X9012345678Y', 'Equipo Stereo', 'Sony', 'Sucursal-Central', 5, 1000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234Z5678901', 'Telefono de Casa', 'Nordika', 'Sucursal-Central', 30, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678A012B', 'Videocasetera', 'Sony', 'Sucursal-Central', 5, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('3456C7890123', 'Triturador de Alimentos', 'Oster', 'Sucursal-Central', 15, 225.00);
INSERT INTO ControlTienda.Producto VALUES ('456D8901234E', 'Televisor 30 pulgadas', 'Samsung', 'Sucursal-Central', 5, 1600.00);
INSERT INTO ControlTienda.Producto VALUES ('56789F012345', 'Lavadora', 'Philips', 'Sucursal-Central', 8, 2600.00);
INSERT INTO ControlTienda.Producto VALUES ('678G90123456', 'Refrigerador', 'Dyson', 'Sucursal-Central', 8, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('789H1234567I', 'Licuadora', 'KitchenAid', 'Sucursal-Central', 15, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890I23456789', 'Microondas', 'Panasonic', 'Sucursal-Central', 10, 2500.00);
INSERT INTO ControlTienda.Producto VALUES ('9012J3456780', 'Equipo Stereo', 'Panasonic', 'Sucursal-Central', 5, 950.00);
INSERT INTO ControlTienda.Producto VALUES ('1234K5678901', 'Repetidor de Wifi', 'Steren', 'Sucursal-Central', 15, 500.00);
INSERT INTO ControlTienda.Producto VALUES ('23456L789012', 'Dispensador de Agua', 'Whirlpool', 'Sucursal-Central', 20, 330.00);
INSERT INTO ControlTienda.Producto VALUES ('345M6789012N', 'Lampara de Mesa', 'Nordika', 'Sucursal-Central', 15, 100.00);
INSERT INTO ControlTienda.Producto VALUES ('45678N012345', 'Plancha de Ropa', 'Oster', 'Sucursal-Central', 20, 250.00);

/*Insercion de Productos En Sucursal Norte*/
INSERT INTO ControlTienda.Producto VALUES ('01234567H890', 'Refrigerador', 'Oster', 'Sucursal-Norte', 7, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234I5678901', 'Estufa', 'Hoover', 'Sucursal-Norte', 5, 4700.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678J9012', 'Horno Electrico', 'Hoover', 'Sucursal-Norte', 7, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('3456K7890123', 'Microondas', 'Black and Decker', 'Sucursal-Norte', 5, 3900.00);
INSERT INTO ControlTienda.Producto VALUES ('456L8901234K', 'Lavadora', 'Whirlpool', 'Sucursal-Norte', 5, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('56789M012345', 'Secadora', 'Whirlpool', 'Sucursal-Norte', 5, 3000.00);
INSERT INTO ControlTienda.Producto VALUES ('678N90123456', 'Aspiradora', 'Samsung', 'Sucursal-Norte', 5, 850.00);
INSERT INTO ControlTienda.Producto VALUES ('789O1234567P', 'Batidora', 'Oster', 'Sucursal-Norte', 7, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890P23456789', 'Licuadora', 'Oster', 'Sucursal-Norte', 10, 400.00);
INSERT INTO ControlTienda.Producto VALUES ('90120Q345678', 'Tostadora', 'Black and Decker', 'Sucursal-Norte', 10, 250.00);
INSERT INTO ControlTienda.Producto VALUES ('1234R5678901', 'Cafetera', 'Philips', 'Sucursal-Norte', 10, 300.00);
INSERT INTO ControlTienda.Producto VALUES ('23456S789012', 'Plancha de Ropa', 'Nordika', 'Sucursal-Norte', 10, 150.00);
INSERT INTO ControlTienda.Producto VALUES ('345T6789012U', 'Ventilador', 'Philips', 'Sucursal-Norte', 20, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('45678U012345', 'Calefactor', 'Samsung', 'Sucursal-Norte', 5, 650.00);
INSERT INTO ControlTienda.Producto VALUES ('56789V123456', 'Extractor de Jugos', 'Oster', 'Sucursal-Norte', 20, 450.00);
INSERT INTO ControlTienda.Producto VALUES ('W8901234567X', 'Televisor 50 pulgadas', 'LG', 'Sucursal-Norte', 10, 2400.00);
INSERT INTO ControlTienda.Producto VALUES ('X9012345678Y', 'Equipo Stereo', 'Sony', 'Sucursal-Norte', 5, 1000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234Z5678901', 'Telefono de Casa', 'Nordika', 'Sucursal-Norte', 30, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678A012B', 'Videocasetera', 'Sony', 'Sucursal-Norte', 5, 200.00);
INSERT INTO ControlTienda.Producto VALUES ('3456C7890123', 'Triturador de Alimentos', 'Oster', 'Sucursal-Norte', 7, 225.00);
INSERT INTO ControlTienda.Producto VALUES ('1234K5678901', 'Repetidor de Wifi', 'Steren', 'Sucursal-Norte', 10, 500.00);
INSERT INTO ControlTienda.Producto VALUES ('23456L789012', 'Dispensador de Agua', 'Whirlpool', 'Sucursal-Norte', 20, 330.00);
INSERT INTO ControlTienda.Producto VALUES ('345M6789012N', 'Lampara de Mesa', 'Nordika', 'Sucursal-Norte', 10, 100.00);
INSERT INTO ControlTienda.Producto VALUES ('890I23456789', 'Microondas', 'Panasonic', 'Sucursal-Norte', 7, 2500.00);
INSERT INTO ControlTienda.Producto VALUES ('9012J3456780', 'Equipo Stereo', 'Panasonic', 'Sucursal-Norte', 5, 950.00);

/*Insercion de Productos En Sucursal Sur*/
INSERT INTO ControlTienda.Producto VALUES ('01234567H890', 'Refrigerador', 'Oster', 'Sucursal-Sur', 3, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('1234I5678901', 'Estufa', 'Hoover', 'Sucursal-Sur', 5, 4700.00);
INSERT INTO ControlTienda.Producto VALUES ('2345678J9012', 'Horno Electrico', 'Hoover', 'Sucursal-Sur', 5, 5000.00);
INSERT INTO ControlTienda.Producto VALUES ('3456K7890123', 'Microondas', 'Black and Decker', 'Sucursal-Sur', 5, 3900.00);
INSERT INTO ControlTienda.Producto VALUES ('456L8901234K', 'Lavadora', 'Whirlpool', 'Sucursal-Sur', 3, 3500.00);
INSERT INTO ControlTienda.Producto VALUES ('56789M012345', 'Secadora', 'Whirlpool', 'Sucursal-Sur', 3, 3000.00);
INSERT INTO ControlTienda.Producto VALUES ('678N90123456', 'Aspiradora', 'Samsung', 'Sucursal-Sur', 3, 850.00);
INSERT INTO ControlTienda.Producto VALUES ('789O1234567P', 'Batidora', 'Oster', 'Sucursal-Sur', 7, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('890P23456789', 'Licuadora', 'Oster', 'Sucursal-Sur', 7, 400.00);
INSERT INTO ControlTienda.Producto VALUES ('1234R5678901', 'Cafetera', 'Philips', 'Sucursal-Sur', 5, 300.00);
INSERT INTO ControlTienda.Producto VALUES ('23456S789012', 'Plancha de Ropa', 'Nordika', 'Sucursal-Sur', 5, 150.00);
INSERT INTO ControlTienda.Producto VALUES ('345T6789012U', 'Ventilador', 'Philips', 'Sucursal-Sur', 10, 350.00);
INSERT INTO ControlTienda.Producto VALUES ('45678U012345', 'Calefactor', 'Samsung', 'Sucursal-Sur', 5, 650.00);
INSERT INTO ControlTienda.Producto VALUES ('56789V123456', 'Extractor de Jugos', 'Oster', 'Sucursal-Sur', 10, 450.00);
INSERT INTO ControlTienda.Producto VALUES ('W8901234567X', 'Televisor 50 pulgadas', 'LG', 'Sucursal-Sur', 7, 2400.00);

/*Insercion Ventas Sucursal-Central*/
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Central', '2020/05/08', 5732480196, 73921548, false, 5000.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (1, '01234567H890', 'Refrigerador', 'Oster', 1, 5000.00);
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Central', '2020/09/09', 2194650378, null, true, 350.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (2, '789O1234567P', 'Batidora', 'Oster', 1, 350.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Central', '2021/01/13', 5732480196, 89217653, false, 200.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (3, '2345678A012B', 'Videocasetera', 'Sony', 1, 200.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Central', '2021/06/30', 6850392741, null, true, 2600.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (4, '56789F012345', 'Lavadora', 'Philips', 1, 2600.00);  
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Central', '2022/12/20', 5732480196, 37689012, false, 500.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (5, '45678N012345', 'Plancha de Ropa', 'Oster', 2, 500.00);

/*Insercion Ventas Sucursal-Norte*/
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Norte', '2019/03/23', 3762951840, null, true, 2830.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (6, '890I23456789', 'Microondas', 'Panasonic', 1, 2500.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (6, '23456L789012', 'Dispensador de Agua', 'Whirlpool', 1, 330.00);
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Norte', '2019/12/01', 1029384756, 68230917, false, 225.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (7, '3456C7890123', 'Triturador de Alimentos', 'Oster', 1, 225.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Norte', '2020/01/18', 3762951840, null, true, 650.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (8, '45678U012345', 'Calefactor', 'Samsung', 1, 650.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Norte', '2021/02/15', 4987320165, 21549783, false, 1000.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (9, 'X9012345678Y', 'Equipo Stereo', 'Sony', 1, 1000.00);  
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Norte', '2022/04/03', 3762951840, null, true, 500.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (10, '90120Q345678', 'Tostadora', 'Black and Decker', 2, 500.00);

/*Insercion Ventas Sucursal-Sur*/
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Sur', '2022/04/19', 3079584612, 45082731, false, 2400.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (11, 'W8901234567X', 'Televisor 50 pulgadas', 'LG', 1, 2400.00);
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Sur', '2022/06/24', 5649382071, null, true, 4700.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (12, '1234I5678901', 'Estufa', 'Hoover', 1, 4700.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Sur', '2022/09/17', 3079584612, 67310824, false, 850.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (13, '678N90123456', 'Aspiradora', 'Samsung', 1, 850.00); 
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Sur', '2022/10/22', 8730952461, null, true, 300.00);
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (14, '1234R5678901', 'Cafetera', 'Philips', 1, 300.00);  
INSERT INTO ControlTienda.Venta (realizadaEn, fechaVenta, codigoEmpleado, NIT, CF, total) VALUES ('Sucursal-Sur', '2022/12/31', 3079584612, 98123546, false, 350.00); 
INSERT INTO ControlTienda.DetalleVenta (idVenta, codigoPdt, nombrePdt, marca, cantidadComprada, subTotal) VALUES (15, '345T6789012U', 'Ventilador', 'Philips', 2, 350.00);
