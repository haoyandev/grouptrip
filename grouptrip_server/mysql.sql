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
	avatar VARCHAR(128) DEFAULT "http://localhost:3000/avatar/default.png",
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
	fid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	from_uid INT,
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 国家表 **/
CREATE TABLE trip_state (
	sid INT PRIMARY KEY AUTO_INCREMENT, # 国家id
	sname VARCHAR(60), # 国家名
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
	detail VARCHAR(400),
	img VARCHAR(128),
	hot_spots VARCHAR(255),
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 景点表 **/
CREATE TABLE trip_spots (
	sid INT PRIMARY KEY AUTO_INCREMENT,
	cid INT,
	sname VARCHAR(12),
	views INT,
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
	uid INT,
	title VARCHAR(48),
	content TEXT,
	likes INT DEFAULT 0,
	comments INT DEFAULT 0,
	img VARCHAR(128),
	create_time VARCHAR(128),
	update_time VARCHAR(128),
	is_delete BOOLEAN DEFAULT '0',
	status TINYINT
);
/** 游记标签表 **/
CREATE TABLE trip_tag (
	tid INT PRIMARY KEY AUTO_INCREMENT, 
	sid INT,
	cid INT,
	uid INT,
	tname VARCHAR(16),
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);

/** 游记 标签 表 **/
CREATE TABLE trip_note_tag (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nid INT,
	tid INT,
	create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);
/** 主题表 **/
CREATE TABLE trip_theme (
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(16),
	timg VARCHAR(128),
  create_time VARCHAR(128),
  update_time VARCHAR(128),
  is_delete TINYINT(1) DEFAULT '0',
  status TINYINT(4) DEFAULT NULL
);

/** 搜索表 **/
CREATE TABLE trip_groups (
	id INT PRIMARY KEY AUTO_INCREMENT,
	tid INT,
	tname VARCHAR(16),
	timg VARCHAR(128),
	sid INT,
	cid INT,
	area VARCHAR(68),
	date VARCHAR(28),
	content VARCHAR(255),
	likes INT,
	bg VARCHAR(128) DEFAULT 'http://localhost:3000/group/bg1.jpg',
	img1 VARCHAR(128),
	img2 VARCHAR(128),
	uid INT,
	uname VARCHAR(16),
	avatar VARCHAR(128),
	gender TINYINT,
	age INT,
	INDEX(sid),
	INDEX(cid)
);
/** 插入数据 **/

INSERT INTO trip_groups(tid, tname, timg, sid, cid, area, date, content, likes, bg, img1, img2, uid, uname, avatar, gender, age) VALUES
(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
13000, 130100, '马来西亚', '2019年12月23日-12月31日',
'马来西亚仙本那旅游,想找个愿意陪我晒太阳的人,一起去到一年四季只有一个季节的国家玩个八天,有意者私聊与留言', 
17,
'http://localhost:3000/group/bg1.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
1, '峰-热爱旅游者', 'http://localhost:3000/avatar/01.jpg', 1, 26),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
13000, 130100, '马来西亚', '2020年2月5日-2020年12月31日',
'2019年2.5-13.马来西亚之旅。机票已出。2-6-9号滨城，轻车熟路。wechat15978116527', 
1,
'http://localhost:3000/group/bg2.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
2, '汪家小满', 'http://localhost:3000/avatar/02.jpg', 1, 32),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
13000, 130100, '马来西亚', '2020年2月5日-2020年12月31日',
'一起去槟城、仙本那吧！坐标上海：目前2妹纸，公司放假比较早， 1.14号就放假了，就想出去旅游啦，有意向请联系我',
52,
'http://localhost:3000/group/bg3.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
3, '泡泡_bubble', 'http://localhost:3000/avatar/03.jpg', 0, 22),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
13000, 130100, '马来西亚', '2019年12月15日-2020年1月3日',
'93年，天秤男，计划12.15-1.3，马来西亚和曼谷深度游，不作不矫情，生存能力较强，希望结个伴。', 
5,
'http://localhost:3000/group/bg4.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
4, '玛丽隔壁的天天', 'http://localhost:3000/avatar/04.jpg', 1, 26),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110400, '中国.台湾', '2019年12月29日-2020年1月3日',
'想元旦的时候出去看看世界～有组队一起的吗？', 
0,
'http://localhost:3000/group/bg5.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
5, 'King云灿', 'http://localhost:3000/avatar/05.jpg', 1, 23),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110400, '中国.台湾', '2020年1月14日-2020年2月12日',
'来一场说走就走的旅行', 
1,
'http://localhost:3000/group/bg6.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
6, '携手度余生', 'http://localhost:3000/avatar/06.jpg', 1, 18),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110400, '中国.台湾', '2020年1月14日-2020年2月12日',
'哎，心情低落到谷底，想出去走走，给自己放个假吧，有没有一起哒，时间你定，地点你定，说走咋就走', 
16,
'http://localhost:3000/group/bg7.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
7, '云朵上的羊角花', 'http://localhost:3000/avatar/07.jpg', 0, 25),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110400, '中国.台湾', '2019年11月5日-2019年11月15日',
'想计划11.5到11.15号出游，不知道要去哪儿，需要一个会玩，懂攻略，回拍照的女友，有志同道合的朋友可以联系我', 
0,
'http://localhost:3000/group/bg8.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
8, '孜炫', 'http://localhost:3000/avatar/08.jpg', 1, 33),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110100, '中国.香港', '2019年11月6日-2019年11月13日',
'珠三角的小伙伴 约饭 周边游都可以弄个小组群 随时说走就走 也可以同城打卡美食，如果你也是一个人很难有节日出游可以一起来聊聊', 
3,
'http://localhost:3000/group/bg9.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
9, '恋人', 'http://localhost:3000/avatar/09.jpg', 0, 20),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110100, '中国.香港', '2019年11月6日-2019年11月13日',
'90年女生一枚，11月8号9号10号去深圳香港玩三天，本人爱好瑜伽美食拍照，有没有同行的小姐姐呢', 
6,
'http://localhost:3000/group/bg10.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
10, '野十七', 'http://localhost:3000/avatar/10.jpg', 0, 21),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110100, '中国.香港', '2019年10月31日-2019年11月29日',
'一起去旅行，让心去旅行。', 
17,
'http://localhost:3000/group/bg1.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
11, 'M迷路人', 'http://localhost:3000/avatar/11.jpg', 0, 23),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
11000, 110100, '中国.香港', '2019年11月6日-2019年11月13日',
'11号3号澳门两天，7号8号香港两天，有一起结伴的吗？', 
1,
'http://localhost:3000/group/bg2.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
12, '被丢弃的孩子', 'http://localhost:3000/avatar/12.jpg', 1, 35),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
12000, 120000, '日本.东京', '2019年11月6日-2019年12月31日',
'我本人是男的，我也是游戏高手，有美女要跟我出去旅游的吗，有的话请联系我', 
0,
'http://localhost:3000/group/bg3.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
13, 'CCCCCCcxy', 'http://localhost:3000/avatar/13.jpg', 1, 28),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
12000, 120000, '日本.东京', '2019年11月6日-2019年12月31日',
'我是80后小姐姐，想11月中旬去日本旅行，东京、大阪，想找个同伴一起吃喝玩，一起分担住宿费，最好会讲英语。', 
2,
'http://localhost:3000/group/bg4.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
14, '伊帆523', 'http://localhost:3000/avatar/14.jpg', 0, 34),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
12000, 120000, '日本.东京', '2019年12月22日-2020年1月2日',
'12.22-1.2日本旅行同行约伴 现在预计12.22-26之间大阪入（看这几天的机票比较便宜）', 
2,
'http://localhost:3000/group/bg5.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
15, '我想下雨天', 'http://localhost:3000/avatar/15.jpg', 0, 22),

