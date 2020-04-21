-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema delilah_RestO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema delilah_RestO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `delilah_RestO` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema delilah_resto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema delilah_resto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `delilah_resto` DEFAULT CHARACTER SET utf8 ;
USE `delilah_RestO` ;

-- -----------------------------------------------------
-- Table `delilah_RestO`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Roles` (
  `Role_Id` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Role_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`User` (
  `User_Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `CompleteName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Cel` INT NOT NULL,
  `Adress` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role_Id` INT NOT NULL,
  `Token` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`User_Id`),
  INDEX `Role_Id_idx` (`Role_Id` ASC) VISIBLE,
  CONSTRAINT `Role_Id`
    FOREIGN KEY (`Role_Id`)
    REFERENCES `delilah_RestO`.`Roles` (`Role_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Plates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Plates` (
  `Plate_id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` FLOAT NOT NULL,
  `Available` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Plate_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Status` (
  `Status_Id` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Status_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Pay_Method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Pay_Method` (
  `Pay_Method_Id` INT NOT NULL AUTO_INCREMENT,
  `Pay-Method` VARCHAR(45) NULL,
  PRIMARY KEY (`Pay_Method_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Order` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `User_id` INT NOT NULL,
  `Hour` TIME NOT NULL,
  `Status_Id` INT NOT NULL,
  `Pay_method_Id` INT NOT NULL,
  `Total` FLOAT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `User_Id_idx` (`User_id` ASC) VISIBLE,
  INDEX `Status_Id_idx` (`Status_Id` ASC) VISIBLE,
  INDEX `Pay_method_idx` (`Pay_method_Id` ASC) VISIBLE,
  CONSTRAINT `User_Id`
    FOREIGN KEY (`User_id`)
    REFERENCES `delilah_RestO`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Status_Id`
    FOREIGN KEY (`Status_Id`)
    REFERENCES `delilah_RestO`.`Status` (`Status_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pay_method`
    FOREIGN KEY (`Pay_method_Id`)
    REFERENCES `delilah_RestO`.`Pay_Method` (`Pay_Method_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Order_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Order_Detail` (
  `Order_Detail_Id` INT NOT NULL AUTO_INCREMENT,
  `Plate_Id` INT NOT NULL,
  `Subtotal` FLOAT NOT NULL,
  PRIMARY KEY (`Order_Detail_Id`),
  INDEX `Plate_Id_idx` (`Plate_Id` ASC) VISIBLE,
  CONSTRAINT `Plate_Id`
    FOREIGN KEY (`Plate_Id`)
    REFERENCES `delilah_RestO`.`Plates` (`Plate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Favorites_Plates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Favorites_Plates` (
  `Plates_Plate_id` INT NOT NULL,
  `User_User_Id` INT NOT NULL,
  PRIMARY KEY (`Plates_Plate_id`, `User_User_Id`),
  INDEX `fk_Plates_has_User_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Plates_has_User_Plates1_idx` (`Plates_Plate_id` ASC) VISIBLE,
  CONSTRAINT `fk_Plates_has_User_Plates1`
    FOREIGN KEY (`Plates_Plate_id`)
    REFERENCES `delilah_RestO`.`Plates` (`Plate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plates_has_User_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `delilah_RestO`.`User` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delilah_RestO`.`Order_has_Order_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_RestO`.`Order_has_Order_Detail` (
  `Order_Id` INT NOT NULL,
  `Order_Detail_Order_Detail_Id` INT NOT NULL,
  PRIMARY KEY (`Order_Id`, `Order_Detail_Order_Detail_Id`),
  INDEX `fk_Order_has_Order_Detail_Order_Detail1_idx` (`Order_Detail_Order_Detail_Id` ASC) VISIBLE,
  INDEX `fk_Order_has_Order_Detail_Order1_idx` (`Order_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_Order_Detail_Order1`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `delilah_RestO`.`Order` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Order_Detail_Order_Detail1`
    FOREIGN KEY (`Order_Detail_Order_Detail_Id`)
    REFERENCES `delilah_RestO`.`Order_Detail` (`Order_Detail_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `delilah_resto` ;

-- -----------------------------------------------------
-- Table `delilah_resto`.`plates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`plates` (
  `Plate_id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Price` FLOAT NOT NULL,
  `Available` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Plate_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`roles` (
  `Role_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Role_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`user` (
  `User_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `CompleteName` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Cel` INT(11) NOT NULL,
  `Adress` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role_Id` INT(11) NOT NULL,
  `Token` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`User_Id`),
  INDEX `Role_Id_idx` (`Role_Id` ASC) VISIBLE,
  CONSTRAINT `Role_Id`
    FOREIGN KEY (`Role_Id`)
    REFERENCES `delilah_resto`.`roles` (`Role_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`favorites_plates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`favorites_plates` (
  `Plates_Plate_id` INT(11) NOT NULL,
  `User_User_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Plates_Plate_id`, `User_User_Id`),
  INDEX `fk_Plates_has_User_User1_idx` (`User_User_Id` ASC) VISIBLE,
  INDEX `fk_Plates_has_User_Plates1_idx` (`Plates_Plate_id` ASC) VISIBLE,
  CONSTRAINT `fk_Plates_has_User_Plates1`
    FOREIGN KEY (`Plates_Plate_id`)
    REFERENCES `delilah_resto`.`plates` (`Plate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plates_has_User_User1`
    FOREIGN KEY (`User_User_Id`)
    REFERENCES `delilah_resto`.`user` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`order_detail` (
  `Order_Detail_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Plate_Id` INT(11) NOT NULL,
  `Subtotal` FLOAT NOT NULL,
  PRIMARY KEY (`Order_Detail_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`pay_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`pay_method` (
  `Pay_Method_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Pay-Method` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Pay_Method_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`status` (
  `Status_Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Status_Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`order` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Order_Detail_Id` INT(11) NOT NULL,
  `User_id` INT(11) NOT NULL,
  `Hour` TIME NOT NULL,
  `Status_Id` INT(11) NOT NULL,
  `Pay_method_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `Order_Detail_Id_idx` (`Order_Detail_Id` ASC) VISIBLE,
  INDEX `User_Id_idx` (`User_id` ASC) VISIBLE,
  INDEX `Status_Id_idx` (`Status_Id` ASC) VISIBLE,
  INDEX `Pay_method_idx` (`Pay_method_Id` ASC) VISIBLE,
  CONSTRAINT `Order_Detail_Id`
    FOREIGN KEY (`Order_Detail_Id`)
    REFERENCES `delilah_resto`.`order_detail` (`Order_Detail_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pay_method`
    FOREIGN KEY (`Pay_method_Id`)
    REFERENCES `delilah_resto`.`pay_method` (`Pay_Method_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Status_Id`
    FOREIGN KEY (`Status_Id`)
    REFERENCES `delilah_resto`.`status` (`Status_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `User_Id`
    FOREIGN KEY (`User_id`)
    REFERENCES `delilah_resto`.`user` (`User_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `delilah_resto`.`order_has_order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delilah_resto`.`order_has_order_detail` (
  `Order_Id` INT(11) NOT NULL,
  `Order_Detail_Order_Detail_Id` INT(11) NOT NULL,
  PRIMARY KEY (`Order_Id`, `Order_Detail_Order_Detail_Id`),
  INDEX `fk_Order_has_Order_Detail_Order_Detail1_idx` (`Order_Detail_Order_Detail_Id` ASC) VISIBLE,
  INDEX `fk_Order_has_Order_Detail_Order1_idx` (`Order_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_Order_Detail_Order1`
    FOREIGN KEY (`Order_Id`)
    REFERENCES `delilah_resto`.`order` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_Order_Detail_Order_Detail1`
    FOREIGN KEY (`Order_Detail_Order_Detail_Id`)
    REFERENCES `delilah_resto`.`order_detail` (`Order_Detail_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
