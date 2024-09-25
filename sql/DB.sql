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
  `Customer_user_id` char(12),
  `title` varchar(50),
  `body` varchar(1000),
  `admin_id` char(12),
  `answer` char(255),
  `created_date` timestamp DEFAULT CURRENT_TIMESTAMP,
  `answered_date` timestamp NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `announcement` (
  `Ann_id` integer PRIMARY KEY AUTO_INCREMENT,
  `Ann_author_id` char(12),
  `Ann_title` char(100),
  `Ann_body` varchar(1000),
  `create_date` timestamp
);

CREATE TABLE `analysis_request` (
  `request_number` integer PRIMARY KEY AUTO_INCREMENT,
  `Customer_user_id` char(12),
  `request_title` char(100),
  `request_body` varchar(1000),
  `actual_prediction` longblob,
  `important` longblob,
  `hitmap` longblob,
  `RMSE` float,
  `MAE` float,
  `Evaluation_indicators` float,
  `request_file` longblob,
  `create_date` timestamp
);

ALTER TABLE `announcement` ADD FOREIGN KEY (`Ann_author_id`) REFERENCES `adminuser` (`id`);

ALTER TABLE `analysis_request` ADD FOREIGN KEY (`Customer_user_id`) REFERENCES `user` (`Customer_user_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`Customer_user_id`) REFERENCES `user` (`Customer_user_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`admin_id`) REFERENCES `adminuser` (`id`);
