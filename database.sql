CREATE DATABASE IF NOT EXISTS radio_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE radio_db;

CREATE TABLE IF NOT EXISTS Area (
  id_area INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_area VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_area)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Modelo_radio (
  id_modelo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_modelo VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_modelo)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Programador (
  id_programador INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_programador VARCHAR(150) NOT NULL,
  puesto VARCHAR(100),
  PRIMARY KEY (id_programador)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Tipo_Empleado (
  id_tipo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_tipo VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_tipo)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Empresa (
  id_empresa INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre_empresa VARCHAR(150) NOT NULL,
  PRIMARY KEY (id_empresa)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Radio (
  id_radio INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_programador INT UNSIGNED NOT NULL,
  id_tipo INT UNSIGNED NOT NULL,
  num_tgr VARCHAR(50),
  correo VARCHAR(254),
  nombre_puesto VARCHAR(100),
  id_empresa INT UNSIGNED NOT NULL,
  id_area INT UNSIGNED NOT NULL,
  id_modelo INT UNSIGNED NOT NULL,
  serie VARCHAR(100),
  fecha DATE,
  PRIMARY KEY (id_radio),
  KEY idx_radio_programador (id_programador),
  KEY idx_radio_tipo (id_tipo),
  KEY idx_radio_empresa (id_empresa),
  KEY idx_radio_area (id_area),
  KEY idx_radio_modelo (id_modelo),
  CONSTRAINT fk_radio_programador
    FOREIGN KEY (id_programador) REFERENCES Programador (id_programador)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_radio_tipo
    FOREIGN KEY (id_tipo) REFERENCES Tipo_Empleado (id_tipo)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_radio_empresa
    FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_radio_area
    FOREIGN KEY (id_area) REFERENCES Area (id_area)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_radio_modelo
    FOREIGN KEY (id_modelo) REFERENCES Modelo_radio (id_modelo)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO Area (id_area, nombre_area) VALUES
  (1, 'Operaciones'),
  (2, 'Seguridad');

INSERT INTO Modelo_radio (id_modelo, nombre_modelo) VALUES
  (1, 'XPR 3500e'),
  (2, 'DEP 450');

INSERT INTO Programador (id_programador, nombre_programador, puesto) VALUES
  (1, 'Ana Lopez', 'Tecnica de radio'),
  (2, 'Carlos Ruiz', 'Supervisor');

INSERT INTO Tipo_Empleado (id_tipo, nombre_tipo) VALUES
  (1, 'Planta'),
  (2, 'Contratista');

INSERT INTO Empresa (id_empresa, nombre_empresa) VALUES
  (1, 'Empresa Ejemplo'),
  (2, 'Servicios Ejemplo');

INSERT INTO Radio (
  id_radio, id_programador, id_tipo, num_tgr, correo, nombre_puesto,
  id_empresa, id_area, id_modelo, serie, fecha
) VALUES
  (1, 1, 1, 'TGR-001', 'ana@example.com', 'Tecnica de radio', 1, 1, 1, 'SER-10001', '2026-01-15'),
  (2, 2, 2, 'TGR-002', 'carlos@example.com', 'Supervisor', 2, 2, 2, 'SER-10002', '2026-02-20');
