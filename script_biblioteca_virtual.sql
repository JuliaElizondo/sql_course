-- *******************************************************************
--                    Creación de la base de datos 
-- *******************************************************************
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
nombre VARCHAR(80) NOT NULL,
apellido VARCHAR(80) NOT NULL
);

-- Tablas con FK
CREATE TABLE usuario (
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_prestamo INT UNSIGNED,
nombre VARCHAR(80) NOT NULL,
apellido VARCHAR(80) NOT NULL,
fecha_nacimiento DATE NOT NULL,
domicilio VARCHAR(50) NOT NULL,
ciudad VARCHAR(25) NOT NULL,
provincia VARCHAR(25) NOT NULL,
pais VARCHAR(25) NOT NULL,
telefono VARCHAR(15),
email VARCHAR(50) NOT NULL
);

CREATE TABLE libro (
id_libro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_autor INT UNSIGNED,
id_categoria INT UNSIGNED,
id_editorial INT UNSIGNED,
id_prestamo INT UNSIGNED,
titulo VARCHAR(100),
ano_edicion INT,
cantidad INT,
precio_dia FLOAT NOT NULL
);

CREATE TABLE prestamo (
id_prestamo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_libro INT UNSIGNED,
id_usuario INT UNSIGNED,
fecha_prestamo DATE NOT NULL,
fecha_devolucion DATE NOT NULL,
precio_prestamo FLOAT NOT NULL,
estado BOOLEAN
);

-- Modificar tablas creadas anteriormente para agregar las FK
-- Tabla Libro
ALTER TABLE libro ADD CONSTRAINT fk_id_autor_libro
	FOREIGN KEY(id_autor) REFERENCES autor(id_autor) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE libro ADD CONSTRAINT fk_id_categoria_libro
	FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE libro ADD CONSTRAINT fk_id_editorial_libro
	FOREIGN KEY(id_editorial) REFERENCES editorial(id_editorial) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE libro ADD CONSTRAINT fk_id_prestamo_libro
	FOREIGN KEY(id_prestamo) REFERENCES prestamo(id_prestamo) ON DELETE SET NULL ON UPDATE CASCADE;

-- Tabla Usuario
ALTER TABLE usuario ADD CONSTRAINT fk_id_prestamo_usuario
	FOREIGN KEY(id_prestamo) REFERENCES prestamo(id_prestamo) ON DELETE SET NULL ON UPDATE CASCADE;

-- Tabla Préstamo
ALTER TABLE prestamo ADD CONSTRAINT fk_id_libro_prestamo
	FOREIGN KEY(id_libro) REFERENCES libro(id_libro) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE prestamo ADD CONSTRAINT fk_id_usuario_prestamo
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON DELETE SET NULL ON UPDATE CASCADE;

-- *******************************************************************
--                   Inserciones de datos
-- *******************************************************************

-- Categoria
INSERT INTO categoria (id_categoria, nombre_categoria) VALUES
(NULL, 'Novela'),
(NULL, 'Fantasía'),
(NULL, 'Ciencia Ficción'),
(NULL, 'Clásicos'),
(NULL, 'Literatura Contemporánea');

-- Editorial
INSERT INTO editorial (id_editorial, nombre_editorial) VALUES
(NULL, 'Penguin Random House'),
(NULL, 'HarperCollins'),
(NULL, 'Simon & Schuster'),
(NULL, 'Planeta'),
(NULL, 'Alfaguara');

-- Autor
INSERT INTO autor (id_autor, nombre, apellido) VALUES
(NULL, 'Gabriel', 'García Márquez'),
(NULL, 'J.K.', 'Rowling'),
(NULL, 'George', 'Orwell'),
(NULL, 'Isabel', 'Allende'),
(NULL, 'Julio', 'Cortázar'),
(NULL, 'Jane', 'Austen'),
(NULL, 'Miguel', 'de Cervantes'),
(NULL, 'J.R.R.', 'Tolkien'),
(NULL, 'Harper', 'Lee'),
(NULL, 'F. Scott', 'Fitzgerald');

