-- Crear la base de datos
CREATE DATABASE NightHaven;

-- Usar la base de datos creada
USE NightHaven;

-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    puntos INT DEFAULT 0,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    edad INT,
    comunidad VARCHAR(100),
    pueblo VARCHAR(100),
    codigo_postal INT
);

-- Crear la tabla de discotecas
CREATE TABLE discotecas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    latitud DOUBLE NOT NULL,
    longitud DOUBLE NOT NULL,
    valoracion INT,
    comentarios_discotecas VARCHAR(255)
);

-- Crear la tabla de aforo
CREATE TABLE aforo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discoteca_id INT,
    usuario_id INT,
    fecha_aforo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (discoteca_id) REFERENCES discotecas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
	
-- Crear la tabla de logros
CREATE TABLE logros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    puntos_requeridos INT NOT NULL
);

-- Crear la tabla de logros_usuarios (relacionar logros con usuarios)
CREATE TABLE logros_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    logro_id INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (logro_id) REFERENCES logros(id)
);

-- Crear la tabla de publicaciones
CREATE TABLE publicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    contenido TEXT NOT NULL,
    fecha_publi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Crear la tabla de comentarios
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    publicacion_id INT,
    usuario_id INT,
    contenido TEXT NOT NULL,
    fecha_coment TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