(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png',
12000, 120000, '日本.东京', '2019年11月6日-2019年12月31日',
'87年的小哥哥一名！11月到12月去日本 加我微信', 
1,
'http://localhost:3000/group/bg6.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
16, '我就是一个坏人', 'http://localhost:3000/avatar/16.jpg', 1, 32),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110400, '中国.台湾', '2019年10月31日-2019年11月30日',
'11月9号到16号。机票已定。想找个人一起结伴旅行。不一定要拼住。', 
0,
'http://localhost:3000/group/bg7.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
17, 'Menzy', 'http://localhost:3000/avatar/17.jpg', 1, 26),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110400, '中国.台湾', '2019年10月31日-2019年11月30日',
'目的地台湾，主要对展览、美食、中古感兴趣，本人85后，性格外向事不多，有多国旅行经验，约年纪差距不太大、志同道合的女生，逛吃逛吃～', 
5,
'http://localhost:3000/group/bg8.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
18, 'Menzy', 'http://localhost:3000/avatar/18.jpg', 0, 34),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110400, '中国.台湾', '2019年11月8日-2019年11月11日',
'11.8-11在台湾，吃吃买买逛逛，会去一些潮牌店、杂货店、咖啡店，喜欢复古，日银、拍照。', 
35,
'http://localhost:3000/group/bg9.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
19, 'zzqzq', 'http://localhost:3000/avatar/19.jpg', 1, 25),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110400, '中国.台湾', '2019年11月4日-2019年11月11日',
'11月份想去台湾，走走逛逛，无目的，求壮胆，女生最好。', 
10,
'http://localhost:3000/group/bg10.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
20, '静妃儿', 'http://localhost:3000/avatar/20.jpg', 0, 25),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110100, '中国.香港', '2019年10月31日-2019年11月1日',
'明天上午深圳出发去香港 有没有一起吃吃吃 逛逛逛的伴 仅仅是明天哈', 
2,
'http://localhost:3000/group/bg1.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
21, 'MEIKO', 'http://localhost:3000/avatar/21.jpg', 0, 25),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110100, '中国.香港', '2019年10月28日-2019年11月9日',
'看到香港崇光百货新开店，想去看见有没有打折的商品，有一起去的吗', 
3,
'http://localhost:3000/group/bg2.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
22, '金曼', 'http://localhost:3000/avatar/21.jpg', 0, 21),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110100, '中国.香港', '2019年12月28日-2019年12月30日',
'作为一名合格的陈奕迅的假粉，香港演唱会是一定要去打卡，有幸买到12.29的票～那么看演唱会的前后就是吃吃吃', 
11,
'http://localhost:3000/group/bg3.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
23, '乌拉拉多', 'http://localhost:3000/avatar/22.jpg', 0, 26),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
11000, 110100, '中国.香港', '2019年11月21日-2019年11月27日',
'过节好无聊，来聊聊天', 
43,
'http://localhost:3000/group/bg4.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
24, '皮卡兰', 'http://localhost:3000/avatar/24.jpg', 0, 24),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
12000, 120100, '日本.东京', '2020年4月1日-2020年12月30日',
'90后女生，已购2020年9月30日到10月7日到东京的机票，喜欢吃喝拍照，零星购物，不穷游不奢游。', 
11,
'http://localhost:3000/group/bg5.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
25, '橙子0208', 'http://localhost:3000/avatar/25.jpg', 0, 26),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
12000, 120100, '日本.东京', '2019年11月10日-2019年11月16日',
'本人女，96年，想找一个女生一起去日本旅游，计划11.10号左右出发，具体行程还未定。', 
2,
'http://localhost:3000/group/bg6.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
26, '悦哥', 'http://localhost:3000/avatar/26.jpg', 0, 23),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
12000, 120100, '日本.东京', '2019年11月10日-2019年11月16日',
'12月30或31号在东京，有在东京的可以一起行动，一起去京都之类的。', 
2,
'http://localhost:3000/group/bg7.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
27, '北京89老啊姨', 'http://localhost:3000/avatar/27.jpg', 0, 30),

