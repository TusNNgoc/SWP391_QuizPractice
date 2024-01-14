-- Tạo database
DROP DATABASE IF EXISTS SWP391;
CREATE DATABASE SWP391;

-- Sử dụng database mới tạo
USE SWP391;

-- Tạo bảng users 
CREATE TABLE users (
    userid  INT AUTO_INCREMENT PRIMARY KEY,
	fullname VARCHAR(50) NULL DEFAULT NULL,
	mobile VARCHAR(15) NULL,
    username VARCHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `status` ENUM('BLOCK', 'ACTIVE') NOT NULL,
    `role` 	varchar(50) -- admin, user
);

-- Tạo bảng quiz 
CREATE TABLE quiz (
    quizid  INT AUTO_INCREMENT PRIMARY KEY,
    nameQuestion  VARCHAR(100) UNIQUE NOT NULL,
	`type` SMALLINT(6) NOT NULL DEFAULT 0,
    content TEXT NULL DEFAULT NULL,
	score SMALLINT(6) NOT NULL DEFAULT 0
);

-- Tạo bảng question 
CREATE TABLE question (
    questionid  INT AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(50) NOT NULL,
	`level` SMALLINT(6) NOT NULL DEFAULT 0,
    quizid INT NOT NULL,
	score SMALLINT(6) NOT NULL DEFAULT 0,
	content TEXT NULL DEFAULT NULL,
    FOREIGN KEY (questionid) REFERENCES quiz(quizid)
);

-- Tạo bảng answer
CREATE TABLE answer (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    quizid INT NOT NULL,
	questionid INT NOT NULL,
	correct TINYINT(1) NOT NULL DEFAULT 0,
	content TEXT NULL DEFAULT NULL,
    FOREIGN KEY (quizid) REFERENCES quiz(quizid),
    FOREIGN KEY (questionid) REFERENCES question(questionid)
);

CREATE TABLE take (
  takeid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userid INT NOT NULL,
  quizid INT NOT NULL,
  `status` SMALLINT(6) NOT NULL DEFAULT 0,
  score SMALLINT(6) NOT NULL DEFAULT 0,
  `published` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `startedAt` DATETIME NULL DEFAULT NULL,
  `finishedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  FOREIGN KEY (userid) REFERENCES users (userid),
  FOREIGN KEY (quizid) REFERENCES quiz (quizid)
  );
  
  CREATE TABLE take_answer (
  take_answer_id INT AUTO_INCREMENT PRIMARY KEY,
  takeid INT NOT NULL,
  questionid INT NOT NULL,
  answer_id INT NOT NULL,
  content TEXT NULL DEFAULT NULL,
  FOREIGN KEY (takeid) REFERENCES take (takeid),
  FOREIGN KEY (questionid) REFERENCES question (questionid),
  FOREIGN KEY (answer_id) REFERENCES answer (answer_id)
);

-- Tạo bảng course 
-- CREATE TABLE course (
--     courseid  INT AUTO_INCREMENT PRIMARY KEY,
--     `type` VARCHAR(50) NOT NULL,
-- 	`level` SMALLINT(6) NOT NULL DEFAULT 0,
--     quizid INT NOT NULL,
-- 	score SMALLINT(6) NOT NULL DEFAULT 0,
-- 	content TEXT NULL DEFAULT NULL,
--     FOREIGN KEY (questionid) REFERENCES quiz(quizid)
-- );
