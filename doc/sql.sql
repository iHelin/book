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