(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png',
12000, 120100, '日本.东京', '2019年11月10日-2019年11月16日',
'12月23-12月29日东京及周边自由行，男生一人，北京出发，机酒已出。', 
6,
'http://localhost:3000/group/bg8.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
28, 'Pandapao', 'http://localhost:3000/avatar/28.jpg', 1, 23),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110400, '中国.台湾', '2019年11月3日-2019年11月15日',
'11.3-11.15台湾。。遇到就约个饭吧夜市拼吃友。台湾自由行。', 
1,
'http://localhost:3000/group/bg9.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
29, 'DD动词打次', 'http://localhost:3000/avatar/29.jpg', 1, 23),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110400, '中国.台湾', '2019年11月3日-2019年11月18日',
'女生，11.3-11.18台湾看石久让音乐会，做攻略后想吃的店超多。', 
1,
'http://localhost:3000/group/bg10.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
30, '我爱吃淤泥', 'http://localhost:3000/avatar/30.jpg', 0, 28),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110400, '中国.台湾', '2019年10月31日-2019年11月01日',
'万圣节夜有小伙伴酒吧约起吗，一起听听jazz讲讲故事。', 
1,
'http://localhost:3000/group/bg1.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
31, 'Jodi_loc', 'http://localhost:3000/avatar/31.jpg', 1, 28),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110400, '中国.台湾', '2019年11月5日-2019年11月08日',
'11.4晚上到台湾，11.7回国。', 
1,
'http://localhost:3000/group/bg2.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
32, 'Cathyiiii', 'http://localhost:3000/avatar/32.jpg', 0, 19),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110100, '中国.香港', '2019年10月18日-2019年11月1日',
'穷游的小伙伴 可否约个饭。', 
2,
'http://localhost:3000/group/bg3.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
33, '王牌先生', 'http://localhost:3000/avatar/33.jpg', 1, 34),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110100, '中国.香港', '2019年11月1日-2019年11月1日',
'有小伙伴一起吃个饭吗。', 
0,
'http://localhost:3000/group/bg4.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
34, '李天赐', 'http://localhost:3000/avatar/34.jpg', 1, 32),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110100, '中国.香港', '2019年12月29日-2020年1月4日',
'想找伴一起打卡香港美食。', 
2,
'http://localhost:3000/group/bg5.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
35, 'Jiayi', 'http://localhost:3000/avatar/35.jpg', 0, 26),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
11000, 110100, '中国.香港', '2019年11月1日-2019年1月1日',
'晚上万圣节有想要一起变装小酌的朋友吗？', 
3,
'http://localhost:3000/group/bg6.jpg',
'http://localhost:3000/citypics/01.jpg',
'http://localhost:3000/citypics/02.jpg',
36, '蘑菇蹲', 'http://localhost:3000/avatar/36.jpg', 1, 26),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
12000, 120100, '日本.东京', '2019年11月17日-2020年1月4日',
'北京大叔准备红叶季去日本浪几天，这次主要玩九州，11月17号飞福冈，预计27号前后回到东京。', 
15,
'http://localhost:3000/group/bg7.jpg',
'http://localhost:3000/citypics/03.jpg',
'http://localhost:3000/citypics/04.jpg',
37, '李沧浪', 'http://localhost:3000/avatar/37.jpg', 1, 37),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
12000, 120100, '日本.东京', '2019年11月17日-2020年1月4日',
'86女 1.23到东京 约一起吃饭的小伙伴儿。', 
2,
'http://localhost:3000/group/bg8.jpg',
'http://localhost:3000/citypics/05.jpg',
'http://localhost:3000/citypics/06.jpg',
38, '乔乔1005', 'http://localhost:3000/avatar/38.jpg', 0, 33),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
12000, 120100, '日本.东京', '2019年11月8日-2019年11月13日',
'11月8号到13号 主要在东京 最后一天大阪逛逛。我们是一对情侣，风趣幽默不斤斤计较。', 
0,
'http://localhost:3000/group/bg9.jpg',
'http://localhost:3000/citypics/07.jpg',
'http://localhost:3000/citypics/08.jpg',
39, '千千寻', 'http://localhost:3000/avatar/39.jpg', 0, 25),

(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png',
12000, 120100, '日本.东京', '2019年11月17日-2020年1月4日',
'本人男，vlog视频创作爱好者，去过东京一次，喜欢走走拍拍，这次时间安排比较轻松，机票已出，男女不限', 
1,
'http://localhost:3000/group/bg10.jpg',
'http://localhost:3000/citypics/09.jpg',
'http://localhost:3000/citypics/10.jpg',
40, '牛牛安', 'http://localhost:3000/avatar/40.jpg', 1, 37);

/** 插入用户表数据 **/
INSERT INTO trip_user(uid, uname, upwd, phone, birthday, city, gender, age, avatar) VALUES
(1, '峰-热爱旅游者', md5('123456'), '13790091111', '1993-02-18', '上海', '1', 26,
'http://localhost:3000/avatar/01.jpg'
),
(2, '汪家小满', '13790091112', md5('123456'), '1987-06-23', '天津', '1', 32,
'http://localhost:3000/avatar/02.jpg'
),
(3, '泡泡_bubble', '13790091113', md5('123456'), '1998-09-03', '广州', '0', 22,
'http://localhost:3000/avatar/03.jpg'
),
(4, '玛丽隔壁的天天', '13790091114', md5('123456'), '1993-07-03', '北京', '0', 26,
'http://localhost:3000/avatar/04.jpg'
),
(5, 'King云灿', '13790091115', md5('123456'), '1996-02-18', '天津', '0', 23,
'http://localhost:3000/avatar/05.jpg'
),
(6, '携手度余生', '13790091116', md5('123456'), '2000-09-28', '长春', '0', 18,
'http://localhost:3000/avatar/06.jpg'
),
(7, '云朵上的羊角花', '13790091117', md5('123456'), '1994-11-12', '北京', '0', 22,
'http://localhost:3000/avatar/07.jpg'
),
(8, '孜炫', '13790091118', md5('123456'), '1986-02-14', '北京', '1', 33,
'http://localhost:3000/avatar/08.jpg'
),
(9, '恋人', '13790091119', md5('123456'), '1999-03-06', '北京', '0', 20,
'http://localhost:3000/avatar/09.jpg'
),
(10, '野十七', '13790091120', md5('123456'), '1998-06-16', '佛山', '0', 22,
'http://localhost:3000/avatar/10.jpg'
);

