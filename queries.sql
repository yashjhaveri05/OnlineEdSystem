CREATE DATABASE `course`;
USE `course`;

CREATE TABLE `courseware`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar
(255) DEFAULT NULL,
  `author` varchar
(100) DEFAULT NULL,
  `subject` varchar
(100) DEFAULT NULL,
  `description` varchar
(255) DEFAULT NULL,
  `body` text,
  `issue_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY
(`id`),
KEY `user_id`
(`user_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY
(`user_id`) REFERENCES `users`
(`id`) ON
DELETE CASCADE ON
UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar
(100) DEFAULT NULL,
  `email` varchar
(100) DEFAULT NULL,
  `role` varchar
(10) DEFAULT NULL,
  `username` varchar
(100) DEFAULT NULL,
  `password` varchar
(255) DEFAULT NULL,
  `register_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY
(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `student_courses`
(
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `courseware_id` int DEFAULT NULL,
  `status` varchar(10) default 'open',
  `enroll_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`courseware_id`) REFERENCES `courseware`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);