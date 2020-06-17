USE MATERIALTEC
GO

CREATE TABLE ROL(
ID      INT NOT NULL IDENTITY,
NAME  VARCHAR(50) NOT NULL,
PRIMARY KEY (ID)
)
GO


CREATE TABLE USUARIO(
ID           INT      NOT NULL IDENTITY,
USERNAME       NVARCHAR(100),
NOMBRE       NVARCHAR(100),
APELLIDO       NVARCHAR(100),
PASSWORD 	NVARCHAR(255),
ACTIVO		INT DEFAULT 0,
FK_ID_ROLE	INT NOT NULL,
CREATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (ID),
FOREIGN KEY (FK_ID_ROLE) REFERENCES ROL(ID)
)
GO


CREATE TABLE CATEGORIA
(
    ID         INT      NOT NULL IDENTITY,
    NOMBRE     NVARCHAR(50),
    ACTIVO     INT NOT NULL DEFAULT 1,
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID)
)
GO


CREATE TABLE ALMACEN
(
    ID          INT     NOT NULL IDENTITY,
    NOMBRE      NVARCHAR(100),
    CAPACIDAD   INT     NULL,
    CREATED_AT  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (ID)
)
GO


CREATE TABLE PRODUCTO
(
    ID           INT      NOT NULL IDENTITY,
    NOMBRE       NVARCHAR(100),
    DESCRIPCION  TEXT,
    CANTIDAD     INT,
    PRECIO       FLOAT,
    PUNTO_REORDEN INT,
    GARANTIA     DATE,
    TIENDA       INT,
    AUTORIZADO   INT DEFAULT 0,
    COSTO        FLOAT,
    COMPRADO     INT DEFAULT 0,
    DESCUENTO    INT DEFAULT 0,
    FK_CATEGORIA INT NOT NULL,
    FK_ALMACEN   INT NOT NULL,
    ACTIVO       INT NOT NULL DEFAULT 1,
    CREATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_CATEGORIA) REFERENCES CATEGORIA (ID),
    FOREIGN KEY (FK_ALMACEN) REFERENCES ALMACEN (ID)
)
GO


CREATE TABLE METODO_PAGO
(
    ID          INT NOT NULL IDENTITY,
    NOMBRE      NVARCHAR(100),
	PRIMARY KEY (ID)
)
GO


CREATE TABLE CLIENTE
(
    ID          INT NOT NULL IDENTITY,
    TEL        INT NOT NULL,
    EMAIL NVARCHAR(255),
    ACTIVO           INT,
	FK_ID_USER  INT NOT NULL,

    CREATED_AT       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_ID_USER) REFERENCES USUARIO (ID)
)
GO

CREATE TABLE DIRECCION
(
    ID         INT      NOT NULL IDENTITY,
    ESTADO     NVARCHAR(50),
    CIUDAD     NVARCHAR(50),
    MUNICIPIO  NVARCHAR(50),
    COLONIA    NVARCHAR(100),
    CALLE      NVARCHAR(100),
    CP         NVARCHAR(8),
    NUMERO     NVARCHAR(10),
    ACTIVO     INT,
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FK_CLIENTE INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_CLIENTE) REFERENCES CLIENTE (ID)
)
GO
CREATE TABLE ORDEN
(
    ID          INT NOT NULL IDENTITY,
    TOTAL       FLOAT,
    SUBTOTAL    FLOAT,
    PAGADO      INT DEFAULT 0,
    DESCUENTO   FLOAT DEFAULT 0,
    NUMERO_GUIA NVARCHAR(100) NULL,
    CREATED_AT DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_CLIENT INT NOT NULL,
	FK_METODO_PAGO INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_CLIENT) REFERENCES CLIENTE (ID),
    FOREIGN KEY (FK_METODO_PAGO) REFERENCES METODO_PAGO (ID)
)
GO


CREATE TABLE ORDEN_PRODUCTO
(
    ID          INT NOT NULL IDENTITY,
    PRECIO      FLOAT,
    CANTIDAD    INT, 
	FK_PRODUCTO INT NOT NULL,
	FK_ORDEN    INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PRODUCTO) REFERENCES PRODUCTO (ID),
    FOREIGN KEY (FK_ORDEN) REFERENCES ORDEN (ID)
)
GO