/** 插入关注表数据 **/
INSERT INTO trip_focus (fid, uid, from_uid)VALUES
(null, 1, 2),
(null, 1, 3),
(null, 1, 4),
(null, 2, 1),
(null, 2, 4),
(null, 3, 2),
(null, 4, 1);

/** 插入主题表数据 **/
INSERT INTO trip_theme(tid, tname, timg) VALUES
(1, '一起去冒险', 'http://127.0.0.1:3000/theme/explore.png'),
(2, '要甜甜的浪漫', 'http://127.0.0.1:3000/theme/romance.png'),
(3, '走！探店去', 'http://127.0.0.1:3000/theme/shop.png'),
(4, '寻觅美食', 'http://127.0.0.1:3000/theme/food.png'),
(5, '看展才是正经事', 'http://127.0.0.1:3000/theme/show.png'),
(6, '约你去看音乐剧', 'http://127.0.0.1:3000/theme/music.png'),
(7, '其他活动', 'http://127.0.0.1:3000/theme/other.png');

/** 插入国家表数据 **/
INSERT INTO trip_state(sid, sname) VALUES
(110000, "中国"),
(120000, "日本"),
(130000, "马来西亚"),
(140000, "法国"),
(150000, "西班牙"),
(160000, "美国"),
(170000, "泰国"),
(180000, "韩国");