-- Usuario
INSERT INTO usuario (id_usuario, nombre, apellido, fecha_nacimiento, domicilio, ciudad, provincia, pais, telefono, email) VALUES
(NULL, 'Carlos', 'Hernández', '1985-06-12', 'Calle Falsa 123', 'Madrid', 'Madrid', 'España', '612345678', 'carlos.hernandez@mail.com'),
(NULL, 'Laura', 'Martínez', '1990-03-22', 'Avenida Siempreviva 742', 'Barcelona', 'Barcelona', 'España', '623456789', 'laura.martinez@mail.com'),
(NULL, 'Miguel', 'Jiménez', '1978-09-09', 'Plaza Mayor 3', 'Valencia', 'Valencia', 'España', '634567890', 'miguel.jimenez@mail.com'),
(NULL, 'Lucía', 'Fernández', '2001-12-18', 'Calle Nueva 22', 'Sevilla', 'Sevilla', 'España', '645678901', 'lucia.fernandez@mail.com'),
(NULL, 'Ana', 'López', '1995-07-29', 'Paseo del Prado 45', 'Granada', 'Andalucía', 'España', '656789012', 'ana.lopez@mail.com'),
(NULL, 'Pedro', 'Gómez', '1982-01-15', 'Calle del Sol 45', 'Alicante', 'Valencia', 'España', '672345678', 'pedro.gomez@mail.com'),
(NULL, 'Sandra', 'López', '1993-05-24', 'Avenida de la Luna 12', 'Murcia', 'Murcia', 'España', '683456789', 'sandra.lopez@mail.com'),
(NULL, 'Raquel', 'Sánchez', '1975-08-13', 'Paseo de los Robles 33', 'Bilbao', 'Vizcaya', 'España', '694567890', 'raquel.sanchez@mail.com'),
(NULL, 'Tomás', 'Ortega', '1988-12-06', 'Calle del Álamo 10', 'Málaga', 'Andalucía', 'España', '675678901', 'tomas.ortega@mail.com'),
(NULL, 'Pablo', 'Vázquez', '1999-11-22', 'Plaza de los Cedros 5', 'Salamanca', 'Castilla y León', 'España', '686789012', 'pablo.vazquez@mail.com');

-- Libro
INSERT INTO libro (id_libro, id_autor, id_categoria, id_editorial, titulo, ano_edicion, cantidad, precio_dia) VALUES
(NULL, 1, 1, 5, 'Cien años de soledad', 1967, 5, 1.2),
(NULL, 2, 2, 1, 'Harry Potter y la piedra filosofal', 1997, 7, 1.5),
(NULL, 3, 3, 2, '1984', 1949, 4, 1.2),
(NULL, 4, 5, 4, 'La casa de los espíritus', 1982, 3, 1.0),
(NULL, 5, 4, 5, 'Rayuela', 1963, 6, 1.2),
(NULL, 6, 4, 3,'Orgullo y prejuicio', 1813, 2, 1.2),
(NULL, 7, 4, 1, 'Don Quijote de la Mancha', 1605, 3, 1.3),
(NULL, 8, 2, 2, 'El señor de los anillos', 1954, 5, 1.4),
(NULL, 9, 1, 3, 'Matar a un ruiseñor', 1960, 4, 1.0),
(NULL, 10, 4, 1, 'El gran Gatsby', 1925, 3, 1.0),
(NULL, 1, 1, 5, 'El amor en los tiempos del cólera', 1985, 4, 1.25),
(NULL, 2, 2, 1, 'Harry Potter y la cámara secreta', 1998, 5, 1.7),
(NULL, 3, 3, 3, 'Rebelión en la granja', 1945, 6, 1.0),
(NULL, 6, 4, 4, 'Eva Luna', 1987, 3, 1.0),
(NULL, 10, 4, 2, 'Cuentos de Eva Luna', 1989, 4, 1.1);

-- Préstamo
INSERT INTO prestamo (id_prestamo, id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado, precio_prestamo) VALUES
(NULL, 1, 2, '2024-11-10', '2024-11-20', TRUE, 12.0),
(NULL, 2, 4, '2024-04-02', '2024-04-15', FALSE, 13.0),
(NULL, 3, 6, '2024-11-12', '2024-11-20', TRUE, 9.6),
(NULL, 4, 3, '2024-06-25', '2024-07-10', FALSE, 18),
(NULL, 5, 8, '2024-11-01', '2024-12-12', TRUE, 58.8),
(NULL, 6, 7, '2024-01-05', '2024-01-30', FALSE, 32.5),
(NULL, 7, 10, '2024-09-11', '2024-10-01', FALSE, 20),
(NULL, 8, 5, '2024-10-10', '2024-11-10', TRUE, 37.2),
(NULL, 9, 9, '2024-03-20', '2024-04-05', FALSE, 16),
(NULL, 10, 1, '2024-11-11', '2024-11-30', TRUE, 22.8);


-- *******************************************************************
--                   Creación de vistas
-- *******************************************************************
-- Primero actualizo el campo id_prestamo en las tablas correspondientes para que queden consistentes las vistas
--  tabla Libro
UPDATE libro 
SET id_prestamo = (
    SELECT id_prestamo 
    FROM prestamo 
    WHERE prestamo.id_libro = libro.id_libro 
      AND prestamo.estado = TRUE
    ORDER BY prestamo.fecha_prestamo DESC
    LIMIT 1
)
WHERE EXISTS (
    SELECT 1 
    FROM prestamo 
    WHERE prestamo.id_libro = Libro.id_libro 
      AND prestamo.estado = TRUE
);
-- tabla Usuario
UPDATE usuario 
SET id_prestamo = (
    SELECT id_prestamo 
    FROM prestamo 
    WHERE prestamo.id_usuario = usuario.id_usuario 
      AND prestamo.estado = TRUE
    ORDER BY prestamo.fecha_prestamo DESC
    LIMIT 1
)
WHERE EXISTS (
    SELECT 1 
    FROM prestamo 
    WHERE prestamo.id_usuario = usuario.id_usuario 
      AND prestamo.estado = TRUE
);

