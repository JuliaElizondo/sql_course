-- Creación de la base de datos 

DROP DATABASE IF EXISTS biblioteca_virtual;
CREATE DATABASE biblioteca_virtual;
USE biblioteca_virtual;

-- Creación de tablas
-- Tablas sólo con PK
CREATE TABLE categoria (
id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE editorial (
id_editorial INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_editorial VARCHAR(30) NOT NULL
);

CREATE TABLE autor (
id_autor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_apellido VARCHAR(80) NOT NULL
);

-- Tablas con FK
CREATE TABLE usuario (
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_prestamo INT UNSIGNED,
nombre_apellido VARCHAR(80) NOT NULL,
fecha_nacimiento DATE NOT NULL,
domilicio VARCHAR(50) NOT NULL,
ciudad VARCHAR(25) NOT NULL,
provincia VARCHAR(25) NOT NULL,
pais VARCHAR(25) NOT NULL,
teléfono VARCHAR(15),
email VARCHAR(50) NOT NULL
);

CREATE TABLE libro (
id_libro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_autor INT UNSIGNED,
id_categoria INT UNSIGNED,
id_editorial INT UNSIGNED,
id_prestamo INT UNSIGNED,
titulo VARCHAR(100),
ano_edicion YEAR,
cantidad INT,
precio_dia INT NOT NULL
);

CREATE TABLE prestamo (
id_prestamo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_libro INT UNSIGNED,
id_usuario INT UNSIGNED,
fecha_prestamo DATE NOT NULL,
fecha_devolucion DATE NOT NULL,
precio_prestamo INT NOT NULL,
estado BOOLEAN
);


-- Modificar tablas creadas anteriormente para agregar las FK
-- Tabla Libro
ALTER TABLE libro ADD CONSTRAINT fk_id_autor_libro
	FOREIGN KEY(id_autor) REFERENCES autor(id_autor);
ALTER TABLE libro ADD CONSTRAINT fk_id_categoria_libro
	FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE libro ADD CONSTRAINT fk_id_editorial_libro
	FOREIGN KEY(id_editorial) REFERENCES editorial(id_editorial);
ALTER TABLE libro ADD CONSTRAINT fk_id_prestamo_libro
	FOREIGN KEY(id_prestamo) REFERENCES prestamo(id_prestamo);

-- Tabla Usuario
ALTER TABLE usuario ADD CONSTRAINT fk_id_prestamo_usuario
	FOREIGN KEY(id_prestamo) REFERENCES prestamo(id_prestamo);

-- Tabla Préstamo
ALTER TABLE prestamo ADD CONSTRAINT fk_id_libro_prestamo
	FOREIGN KEY(id_libro) REFERENCES libro(id_libro);
ALTER TABLE prestamo ADD CONSTRAINT fk_id_usuario_prestamo
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario);

