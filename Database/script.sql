SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bestbuydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bestbuydb` ;

-- -----------------------------------------------------
-- Table `bestbuydb`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Account` (
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NULL,
  `RealName` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;

CREATE TABLE `UserRoles` (
  `RoleID` INT(10) UNSIGNED NOT NULL auto_increment,
  `Username` VARCHAR(45) NOT NULL,
  `Authority` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`),
  KEY `FK_user_roles` (`Username`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
);

INSERT INTO Account (Username,Password, Enable)
VALUES ('mkyong', '123456', TRUE);
 
INSERT INTO UserRoles (RoleID, Username,Authority)
VALUES (1, 'mkyong', 'ROLE_ADMIN');

-- -----------------------------------------------------
-- Table `bestbuydb`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Cart` (
  `CartId` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(45) NULL,
  `TotalPrice` DOUBLE NULL,
  PRIMARY KEY (`CartId`),
  INDEX `FK_Account_idx` (`Username` ASC),
  CONSTRAINT `FK_Account`
    FOREIGN KEY (`Username`)
    REFERENCES `bestbuydb`.`Account` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Brand` (
  `BrandId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`BrandId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Category` (
  `CategoryId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Product` (
  `ProductId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Description` VARCHAR(2000) NULL,
  `Price` DOUBLE NULL,
  `Rating` DOUBLE NULL,
  `Screen` INT NULL,
  `Warranty` INT NULL,
  `Quantity` INT NULL,
  `ImageUrl` VARCHAR(45) NULL,
  `BrandId` INT NULL,
  `CategoryId` INT NULL,
  `Tag` INT NULL,
  PRIMARY KEY (`ProductId`),
  INDEX `FK_Brand_idx` (`BrandId` ASC),
  INDEX `FK_Category_idx` (`CategoryId` ASC),
  INDEX `FK_Product_idx` (`Tag` ASC),
  CONSTRAINT `FK_Brand`
    FOREIGN KEY (`BrandId`)
    REFERENCES `bestbuydb`.`Brand` (`BrandId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Category`
    FOREIGN KEY (`CategoryId`)
    REFERENCES `bestbuydb`.`Category` (`CategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product`
    FOREIGN KEY (`Tag`)
    REFERENCES `bestbuydb`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Cart_Detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Cart_Detail` (
  `CartId` INT NOT NULL,
  `ProductId` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`CartId`, `ProductId`),
  INDEX `FK_Product_idx` (`ProductId` ASC),
  CONSTRAINT `FK_CartDT_Cart`
    FOREIGN KEY (`CartId`)
    REFERENCES `bestbuydb`.`Cart` (`CartId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CartDT_Product`
    FOREIGN KEY (`ProductId`)
    REFERENCES `bestbuydb`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Comment` (
  `CommentId` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(45) NULL,
  `ProductId` INT NULL,
  `Content` VARCHAR(2000) NULL,
  INDEX `FK_Product_idx` (`ProductId` ASC),
  PRIMARY KEY (`CommentId`),
  INDEX `FK_Account_idx` (`Username` ASC),
  CONSTRAINT `FK_Comment_Product`
    FOREIGN KEY (`ProductId`)
    REFERENCES `bestbuydb`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comment_Account`
    FOREIGN KEY (`Username`)
    REFERENCES `bestbuydb`.`Account` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bestbuydb`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Image` (
  `ImageId` INT NOT NULL AUTO_INCREMENT,
  `Url` VARCHAR(45) NULL,
  `ProductId` INT NULL,
  PRIMARY KEY (`ImageId`),
  INDEX `FK_Product_idx` (`ProductId` ASC),
  CONSTRAINT `FK_Image_Product`
    FOREIGN KEY (`ProductId`)
    REFERENCES `bestbuydb`.`Product` (`ProductId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bestbuydb`.`Brand`
-- -----------------------------------------------------
START TRANSACTION;
USE `bestbuydb`;
INSERT INTO `bestbuydb`.`Brand` (`BrandId`, `Name`) VALUES (1, 'Samsung');
INSERT INTO `bestbuydb`.`Brand` (`BrandId`, `Name`) VALUES (2, 'LG');
INSERT INTO `bestbuydb`.`Brand` (`BrandId`, `Name`) VALUES (3, 'Sony');
INSERT INTO `bestbuydb`.`Brand` (`BrandId`, `Name`) VALUES (4, 'Panasonic');
INSERT INTO `bestbuydb`.`Brand` (`BrandId`, `Name`) VALUES (5, 'Sharp');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bestbuydb`.`Category`
-- -----------------------------------------------------
START TRANSACTION;
USE `bestbuydb`;
INSERT INTO `bestbuydb`.`Category` (`CategoryId`, `Name`) VALUES (1, 'All Flat-Panel');
INSERT INTO `bestbuydb`.`Category` (`CategoryId`, `Name`) VALUES (2, 'LCD');
INSERT INTO `bestbuydb`.`Category` (`CategoryId`, `Name`) VALUES (3, 'LED');
INSERT INTO `bestbuydb`.`Category` (`CategoryId`, `Name`) VALUES (4, 'Plasma');
INSERT INTO `bestbuydb`.`Category` (`CategoryId`, `Name`) VALUES (5, '3D');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bestbuydb`.`Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `bestbuydb`;
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy a high-quality viewing experience with this Samsung 32\" LED HDTV that features Wide Color Enhancer Plus and Clear Motion Rate (CMR) 60 technologies for colorful, natural-looking visuals and detailed images. Two 5W speakers offer lush audio. ', 229.99, 4.5, 32, 12, NULL, 'images/m1.jpg', 1, 1, NULL);
INSERT INTO `bestbuydb`.`product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won\'t scratch your screen. ', '19.99', '3.5', '12', 'images/m2.jpg', '1');
INSERT INTO `bestbuydb`.`product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won\'t scratch your screen. ', '19.99', '3.5', '12', 'images/m2.jpg', '1');
INSERT INTO `bestbuydb`.`product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won\'t scratch your screen. ', '19.99', '3.5', '12', 'images/m2.jpg', '1');
INSERT INTO `bestbuydb`.`image` (`ImageId`, `Url`, `ProductId`) VALUES ('1', 'images/m4.jpg', '1');
INSERT INTO `bestbuydb`.`image` (`ImageId`, `Url`, `ProductId`) VALUES ('2', 'images/m5.jpg', '1');
INSERT INTO `bestbuydb`.`image` (`ImageId`, `Url`, `ProductId`) VALUES ('3', 'images/m6.jpg', '1');

/*
CREATE TABLE `users` (
  `USER_ID` INT(10) UNSIGNED NOT NULL,
  `USERNAME` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_roles` (
  `USER_ROLE_ID` INT(10) UNSIGNED NOT NULL,
  `USER_ID` INT(10) UNSIGNED NOT NULL,
  `AUTHORITY` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FK_user_roles` (`USER_ID`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO users (USER_ID, USERNAME,PASSWORD, ENABLED)
VALUES (1, 'admin', 'admin', TRUE);
 
INSERT INTO user_roles (USER_ROLE_ID, USER_ID,AUTHORITY)
VALUES (1, 1, 'ROLE_ADMIN');
*/
COMMIT;

