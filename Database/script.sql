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
  `Address` VARCHAR(1000) NULL,
  `WishId` INT(10) NULL,
  `Enable` tinyint(1) NOT NULL,
  `AvatarUrl` VARCHAR(45) NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `FK_account_cart` FOREIGN KEY (`WishId`) REFERENCES `Cart` (`CartId`))
ENGINE = InnoDB;

CREATE TABLE `UserRoles` (
  `RoleID` INT(10) UNSIGNED NOT NULL auto_increment,
  `Username` VARCHAR(45) NOT NULL,
  `Authority` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`),
  KEY `FK_user_roles` (`Username`),
  CONSTRAINT `FK_user_roles` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
);

-- -----------------------------------------------------
-- Table `bestbuydb`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`Cart` (
  `CartId` INT NOT NULL AUTO_INCREMENT,
  `Username` VARCHAR(45) NULL,
  `TotalPrice` DOUBLE NULL,
  `CartDate` DATE NULL,
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
  `SalePrice` DOUBLE NULL,
  `Rating` DOUBLE NULL DEFAULT 0.0,
  `RateAmount` INT NULL DEFAULT 0,
  `Screen` INT NULL,
  `Warranty` INT NULL,
  `Quantity` INT NULL DEFAULT 0,
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


-- -----------------------------------------------------
-- Table `bestbuydb`.`sale_off`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bestbuydb`.`sale_off` (
  `SaleoffId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(1000) NULL,
  `Description` VARCHAR(2000) NULL,
  `Percent` INT NULL,
  `FromDate` DATE NULL,
  `ToDate` DATE NULL,
  PRIMARY KEY (`SaleoffId`))
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

iNSERT INTO Cart (TotalPrice) VALUES (0);

INSERT INTO Account (Username,Password, Enable, AvatarUrl, WishId)
VALUES ('admin', 'admin', TRUE, 'images/avatar.jpg', 1);
 
INSERT INTO UserRoles (RoleID, Username,Authority)
VALUES (1, 'admin', 'ROLE_ADMIN');

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

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 65\" Class (64-1/2\" Diag.) - LED - 1080p - 120Hz - Smart - HDTV', 'Samsung UN65F6300AFXZA LED HDTV: A spacious 1080p screen brings your home entertainment experience to new levels. Watch the finest details come to life on this Samsung LED HDTV and easily access movies, the Web and your mobile devices with a variety of smart technology.', 1799.99, 4.7, 65, 12, NULL, 'images/1_ch.jpg', 1, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('1', 'images/1_phu1.jpg', '1');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('2', 'images/1_phu2.jpg', '1');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('3', 'images/1_phu3.jpg', '1');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 60\" Class (60\" Diag.) - LED - 1080p - 240Hz - Smart - 3D - HDTV', 'Samsung UN60F8000BFXZA LED HDTV: Spacious 1080p LED screen displays your favorite visual entertainment in 2D or 3D. Smart Hub brings you apps, video and music streaming, social networking and more, while the built-in Web browser lets you surf the Internet on your TV.', 2599.99, 4.8, 60, 12, NULL, 'images/2_ch.jpg', 1, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('4', 'images/2_phu1.jpg', '2');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('5', 'images/2_phu2.jpg', '2');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('6', 'images/2_phu3.jpg', '2');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 75\" Class (74-1/2\" Diag.) - LED - 1080p - 120Hz - Smart - 3D - HDTV', 'Samsung UN75F6400AFXZA LED HDTV: Make the most of your home theater space with an enormous 1080p LED display. Watch all your favorite movies, TV shows and more in 2D or 3D, stream video, check your social networks and surf the Internet from your TV.', 3499.99, 4.9, 75, 12, NULL, 'images/3_ch.jpg', 1, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('7', 'images/3_phu1.jpg', '3');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('8', 'images/3_phu2.jpg', '3');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('9', 'images/3_phu3.jpg', '3');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 51\" Class (50-3/4\" Diag.) - Plasma - 1080p - 600Hz - Smart - 3D - HDTV', 'This Samsung PN51F8500AFXZA 51\" plasma 3D HDTV features vibrant 1080p resolution. To build a complete 3D home theater system, we recommend you purchase a 3D Blu-ray player, high-speed HDMI cable and an A/V receiver that is compatible with 3D Products.', 1899.98, 4.7, 51, 12, NULL, 'images/4_ch.jpg', 1, 4, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('10', 'images/4_phu1.jpg', '4');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('11', 'images/4_phu2.jpg', '4');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Samsung - 60\" Class (60\" Diag.) - LED - 1080p - 120Hz - Smart - HDTV', 'With Clear Motion Rate 240 technology, this Samsung 60" UN60F6300AFXZA 120Hz LED HDTV delivers crystal-clear visuals during fast-action sequences. Surf the Web, download apps, watch content and more with ease via built-in Wi-Fi.', 1399.99, 4.7, 60, 12, NULL, 'images/5_ch.jpg', 1, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('12', 'images/5_phu1.jpg', '5');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('13', 'images/5_phu2.jpg', '5');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'LG - 47\" Class (46-9/10\" Diag.) - LED - 1080p - 60Hz - HDTV', 'Experience your favorite entertainment in stunning 1080p resolution with this LG 47LN5200 LED HDTV that features Resolution Upscaler, Triple XD Engine and Picture Wizard for vibrant visuals. Two 10W speakers produce robust, balanced audio.', 449.99, 5, 47, 12, NULL, 'images/6_ch.jpg', 2, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('14', 'images/6_phu1.jpg', '6');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('15', 'images/6_phu2.jpg', '6');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sony - 55\" Class (54-5/8\" Diag.) - LED - 1080p - 240Hz - Smart - 3D - HDTV', 'This Sony KDL55W900A HDTV supports 3D and 2D images in 1080p resolution. To build a complete 3D home theater system, we recommend you purchase a 3D Blu-ray player, high-speed HDMI cable and an A/V receiver that is compatible with 3D Products.', 1999.99, 4.9, 55, 12, NULL, 'images/7_ch.jpg', 3, 5, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('16', 'images/7_phu1.jpg', '7');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('17', 'images/7_phu2.jpg', '7');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'LG - 24\" Class (23-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'This LG 24LN451B HDTV delivers up to 720p resolution and features LED backlight technology for lush, stunning images. The VESA-compliant 100mm x 100mm pattern facilitates wall mounting for flexible placement options.', 149.99, 4, 24, 12, NULL, 'images/8_ch.jpg', 2, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('18', 'images/8_phu1.jpg', '8');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('19', 'images/8_phu2.jpg', '8');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'LG - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Enjoy arresting home entertainment with this LG 32LN520B HDTV that features 720p resolution and LED backlight technology for bright, clear, vibrant images. Virtual surround sound technology delivers immersive, realistic audio.', 229.99, 3.7, 32, 12, NULL, 'images/9_ch.jpg', 2, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('20', 'images/9_phu1.jpg', '9');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('21', 'images/9_phu2.jpg', '9');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'LG - 47\" Class (46-9/10\" Diag.) - LCD - 1080p - 120Hz - HDTV', 'This LG 47CS570 47" HDTV features a Triple XD engine, Picture Wizard II technology and 8 picture modes for clear, detailed images. Two 10W speakers with Clear Voice II technology provide a lush soundscape.', 725.99, 4.9, 47, 12, NULL, 'images/10_ch.jpg', 2, 2, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('22', 'images/10_phu1.jpg', '10');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('23', 'images/10_phu2.jpg', '10');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sony - 65\" Class (64-1/2\" Diag.) - LED - 1080p - 120Hz - Smart - 3D - HDTV', 'Utilizing a TRILUMINOS display, this Sony KDL65W850A HDTV ensures vivid colors. To build a complete 3D home theater system, we recommend you purchase a 3D Blu-ray player, high-speed HDMI cable and an A/V receiver that is compatible with 3D Products.', 2499.98, 5, 65, 12, NULL, 'images/11_ch.jpg', 3, 5, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('24', 'images/11_phu1.jpg', '11');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('25', 'images/11_phu2.jpg', '11');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sony - 40\" Class - LCD - 1080p - 60Hz - HDTV', 'This Sony KDL40BX450 40\" LCD TV 1080p high-definition resolution and advanced digital noise reduction deliver stunning picture clarity. Sony 24p True Cinema technology replicates a cinematic frame rate for theater-like viewing.', 499.00, 3.9, 40, 12, NULL, 'images/12_ch.jpg', 3, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('26', 'images/12_phu1.jpg', '12');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('27', 'images/12_phu2.jpg', '12');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sony - Refurbished - BRAVIA - 60\" Class (60\" Diag.) - LED-LCD TV', 'Experience amazing picture quality and unlimited entertainment with Sony R520A Series HDTVs. This elegantly slim LED TV boasts Full HD 1080p for incredible detail and Edge LED backlighting for outstanding contrast, rich colors and enhanced dark-scene detail. Built-in Wi-Fi® lets you connect to the Internet so you can watch YouTube™ clips and access online HD movies, music and more. Fast-paced motion seen in sports and action movies appears amazingly realistic thanks to Motionflow XR 240 technology. For DIRECTV® customers with a Genie™ Whole-Home HD DVR, the Sony R520A Series allows you to enjoy full DIRECTV service and HD DVR functionality without an additional receiver.', 1300.20, 4.35, 60, 12, NULL, 'images/13_ch.jpg', 3, 2, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('28', 'images/13_phu1.jpg', '13');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('29', 'images/13_phu2.jpg', '13');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sony - Refurbished BRAVIA - 40\" Class - LCD - 1080p - 120Hz - HDTV', 'Enjoy movies, games and more with this 40\" Sony KDL40EX500 HDTV that features a BRAVIA Engine 2 processor for vibrant, lifelike images and Motionflow 120Hz technology for smooth movement in fast-action scenes.', 549.99, 3.5, 40, 12, NULL, 'images/14_ch.jpg', 3, 2, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('30', 'images/14_phu1.jpg', '14');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('31', 'images/14_phu2.jpg', '14');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'LG - 47\" Class (46-9/10\" Diag.) - LED - 1080p - 240Hz - Smart - 3D - HDTV', 'LG 47GA7900 LED 3D Google TV:The power of the web, with the browser you trust. Google Chrome allows you to stream everything on the internet, right on your TV. Cinema quality pictures and passive 3D bring movie-theater brilliance into your home. Dual Play gives individual gamers full-screen views. All your entertainment options in one convenient location', 1499.99, 4.32, 47, 12, NULL, 'images/15_ch.jpg', 2, 2, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('32', 'images/15_phu1.jpg', '15');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('33', 'images/15_phu2.jpg', '15');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Panasonic - VIERA - 50\" Class - Plasma - 1080p - 600Hz - Smart - 3D - HDTV', 'Panasonic TC-P50ST60 LED HDTV: With a full array of smart apps, 3D technology and the detailed picture quality of a plasma screen, this Panasonic HDTV is an excellent addition to any mid-sized entertainment room.', 999.99, 4.7, 50, 12, NULL, 'images/16_ch.jpg', 4, 4, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('34', 'images/16_phu1.jpg', '16');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('35', 'images/16_phu2.jpg', '16');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Panasonic - VIERA - 60\" Class (60-1/8\" Diag.) - Plasma - 1080p - 600Hz - Smart - 3D - HDTV', 'Enjoy streaming media and Web browsing with this Panasonic VIERA TC-P60VT60 HDTV. To build a complete 3D home theater system, we recommend you purchase a 3D Blu-ray player, high-speed HDMI cable and an A/V receiver that is compatible with 3D Products.', 1299.99, 4.8, 60, 12, NULL, 'images/17_ch.jpg', 4, 4, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('36', 'images/17_phu1.jpg', '17');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('37', 'images/17_phu2.jpg', '17');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Panasonic - VIERA - 32\" Class (31-1/2\" Diag.) - LED - 720p - 60Hz - HDTV', 'Panasonic VIERA TC-L32XM6 LED HDTV: Enjoy all of your favorite shows and movies in high-definition clarity. A great size for a small living room, bedroom or dorm room.', 500.99, 4.6, 32, 12, NULL, 'images/18_ch.jpg', 4, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('39', 'images/18_phu1.jpg', '18');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('40', 'images/18_phu2.jpg', '18');


INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sharp - 32\" Class (31-1/2\" Diag.) - LED - 1080p - 60Hz - HDTV', 'With support for 1080p resolution, a 2,000,000:1 dynamic contrast ratio and direct-lit LED backlighting, this Sharp LC-32LB150U HDTV offers bright, arresting images in high-definition. VESA 100mm x 100mm compliance facilitates wall mounting. Connect a Roku Streaming Stick to this HDTV and get access to more than 700 channels, including Netflix, Hulu Plus and HBO GO.', 289.99, 4.8, 32, 12, NULL, 'images/19_ch.jpg', 5, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('41', 'images/19_phu1.jpg', '19');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('42', 'images/19_phu2.jpg', '19');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Screen`, `Warranty`, `Quantity`, `ImageUrl`, `BrandId`, `CategoryId`, `Tag`) VALUES ( 'Sharp - AQUOS - 70\" Class (69-1/2\" Diag.) - LED - 1080p - 120Hz - Smart - HDTV', 'Sharp AQUOS LC-70LE650U LED Smart HDTV: Fill your living room or home theater space with a beautiful 1080p picture and king-sized screen, and watching sports will feel like you re on the field with the players. This Smart HDTV provides plenty of entertainment options, too. Stream movies from the Internet, surf the Web and share your smartphone content on the screen.', 589.99, 4.7, 70, 12, NULL, 'images/20_ch.jpg', 5, 3, NULL);
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('43', 'images/20_phu1.jpg', '20');
INSERT INTO `bestbuydb`.`Image` (`ImageId`, `Url`, `ProductId`) VALUES ('44', 'images/20_phu2.jpg', '20');





INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Low-Profile Tilting Wall Mount for Most 26\" to 40\" Flat-Panel TVs - Black', 'This tilting mount is compatible with most 26\" - 40\" flat-panel TVs and features an innovative locking mechanism for quick and easy installation. The fingertip tilt allows for smooth movement and optimal viewing.', '59.99', '4.5', '60', 'images/drag1.jpg', '1');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '1');


INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '2');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won t scratch your screen.', '19.99', '4.5', '12', 'images/drag3.jpg', '2');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won t scratch your screen.', '19.99', '4.5', '12', 'images/drag3.jpg', '3');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Roku - Streaming Stick - Purple', 'Enjoy Web-based media with this Roku 3400M Streaming Stick, which supports up to 1080p content and features built-in dual-band wireless connectivity, so you can easily access more than 1000 entertainment channels via your Roku-ready TV.', '69.99', '4.8', '3', 'images/drag4.jpg', '3');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Roku - Streaming Stick - Purple', 'Enjoy Web-based media with this Roku 3400M Streaming Stick, which supports up to 1080p content and features built-in dual-band wireless connectivity, so you can easily access more than 1000 entertainment channels via your Roku-ready TV.', '69.99', '4.8', '3', 'images/drag4.jpg', '4');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Interactive Full-Motion Wall Mount for Most 19\" - 32\" Flat-Panel TVs - Extends 16-5/8\" - Black', 'Position your flat-panel TV at an optimal angle for viewing with this Rocketfish™ RF-TVMP20 full-motion wall mount that features Constant Force technology for simple adjustment. The extendable design holds your TV up to 16-5/8\" from the wall.', '129.99', '4.8', '60', 'images/drag5.jpg', '4');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Interactive Full-Motion Wall Mount for Most 19\" - 32\" Flat-Panel TVs - Extends 16-5/8\" - Black', 'Position your flat-panel TV at an optimal angle for viewing with this Rocketfish™ RF-TVMP20 full-motion wall mount that features Constant Force technology for simple adjustment. The extendable design holds your TV up to 16-5/8\" from the wall.', '129.99', '4.8', '60', 'images/drag5.jpg', '5');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 12 In-Wall HDMI Cable', 'Enjoy stunning visuals on your HDTV or projector with this HDMI cable that features up to 15.0 Gbps bandwidth and supports signals up to 1080p.', '79.99', '4.8', '3', 'images/drag6.jpg', '5');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 12 In-Wall HDMI Cable', 'Enjoy stunning visuals on your HDTV or projector with this HDMI cable that features up to 15.0 Gbps bandwidth and supports signals up to 1080p.', '79.99', '4.8', '3', 'images/drag6.jpg', '6');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 8-Outlet Surge Protector', 'Protect your A/V components from power surges with this Rocketfish™ RF-HTS210 8-outlet surge protector that features a 3150-joule rating. The 6 Soft-Flex power cord allows flexible room placement.', '49.99', '4.7', '12', 'images/drag7.jpg', '6');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 8-Outlet Surge Protector', 'Protect your A/V components from power surges with this Rocketfish™ RF-HTS210 8-outlet surge protector that features a 3150-joule rating. The 6 Soft-Flex power cord allows flexible room placement.', '49.99', '4.7', '12', 'images/drag7.jpg', '7');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Enlarge Wiremold - CordMate II Cord Cover Kit - White', 'Keep your speaker cables out of sight with this cord cover kit.', '28.99', '4.4', '1', 'images/drag8.jpg', '7');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Enlarge Wiremold - CordMate II Cord Cover Kit - White', 'Keep your speaker cables out of sight with this cord cover kit.', '28.99', '4.4', '1', 'images/drag8.jpg', '8');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Sanus - Foundations Vertical Series On-Wall Component Shelf - Black', 'Keep your A/V components secure with this Sanus Foundations Vertical Series VMA401-B1 on-wall shelf that features an integrated cable management system to help ensure an organized look and tempered-glass material that holds up to 15 lbs.', '49.99', '4.5', '60', 'images/drag9.jpg', '8');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Sanus - Foundations Vertical Series On-Wall Component Shelf - Black', 'Keep your A/V components secure with this Sanus Foundations Vertical Series VMA401-B1 on-wall shelf that features an integrated cable management system to help ensure an organized look and tempered-glass material that holds up to 15 lbs.', '49.99', '4.5', '60', 'images/drag9.jpg', '9');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - iClean Family-Size LCD Screen Cleaner', 'Safely wipe away fingerprints, dust and dirt with this cleaning solution and microfiber cloth designed for use with most LCD displays. The alcohol-free and ammonia-free formula cleans without damaging the display s protective coating.', '21.98', '5', '12', 'images/drag10.jpg', '9');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - iClean Family-Size LCD Screen Cleaner', 'Safely wipe away fingerprints, dust and dirt with this cleaning solution and microfiber cloth designed for use with most LCD displays. The alcohol-free and ammonia-free formula cleans without damaging the display s protective coating.', '21.98', '5', '12', 'images/drag10.jpg', '10');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Digital Innovations - CleanDr LCD, LED and Plasma Screen Cleaning Kit', 'This cleaning kit helps keep your LCD, LED or plasma screen free of fingerprints and dirt. The cleaning solution delivers a streak-free look and the 11" microfiber cloth is machine washable for easy cleaning.', '19.99', '4.1', '10', 'images/drag11.jpg', '10');


INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Low-Profile Tilting Wall Mount for Most 26\" to 40\" Flat-Panel TVs - Black', 'This tilting mount is compatible with most 26\" - 40\" flat-panel TVs and features an innovative locking mechanism for quick and easy installation. The fingertip tilt allows for smooth movement and optimal viewing.', '59.99', '4.5', '60', 'images/drag1.jpg', '11');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won t scratch your screen.', '19.99', '4.5', '12', 'images/drag3.jpg', '11');


INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - TV Screen Cleaning Kit', 'Keep your big screen in pristine condition with this complete monitor cleaning kit. The advanced formula removes dust and fingerprints without streaks or stains. The reusable MicroFiber cloth won t scratch your screen.', '19.99', '4.5', '12', 'images/drag3.jpg', '12');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '12');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '13');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Roku - Streaming Stick - Purple', 'Enjoy Web-based media with this Roku 3400M Streaming Stick, which supports up to 1080p content and features built-in dual-band wireless connectivity, so you can easily access more than 1000 entertainment channels via your Roku-ready TV.', '69.99', '4.8', '3', 'images/drag4.jpg', '13');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Interactive Full-Motion Wall Mount for Most 19\" - 32\" Flat-Panel TVs - Extends 16-5/8\" - Black', 'Position your flat-panel TV at an optimal angle for viewing with this Rocketfish™ RF-TVMP20 full-motion wall mount that features Constant Force technology for simple adjustment. The extendable design holds your TV up to 16-5/8\" from the wall.', '129.99', '4.8', '60', 'images/drag5.jpg', '14');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 8-Outlet Surge Protector', 'Protect your A/V components from power surges with this Rocketfish™ RF-HTS210 8-outlet surge protector that features a 3150-joule rating. The 6 Soft-Flex power cord allows flexible room placement.', '49.99', '4.7', '12', 'images/drag7.jpg', '14');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Enlarge Wiremold - CordMate II Cord Cover Kit - White', 'Keep your speaker cables out of sight with this cord cover kit.', '28.99', '4.4', '1', 'images/drag8.jpg', '15');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - iClean Family-Size LCD Screen Cleaner', 'Safely wipe away fingerprints, dust and dirt with this cleaning solution and microfiber cloth designed for use with most LCD displays. The alcohol-free and ammonia-free formula cleans without damaging the display s protective coating.', '21.98', '5', '12', 'images/drag10.jpg', '15');


INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Monster - iClean Family-Size LCD Screen Cleaner', 'Safely wipe away fingerprints, dust and dirt with this cleaning solution and microfiber cloth designed for use with most LCD displays. The alcohol-free and ammonia-free formula cleans without damaging the display s protective coating.', '21.98', '5', '12', 'images/drag10.jpg', '16');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Low-Profile Tilting Wall Mount for Most 26\" to 40\" Flat-Panel TVs - Black', 'This tilting mount is compatible with most 26\" - 40\" flat-panel TVs and features an innovative locking mechanism for quick and easy installation. The fingertip tilt allows for smooth movement and optimal viewing.', '59.99', '4.5', '60', 'images/drag1.jpg', '16');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Low-Profile Tilting Wall Mount for Most 26\" to 40\" Flat-Panel TVs - Black', 'This tilting mount is compatible with most 26\" - 40\" flat-panel TVs and features an innovative locking mechanism for quick and easy installation. The fingertip tilt allows for smooth movement and optimal viewing.', '59.99', '4.5', '60', 'images/drag1.jpg', '17');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Roku - Streaming Stick - Purple', 'Enjoy Web-based media with this Roku 3400M Streaming Stick, which supports up to 1080p content and features built-in dual-band wireless connectivity, so you can easily access more than 1000 entertainment channels via your Roku-ready TV.', '69.99', '4.8', '3', 'images/drag4.jpg', '17');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '18');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - 12 In-Wall HDMI Cable', 'Enjoy stunning visuals on your HDTV or projector with this HDMI cable that features up to 15.0 Gbps bandwidth and supports signals up to 1080p.', '79.99', '4.8', '3', 'images/drag6.jpg', '18');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Digital Innovations - CleanDr LCD, LED and Plasma Screen Cleaning Kit', 'This cleaning kit helps keep your LCD, LED or plasma screen free of fingerprints and dirt. The cleaning solution delivers a streak-free look and the 11" microfiber cloth is machine washable for easy cleaning.', '19.99', '4.1', '10', 'images/drag11.jpg', '19');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Dynex™ - 6\" HDMI Cable', 'This HDMI cable features up to 10.2 Gbps bandwidth and is compatible with most HDMI sources, including Blu-ray Disc players for stunning high-definition images. The 6\" cable also supports HDMI Ethernet Channel (HEC) and Audio Return Channel (ARC) for wide-ranging use.', '14.99', '4.6', '12', 'images/drag2.jpg', '19');

INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Rocketfish™ - Low-Profile Tilting Wall Mount for Most 26\" to 40\" Flat-Panel TVs - Black', 'This tilting mount is compatible with most 26\" - 40\" flat-panel TVs and features an innovative locking mechanism for quick and easy installation. The fingertip tilt allows for smooth movement and optimal viewing.', '59.99', '4.5', '60', 'images/drag1.jpg', '20');
INSERT INTO `bestbuydb`.`Product` (`Name`, `Description`, `Price`, `Rating`, `Warranty`, `ImageUrl`, `Tag`) VALUES ('Digital Innovations - CleanDr LCD, LED and Plasma Screen Cleaning Kit', 'This cleaning kit helps keep your LCD, LED or plasma screen free of fingerprints and dirt. The cleaning solution delivers a streak-free look and the 11" microfiber cloth is machine washable for easy cleaning.', '19.99', '4.1', '10', 'images/drag11.jpg', '20');


COMMIT;