/** 插入城市表数据 **/
/** id 国家id **/
INSERT INTO trip_city(cid, sid, cname, elname, views, detail, hot_spots, img, poster) VALUES 
(110100, 110000, '香港', 'Hong Kong' ,1000,
'香港，这座昔日的小渔村已发展成繁华的大都市，不同文化共同影响了这片土地，形成了今日独特多样的面貌。旅行者可以穿梭在繁华的中环金融区，在尖沙咀、铜锣湾的橱窗中领略全球风尚，在维多利亚港与兰桂坊感受这座不夜城的魅力，也可以在大屿山、西贡、龙脊与大自然亲密接触。带着这本锦囊，认识一个不一样的香港。', '星光大道,太平山,香港迪斯尼乐园,香港海洋公园', 'http://localhost:3000/citypics/hk1.jpg','http://localhost:3000/poster/p1.jpg'),
(110200, 110000, '澳门', 'Macau' ,1000,
'你可以跟随澳门锦囊，踏上被列入世界文化遗产的老城区，那里随处可见教堂和欧式建筑充满异域风情，步行游览也非常合适。除了观光，澳门的娱乐业非常发达，同时也是购物的好地方。还可以品尝独具特色的土生葡菜和葡式蛋挞。', '大三巴牌坊，澳门渔人码头，路环岛，澳门旅游塔', 'http://localhost:3000/citypics/macao.jpg','http://localhost:3000/poster/p2.jpg'),
(110300, 110000, '广州', 'Guang Zhou' ,1000,
'广州，别称羊城，广东省省会，位于广东省中南部，是中国的“南大门”。广州对外贸易发达，得益于良好的地理位置，广州自秦汉至明清，一直是中国对外贸易的重要港口城市。千年来的文化在此交融碰撞，形成了独特的广州文化，吸引着络绎不绝的旅行者来此领略广州风光。', '广州塔，沙面，越秀公园，上下九步行街', 'http://localhost:3000/citypics/guangzhou.jpg','http://localhost:3000/poster/p3.jpg'),
(110400, 110000, '台北', 'Taipei' ,1000,
'欢迎来到台北！这个《台北的天空》《忠孝东路走九遍》《冬季到台北来看雨》的台北，《搭错车》《恐怖分子》《艋舺》《一页台北》中的台北，各文学作品、影视作品中的台北。这个有台北“故宫博物院”、诚品书店、青田街、101大楼、西门町的台北。台北让人爱恨交加，但可能是华人世界中一座最具包容性的城市。这是一座丰富有趣的城市，你想玩什么，想要看什么，几乎都能满足你的需求。', '台北101，台北故宫博物院，饶河街夜市，国父纪念馆', 'http://localhost:3000/citypics/taiwan3.jpg','http://localhost:3000/poster/p4.jpg'),
(110500, 110000, '垦丁', 'Kenting' ,1000,
'台湾没有太多壮丽的山水，却有对景点细致的发掘；没有广阔苍茫的大陆，却有一望无际的蓝色太平洋；这块小岛上的人们没有太多的豪情壮志远大理想，只想过着自己小情小调，踏实而细致的日子。在台湾，更应该感受的是生活，对传统文化的保存及发扬，现代与传统的碰撞与结合。', '垦丁大街，垦丁白沙湾沙滩,龙磐公园，鹅銮鼻灯塔', 'http://localhost:3000/citypics/kending.jpg','http://localhost:3000/poster/p5.jpg'),
(110600, 110000, '北京', 'Beijing' ,1000,
'北京是中华人民共和国的首都，是中国的政治中心和文化中心，这个城市见证了历史、汇集了古今、连接了中外，兼容并蓄，大气宽容，庄严端肃，却又不失灵秀，真可谓钟灵毓秀之地。', '故宫，天安门广场，八达岭长城，颐和园', 'http://localhost:3000/citypics/beijing1.jpg','http://localhost:3000/poster/p6.jpg'),
(110700, 110000, '上海', 'Shang Hai' ,1000,
'走在外滩黄浦江畔的人，会觉得上海充满了回首与展望：一边是外滩颇有时间沧桑感的万国建筑群，一边是上海的城市标志“东方明珠”、高耸入云的全球金融中心、金茂大厦等现代感十足的建筑。望着滚滚而逝的黄浦江水，让人顿生今昔何夕之感。金嗓子周璇的歌声仿佛还在耳边回响，码头的游轮拉响长笛，催人启程。', '外滩，南京步行街，上海城隍庙旅游区，陆家嘴', 'http://localhost:3000/citypics/shanghai.jpg','http://localhost:3000/poster/p7.jpg'),
(110800, 110000, '成都', 'Chengdu' ,1000,
'成都，一座来了就不想走的城市。这座城市的可爱之处实在太多了。从游览方面来说，这里有武侯祠、杜甫草堂、青羊宫、文殊院这样的古迹，有四川博物馆、金沙遗址博物馆这样的文化场所，有锦里、宽窄巷子这样的休闲场所，有天府广场、春熙路这样充满现代感的商业区；从美食方面来说，这里有火锅、川菜、小吃，还有茶馆，林林总总，让人目不暇接。', '锦里，宽窄巷子，春熙路，都江堰景区', 'http://localhost:3000/citypics/chengdu.jpg','http://localhost:3000/poster/p8.jpg'),
(120100, 120000, '东京', 'Tokyo' ,1000,
'东京，如同一支狂想曲，写满了喧嚣与孤独，浅吟着繁华与怀旧。她是世界五大金融中心之一，她有繁华如银座、新宿、六本木的商业区，也有静默如根津、深川的城下町。她可以非常大都市，在东京站、涉谷、表参道街头感受国际风尚，也可以很传统内敛，去月岛、北千住、浅草走街串巷体味旧式小巷和残留的民风街物。锦囊依据东京的交通划分区域，详细全面的介绍了东京的各类实用信息，以及不可错过的景点、美食和购物点，一起去感受东京的繁华与文化吧。', '浅草寺，东京塔，银座，秋叶原', 'http://localhost:3000/citypics/tokyo.jpg','http://localhost:3000/poster/p9.jpg'),
(120200, 120000, '大阪', 'Osaka' ,1000,
'作为综合性的国际化大都市，大阪在繁华和时尚程度上丝毫不逊色于东京。这里高楼林立、交通发达，商业发展特别繁荣，有超过10万多家不同类型的商铺，简直可以称得上购物爱好者们的天堂。相比起东京，拥有独特历史魅力和众多文化遗产的大阪更加受旅行者们的青睐，这里也是前往奈良和京都的必经之地。', '大阪环球影城，大阪城天守阁，黑门市场，大阪城公园', 'http://localhost:3000/citypics/daban.jpg','http://localhost:3000/poster/p10.jpg'),
(120300, 120000, '京都', 'Kyoto' ,1000,
'京都市坐落于日本关西的盆地中，三面环山，一面与大阪府相接。京都拥有一千两百多年的悠久历史，被称为所有日本人的故乡，其中作为日本首都的岁月也超过了千年，是名副其实的千年古都。四季的京都有着自己独特的魅力：春天走过哲学小道，轻轻掸去飘落肩头的樱花瓣；夏日在鸭川河畔的纳凉床把酒言欢，看对岸灯火阑珊；秋天漫步渡月桥，惊叹于被枫叶染红的整个世界；冬日在积雪的金阁寺，侧耳倾听雪落和心跳的声音。即使不按照固定行程，只是漫无目的行走在这座城市，也是一场充满惊喜的小探险。', '清水寺，千本鸟居，金阁寺，伏见稻荷大社', 'http://localhost:3000/citypics/jingdou.jpg','http://localhost:3000/poster/p11.jpg'),
(120400, 120000, '北海道', 'HokKaido', 1000,
'北海道，只是这三个字，就会令无数人心驰神往。春时满城樱花，夏日山野烂漫，秋季红叶清幽，冬夜飘雪浪漫，这是一座北方的海岛，四季分明的浪漫北国。北海道锦囊涵盖了道央和道北地区几大重要城市，包括北海道道厅所在地札幌、电影《情书》的拍摄地小樽、温泉资源非常丰富的火山湖洞爷湖、知名度最高的温泉疗养胜地登别、以夜景而闻名的“坂道之城”函馆，以动物园而为人熟知的旭川，还有薰衣草飘香的富良野与美瑛。', '札幌，函馆，富良野，小樽', 'http://localhost:3000/citypics/hokkaido.jpg','http://localhost:3000/poster/p12.jpg'),
(120500, 120000, '奈良', 'Nagoya', 1000,
'作为日本旧都，奈良保留了非常多的名胜古迹。这座宁静的城市既保存有佛教最初传入日本的痕迹，也拥有唐风浓郁的建筑样式，悠闲漫步的鹿群更为这座古城增添了勃勃生机。宇治正是日本小说《源氏物语》的诞生地，美丽的河水、春夏绿意盎然的美景、秋天的红枫以及正宗的宇治抹茶，让这座小城魅力满分。', '奈良公园，春日大社，东大寺，若草山', 'http://localhost:3000/citypics/3-1.jpeg','http://localhost:3000/poster/p13.jpg'),
(120600, 120000, '名古屋', 'Nagaya', 1000,
'名古屋位于东京和京都之间，所以也被称作中京，中部地区则被称作中京圈。随着丰田等地区的汽车制造业的快速发展，名古屋的工业发展也被逐渐地带动了起来，成为全国知名的工业城市，以名古屋为首的中京圈逐渐成为中部地区商业发展的中心。', '名古屋城，热田神宫，名古屋电视台，名古屋城天守阁','http://localhost:3000/citypics/2-2.jpeg','http://localhost:3000/poster/p14.jpg'),
(120700, 120000, '神户', 'Kobe', 1000,
'在这里，你可以登上108米高的神户港塔，将整座城市的风貌和港口的美景尽收眼底。也可以前往北野异人馆街区参观那些明治时代遗留下来的西洋建筑，体验异国风情的文化与历史。还可以去南京町中华街感受当地的华人文化，品尝美味可口的中餐料理。周边还有日本的国宝姫路城，人气极高的宝塚歌剧院，动漫迷们格外熟悉的圣地甲子园，以及可以欣赏到“用千万美金都不换”的六甲山夜景，还能够体验丰臣秀吉钟爱的日本三大温泉之一有马温泉。神户还是日本第一的清酒产地，号称日本第一酒乡。著名的神户牛肉可以说是日本和牛最具代表的品种，被誉为日本料理的顶级食材。这一切都让世界各地的旅行者们对这座城市充满了向往和好感，吸引着他们前来观光。', '神户港，神户北野美术馆，神户港灯塔，六甲山','http://localhost:3000/citypics/7-1.jpeg','http://localhost:3000/poster/p15.jpg'),
(120800, 120000, '札幌', 'Sapporo', 1000,
'札幌是个典型的北国城市，具有浓厚的北国风味。札幌每年都有以冰雪为主题的户外活动，这就是札幌雪祭的由来。雪祭的主会场设在大通公园，郊区的真驹被开辟为第二会场，专供儿童玩耍。', '白色恋人巧克力工厂，札幌电视台，北海道神宫，札幌钟楼','http://localhost:3000/citypics/3-1.jpg','http://localhost:3000/poster/p16.jpg'),
(130100, 130000, '吉隆坡', 'Kuala Lumpur', 1000, null, null, null,null),
(130200, 130000, '马六甲', 'Melaka', 1000, null, null, null,null),
(130300, 130000, '亚庇', 'Kota Kinabalu', 1000, null, null, null,null),
(130400, 130000, '沙巴', 'Sabah', 1000, null, null, null,null),
(130500, 130000, '槟城', 'Penang', 1000, null, null, null),null,
(140100, 140000, '巴黎', 'Paris', 1000, null, null, null,null),
(150100, 150000, '马德里', 'Madrid', 1000, null, null, null,null),
(150200, 150000, '巴塞罗那', 'Barcelona', 1000, null, null, null,null),
(160100, 160000, '纽约', 'NewYork', 1000, null, null, null,null),
(160200, 160000, '洛杉矶', 'Los Angeles', 1000, null, null, null,null),
(170100, 170000, '曼谷', 'Bangkok', 1000, null, null, null,null),
(170200, 170000, '清迈', 'Chiang Mai', 1000, null, null, null,null),
(170300, 170000, '普吉岛', 'Phuket', 1000, null, null, null,null),
(180100, 180000, '首尔', 'Seoul', 1000, null, null, null,null);

