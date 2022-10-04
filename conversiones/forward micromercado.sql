-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema consecionaria
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema micromercado
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `micromercado` ;

-- -----------------------------------------------------
-- Schema micromercado
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `micromercado` ;
USE `micromercado` ;

-- -----------------------------------------------------
-- Table `micromercado`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `micromercado`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `micromercado`.`Clientes` (
  `cedula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo_elect` VARCHAR(45) NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `micromercado`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `micromercado`.`producto` ;

CREATE TABLE IF NOT EXISTS `micromercado`.`producto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio_unit` FLOAT NOT NULL,
  `un_de_venta` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `micromercado`.`formas_de_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `micromercado`.`formas_de_pago` ;

CREATE TABLE IF NOT EXISTS `micromercado`.`formas_de_pago` (
  `id_formaP` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_formaP`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `micromercado`.`factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `micromercado`.`factura` ;

CREATE TABLE IF NOT EXISTS `micromercado`.`factura` (
  `no_factura` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `Clientes_cedula` INT NOT NULL,
  `producto_codigo` INT NOT NULL,
  `formas_de_pago_id_formaP` INT NOT NULL,
  PRIMARY KEY (`no_factura`),
  INDEX `fk_producto_has_Clientes_Clientes1_idx` (`Clientes_cedula` ASC) VISIBLE,
  INDEX `fk_producto_has_Clientes_producto_idx` (`producto_codigo` ASC) VISIBLE,
  INDEX `fk_factura_formas_de_pago1_idx` (`formas_de_pago_id_formaP` ASC) VISIBLE,
  CONSTRAINT `fk_producto_has_Clientes_producto`
    FOREIGN KEY (`producto_codigo`)
    REFERENCES `micromercado`.`producto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_Clientes_Clientes1`
    FOREIGN KEY (`Clientes_cedula`)
    REFERENCES `micromercado`.`Clientes` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_formas_de_pago1`
    FOREIGN KEY (`formas_de_pago_id_formaP`)
    REFERENCES `micromercado`.`formas_de_pago` (`id_formaP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
