CREATE DATABASE TECHNOLOGY_CENTER;
USE TECHNOLOGY_CENTER;


CREATE TABLE marca_disp (
    id_marca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    marca VARCHAR(100) NOT NULL
);

CREATE TABLE productos (
    id_prod INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_marca INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    nombre_pro VARCHAR(50) NOT NULL,
    cantidad INT,
    FOREIGN KEY (id_marca) REFERENCES marca_disp (id_marca)
);

CREATE TABLE caracteristicas_prod (
    num_prod INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_prod INT NOT NULL,
    procesador VARCHAR(30) NOT NULL,
    ram VARCHAR(30) NOT NULL,
    almacenamiento VARCHAR(30) NOT NULL,
    pantalla VARCHAR(30) NOT NULL,
    sistema_operativo VARCHAR(200) NOT NULL,
    camara VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);

CREATE TABLE precios (
    num_prod INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    precio_normal INT NOT NULL,
    descuento INT NOT NULL,
    FOREIGN KEY (num_prod) REFERENCES caracteristicas_prod(num_prod)
);

CREATE TABLE clientes (
    ci  VARCHAR(20) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    num_cell INTEGER NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    id_prod INT NOT NULL,
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);

CREATE TABLE recibo (
    numero_compra INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    ci_cliente VARCHAR(20) NOT NULL,
    id_admin INT NOT NULL,
    id_prod INT NOT NULL,
    pago INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (ci_cliente) REFERENCES clientes(ci),
    FOREIGN KEY (id_admin) REFERENCES administracion(id_admin),
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod)
);

CREATE TABLE administracion (
    id_admin INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