/** 插入景点表数据 **/
INSERT INTO trip_spots(sid, cid, views, sname) VALUES
(110101, 110100, 10000, '星光大道'),
(110102, 110100, 10000, '太平山'),
(110103, 110100, 10000, '香港迪斯尼乐园'),
(110104, 110100, 10000, '香港海洋公园'),
(110105, 110100, 10000, '香港湛山寺'),
(110106, 110100, 10000, '香港妙法寺'),
(110107, 110100, 10000, '香港长洲花地玛圣母堂'),
(110108, 110100, 10000, '香港荔枝角公园'),
(110201, 110200, 10000, '大三巴牌坊'),
(110202, 110200, 10000, '澳门渔人码头'),
(110203, 110200, 10000, '路环岛'),
(110204, 110200, 10000, '澳门旅游塔'),
(110205, 110200, 10000, '议事厅亭前地'),
(110301, 110300, 10000, '广州塔'),
(110302, 110300, 10000, '沙面'),
(110303, 110300, 10000, '越秀公园'),
(110304, 110300, 10000, '上下九步行街'),
(110305, 110300, 10000, '北京路'),
(110306, 110300, 10000, '中山纪念堂'),
(110401, 110400, 10000, '台北101'),
(110402, 110400, 10000, '台北故宫博物院'),
(110403, 110400, 10000, '饶河街夜市'),
(110404, 110400, 10000, '国父纪念馆'),
(110405, 110400, 10000, '西门红楼'),
(110501, 110500, 10000, '垦丁大街'),
(110502, 110500, 10000, '垦丁白沙湾沙'),
(110503, 110500, 10000, '龙磐公园'),
(110504, 110500, 10000, '鹅銮鼻灯塔'),
(110505, 110500, 10000, '猫鼻头公园堂'),
(110601, 110600, 10000, '故宫'),
(110602, 110600, 10000, '天安门广场'),
(110603, 110600, 10000, '八达岭长城'),
(110604, 110600, 10000, '颐和园'),
(110605, 110600, 10000, '鸟巢'),
(110606, 110600, 10000, '天坛公园'),
(110607, 110600, 10000, '圆明园'),
(110701, 110700, 10000, '外滩'),
(110702, 110700, 10000, '南京步行街'),
(110703, 110700, 10000, '上海城隍庙旅游区'),
(110704, 110700, 10000, '陆家嘴'),
(110705, 110700, 10000, '东方明珠广播电视塔'),
(110706, 110700, 10000, '黄浦江'),
(110707, 110700, 10000, '田子坊'),
(110801, 110800, 10000, '锦里'),
(110802, 110800, 10000, '宽窄巷子'),
(110803, 110800, 10000, '春熙路'),
(110804, 110800, 10000, '都江堰景区'),
(110805, 110800, 10000, '武侯祠'),
(120101, 120100, 10000, '浅草寺'),
(120102, 120100, 10000, '东京塔'),
(120103, 120100, 10000, '银座'),
(120104, 120100, 10000, '秋叶原'),
(120105, 120100, 10000, '东京迪士尼'),
(120106, 120100, 10000, '上野公园'),
(120201, 120200, 10000, '大阪环球影城'),
(120202, 120200, 10000, '大阪城天守阁'),
(120203, 120200, 10000, '黑门市场'),
(120204, 120200, 10000, '大阪城公园'),
(120205, 120200, 10000, '通天阁'),
(120301, 120300, 10000, '清水寺'),
(120302, 120300, 10000, '千本鸟居'),
(120303, 120300, 10000, '金阁寺'),
(120304, 120300, 10000, '伏见稻荷大社'),
(120305, 120300, 10000, '八坂神社'),
(120306, 120300, 10000, '三年坂二年坂'),
(120401, 120400, 10000, '札幌'),
(120402, 120400, 10000, '函馆'),
(120403, 120400, 10000, '富良野'),
(120404, 120400, 10000, '小樽'),
(120405, 120400, 10000, '旭川市'),
(120501, 120500, 10000, '奈良公园'),
(120502, 120500, 10000, '春日大社'),
(120503, 120500, 10000, '东大寺'),
(120504, 120500, 10000, '若草山'),
(120505, 120500, 10000, '奈良国立博物馆'),
(120601, 120600, 10000, '名古屋城'),
(120602, 120600, 10000, '热田神宫'),
(120603, 120600, 10000, '名古屋电视台'),
(120604, 120600, 10000, '名古屋城天守阁'),
(120605, 120600, 10000, '大须观音寺'),
(120701, 120700, 10000, '神户港'),
(120702, 120700, 10000, '神户北野美术馆'),
(120703, 120700, 10000, '神户港灯塔'),
(120704, 120700, 10000, '六甲山'),
(120705, 120700, 10000, '马赛克摩天轮馆'),
(120801, 120800, 10000, '白色恋人巧克力工厂'),
(120802, 120800, 10000, '札幌电视台'),
(120803, 120800, 10000, '北海道神宫'),
(120804, 120800, 10000, '札幌钟楼'),
(120805, 120800, 10000, '大通公园');

