CREATE TABLE `user` (
  `Customer_user_id` char(12) PRIMARY KEY,
  `Customer_user_pwd` char(16),
  `Customer_user_name` char(12),
  `Customer_user_company` char(100),
  `Customer_user_phoneNumber` char(12),
  `Customer_user_email` char(100)
);

CREATE TABLE `adminuser` (
  `id` char(12) PRIMARY KEY,
  `name` char(12),
  `pwd` char(16),
  `Em_code` char(10)
);

CREATE TABLE `posts` (
  `inquiry_id` integer PRIMARY KEY AUTO_INCREMENT,
  `Customer_user_name` char(12),
  `title` varchar(50),
  `body` varchar(1000),
  `cereate_date` timestamp
);

CREATE TABLE `announcement` (
  `Ann_id` integer PRIMARY KEY AUTO_INCREMENT,
  `Ann_author_name` char(12),
  `Ann_title` char(100),
  `Ann_body` varchar(1000),
  `cereate_date` timestamp
);

CREATE TABLE `adminPost` (
  `inquiry_id` integer PRIMARY KEY,
  `admin_name` char(12),
  `Answer` char(250)
);

CREATE TABLE `analysis_request` (
  `request_number` integer PRIMARY KEY AUTO_INCREMENT,
  `Customer_user_name` char(12),
  `request_title` char(100),
  `request_body` varchar(1000),
  `file_path` longblob,
  `cereate_date` timestamp
);

CREATE TABLE `analysis_answer` (
  `request_number` integer PRIMARY KEY,
  `file_path` longblob,
  `request_output` longblob,
  `coefficient_of_determin` float,
  `RMSE` float,
  `MAE` float
);

ALTER TABLE `user` ADD FOREIGN KEY (`Customer_user_name`) REFERENCES `posts` (`Customer_user_name`);

ALTER TABLE `adminuser` ADD FOREIGN KEY (`name`) REFERENCES `adminPost` (`admin_name`);

ALTER TABLE `posts` ADD FOREIGN KEY (`inquiry_id`) REFERENCES `adminPost` (`inquiry_id`);

ALTER TABLE `adminuser` ADD FOREIGN KEY (`name`) REFERENCES `announcement` (`Ann_author_name`);

ALTER TABLE `user` ADD FOREIGN KEY (`Customer_user_name`) REFERENCES `analysis_request` (`Customer_user_name`);

ALTER TABLE `analysis_request` ADD FOREIGN KEY (`request_number`) REFERENCES `analysis_answer` (`request_number`);

ALTER TABLE `analysis_request` ADD FOREIGN KEY (`file_path`) REFERENCES `analysis_answer` (`file_path`);
