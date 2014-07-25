SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema UsedCarLot
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UsedCarLot` ;
CREATE SCHEMA IF NOT EXISTS `UsedCarLot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `UsedCarLot` ;

-- -----------------------------------------------------
-- Table `UsedCarLot`.`Previous_Owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot`.`Previous_Owner` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot`.`Previous_Owner` (
  `Previous_Owner_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` CHAR(15) NULL,
  `Last_Name` CHAR(15) NULL,
  `Address` VARCHAR(45) NULL,
  `City` CHAR(15) NULL,
  `Postal_Code` VARCHAR(7) NULL,
  PRIMARY KEY (`Previous_Owner_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsedCarLot`.`New_Owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot`.`New_Owner` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot`.`New_Owner` (
  `New_Owner_ID` INT NOT NULL AUTO_INCREMENT,
  `First_Name` CHAR(15) NOT NULL,
  `Last_Name` CHAR(15) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(15) NOT NULL,
  `Postal_Code` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`New_Owner_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsedCarLot`.`Vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot`.`Vehicle` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot`.`Vehicle` (
  `Vin` VARCHAR(15) NOT NULL,
  `Make` CHAR(10) NOT NULL,
  `Model` CHAR(10) NOT NULL,
  `Year` INT(4) NOT NULL,
  `Color` CHAR(10) NOT NULL,
  `On_Lot` TINYINT(1) NOT NULL DEFAULT 1,
  `Price` FLOAT NOT NULL,
  `Previous_Owner_Previous_Owner_ID` INT NOT NULL,
  `New_Owner_New_Owner_ID` INT NOT NULL,
  PRIMARY KEY (`Vin`),
  INDEX `fk_Vehicle_Previous_Owner_idx` (`Previous_Owner_Previous_Owner_ID` ASC),
  INDEX `fk_Vehicle_New_Owner1_idx` (`New_Owner_New_Owner_ID` ASC),
  CONSTRAINT `fk_Vehicle_Previous_Owner`
    FOREIGN KEY (`Previous_Owner_Previous_Owner_ID`)
    REFERENCES `UsedCarLot`.`Previous_Owner` (`Previous_Owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_New_Owner1`
    FOREIGN KEY (`New_Owner_New_Owner_ID`)
    REFERENCES `UsedCarLot`.`New_Owner` (`New_Owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsedCarLot`.`Maintenance_Schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot`.`Maintenance_Schedule` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot`.`Maintenance_Schedule` (
  `Vehicle_Vin` VARCHAR(15) NOT NULL,
  `Engine_Test` DATE NULL,
  `Engine_Pass` TINYINT(1) NULL,
  `Brake_Test` DATE NULL,
  `Brake_Pass` TINYINT(1) NULL,
  `Electrical_Test` DATE NULL,
  `Electrical_Pass` TINYINT(1) NULL,
  `Fluid_Test` DATE NULL,
  `Fluid_Pass` TINYINT(1) NULL,
  `Tire_test` DATE NULL,
  `Tire_Pass` TINYINT(1) NULL,
  `Window_Test` DATE NULL,
  `Window_Pass` TINYINT(1) NULL,
  `Road_Test` DATE NULL,
  `Road_Pass` TINYINT(1) NULL DEFAULT 1,
  
  PRIMARY KEY (`Vehicle_Vin`),
  CONSTRAINT `fk_Maintenance_Schedule_Vehicle1`
    FOREIGN KEY (`Vehicle_Vin`)
    REFERENCES `UsedCarLot`.`Vehicle` (`Vin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