/** 插入Note表数据 **/
INSERT INTO trip_note(nid, sid, cid, uid, title, likes, comments, create_time, img) VALUES
(1, 120000, 120200, 1,
'从平价小吃到米其林——大阪京都神户美食集(10日20店详记',
88, 128, '2018-12-18', 'http://localhost:3000/citypics/1-1.jpg'
),
(2, 120000, 120400, 2,
'日本·北海道 | 十二月的晴空飞雪',
6499, 360, '2017-12-12', 'http://localhost:3000/citypics/hokkaido.jpg'
),
(3, 120000, 120200, 3,
'霓虹国走花路之我的关西樱花图鉴',
7168, 318,'2018-03-30', 'http://localhost:3000/citypics/3-1.jpeg'
),
(4, 120000, 120300, 4,
'京都风物 | 偏爱京都冷门地、独立咖啡店与在地美食收录',
7466, 452, '2018-10-02', 'http://localhost:3000/citypics/3-2.jpeg'
),
(5, 120000, 120100, 5,
'《东京攻略》潜水~日本东京潜水攻略——馆山自由行', 
6098, 80, '2018-08-30', 'http://localhost:3000/citypics/5-1.jpg'
),
(6, 120000, 120600, 6,
'名古屋秋日的樱花与红叶（爱知县攻略)',
125, 203, '2018-11-24', 'http://localhost:3000/citypics/4-2.jpg'
),
(7, 120000, 120700, 7,
'神户【BE KOBE】（史上最全！！！的神户交通+路线规划)',
989, 452, '2019-04-27', 'http://localhost:3000/citypics/7-1.jpeg'
),
(8, 130000, 130100, 8,
'大马(吉隆坡)，带我去从不一样的视角看世界',
769, 342, '2018-10-27', 'http://localhost:3000/citypics/8-1.jpg'
),
(9, 130000, 130100, 9,
'寻味，槟城',
839, 91, '2017-10-01', 'http://localhost:3000/citypics/9-1.jpg'
),
(10, 130000, 130100, 10,
'大马十天闯祸记|亚庇•仙本那•吉隆坡•攻略篇【超详细！内含考潜水证OW攻界',
769, 342, '2018-06-03', 'http://localhost:3000/citypics/10-2.jpg'
);

/** 插入tag表数据 **/
INSERT INTO trip_tag (tid, tname) VALUES
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

