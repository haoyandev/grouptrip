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
/** 关注表 **/
CREATE TABLE trip_focus(
	id INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	from_uid INT
);
/** 国家表 **/
CREATE TABLE trip_state (
	sid INT PRIMARY KEY AUTO_INCREMENT, # 国家id
	cname VARCHAR(60),
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 城市表 **/
CREATE TABLE trip_city (
	cid INT PRIMARY KEY AUTO_INCREMENT, # 城市id
	sid INT, # 国家id
	cname VARCHAR(60),
	elname VARCHAR(60),
	views INT, # 去过的人数
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 游记表 **/
CREATE TABLE trip_note(
	nid INT PRIMARY KEY AUTO_INCREMENT,
	sid INT, # 国家id
	cid INT, # 城市id
	title VARCHAR(48),
	content TEXT,
	likes INT DEFAULT 0,
	comments INT DEFAULT 0,
	create_time VARCHAR(128),
	update_time VARCHAR(128),
	is_delete BOOLEAN DEFAULT '0',
	status TINYINT
);
/** 游记标签表 **/
CREATE TABLE trip_tag (
	tid INT PRIMARY KEY AUTO_INCREMENT, 
	tname VARCHAR(16)
);
/** 游记图片 **/
CREATE TABLE trip_note_pic (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nid INT,
	img VARCHAR(128)
);
/** 游记 标签 表 **/
CREATE TABLE trip_note_tag (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nid INT,
	tid INT
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

/** 插入数据 **/
/** 用户表 **/
INSERT INTO trip_user(uname, upwd, phone, birthday, city, gender) VALUES
('dingding', md5('123456'), '13790091222', '1990-02-18', '上海', 1),
('victoria', md5('123456'), '13790091223', '1995-06-23', '广州', 0),
('xiaohao', md5('123456'), '13790091224', '1899-12-06', '顺德', 1),
('dongdong', md5('123456'), '13790091225', '2000-01-25', '北京', -1);

/** 关注表 **/
INSERT INTO trip_focus VALUES
(null, 1, 2),
(null, 1, 3),
(null, 1, 4),
(null, 2, 1),
(null, 2, 4);
(null, 3, 2);
(null, 4, 1);

/** 主题表 **/
INSERT INTO trip_theme(tid, tname, timg) VALUES
(null, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png'),
(null, '要甜甜的浪漫', 'http://127.0.0.1:3000/theme/romance.png'),
(null, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png'),
(null, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png'),
(null, '看展才是正经事', 'http://127.0.0.1:3000/theme/show.png'),
(null, '音乐剧', 'http://127.0.0.1:3000/theme/music.png'),
(null, '其他活动', 'http://127.0.0.1:3000/theme/other.png');

/** 国家表**/
INSERT INTO trip_country(sid, cname) VALUES
(110000, "中国"),
(120000, "日本"),
(130000, "马来西亚"),
(140000, "法国"),
(150000, "西班牙"),
(160000, "美国"),
(170000, "泰国"),
(180000, "韩国");
/** 城市表 **/
/** id 国家id **/
INSERT INTO trip_city(cid, sid, cname, elname, views) VALUES 
(110000, 110100, '香港', 'Hong Kong' ,1000),
(110000, 110200, '澳门', 'Macau' ,1000),
(110000, 110300, '广州', 'Guang Zhou' ,1000),
(110000, 110400, '台北', 'Taipei' ,1000),
(110000, 110500, '垦丁', 'Kenting' ,1000),
(110000, 110600, '北京', 'Beijing' ,1000),
(110000, 110700, '上海', 'Shang Hai' ,1000),
(110000, 110800, '成都', 'Chengdu' ,1000),
(120000, 120100, '东京', 'Tokyo' ,1000),
(120000, 120200, '大阪', 'Osaka' ,1000),
(120000, 120300, '京都', 'Kyoto' ,1000),
(120000, 120400, '北海道', 'HokKaido', 1000),
(120000, 120500, '奈良', 'Nagoya', 1000),
(120000, 120600, '名古屋', 'Nagaya', 1000),
(120000, 120700, '神户', 'Kobe', 1000),
(120000, 120800, '札幌', 'Sapporo', 1000),
(130000, 130100, '吉隆坡', 'Kuala Lumpur', 1000),
(130000, 130200, '马六甲', 'Melaka', 1000),
(130000, 130300, '亚庇', 'Kota Kinabalu', 1000),
(130000, 130400, '沙巴', 'Sabah', 1000),
(130000, 130500, '槟城', 'Penang', 1000),
(140000, 140100, '巴黎', 'Paris', 1000),
(150000, 150100, '马德里', 'Madrid', 1000),
(150000, 150200, '巴塞罗那', 'Barcelona', 1000),
(160000, 160100, '纽约', 'NewYork', 1000),
(160000, 160200, '洛杉矶', 'Los Angeles', 1000),
(170000, 170100, '曼谷', 'Bangkok', 1000),
(170000, 170200, '清迈', 'Chiang Mai', 1000),
(170000, 170300, '普吉岛', 'Phuket', 1000),
(180000, 180100, '首尔', 'Seoul', 1000);

/** Note表 **/
INSERT INTO trip_note(nid, sid, cid, title, likes, comments, create_time) VALUES
(1, 120000, 120200,
'从平价小吃到米其林——大阪京都神户美食集(10日20店详记',
88, 128, '2018-12-18'
),
(2, 120000, 120400,
'日本·北海道 | 十二月的晴空飞雪',
6499, 360, '2017-12-12'
),
(3, 120000, 120200,
'霓虹国走花路之我的关西樱花图鉴',
7168, 318,'2018-03-30'
),
(4, 120000, 120300,
'京都风物 | 偏爱京都冷门地、独立咖啡店与在地美食收录',
7466, 452, '2018-10-02'
),
(5, 120000, 120100,
'《东京攻略》潜水~日本东京潜水攻略——馆山自由行',
6098, 80, '2018-08-30'
),
(6, 120000, 120600,
'名古屋秋日的樱花与红叶（爱知县攻略)',
125, 203, '2018-11-24'
),
(7, 120000, 120700,
'神户【BE KOBE】（史上最全！！！的神户交通+路线规划)',
989, 452, '2019-04-27'
),
(8, 130000, 130100,
'大马(吉隆坡)，带我去从不一样的视角看世界',
769, 342, '2018-10-27'
),
(9, 130000, 130100,
'寻味，槟城',
839, 91, '2017-10-01'
),
(10, 130000, 130100,
'大马十天闯祸记|亚庇•仙本那•吉隆坡•攻略篇【超详细！内含考潜水证OW攻界',
769, 342, '2018-06-03'
);

/** tag表 **/
INSERT INTO trip_tag VALUES
(1, '日本美食'),
(2, '关西攻略'),
(3, '北海道'),
(4, '冰雪之旅'),
(5, '樱花季'),
(6, '关西攻略'),
(7, '特色古街'),
(8, '日式风情'),
(9, '东京迪士尼乐园'),
(10, '冰雪之旅'),
(11, '秋日赏枫地'),
(12, '名古屋美食'),
(13, '古建筑大赏'),
(14, '神户和牛'),
(15, '日式温泉'),
(16, '夜市吃吃吃'),
(17, '超赞网红打卡地'),
(18, '槟城壁画'),
(19, '槟城美食'),
(20, 'ow潜水证'),
(21, '大马攻略');

/** note tag **/
INSERT INTO trip_note_tag VALUES
(null, 1, 1),
(null, 1, 2),
(null, 2, 3),
(null, 2, 4),
(null, 3, 5),
(null, 3, 6),
(null, 4, 7),
(null, 4, 8),
(null, 5, 9),
(null, 5, 10),
(null, 6, 11),
(null, 6, 12),
(null, 6, 13),
(null, 7, 14),
(null, 7, 15),
(null, 8, 16),
(null, 8, 17),
(null, 9, 18),
(null, 9, 19),
(null, 10, 20),
(null, 10, 21);

INSERT INTO trip_note_pic VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),