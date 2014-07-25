SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema UsedCarLot_2014
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UsedCarLot_2014` ;
CREATE SCHEMA IF NOT EXISTS `UsedCarLot_2014` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `UsedCarLot_2014` ;

-- -----------------------------------------------------
-- Table `UsedCarLot_2014`.`vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot_2014`.`vehicle` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot_2014`.`vehicle` (
  `VIN` VARCHAR(15) NOT NULL,
  `vehicle_make` VARCHAR(45) NOT NULL,
  `vehicle_model` VARCHAR(45) NOT NULL,
  `vehicle_year` VARCHAR(45) NOT NULL,
  `vehicle_color` VARCHAR(45) NOT NULL,
  `vehiclePrice` FLOAT NOT NULL,
  `vehicleSold` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsedCarLot_2014`.`previous_owners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot_2014`.`previous_owners` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot_2014`.`previous_owners` (
  `po_owner_id` INT NOT NULL,
  `po_first_name` CHAR(10) NOT NULL,
  `po_last_name` CHAR(15) NOT NULL,
  `po_address` VARCHAR(45) NOT NULL,
  `po_city` CHAR(30) NOT NULL,
  `po_postal_code` VARCHAR(7) NOT NULL,
  `po_years_owned` INT(2) NOT NULL,
  PRIMARY KEY (`po_owner_id`, `po_first_name`, `po_last_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsedCarLot_2014`.`vehicle_has_previous_owners`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UsedCarLot_2014`.`vehicle_has_previous_owners` ;

CREATE TABLE IF NOT EXISTS `UsedCarLot_2014`.`vehicle_has_previous_owners` (
  `vehicle_VIN` VARCHAR(15) NOT NULL,
  `previous_owners_po_owner_id` INT NOT NULL,
  `previous_owners_po_first_name` CHAR(10) NOT NULL,
  `previous_owners_po_last_name` CHAR(15) NOT NULL,
  PRIMARY KEY (`vehicle_VIN`, `previous_owners_po_owner_id`, `previous_owners_po_first_name`, `previous_owners_po_last_name`),
  INDEX `fk_vehicle_has_previous_owners_previous_owners1_idx` (`previous_owners_po_owner_id` ASC, `previous_owners_po_first_name` ASC, `previous_owners_po_last_name` ASC),
  INDEX `fk_vehicle_has_previous_owners_vehicle_idx` (`vehicle_VIN` ASC),
  CONSTRAINT `fk_vehicle_has_previous_owners_vehicle`
    FOREIGN KEY (`vehicle_VIN`)
    REFERENCES `UsedCarLot_2014`.`vehicle` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_has_previous_owners_previous_owners1`
    FOREIGN KEY (`previous_owners_po_owner_id` , `previous_owners_po_first_name` , `previous_owners_po_last_name`)
    REFERENCES `UsedCarLot_2014`.`previous_owners` (`po_owner_id` , `po_first_name` , `po_last_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
