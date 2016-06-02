CREATE TABLE `book`.`Account` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`account_name` varchar(45),
	`password` varchar(45),
	`email` varchar(45),
	`real_name` varchar(45),
	`register_date` datetime,
	`img` varchar(55),
	`genger` bit(2),
	`mobile` varchar(45),
	`birthday` datetime,
	PRIMARY KEY (`id`)
) COMMENT='';

ALTER TABLE `book`.`Account` ADD COLUMN `account_type` int(2) AFTER `email`, CHANGE COLUMN `real_name` `real_name` varchar(45) DEFAULT NULL AFTER `account_type`, CHANGE COLUMN `register_date` `register_date` datetime DEFAULT NULL AFTER `real_name`, CHANGE COLUMN `img` `img` varchar(55) DEFAULT NULL AFTER `register_date`, CHANGE COLUMN `genger` `genger` bit(2) DEFAULT NULL AFTER `img`, CHANGE COLUMN `mobile` `mobile` varchar(45) DEFAULT NULL AFTER `genger`, CHANGE COLUMN `birthday` `birthday` datetime DEFAULT NULL AFTER `mobile`;

CREATE TABLE `book`.`Book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_name` VARCHAR(45) NULL,
  `author` VARCHAR(45) NULL,
  `img` VARCHAR(45) NULL,
  `isbn` VARCHAR(45) NULL,
  `create_time` DATETIME NULL,
  `creater_id` INT NULL,
  PRIMARY KEY (`id`));

  ALTER TABLE `book`.`Book` 
CHANGE COLUMN `id` `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE `book`.`Account` 
CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE `book`.`Account` 
CHANGE COLUMN `id` `id` INT(11) UNSIGNED NOT NULL ;

ALTER TABLE `book`.`Book` 
ADD COLUMN `type` INT NULL AFTER `creater_id`,
ADD COLUMN `press` VARCHAR(45) NULL AFTER `type`;

ALTER TABLE `book`.`Book` 
CHANGE COLUMN `type` `type` INT(2) NULL DEFAULT NULL ,
ADD COLUMN `number` INT(5) NULL AFTER `press`,
ADD COLUMN `price` DECIMAL(9,2) NULL AFTER `number`,
ADD COLUMN `promotion_price` DECIMAL(9,2) NULL AFTER `price`;


ALTER TABLE `book`.`Book` 
CHANGE COLUMN `isbn` `isbn` INT(13) NULL DEFAULT NULL ;

ALTER TABLE `book`.`Book` 
CHANGE COLUMN `isbn` `isbn` VARCHAR(15) NULL DEFAULT NULL ;

ALTER TABLE `book`.`Account` 
CHANGE COLUMN `id` `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE `book`.`Account` 
CHANGE COLUMN `genger` `gender` BIT(2) NULL DEFAULT NULL ;

ALTER TABLE `book`.`Book` 
ADD COLUMN `promo` VARCHAR(450) NULL AFTER `promotion_price`,
ADD COLUMN `detail` LONGTEXT NULL AFTER `promo`,
ADD COLUMN `is_free_postage` BIT(1) NULL AFTER `detail`;

ALTER TABLE `book`.`Book` 
CHANGE COLUMN `detail` `detail` TEXT NULL DEFAULT NULL ;

ALTER TABLE `book`.`Account` 
ADD COLUMN `QQ` VARCHAR(10) NULL AFTER `birthday`;

ALTER TABLE `book`.`OrderPayGroup` 
ADD COLUMN `status` INT(2) NULL AFTER `pay_time`;


