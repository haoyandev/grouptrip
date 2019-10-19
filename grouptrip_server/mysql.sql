SET NAMES UTF8;
DROP DATABASE IF EXISTS trip;
CREATE DATABASE trip CHARSET=UTF8;
USE trip;

/** 用户表 **/
CREATE TABLE trip_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(255),
	phone VARCHAR(64),
	avatar VARCHAR(128) DEFAULT "img/avatar/default.png",
	birthday VARCHAR(32),
	city VARCHAR(16),
	gender ENUM('1','0','-1') DEFAULT '-1',
	age TINYINT,
	intr VARCHAR(50), # 自我介绍
	create_time VARCHAR(128),
	update_time VARCHAR(128),
	is_delete BOOLEAN default '0',
	status TINYINT
);



/** 游记表 **/
CREATE TABLE trip_note(
	title VARCHAR(48),
	content TEXT,
	bg_img VARCHAR(128)
);

/** 插入数据 **/