/** 插入note tag数据 **/
INSERT INTO trip_note_tag (id, nid, tid) VALUES
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
/** 插入组团游表数据 **/
INSERT INTO trip_group(gid, uid, tid, cid, intr, begin_time, end_time, create_time, update_time, sid, bg) VALUES
# 同一主题不同城市 香港 台湾 东京
(1, 1, 1, 110100,
'看到香港崇光百货新开店，想去看见有没有打折的商品，有一起去的吗',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg1.png'
),
(2, 2, 1, 110100,
'看到香港崇光百货新开店，想去看见有没有打折的商品，有一起去的吗',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg2.png'
),
(3, 3, 1, 110100,
'看到香港崇光百货新开店，想去看见有没有打折的商品，有一起去的吗',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg3.png'
),
(4, 4, 1, 110100,
'看到香港崇光百货新开店，想去看见有没有打折的商品，有一起去的吗',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg4.png'
),
(5, 5, 1, 110400, '11月9号到16号。机票已定。想找个人一起结伴旅行。不一定要拼住，要是你刚好也在台北就能约一起狂街。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg5.png'
),
(6, 6, 1, 110400, '11月9号到16号。机票已定。想找个人一起结伴旅行。不一定要拼住，要是你刚好也在台北就能约一起狂街。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg6.png'
),
(7, 7, 1, 110400, '11月9号到16号。机票已定。想找个人一起结伴旅行。不一定要拼住，要是你刚好也在台北就能约一起狂街。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg7.png'
),
(8, 8, 1, 110400, '11月9号到16号。机票已定。想找个人一起结伴旅行。不一定要拼住，要是你刚好也在台北就能约一起狂街。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg8.png'
),
(9, 1, 1, 120100, '目的地东京，主要对展览、美食、中古感兴趣，本人85后，性格外向事不多，有多国旅游经验，约年纪差距不太大，志同道合的女生，逛吃逛吃～',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg9.png'
),
(10, 2, 1, 120100, '目的地东京，主要对展览、美食、中古感兴趣，本人85后，性格外向事不多，有多国旅游经验，约年纪差距不太大，志同道合的女生，逛吃逛吃～',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg10.png'
),
(11, 3, 1, 120100, '目的地东京，主要对展览、美食、中古感兴趣，本人85后，性格外向事不多，有多国旅游经验，约年纪差距不太大，志同道合的女生，逛吃逛吃～',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg1.png'
),
(12, 4, 1, 120100, '目的地东京，主要对展览、美食、中古感兴趣，本人85后，性格外向事不多，有多国旅游经验，约年纪差距不太大，志同道合的女生，逛吃逛吃～',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg2.png'
),
(13, 5, 2, 110100, '找个一起旅行一辈子的人',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg3.png'
),
(14, 6, 2, 110100, '找个一起旅行一辈子的人',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg4.png'
),
(15, 7, 2, 110100, '找个一起旅行一辈子的人',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg5.png'
),
(16, 8, 2, 110100, '找个一起旅行一辈子的人',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg6.png'
),
(17, 5, 2, 110400, '寻知心说走就走的散心之旅',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg7.png'
),
(18, 5, 2, 110400, '寻知心说走就走的散心之旅',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg8.png'
),
(19, 5, 2, 110400, '寻知心说走就走的散心之旅',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg9.png'
),
(20, 5, 2, 110400, '寻知心说走就走的散心之旅',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg10.png'
),
(21, 5, 2, 120100, '11月东京，主要去迪士尼，去过2次日本自由行，多国自由行经验丰富。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg1.png'
),
(22, 5, 2, 120100, '11月东京，主要去迪士尼，去过2次日本自由行，多国自由行经验丰富。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg2.png'
),
(23, 5, 2, 120100, '11月东京，主要去迪士尼，去过2次日本自由行，多国自由行经验丰富。',
'2019-11-11', '2019-11-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg3.png'
),
(24,6,3,110100,'一起旅游吧 想去哪儿都可以，来一场说走就走的旅行','2019-11-10',' 2019-11-15', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg4.png'
),
(25,7,3,110100,'本人座標深圳 女 吃貨一枚 下週有沒有要去香港海洋公園halloween','2019-11-29',' 2019-12-04', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg5.png'
),
(26,4,3,110100,'在香港学习工作6年，本土深度游，杜绝参观式旅游','2019-12-30',' 2020-1-04', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg6.png'
),
(27,1,3,110400,'找个伴，一起在外跨年','2019-12-30','2020-01-06', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg7.png'
),
(28,2,3,110400,'26~27日在台湾垦丁水肺潜水，有刚好在垦丁的朋友要一起潜水吗？','2019-11-26','2019-11-27', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg8.png'
),
(29,5,3,110400,'随性而行，随遇而安','2020-02-05','2020-2-13', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg9.png'
),
(30,3,3,120100,'一部单反、一辆车、两三个人一起闯','2020-05-04','2020-05-16', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg10.png'
),
(31,3,3,120100,'12月25日－1月2日，东京自由行，上海出发，主要去富士山，还会去镰仓和迪士尼海洋，可拼房或者单独住，合适直接出票，有兴趣的伙伴联系我。','2019-12-25','2020-04-12', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg1.png'
),
(32,3,3,120100,'一月初东京迪士尼有没有一起的呀','2019-12-29','2020-01-15', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg2.png'
),
(33,6,4,110100,'一起过万圣节，香港，有没有一起组队的','2019-10-31',' 2019-11-04', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg3.png'
),
(34,7,4,110100,'一起去旅行，让心去旅行。','2019-11-29',' 2019-12-04', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg4.png'
),
(35,4,4,110100,'准备区香港跨年。寻找志同道合的小伙伴','2019-12-30',' 2020-1-04', '2019-10-30', '2019-10-30',
110000, 'http://localhost:3000/group/bg5.png'
),
(36,1,4,110400,'想散心走走 沒目標希望有一個有目標的男女生','2019-11-01','2019-11-30', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg6.png'
),
(37,2,4,110400,'11.16-11.24台北七日行，详细攻略由台北中正纪念堂-故宫博物院-宁夏夜市-西门町-九份老街-七星潭转台中，或许旅途结束会去印度，希望在旅途中有志同道合的朋友一起加入能让旅途变得更加有趣','2019-11-16','2019-11-24', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg7.png'
),
(38,5,4,110400,'台湾跨年，行程未定','2019-12-27','2020-1-3', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg8.png'
),
(39,3,4,120100,'2020- 4月初邀约想看樱花节的朋友一起游东京，看樱花，黑部力山，开朗活泼，行程可以一起讨论，有兴趣的可以联络～','2020-04-04','2020-04-11', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg9.png'
),
(40,3,4,120100,'旅游攻略论坛：结伴同游计划很简单 东京到京都到大阪，11.13-11.18','2019-11-13','2019-11-18', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg10.png'
),
(41,3,4,120100,'无计划，无目的，无意向，元旦期间有长时间的假期，年假一直没休，最近想找个时间放空自己，外出旅行寻找一下人生的意义，希望有同伴能带带我，去哪都行，本人头脑灵活，四肢还算发达，不管是自驾游还是自由行，我都能派上用场','2019-12-25','2020-01-08', '2019-10-30', '2019-10-30',
120000, 'http://localhost:3000/group/bg1.png'
);

INSERT INTO trip_group_img(gid, img) VALUES
(1, 'http://localhost:3000/citypics/1-1.jpg'),
(1, 'http://localhost:3000/citypics/1-2.jpg'),
(1, 'http://localhost:3000/citypics/1-3.jpg'),
(2, 'http://localhost:3000/citypics/shanghai.jpg'),
(3, 'http://localhost:3000/citypics/taiwan2.jpg'),
(3, 'http://localhost:3000/citypics/taiwan3.jpg'),
(4, 'http://localhost:3000/citypics/guangzhou.jpg'),
(5, 'http://localhost:3000/citypics/chengdu.jpg'),
(6, 'http://localhost:3000/citypics/chongqing.jpg'),
(7, 'http://localhost:3000/citypics/hk1.jpg'),
(7, 'http://localhost:3000/citypics/hk2.jpg'),
(8, 'http://localhost:3000/citypics/beijin1.jpg'),
(8, 'http://localhost:3000/citypics/beijin2.jpg');