CREATE TABLE IMAGEN_PRODUCTO
(
    ID          INT NOT NULL IDENTITY,
    IMAGEN      NVARCHAR(100),
    PRINCIPAL   INT NOT NULL DEFAULT 0,
    FK_PRODUCTO INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PRODUCTO) REFERENCES PRODUCTO (ID)
)
GO
CREATE TABLE PROMOCION
(
    ID          INT NOT NULL IDENTITY,
    TITULO      NVARCHAR(100),
    DESCRIPCION NVARCHAR(100),
    AUTORIZADO  INT DEFAULT 0,
    FECHA_INICIAL DATE,
    FECHA_FINAL DATE,
    ACTIVO      INT DEFAULT 0,
    PRIMARY KEY (ID)
)
GO
CREATE TABLE TIPO_PROMOCION
(
    ID          INT NOT NULL IDENTITY,
    NOMBRE      NVARCHAR(100),

    PRIMARY KEY (ID)
)
GO
CREATE TABLE PRODUCTO_PROMOCION
(
    ID          INT NOT NULL IDENTITY,
    DESCUENTO   INT,
    PLUS        INT,
    ACTIVE      INT DEFAULT 0,
    CREATED_AT  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_TIPO_PROMOCION INT NOT NULL,
	FK_PROMOCION INT NOT NULL,
	FK_PRODUCTO INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_TIPO_PROMOCION) REFERENCES TIPO_PROMOCION (ID),
    FOREIGN KEY (FK_PROMOCION) REFERENCES PROMOCION (ID),
    FOREIGN KEY (FK_PRODUCTO) REFERENCES PRODUCTO (ID)
)
GO
CREATE TABLE PROVEEDOR
(
    ID          INT NOT NULL IDENTITY,
    NOMBRE      NVARCHAR(100),
    RFC         NVARCHAR(100),

    PRIMARY KEY (ID)
)
GO
CREATE TABLE PEDIDO_PROVEEDOR
(
    ID          INT NOT NULL IDENTITY,
    PRECIO_TOTAL FLOAT,
    PAGADO      INT DEFAULT 0,
    AUTORIZADO  INT DEFAULT 0,
    FECHA       DATE,
    ACTIVO      INT DEFAULT 1,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_PROVEEDOR INT NOT NULL,
	FK_USUARIO  INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PROVEEDOR) REFERENCES PROVEEDOR (ID),
    FOREIGN KEY (FK_USUARIO) REFERENCES USUARIO (ID),
)
GO
CREATE TABLE FACTURA
(
    ID          INT NOT NULL IDENTITY,
    PAGO_TOTAL  FLOAT,
    FECHA_PAGO  DATE,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_PEDIDO_PROVEEDOR INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PEDIDO_PROVEEDOR) REFERENCES PEDIDO_PROVEEDOR (ID)
)
GO
CREATE TABLE FACTURA_PRODUCTO
(
    ID          INT NOT NULL IDENTITY,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_FACTURA  INT NOT NULL,
	FK_PRODUCTO INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (FK_FACTURA) REFERENCES FACTURA (ID),
    FOREIGN KEY (FK_PRODUCTO) REFERENCES PRODUCTO (ID),

)
GO
CREATE TABLE PRODUCTO_PROVEEDOR
(
    ID          INT NOT NULL IDENTITY,
    NOMBRE      NVARCHAR(100),
    DESCRIPCION TEXT,
    PRECIO      FLOAT,
    GARANTIA    INT DEFAULT 30,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (ID),
)
GO
CREATE TABLE PRODUCTO_PEDIDO
(
    ID          INT NOT NULL IDENTITY,
    CANTIDAD    INT,
    COSTO       FLOAT,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_PRODUCTO_PROVEEDOR INT NOT NULL,
	FK_PEDIDO_PROVEEDOR INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PRODUCTO_PROVEEDOR) REFERENCES PRODUCTO_PROVEEDOR (ID),
    FOREIGN KEY (FK_PEDIDO_PROVEEDOR) REFERENCES PEDIDO_PROVEEDOR (ID)

)
GO
CREATE TABLE DEVOLUCION_PEDIDO
(
    ID          INT NOT NULL IDENTITY,
    CANTIDAD    INT,
    RAZON       NVARCHAR(100),
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FK_PEDIDO_PROVEEDOR INT NOT NULL,
	FK_PRODUCTO_PEDIDO INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_PEDIDO_PROVEEDOR) REFERENCES PEDIDO_PROVEEDOR (ID),
    FOREIGN KEY (FK_PRODUCTO_PEDIDO) REFERENCES PRODUCTO_PEDIDO (ID)
)
GO
CREATE TABLE GERENTE_VENTA
(
    ID          INT NOT NULL IDENTITY,
    CRATED_AT   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (ID)
)
GO
CREATE TABLE CHAT
(
    ID          INT NOT NULL IDENTITY,
    MENSAJE     NVARCHAR(100),
	FK_DESTINATARIO INT NOT NULL,
	FK_REMITENTE INT NOT NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (FK_DESTINATARIO) REFERENCES USUARIO (ID),
    FOREIGN KEY (FK_REMITENTE) REFERENCES USUARIO (ID)
)
go