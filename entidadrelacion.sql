create database facturas;

use facturas;

CREATE TABLE Clientes (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  ApellidoP VARCHAR(50),
  ApellidoM VARCHAR(50),
  RFC VARCHAR(13),
  FechaRegistr DATETIME,
  Correo VARCHAR(100),
  Direccion VARCHAR(100)
);

CREATE TABLE Vendedor (
  ID INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Turno VARCHAR(50)
);

CREATE TABLE Productos (
  IDProducto INT PRIMARY KEY,
  Descripcion VARCHAR(100),
  PrecioCosto DOUBLE,
  PrecioVenta DOUBLE,
  NVendedor INT,
  FOREIGN KEY (NVendedor) REFERENCES Vendedor(ID)
);

drop table productos;

CREATE TABLE Factura (
  IDFactura INT PRIMARY KEY,
  Fecha DATE,
  IDCliente INT,
  TotalFactura DOUBLE,
  FOREIGN KEY (IDCliente) REFERENCES Clientes(ID)
);

CREATE TABLE DetalleFactura (
  IDFacturaF INT PRIMARY KEY,
  NoFactura INT,
  CodProducto INT,
  CantidadPedida DOUBLE,
  PrecioTotal DOUBLE,
  FOREIGN KEY (NoFactura) REFERENCES Factura(IDFactura),
  FOREIGN KEY (CodProducto) REFERENCES Productos(IDProducto)
);
drop table DetalleFactura;


SELECT Productos.IDProducto, Productos.Descripcion, Productos.PrecioVenta, Vendedor.Nombre 
FROM Productos 
JOIN Vendedor ON Productos.NVendedor = Vendedor.ID;








