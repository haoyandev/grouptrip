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
/** 主题表 **/
CREATE TABLE trip_theme (
  tid INT(11) PRIMARY KEY (`tid`) AUTO_INCREMENT,
  tname VARCHAR(16),
	timg VARCHAR(128),
  create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
 /** group表 **/ 
CREATE TABLE trip_group (
	gip INT PRIMARY KEY AUTO_INCREMENT,
	tid INT,
	intr VARCHAR(200),
	start_time VARCHAR(128),
	end_time VARCHAR(128),
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 国家表 **/
CREATE TABLE trip_country (
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(60),
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 城市表 **/
CREATE TABLE trip_city (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cid INT,
	name VARCHAR(60),
	elname VARCHAR(60),
	count INT,

);

/** 插入数据 **/
/** 主题表 **/
insert into trip_theme(tid, tname, timg) values
(null, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png'),
(null, '要甜甜的浪漫', 'http://127.0.0.1:3000/theme/romance.png'),
(null, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png'),
(null, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png'),
(null, '看展才是正经事', 'http://127.0.0.1:3000/theme/show.png'),
(null, '音乐剧', 'http://127.0.0.1:3000/theme/music.png'),
(null, '其他活动', 'http://127.0.0.1:3000/theme/other.png');

/** 国家表**/
insert into trip_country(cid, cname) values
(1, "中国"),
(2, "日本"),
(3, "马来西亚"),
(4, "法国"),
(5, "西班牙"),
(6, "美国"),
(7, "泰国"),
(8, "韩国");
/** 城市表 **/
insert into trip_city(cid, cname) values 
(1, '香港', 'Hong Kong' ,1000),
(1, '澳门', 'Macau' ,1000),
(1, '广州', 'Guang Zhou' ,1000),
(1, '台北', 'Taipei' ,1000),
(1, '垦丁', 'Kenting' ,1000),
(1, '北京', 'Beijing' ,1000),
(1, '上海', 'Shang Hai' ,1000),
(1, '成都', 'Chengdu' ,1000),
(2, '东京', 'Tokyo' ,1000),
(2, '大阪', 'Osaka' ,1000),
(2, '京都', 'Kyoto' ,1000),
(2, '北海道', 'HokKaido', 1000),
(2, '奈良', 'Nagoya', 1000),
(2, '名古屋', 'Nagaya', 1000),
(2, '神户', 'Kobe', 1000),
(2, '札幌', 'Sapporo', 1000),
(3, '吉隆坡', 'Kuala Lumpur', 1000),
(3, '马六甲', 'Melaka', 1000),
(3, '亚庇', 'Kota Kinabalu', 1000),
(3, '沙巴', 'Sabah', 1000),
(3, '槟城', 'Penang', 1000),
(4, '巴黎', 'Paris', 1000),
(5, '马德里', 'Madrid', 1000),
(5, '巴塞罗那', 'Barcelona', 1000),
(6, '纽约', 'NewYork', 1000),
(6, '洛杉矶', 'Los Angeles', 1000),
(7, '曼谷', 'Bangkok', 1000),
(7, '清迈', 'Chiang Mai', 1000),
(7, '普吉岛', 'Phuket', 1000),
(8, '首尔', 'Seoul', 1000);

/** group表 **/
