-- MySQL Script generated by MySQL Workbench
-- Wed Nov  9 13:47:24 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mascotar
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mascotar` ;

-- -----------------------------------------------------
-- Schema mascotar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mascotar` DEFAULT CHARACTER SET utf8mb4 ;
USE `mascotar` ;

-- -----------------------------------------------------
-- Table `mascotar`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`producto` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `precio` FLOAT NOT NULL,
  `descripcion` VARCHAR(60) NOT NULL,
  `linkImagen` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`departamento` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`provincia` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(15) NOT NULL,
  `contraseña` VARCHAR(30) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_departamento`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `mascotar`.`departamento` (`id`),
  CONSTRAINT `fk_provincia`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `mascotar`.`provincia` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_provincia` ON `mascotar`.`usuario` (`idProvincia` ASC) VISIBLE;

CREATE INDEX `fk_departamento` ON `mascotar`.`usuario` (`idDepartamento` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mascotar`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`carrito` (
  `id` INT(11) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_productoCarrito`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mascotar`.`producto` (`id`),
  CONSTRAINT `fk_usuarioCarrito`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mascotar`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_usuarioCarrito` ON `mascotar`.`carrito` (`idUsuario` ASC) VISIBLE;

CREATE INDEX `fk_productoCarrito` ON `mascotar`.`carrito` (`idProducto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mascotar`.`cola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`cola` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`colorprincipal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`colorprincipal` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`colorsecundario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`colorsecundario` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`metodopago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`metodopago` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`orden` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  `idMetodoPago` INT(11) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  `direccionEnvio` VARCHAR(45) NOT NULL,
  `total` FLOAT NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_departamentoOrden`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `mascotar`.`departamento` (`id`),
  CONSTRAINT `fk_metodoPago`
    FOREIGN KEY (`idMetodoPago`)
    REFERENCES `mascotar`.`metodopago` (`id`),
  CONSTRAINT `fk_provinciaOrden`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `mascotar`.`provincia` (`id`),
  CONSTRAINT `fk_usuarioOrden`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mascotar`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_usuarioOrden` ON `mascotar`.`orden` (`idUsuario` ASC) VISIBLE;

CREATE INDEX `fk_metodoPago` ON `mascotar`.`orden` (`idMetodoPago` ASC) VISIBLE;

CREATE INDEX `fk_provinciaOrden` ON `mascotar`.`orden` (`idProvincia` ASC) VISIBLE;

CREATE INDEX `fk_departamentoOrden` ON `mascotar`.`orden` (`idDepartamento` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mascotar`.`detalleorden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`detalleorden` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idOrden` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orden`
    FOREIGN KEY (`idOrden`)
    REFERENCES `mascotar`.`orden` (`id`),
  CONSTRAINT `fk_productoOrden`
    FOREIGN KEY (`idProducto`)
    REFERENCES `mascotar`.`producto` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_orden` ON `mascotar`.`detalleorden` (`idOrden` ASC) VISIBLE;

CREATE INDEX `fk_productoOrden` ON `mascotar`.`detalleorden` (`idProducto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mascotar`.`edad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`edad` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`especie` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`estado` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`orejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`orejas` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`raza` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`sexo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`sexo` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `mascotar`.`mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`mascota` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  `idEstado` INT(11) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  `idEspecie` INT(11) NOT NULL,
  `idRaza` INT(11) NOT NULL,
  `idSexo` INT(11) NOT NULL,
  `idEdad` INT(11) NOT NULL,
  `idColorPrincipal` INT(11) NOT NULL,
  `idColorSecundario` INT(11) NULL DEFAULT NULL,
  `idOrejas` INT(11) NOT NULL,
  `idCola` INT(11) NOT NULL,
  `linkImagen` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cola`
    FOREIGN KEY (`idCola`)
    REFERENCES `mascotar`.`cola` (`id`),
  CONSTRAINT `fk_colorPrincipal`
    FOREIGN KEY (`idColorPrincipal`)
    REFERENCES `mascotar`.`colorprincipal` (`id`),
  CONSTRAINT `fk_colorSecundario`
    FOREIGN KEY (`idColorSecundario`)
    REFERENCES `mascotar`.`colorsecundario` (`id`),
  CONSTRAINT `fk_departamentoMascota`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `mascotar`.`departamento` (`id`),
  CONSTRAINT `fk_edad`
    FOREIGN KEY (`idEdad`)
    REFERENCES `mascotar`.`edad` (`id`),
  CONSTRAINT `fk_especie`
    FOREIGN KEY (`idEspecie`)
    REFERENCES `mascotar`.`especie` (`id`),
  CONSTRAINT `fk_estado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `mascotar`.`estado` (`id`),
  CONSTRAINT `fk_orejas`
    FOREIGN KEY (`idOrejas`)
    REFERENCES `mascotar`.`orejas` (`id`),
  CONSTRAINT `fk_provinciaMascota`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `mascotar`.`provincia` (`id`),
  CONSTRAINT `fk_raza`
    FOREIGN KEY (`idRaza`)
    REFERENCES `mascotar`.`raza` (`id`),
  CONSTRAINT `fk_sexo`
    FOREIGN KEY (`idSexo`)
    REFERENCES `mascotar`.`sexo` (`id`),
  CONSTRAINT `fk_usuarioMascota`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mascotar`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_usuarioMascota` ON `mascotar`.`mascota` (`idUsuario` ASC) VISIBLE;

CREATE INDEX `fk_estado` ON `mascotar`.`mascota` (`idEstado` ASC) VISIBLE;

CREATE INDEX `fk_provinciaMascota` ON `mascotar`.`mascota` (`idProvincia` ASC) VISIBLE;

CREATE INDEX `fk_departamentoMascota` ON `mascotar`.`mascota` (`idDepartamento` ASC) VISIBLE;

CREATE INDEX `fk_especie` ON `mascotar`.`mascota` (`idEspecie` ASC) VISIBLE;

CREATE INDEX `fk_raza` ON `mascotar`.`mascota` (`idRaza` ASC) VISIBLE;

CREATE INDEX `fk_sexo` ON `mascotar`.`mascota` (`idSexo` ASC) VISIBLE;

CREATE INDEX `fk_edad` ON `mascotar`.`mascota` (`idEdad` ASC) VISIBLE;

CREATE INDEX `fk_colorPrincipal` ON `mascotar`.`mascota` (`idColorPrincipal` ASC) VISIBLE;

CREATE INDEX `fk_colorSecundario` ON `mascotar`.`mascota` (`idColorSecundario` ASC) VISIBLE;

CREATE INDEX `fk_orejas` ON `mascotar`.`mascota` (`idOrejas` ASC) VISIBLE;

CREATE INDEX `fk_cola` ON `mascotar`.`mascota` (`idCola` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mascotar`.`mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mascotar`.`mensaje` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  `asunto` VARCHAR(40) NULL DEFAULT NULL,
  `texto` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuarioMensaje`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mascotar`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE INDEX `fk_usuarioMensaje` ON `mascotar`.`mensaje` (`idUsuario` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