-- Esta vista nos muestra los libros que se encuentran prestados
CREATE VIEW vw_libros_prestados AS (
	SELECT l.id_libro, l.id_autor, l.id_editorial, l.titulo, p.fecha_prestamo, p.fecha_devolucion
    FROM libro l
    JOIN prestamo p ON p.id_libro = l.id_libro
    WHERE p.estado = TRUE);
    

-- Esta vista nos muestra los libros que se encuentran disponibles para ser prestados
CREATE VIEW vw_libros_disponibles AS (SELECT l.id_libro, l.id_autor, l.id_editorial, l.titulo
    FROM libro l
    JOIN prestamo p ON p.id_libro = l.id_libro
    WHERE p.estado = FALSE);

-- Esta vista nos muestra los usuarios que tienen préstamos activos
CREATE VIEW vw_usuarios_prestamos_activos AS (SELECT u.id_usuario, u.nombre, u.apellido, u.domicilio, u.ciudad, u.provincia, u.email, u.id_prestamo FROM usuario u
JOIN prestamo p ON p.id_usuario = u.id_usuario
WHERE p.estado = TRUE);

-- *******************************************************************
--                   Creación de funciones
-- *******************************************************************

-- Función para calcular el valor de un préstamo
DELIMITER //
CREATE FUNCTION calcular_prestamo (fecha_prestamo DATE, fecha_devolucion DATE, precio_dia FLOAT)
RETURNS FLOAT 
NO SQL
BEGIN
	DECLARE precio_prestamo FLOAT;
    DECLARE dias_prestamo FLOAT; 
    SET dias_prestamo = DATEDIFF(fecha_devolucion, fecha_prestamo);
    SET precio_prestamo = dias_prestamo * precio_dia;
    RETURN precio_prestamo;
END // 
DELIMITER ;

-- Función para obtener el titulo del libro con el id
DELIMITER //
CREATE FUNCTION titulo_libro (id INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE titulo_libro VARCHAR(100);
    SELECT titulo INTO titulo_libro
    FROM Libro
    WHERE id_libro = id
    LIMIT 1;
		RETURN titulo_libro;
END //
DELIMITER ;

-- Función para calcular el total de ingresos por préstamos a una fecha determinada
DELIMITER //
CREATE FUNCTION calcular_ingresos_totales_a_fecha(fecha DATE)
RETURNS FLOAT 
READS SQL DATA
BEGIN
    DECLARE total_prestamo FLOAT;

    SELECT SUM(precio_prestamo) INTO total_prestamo
    FROM Prestamo
    WHERE fecha_prestamo < fecha;
    RETURN total_prestamo;
END //
DELIMITER ;

-- *******************************************************************
--                   Creación de stored procedures
-- *******************************************************************

-- Procedimiento para agregar un nuevo libro a la tabla Libro
DELIMITER //
CREATE PROCEDURE sp_insertar_libro(
    IN p_id_autor INT,
    IN p_id_categoria INT,
    IN p_id_editorial INT,
    IN p_id_prestamo INT,
    IN p_titulo VARCHAR(100),
    IN p_ano_edicion INT,
    IN p_cantidad INT,
    IN p_precio_dia FLOAT
)
BEGIN
    INSERT INTO libro (id_autor, id_categoria, id_editorial, id_prestamo, titulo, ano_edicion, cantidad, precio_dia)
    VALUES (p_id_autor, p_id_categoria, p_id_editorial, p_id_prestamo, p_titulo, p_ano_edicion, p_cantidad, p_precio_dia);
END //
DELIMITER ;

-- Procedimiento para obtener libros según un autor determinado
DELIMITER //
CREATE PROCEDURE sp_obtener_libros_por_autor(IN p_id_autor INT)
BEGIN
    SELECT l.id_libro, l.titulo, a.nombre, a.apellido, l.id_editorial
    FROM Libro l
    JOIN autor a ON a.id_autor = l.id_autor
    WHERE l.id_autor = p_id_autor;
END //
DELIMITER ;

-- Procedimiento para ordernar tablas
DELIMITER //
CREATE PROCEDURE sp_ordenar_tablas (IN tabla VARCHAR(40),IN campo VARCHAR(30), IN p_asc_desc VARCHAR(4))
BEGIN
  SET @cons =  CONCAT('SELECT * FROM ', tabla, ' ORDER BY','  ',campo,'  ', p_asc_desc);
  PREPARE consulta FROM @cons;
  EXECUTE consulta;
  DEALLOCATE PREPARE consulta;
END //
DELIMITER ;

