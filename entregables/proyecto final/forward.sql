-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Proveedores
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Proveedores` ;

-- -----------------------------------------------------
-- Schema Proveedores
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proveedores` ;
USE `Proveedores` ;

-- -----------------------------------------------------
-- Table `Proveedores`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedores`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `Proveedores`.`proveedores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `Proveedores`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedores`.`categoria` ;

CREATE TABLE IF NOT EXISTS `Proveedores`.`categoria` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `Proveedores`.`piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedores`.`piezas` ;

CREATE TABLE IF NOT EXISTS `Proveedores`.`piezas` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `categoria_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_piezas_categoria1_idx` (`categoria_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_categoria1`
    FOREIGN KEY (`categoria_codigo`)
    REFERENCES `Proveedores`.`categoria` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `Proveedores`.`proveedores_has_piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedores`.`proveedores_has_piezas` ;

CREATE TABLE IF NOT EXISTS `Proveedores`.`proveedores_has_piezas` (
  `fecha` DATE NOT NULL,
  `proveedores_codigo` INT NOT NULL,
  `piezas_codigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_proveedores_has_piezas_piezas1_idx` (`piezas_codigo` ASC) VISIBLE,
  INDEX `fk_proveedores_has_piezas_proveedores1_idx` (`proveedores_codigo` ASC) VISIBLE,
  PRIMARY KEY (`fecha`),
  CONSTRAINT `fk_proveedores_has_piezas_proveedores1`
    FOREIGN KEY (`proveedores_codigo`)
    REFERENCES `Proveedores`.`proveedores` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_has_piezas_piezas1`
    FOREIGN KEY (`piezas_codigo`)
    REFERENCES `Proveedores`.`piezas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
