/*
Navicat MySQL Data Transfer

Source Server         : phpwamp
Source Server Version : 50554
Source Host           : 127.0.0.1:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-12-28 15:24:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '笔名',
  `realname` varchar(255) DEFAULT NULL COMMENT ' 真实姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='作者';

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', '觅树知音', '张', '15912345678', '1508467893', '1508467893', null);
INSERT INTO `author` VALUES ('2', '土豆', '李四', '13012341234', '1508467913', '1508467913', null);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '1' COMMENT 'banner位置 1为首页轮播图 2为个人中心背景图 3为书籍详情背景图',
  `jump_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `picture` text COMMENT ' 广告图',
  `sort` int(11) DEFAULT NULL COMMENT ' 排序',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='首页轮播图';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('2', '1', '/index/index/book_detail/book_id/3.html', '/uploads/20171030/e967b05736e09a98aed6a74cf33c9d1b.jpg', '0', '1509331978', '1509332448', null);
INSERT INTO `banner` VALUES ('3', '1', '', '/uploads/20171030/785accfd809626e5835f0c9a95ad34c0.jpg', '0', '1509332636', '1509335772', null);
INSERT INTO `banner` VALUES ('6', '2', '', '/uploads/20171030/0e2920748a24ea25b5d57ec48942bf2e.jpg', '0', '1509343437', '1509343437', null);
INSERT INTO `banner` VALUES ('7', '3', '', '/uploads/20171107/b68f51ed668294f4477c59357508a133.jpg', '0', '1510020315', '1510022671', null);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类 ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0连载，1完结',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型，0男，1女',
  `picture` text COMMENT '封面',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `author_id` int(11) DEFAULT NULL COMMENT '作者 ID',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `click_num` int(11) DEFAULT '0' COMMENT '点击量',
  `submit_num` int(11) DEFAULT '0' COMMENT '保存量',
  `buy_num` int(11) DEFAULT '0' COMMENT '购买量',
  `amount` int(11) DEFAULT NULL COMMENT '整书价格',
  `free_status` tinyint(1) DEFAULT '0' COMMENT '免费状态，0不免费，1限时免费，2完全免费',
  `free_start` int(11) DEFAULT NULL COMMENT '免费开始时间',
  `free_end` int(11) DEFAULT NULL COMMENT '免费结束时间',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '热门，0否，1是',
  `is_recommend` tinyint(1) DEFAULT '1' COMMENT '推荐，0否，1是',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `online` tinyint(1) DEFAULT '1' COMMENT '在架状态，0下架，1在架',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `edited_at` int(11) DEFAULT NULL COMMENT '文章更新时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='小说文章 主表';

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '6', '1', '0', '/uploads/20171020/4f540f84a22baf966f86a9519bc1708a.jpg', '巴黎圣母院1', '1', '巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院巴黎圣母院', '5', '0', '0', '0', '1', '1510070400', '1510156799', '0', '1', '0', '1', '1510121911', '1510121911', '1509173334', null);
INSERT INTO `book` VALUES ('2', '6', '1', '0', '/uploads/20171020/72c76d5b839179f4fd9f4e354096066f.jpg', '战争与和平2', '1', '战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平战争与和平', '15', '0', '0', '0', '1', '1509638400', '1509724799', '1', '1', '0', '1', '1510039620', '1510039620', null, null);
INSERT INTO `book` VALUES ('3', '6', '1', '0', '/uploads/20171020/3627e4eaff26529e306926ecf4f6613d.jpg', '童年3', '2', '童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年童年', '7', '0', '0', '0', '1', '1509638400', '1509724799', '1', '1', '0', '1', '1510128742', '1510128742', '1509157502', null);
INSERT INTO `book` VALUES ('4', '1', '1', '0', '/uploads/20171020/b03728ca92d8b6c25ab39772d8e7e27c.jpg', '第一本书4', '1', '第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书第一本书', '0', '0', '0', '0', '1', '1510070400', '1510070399', '1', '1', '0', '1', '1510121327', '1510121327', null, null);
INSERT INTO `book` VALUES ('5', '3', '1', '0', '/uploads/20171020/ae275c880eef845dcbf509c1ae8573fd.jpg', '鬼吹灯5', '1', '小说中作者首创历史上四大盗墓门派——摸金、卸岭、发丘、搬山，其中摸金是技术含量最高，规矩最多的门派。“人点烛，鬼吹灯”是传说中摸金派的不传之秘，意为进入古墓之中先在东南角点燃一支蜡烛才能开棺，如果蜡烛熄灭，须速速退出，不可取一物。相传这是祖师爷所定的一条活人与死人的契约，千年传承，不得破。', '438', '0', '2', '0', '1', '1509033600', '1509119999', '0', '1', '0', '1', '1510042018', '1510042018', '1509346321', null);
INSERT INTO `book` VALUES ('6', '1', '0', '0', '/uploads/20171030/39f8466cd31bfe3c72004b0731911ef4.jpg', '6', '1', '21', '0', '0', '0', '0', '1', '1509638400', '1509724799', '0', '1', '0', '1', '1509698434', '1509698434', null, null);
INSERT INTO `book` VALUES ('7', '4', '0', '0', '/uploads/20171030/d8d20be5c4204f4515a0ece04b5a121e.jpg', '7', '2', '423', '0', '0', '0', '342', '0', '0', '0', '0', '1', '0', '1', '1509356713', '1509356713', null, null);
INSERT INTO `book` VALUES ('8', '2', '0', '0', '/uploads/20171031/afdfd4f16f444fbc68d5f24bac34d696.jpg', '8', '2', '34234', '0', '0', '0', '0', '1', '1510070400', '1510156799', '0', '1', '0', '1', '1510122128', '1510122128', null, null);
INSERT INTO `book` VALUES ('9', '2', '0', '0', '/uploads/20171031/202a4e13cf365c7e8749337c3bff0516.jpg', '9', '1', '432', '0', '0', '0', '0', '1', '1510070400', '1510156799', '0', '1', '0', '1', '1510122128', '1510122128', null, null);
INSERT INTO `book` VALUES ('10', '6', '1', '0', '/uploads/20171101/314bc7843bf5fb9340f59d7489997dab.jpg', '10', '1', '21', '0', '0', '0', '0', '1', '1509638400', '1509724799', '0', '1', '0', '1', '1509698455', '1509698455', null, null);
INSERT INTO `book` VALUES ('11', '2', '1', '0', '/uploads/20171101/87c49c884b41e0a582f7f130870319ea.jpg', '11', '1', '21', '2', '1', '0', '0', '2', '0', '0', '0', '1', '0', '1', '1510190287', '1510190287', null, null);
INSERT INTO `book` VALUES ('12', '2', '1', '0', '/uploads/20171101/f53c339ce2fe21d64dacffe35cae3025.jpg', '12', '1', '21', '0', '0', '0', '0', '2', '0', '0', '0', '1', '0', '1', '1509504099', '1509504099', null, null);
INSERT INTO `book` VALUES ('13', '2', '1', '0', '/uploads/20171101/91840ab025d18a662c199a7580e9a60c.jpg', '13', '1', '21', '0', '0', '0', '0', '1', '1509638400', '1509724799', '0', '1', '0', '1', '1509698586', '1509698586', null, null);
INSERT INTO `book` VALUES ('14', '2', '1', '0', '/uploads/20171101/314bc7843bf5fb9340f59d7489997dab.jpg', '14', '1', '21', '0', '0', '0', '0', '2', '0', '0', '0', '1', '0', '1', '1509504006', '1509504006', null, null);
INSERT INTO `book` VALUES ('15', '2', '1', '0', '/uploads/20171101/314bc7843bf5fb9340f59d7489997dab.jpg', '15', '1', '21', '0', '0', '0', '0', '2', '0', '0', '0', '1', '0', '1', '1509504006', '1509504006', null, null);
INSERT INTO `book` VALUES ('16', '2', '1', '0', '/uploads/20171101/314bc7843bf5fb9340f59d7489997dab.jpg', '16', '1', '21', '0', '1', '0', '0', '2', '0', '0', '0', '1', '0', '1', '1510190181', '1510190181', null, null);

-- ----------------------------
-- Table structure for book_cate
-- ----------------------------
DROP TABLE IF EXISTS `book_cate`;
CREATE TABLE `book_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='小说分类';

-- ----------------------------
-- Records of book_cate
-- ----------------------------
INSERT INTO `book_cate` VALUES ('1', '都市', '0', '1508467927', '1508467927', null);
INSERT INTO `book_cate` VALUES ('2', '玄幻', '0', '1508467937', '1508467937', null);
INSERT INTO `book_cate` VALUES ('3', '惊悚', '0', '1508467945', '1508467945', null);
INSERT INTO `book_cate` VALUES ('4', '历史', '0', '1508467970', '1508467970', null);
INSERT INTO `book_cate` VALUES ('5', '科幻', '0', '1508467975', '1508467975', null);
INSERT INTO `book_cate` VALUES ('6', '名著', '0', '1508467981', '1508467981', null);
INSERT INTO `book_cate` VALUES ('7', '官场', '0', '1509432880', '1509432880', null);
INSERT INTO `book_cate` VALUES ('8', '总裁', '0', '1509432885', '1509432885', null);

-- ----------------------------
-- Table structure for book_content
-- ----------------------------
DROP TABLE IF EXISTS `book_content`;
CREATE TABLE `book_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL COMMENT '小说主表 ID',
  `order_num` int(11) DEFAULT NULL COMMENT ' 序号',
  `name` varchar(255) DEFAULT NULL COMMENT ' 标题',
  `content` text COMMENT '内容',
  `price` int(11) DEFAULT NULL COMMENT ' 章节价格',
  `click_num` int(11) DEFAULT NULL COMMENT '点击量',
  `buy_num` int(11) DEFAULT NULL COMMENT '购买量',
  `created_at` int(11) DEFAULT NULL COMMENT ' ',
  `edited_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='小说文章 内容表';

-- ----------------------------
-- Records of book_content
-- ----------------------------
INSERT INTO `book_content` VALUES ('1', '3', '1', '前言', '<p>\r\n	342342\r\n</p>', '0', '5', null, '1509157483', '1509157483', '1510128742', null);
INSERT INTO `book_content` VALUES ('2', '3', '2', '背景', '<p>\r\n	热热翁\r\n</p>', '0', '2', null, '1509157502', '1509157502', '1510128740', null);
INSERT INTO `book_content` VALUES ('3', '5', '1', '人物介绍', '<p>\r\n	胡八一（胡说胡有理）\r\n</p>\r\n<p>\r\n	敢想、敢说、敢做、敢闯、敢革命，一句话概括就是敢造反，红卫兵、知青、工兵、野战军、个体户、掌握寻龙诀的摸金校尉，一腔剩勇。(原名：胡建军 后因为在幼儿园时全班叫建军太多而改为胡八一)\r\n</p>\r\n<p>\r\n	胖子王凯旋（只信任胡司令一人）\r\n</p>\r\n<p>\r\n	毛主席说“粪土当年万户侯”，既然立志以天下为己任，不狂妄不牛逼怎么行？狂妄靠的是实力，牛逼凭的是魄力，喧哗上等性格比较二，认钱不认人，枪法第一，将门之后高干子弟，除了怕高别的都不在乎，不仅具备完善的斗争理论，更可贵的是敢于斗争，善于斗争，乐于斗争。\r\n</p>\r\n<p>\r\n	Shirley杨（信仰上帝）\r\n</p>\r\n<p>\r\n	Shirley杨是个年轻的女子，黑发如云，秀眉入鬓，面容清秀。但这漂亮妞儿却鼻子有点鹰勾，眼睛稍微有点发蓝，具有外国的血统。她是美籍华裔，卓越但不高傲，美国海军学院毕业，放弃从军改做摄影师，支持民主党，继承了家族中密而不传的搬山分甲术。\r\n</p>\r\n<p>\r\n	明叔雷显明（破产的投机港商）\r\n</p>\r\n<p>\r\n	祖上拜十三须花瓷猫，以背尸翻窨子起家，又在南洋跑船致富，继承了民间散盗的一切优良传统，专业从事不法勾当，座右铭是不赌不知时运高。\r\n</p>\r\n<p>\r\n	大金牙（最喜欢古玉）\r\n</p>\r\n<p>\r\n	传统市侩，满身老旧习气，潘家园旧货商人之王，跟老胡胖子同是老插，由于身体素质不好，所以在内心深处比较推崇和信任胡八一，希望能发财。\r\n</p>\r\n<p>\r\n	陈瞎子（算命者）\r\n</p>\r\n<p>\r\n	祖上是湖南湘阴显赫一时的世家，到这代已经做了三代卸岭盗魁，生的一双夜眼，民国期间做过三湘四水显赫一时的卸岭盗魁，后去云南献王墓的时候死了不少兄弟并毁了一对招子。从此退隐，以算命为生。平生忌讳之事，就是见到社区红袖章大妈。\r\n</p>\r\n<p>\r\n	丁思甜（胡八一和胖子的红卫兵战友）\r\n</p>\r\n<p>\r\n	丁思甜长得实在太漂亮，美到惊为天人。同时她又太有才华，跳的舞蹈能使人如痴如醉，浑然忘记身在何方。她唱歌跳舞文艺全能，内蒙古草原插队，心地单纯善良，崇拜苏联作家奥斯托洛夫斯基。\r\n</p>\r\n<p>\r\n	（原名：丁乐乐后在忆苦思甜时期改为丁思甜）（死于白灾）\r\n</p>\r\n<p>\r\n	阮黑（航海经验丰富的船老大）\r\n</p>\r\n<p>\r\n	越南籍华人，反VC者，流落海岛打渔为生，朴实可靠，识风信，知水性，洞悉海底地型。（被虎鲸咬死）\r\n</p>\r\n<p>\r\n	古猜（龙户）\r\n</p>\r\n<p>\r\n	古代疍人后代，在海中来去自如，彪悍绝伦，最善赴水采珠，周身纹有“透海阵”。\r\n</p>\r\n<p>\r\n	鹧鸪哨（最后的搬山道人）\r\n</p>\r\n<p>\r\n	心狠手辣，杀人如麻，嫉恶如仇，黑夜的宠儿，身手超凡脱俗。Shirley杨的外祖父。后拜了尘长老为师学习摸金校尉的手艺。因其擅长模仿各种动物的声音人送外号鹧鸪哨。\r\n</p>\r\n<p>\r\n	阿香（明叔的干女儿）\r\n</p>\r\n<p>\r\n	科学教的牺牲品，孤苦无依，缺乏主见，拥有佛经上所描述的本能的双眼。\r\n</p>\r\n<p>\r\n	张赢川（胡八一的师兄）\r\n</p>\r\n<p>\r\n	甘于平凡，貌不惊人，穷通易学，推天道明人事，《十六字阴阳风水秘术》作者张三链子的后代。\r\n</p>\r\n<p>\r\n	初一（昆仑山的向导）\r\n</p>\r\n<p>\r\n	沉稳干练，打狼好手，刀不离身酒不离口的藏族汉子。（和昆仑山白狼王同归于尽）\r\n</p>\r\n<p>\r\n	英子（鄂伦春族向导）\r\n</p>\r\n<p>\r\n	性格火辣，倔强直爽，游荡在山林中的猎鹿人，精于养獒。\r\n</p>\r\n<p>\r\n	安力满（维族老向导）\r\n</p>\r\n<p>\r\n	总是以胡大的旨意为借口，逃跑起来毫不迟疑，沙漠里的老狐狸和活地图。\r\n</p>\r\n<p>\r\n	老羊皮（接收丁思甜插队落户的牧羊人）\r\n</p>\r\n<p>\r\n	秦腔与马头琴之达人，迷信思想严重，平时沉默寡言，拥有一肚子的苦水和秘密，五千年沧桑写了满脸。与兄弟杨二蛋曾做过倒斗的生意。（死的离奇诡异，死后尸体被雷击中）\r\n</p>\r\n<p>\r\n	封学武（孙教授）\r\n</p>\r\n<p>\r\n	化名孙学武，表面看是苦干实干派，其真实身份是观山太保的后人，一辈子没自在过，连个能说心腹的朋友也没有，唯一可信任的，也仅仅是藏在棺材峡的那头巴山猿。\r\n</p>\r\n<p>\r\n	销器儿李（老掌柜李树国）\r\n</p>\r\n<p>\r\n	蜂窝山，七十二行里的手艺人，专门制作个人销器儿的工匠，手艺技术高超，是解放前有名的高手，黑白两道无不相识。曾按照金算盘留下的图谱和合金比例的秘方制造出一把金刚伞。后中日战争爆发，逃难入川，又化了一个假名，开间店铺买卖杂货，实际上还是想做老本行。\r\n</p>\r\n<p>\r\n	陈教授（学院派）\r\n</p>\r\n<p>\r\n	慈祥和蔼，学识渊博，对年轻人总是寄予厚望，痴迷考察文物古迹，拥有极强钻研精神的工作狂，一度由于受到打击过重导致精神失常。\r\n</p>\r\n<p>\r\n	张三爷（清末盗墓行里的老夫子）\r\n</p>\r\n<p>\r\n	一人挂三符，人称张三链子，真名不详。阅人无数，生平积案无数，而官府不敢动也。本身也经历了无数次的磨砺，深通风水之术，写有《十六字阴阳风水秘术》，详细记载着张三爷生平所学。门下党徒众多，家财不计，更广交无数达官贵族，是当时首屈一指的人物。\r\n</p>\r\n<p>\r\n	张三爷有4个徒弟，分别为金算盘、铁磨头、阴阳眼孙国辅和日后出家了的了尘长老，个个身手不凡。\r\n</p>\r\n<p>\r\n	天下霸唱新书《贼猫》中的张小辫，据传便是张三链子年轻之时。\r\n</p>\r\n<p>\r\n	掰武（崇拜同行大金牙）\r\n</p>\r\n<p>\r\n	在海岛黑市上经营酒馆和青头货的华裔残疾商人，祖上曾在前清水师营听差，海事通吃，无差别交易者。\r\n</p>', '0', '185', '2', '1509157545', '1509157545', '1510042001', null);
INSERT INTO `book_content` VALUES ('4', '5', '2', '故事介绍', '<p>\r\n	《精绝古城》\r\n</p>\r\n<p>\r\n	《鬼吹灯》第一部第一卷《精绝古城》，可以分为前后两个部分，前半部分截止到野人沟黑风口的地下军(是)事要塞，主要是一个框架、平台的搭建，并没有什么与主线关系明确的线索。这半部是想写成民间传说、乡村野谈那种类型。所谓民间故事的类型，感觉大概就是僵尸和黑驴蹄子那种深山老林里的传说。\r\n</p>\r\n<p>\r\n	从考古队进入沙漠寻找精绝古城开始，触及到了鲜明的地理文化元素，西域沙漠、孔雀河、双圣山、三十六国、楼兰女尸、敦煌壁画，提到这些元素，一股神秘的气息扑面而来，所以在精绝古城这部分，是将神秘感作为了故事核心，到最后精绝女王也没露面，算是神秘到底了。这一卷中涉及到了一些考古解谜之类的元素。\r\n</p>\r\n<p>\r\n	作为最初的一卷，现在来看最大的缺陷，就是有些部分写得过于简单和潦草了，逻辑比较松散，随写随编，完全没有考虑后面的故事如何展开；满意的地方是描写和叙述比较真实、生动。\r\n</p>\r\n<p>\r\n	看起来很真实很乡野很神秘的风格，是在写第一卷的时候，最想表现的内容。\r\n</p>\r\n<p>\r\n	《龙岭迷窟》\r\n</p>\r\n<p>\r\n	《鬼吹灯》第一部第二卷《龙岭迷窟》，实际上这卷故事，分为了三个部分，一是龙岭倒斗发现西周幽灵冢，二是摸金校尉黑水城寻宝，三是石碑店棺材铺献王痋术浮出水面。虽然一卷中有三个故事，但在本卷中，作者主要想突出惊悚这一核心元素。也许有人说《鬼吹灯》是惊悚小说，其实作者觉得完全不是，整体上和“恐怖”关系不大。如果说到惊悚，这只是本书诸多元素之一，并非主要元素。悬念迭出的只有《龙岭迷窟》这一卷，到处是传统话本令人窒息的扣子，这是耸人听闻的一卷\r\n</p>\r\n<p>\r\n	《云南虫谷》\r\n</p>\r\n<p>\r\n	《鬼吹灯》第一部第三卷《云南虫谷》，写这卷故事的时候正好是在看世界杯，印象尤其深刻，是对精力、体力、毅志品质的一次严峻考验。云南献王墓这一卷中以探险作为核心。作者很喜欢看电影，曾经非常喜欢《深渊》和《异形》。所谓的探险，是探索加冒险，后来看到翻拍版《金刚》的预告片，有一段探险队利用转盘式冲锋(抢)枪，同山谷里蜈蚣恶(占)战的桥段，超级喜欢这种场面。老式装备的探险队，皮划艇漂流、坠毁的空(君)军飞机残骸、幽灵般的摩尔斯信号、芝加哥打字机、千万年不死的巨型昆虫、吞噬万物的尸洞效应、在自然环境恶劣的丛林和化石洞穴中披荆斩棘，于是云南虫谷就启动了，完全是藏宝图式的传统探险元素，里面加有一引起奇怪的灵异和科幻色彩，这是新旧冒险元素相互结合的一卷。\r\n</p>\r\n<p>\r\n	在《云南虫谷》中，故事类型全面转向“探险”。本卷出场人物较少，主要篇幅用于讲述险恶的地形和各种诡异的陷阱。对于陈瞎子贡献的人皮地图，开始的时候在作者脑中并没有什么概念，觉得怎么离奇就怎么安排了，随着写作的推进，把这一个个谜团揭开，自己也觉得有些惊讶，最早设计的献王墓，是一个只有在天崩时才会被人进入的古墓。还曾异想天开，有一架大型客机坠毁在摸金小队面前，从而撞开了古墓的大们，但后来一想到还有许多朋友今后要坐飞机出门，这么写可能不太好；加上在幽灵信号一段中，使用了抗战时期美（mi）国援华空(君)军的运输机，所以最后就把天崩描述成几十年前附毁的轰(乍)炸机了，这种情节上的重力感和命运感也无法提前预测的。\r\n</p>\r\n<p>\r\n	《昆仑神宫》\r\n</p>\r\n<p>\r\n	《鬼吹灯》第一部第四卷《昆仑神宫》充满了神话色彩。中国地大物博，不同的地域，孕育出不同的文化与传说。凡是中国神话必定离不开昆仑山，昆仑山是天地的脊骨、祖龙发源之地、西王母的神宫、北方妖魔的巢穴，昆仑离开了神话传说似乎就不能称之为昆仑了。古籍上记载着昆仑西王母的真实形象是个怪物，按照作者个人想象可能是条大鱼，曾在自然博物馆中看过世界上最大的淡水鱼，感觉真的像龙一样。\r\n</p>\r\n<p>\r\n	这一卷的情节涉及到格萨尔王传说。制敌宝珠的英雄大王史诗，本身就是一篇神话色彩很强烈的说唱长诗，所以在昆仑山这一篇中，揉入了许多接近神话的另类元素。风蚀湖的鱼王、无量业火、乃穷神冰、大黑天击雷山、水晶自在山、恶罗海城、灾难之门，这场冒险光怪陆离如同进入了幻界。《昆仑神宫》是如同在神界中冒险的一卷，虽然神话元素众多，但还是保持了一贯的原则，尽量向真实世界靠拢，当然不会有飞天入地、长生不死、神仙符咒那种真正的神话。\r\n</p>\r\n<p>\r\n	由于时间安排与合同的原因，《鬼吹灯》的第一部在《昆仑神宫》后，就算结束了，最后的结局处是在北京的北海公园，属于完美大结局。起点中文网最后一章234章中完整收录了全部内容，实体书更是完璧无缺，当然这个大结局只属于第一部。\r\n</p>\r\n<p>\r\n	在《鬼吹灯》第一部的前四册中，个人最喜欢的情节，就出现在西（分开）藏，但出于篇幅的问题，那部分被收录在了实体书云南卷的最后，是描写胡八一参军不久，在西（分开）藏月夜下的荒废寺庙中，同铁棒喇（马）嘛恶战狼群的一部分，其实这几章无论如何都应该算在最后的西（分开）藏之卷里\r\n</p>\r\n<p>\r\n	《黄皮子坟》\r\n</p>\r\n<p>\r\n	如果按照最初的计划，还是要在《鬼吹灯》第二部的四册中，描写四种不同的重点元素，这所以要写前传，主要是想活络一下思路和文字，使自己不会因过于僵化的时间线索失去耐心。\r\n</p>\r\n<p>\r\n	《黄皮子坟》是年代背景非常强烈的一卷，核心元素是关于黄鼠狼的种种诡异传说，和非人生物的墓穴和棺椁，以及东北地区特有的江湖体系，都是作者非常感兴趣的元素。但由于年代背景比较特殊，许多词语和内容难免要受限制，不同于思想活跃的八十年代，这一时期的主人公尚不成熟，但满腔的热情却是什么困难都挡不住的。\r\n</p>\r\n<p>\r\n	作者曾在海拉尔和大连，参观过日军侵华战争时期的遗址，包括焚尸炉、监狱、欧洲风格的医院和研究所等建筑，对其印象深刻，所以将故事的背景设置在其中。在这一卷中，作者觉得写得比较满意的，是对于黄皮子读心术和焚化间的描写，以及老羊皮死后被雷火击中的诡异事件，很有沉重感，单就实物来讲，觉得怪汤这一段很离奇又很真实。比较大的缺陷在于有些很有意思的东西忘了写进去，人熊那部分也处理得太草率了。\r\n</p>\r\n<p>\r\n	《南海归墟》\r\n</p>\r\n<p>\r\n	作为第一部故事的延续，在前边几卷中，对于摸金倒斗的描写，作者觉得中国传统行业中，有许多风险很大的职业，风险性最高的，当属在海中采珠的疍民。南海采珠的疍民原型出自广西北海地区，秦汉时期就已有龙户和獭家赴水采珠屠蚌，但是似乎很少有人来写。\r\n</p>\r\n<p>\r\n	所以在这一卷中，海中采珠和这一行业的传说是重点元素。有观点认为，灿烂辉煌一时的玛雅文化，是中国西周时期渡海的先民所建，因为两者相似之处极多，射日神话更是华夏文明中十分重要的内容。\r\n</p>\r\n<p>\r\n	曾想把海底的神箭，描写成一种真正的巨型兵器，迷失在归墟这片混沌之海内的摸金校尉和蛋民们，最终开动了震惊百时的神箭，射破了头顶的大海，从而逃出生天，可后来写的时候，把这个构思给忘了，但借助过龙兵这一海上的真实奇观逃生，也是十分惊心动魄的冒险。\r\n</p>\r\n<p>\r\n	关于用装填了石灰的西瓜杀死水中恶鱼，并依靠司天鱼在茫茫无际的大海上航行，这些事情并非是虚构的。以前在中国南方，确实存在着。对于本卷中比较满意的，是对海岛上的黑市描写，有一些关于海难的桥段也觉得不错，例如乾坤一跳等等；感到最不满意的是海柳底舱中海匪的尸体，这段粗糙了，应该有很大发挥的余地。珠母海里的事情也应该展开来写，但每卷书的篇幅和字数也是一个很难克服的限制，情节和内容既不能多，也不能少，在没有整体大纲的情况下，很难控制，业余和专业的水平可能就在于此了。\r\n</p>\r\n<p>\r\n	《怒晴湘西》\r\n</p>\r\n<p>\r\n	在这一卷时，作者的工作时间非常宽松，时间多了相对就会写得比较从容，所以单从文字上来讲，作者觉得《怒晴湘西》是八卷中最精致的一卷，因为关于现代题材的限制越来越多，所以决定把前传倒回民国时期，放开手脚狠狠开挖。\r\n</p>\r\n<p>\r\n	以前曾图着顺口，随意编了发丘摸金、搬山、卸岭这三大体系，随着故事情节的不断展开，就逐渐勾勒出了这些行业的来历、掌故、传说、手法，因为以前几本都以望风水盗墓为主，导致许多人，甚至连跟风写所谓盗墓小说的人，都只知道看风水找龙脉，却不知民间有许多稀奇古怪的盗墓方式。\r\n</p>\r\n<p>\r\n	所以在这一卷中，把望字诀以外的盗墓手段作为核心。在民国传说式的故事，一要有说书的语感、二是要有侠盗般的人物，再加上各种黑话切口，充满了历史民间故事的色彩，才会有趣。以前写黑水城一段，是试探性的，没敢往大处写，但有了以前的经验，写起来自然驾轻就熟，其中编了一套全新的概念性暗语，也就是山经，包括常胜山和月亮门等体系，完全是虚构的。\r\n</p>\r\n<p>\r\n	《巫峡棺山》\r\n</p>\r\n<p>\r\n	作为全书的最后一卷，《巫峡棺山》这一卷的任务比较重，最要命的是字数，根据合同约定的字数来算，第二卷的前三册，第一册少了三万字左右，只好都加到最后一卷中，所以本卷是超长篇，足足多了半本书，但即使是这样，最后一卷的篇幅也显得不够用。\r\n</p>\r\n<p>\r\n	在计划中作为全书主线的四枚铜符，象征着通过不同形式存在于天地间的四种生命状态，想每部引出一符，但那样一来，就需要至少五册，只好简化了一些情节。\r\n</p>\r\n<p>\r\n	另外也打算在这一卷中，把《十六字阴阳风水秘术》成为残书的真实原因，以及摸金符上代主人的故事做出交代。《鬼吹灯》全书起于《十六字阴阳风水秘术》残卷，最后也将终于《十六字阴阳风水秘术》当年被毁的往事，除了地仙村探险的内容，最后一卷中还包括了这些情节。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '187', null, '1509157571', '1509157571', '1510042018', null);
INSERT INTO `book_content` VALUES ('5', '1', '1', '12312', '<p>\r\n	312\r\n</p>', '0', '5', null, '1509173334', '1509173334', '1509428839', null);
INSERT INTO `book_content` VALUES ('6', '5', '3', '33333', '<p>\r\n	33\r\n</p>', '10', '1', null, '1509344898', '1509344898', '1509700881', null);
INSERT INTO `book_content` VALUES ('7', '5', '4', '44444', '<p>\r\n	44444\r\n</p>', '0', '5', null, '1509344909', '1509344909', '1509931620', null);
INSERT INTO `book_content` VALUES ('8', '5', '5', '55555', '<p>\r\n	55555555\r\n</p>', '0', '9', null, '1509344926', '1509344926', '1509931595', null);
INSERT INTO `book_content` VALUES ('9', '5', '6', '66666', '<p>\r\n	66666\r\n</p>', '0', '2', null, '1509344937', '1509344937', '1509411018', null);
INSERT INTO `book_content` VALUES ('10', '5', '7', '7777777777777', '<p>\r\n	77777777\r\n</p>', '0', '2', null, '1509344951', '1509344951', '1509930874', null);
INSERT INTO `book_content` VALUES ('11', '5', '8', '88888', '<p>\r\n	888888\r\n</p>', '0', '2', null, '1509344976', '1509344976', '1509931435', null);
INSERT INTO `book_content` VALUES ('12', '5', '9', '99999', '<p>\r\n	99999\r\n</p>', '0', '2', null, '1509344987', '1509344987', '1509931575', null);
INSERT INTO `book_content` VALUES ('13', '5', '10', '101111111', '<p>\r\n	32143222222222\r\n</p>', '0', '1', null, '1509346298', '1509346298', '1509931375', null);
INSERT INTO `book_content` VALUES ('14', '5', '11', '432421423', '<p>\r\n	634634\r\n</p>', '0', null, null, '1509346309', '1509346309', '1509346309', null);
INSERT INTO `book_content` VALUES ('15', '5', '12', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1509931384', null);
INSERT INTO `book_content` VALUES ('16', '5', '13', '12312', '<p>\r\n	4324232\r\n</p>', '0', '2', null, '1509346321', '1509346321', '1509931379', null);
INSERT INTO `book_content` VALUES ('17', '5', '14', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('18', '5', '15', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('19', '5', '16', '12312', '<p>\r\n	4324232\r\n</p>', '20', null, null, '1509346321', '1509346321', '1509591432', null);
INSERT INTO `book_content` VALUES ('20', '5', '17', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('21', '5', '18', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1509692009', null);
INSERT INTO `book_content` VALUES ('22', '5', '19', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('23', '5', '20', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('24', '5', '21', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('25', '5', '22', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('26', '5', '23', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('27', '5', '24', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('28', '5', '25', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('29', '5', '26', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('30', '5', '27', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('31', '5', '28', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('32', '5', '29', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('33', '5', '30', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('34', '5', '31', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1509591621', null);
INSERT INTO `book_content` VALUES ('35', '5', '32', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('36', '5', '33', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('37', '5', '34', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('38', '5', '35', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('39', '5', '36', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('40', '5', '37', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('41', '5', '38', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('42', '5', '39', '12312', '<p>\r\n	4324232\r\n</p>', '0', null, null, '1509346321', '1509346321', '1509346321', null);
INSERT INTO `book_content` VALUES ('43', '5', '40', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035709', null);
INSERT INTO `book_content` VALUES ('44', '5', '41', '12312', '<p>\r\n	4324232\r\n</p>', '0', '5', null, '1509346321', '1509346321', '1510035710', null);
INSERT INTO `book_content` VALUES ('45', '5', '42', '12312', '<p>\r\n	4324232\r\n</p>', '0', '4', null, '1509346321', '1509346321', '1510035711', null);
INSERT INTO `book_content` VALUES ('46', '5', '43', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035712', null);
INSERT INTO `book_content` VALUES ('47', '5', '44', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035713', null);
INSERT INTO `book_content` VALUES ('48', '5', '45', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035714', null);
INSERT INTO `book_content` VALUES ('49', '5', '46', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035715', null);
INSERT INTO `book_content` VALUES ('50', '5', '47', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035716', null);
INSERT INTO `book_content` VALUES ('51', '5', '48', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035718', null);
INSERT INTO `book_content` VALUES ('52', '5', '49', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035718', null);
INSERT INTO `book_content` VALUES ('53', '5', '50', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035720', null);
INSERT INTO `book_content` VALUES ('54', '5', '51', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035721', null);
INSERT INTO `book_content` VALUES ('55', '5', '52', '12312', '<p>\r\n	4324232\r\n</p>', '0', '1', null, '1509346321', '1509346321', '1510035722', null);
INSERT INTO `book_content` VALUES ('56', '5', '53', '12312', '<p>\r\n	4324232\r\n</p>', '0', '2', null, '1509346321', '1509346321', '1510038061', null);
INSERT INTO `book_content` VALUES ('57', '5', '54', '12312', '<p>\r\n	4324232\r\n</p>', '0', '3', null, '1509346321', '1509346321', '1510038058', null);
INSERT INTO `book_content` VALUES ('58', '5', '55', '12312', '<p>\r\n	4324232\r\n</p>', '0', '6', null, '1509346321', '1509346321', '1510039712', null);

-- ----------------------------
-- Table structure for buy_content
-- ----------------------------
DROP TABLE IF EXISTS `buy_content`;
CREATE TABLE `buy_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='购买章节记录表';

-- ----------------------------
-- Records of buy_content
-- ----------------------------
INSERT INTO `buy_content` VALUES ('2', '1', '5', '3', '1509180973');

-- ----------------------------
-- Table structure for data_setting
-- ----------------------------
DROP TABLE IF EXISTS `data_setting`;
CREATE TABLE `data_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` int(11) DEFAULT NULL COMMENT '轮播显示条数',
  `recommend` int(11) DEFAULT NULL COMMENT '主编推荐显示条数',
  `hot` int(11) DEFAULT NULL COMMENT ' 热门显示条数',
  `new_recommend` int(11) DEFAULT NULL COMMENT '新书推荐显示条数',
  `free` int(11) DEFAULT NULL COMMENT '限时免费显示条数',
  `guess` int(11) DEFAULT NULL COMMENT ' 猜你喜欢显示条数',
  `buy` int(11) DEFAULT NULL COMMENT ' 畅销显示条数',
  `pagenum` int(11) DEFAULT NULL COMMENT ' 列表每页条数',
  `ranking_top` int(11) DEFAULT NULL COMMENT ' 排行置顶条数',
  `ranking_total` int(11) DEFAULT NULL COMMENT ' 排行显示条数',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='数据设置';

-- ----------------------------
-- Records of data_setting
-- ----------------------------
INSERT INTO `data_setting` VALUES ('1', '3', '7', '3', '5', '3', '3', '3', '3', '3', '3', '1509523114');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '上级 ID',
  `name` varchar(255) DEFAULT NULL COMMENT ' 名称',
  `level` int(11) DEFAULT NULL COMMENT ' 层级',
  `icon` text COMMENT ' 图标',
  `sort` int(11) DEFAULT NULL COMMENT ' 排序',
  `url` text COMMENT ' 路由地址',
  `infos` text COMMENT ' 描述',
  `display` tinyint(1) DEFAULT '0' COMMENT ' 显示状态，0隐藏，1显示',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，0禁用，1启用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='功能与菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '1', '<img src=\"/static/system/img/setting_tools.png\"/>', '0', '/system/setting#', '', '1', '1', '1507862534', '1508407873', null);
INSERT INTO `menu` VALUES ('2', '1', '功能与菜单', '2', '<img src=\"/static/system/img/monitor_window_3d.png\"/>', '0', '/system/menu/index', '', '1', '1', '1507865210', '1507898297', null);
INSERT INTO `menu` VALUES ('3', '1', '权限与角色', '2', '<img src=\"/static/system/img/role.png\"/>', '0', '/system/role/index', '', '1', '1', '1507865414', '1507888531', null);
INSERT INTO `menu` VALUES ('4', '1', '系统用户', '2', '<img src=\"/static/system/img/folder_user.png\"/>', '0', '/system/user/index', '', '1', '1', '1507866165', '1507889575', null);
INSERT INTO `menu` VALUES ('5', '2', '添加菜单', '3', '<img src=\"/static/system/img/add.png\"/>', '0', '/system/menu/add', '', '0', '1', '1507872000', '1507897493', null);
INSERT INTO `menu` VALUES ('6', '2', '菜单详情', '3', '<img src=\"/static/system/img/page_white_paste.png\"/>', '0', '/system/menu/detail', '', '0', '1', '1507880446', '1507880446', null);
INSERT INTO `menu` VALUES ('7', '2', '菜单修改', '3', '<img src=\"/static/system/img/richtext_editor.png\"/>', '0', '/system/menu/edit', '', '0', '1', '1507880485', '1507896298', null);
INSERT INTO `menu` VALUES ('8', '0', '内容管理', '1', '<img src=\"/static/system/img/bricks.png\"/>', '0', '/system/content#', '', '1', '1', '1507880673', '1508144387', null);
INSERT INTO `menu` VALUES ('9', '8', '作者管理', '2', '<img src=\"/static/system/img/outlook_new_meeting.png\"/>', '0', '/system/author/index', '', '1', '1', '1508145488', '1508145488', null);
INSERT INTO `menu` VALUES ('10', '8', '小说分类', '2', '<img src=\"/static/system/img/server_database.png\"/>', '0', '/system/bookcate/index', '', '1', '1', '1508145595', '1508145595', null);
INSERT INTO `menu` VALUES ('11', '1', '个人中心', '2', '<img src=\"/static/system/img/report_user.png\"/>', '0', '/system/user/info', '', '0', '1', '1508145659', '1508145659', null);
INSERT INTO `menu` VALUES ('12', '8', '小说管理', '2', '<img src=\"/static/system/img/books.png\"/>', '0', '/system/book/index', '', '1', '1', '1508145720', '1508145720', null);
INSERT INTO `menu` VALUES ('13', '8', '充值设置', '2', '<img src=\"/static/system/img/add_on.png\"/>', '0', '/system/rechargeprice/index', '', '1', '1', '1508146326', '1508146326', null);
INSERT INTO `menu` VALUES ('14', '0', '业务数据', '1', '<img src=\"/static/system/img/sharepoint.png\"/>', '0', '/system/datas#', '', '1', '1', '1508146527', '1508146527', null);
INSERT INTO `menu` VALUES ('15', '14', '读者管理', '2', '<img src=\"/static/system/img/outlook_new_meeting.png\"/>', '0', '/system/reader/index', '', '1', '1', '1508146593', '1508146593', null);
INSERT INTO `menu` VALUES ('16', '14', '支付订单', '2', '<img src=\"/static/system/img/small_business.png\"/>', '0', '/system/rechargeorders/index', '', '1', '1', '1508146679', '1508146679', null);
INSERT INTO `menu` VALUES ('17', '2', '菜单排序', '3', '<img src=\"/static/system/img/text_list_numbers.png\"/>', '0', '/system/menu/sort', '', '0', '1', '1508146897', '1508146897', null);
INSERT INTO `menu` VALUES ('18', '2', '菜单显示状态', '3', '<img src=\"/static/system/img/monitor_window_3d.png\"/>', '0', '/system/menu/show', '', '0', '1', '1508146986', '1508146986', null);
INSERT INTO `menu` VALUES ('19', '2', '菜单使用状态', '3', '<img src=\"/static/system/img/checked.png\"/>', '0', '/system/menu/status', '', '0', '1', '1508147023', '1508147023', null);
INSERT INTO `menu` VALUES ('20', '2', '删除菜单', '3', '<img src=\"/static/system/img/broom.png\"/>', '0', '/system/menu/delete', '', '0', '1', '1508147061', '1508147061', null);
INSERT INTO `menu` VALUES ('21', '2', '菜单恢复', '3', '<img src=\"/static/system/img/recycle.png\"/>', '0', '/system/menu/restore', '', '0', '1', '1508147092', '1508147092', null);
INSERT INTO `menu` VALUES ('22', '2', '菜单销毁', '3', '<img src=\"/static/system/img/destroy.png\"/>', '0', '/system/menu/destroy', '', '0', '1', '1508147134', '1508147140', null);
INSERT INTO `menu` VALUES ('23', '2', '所有菜单', '3', '<img src=\"/static/system/img/navigation.png\"/>', '0', '/system/menu/all', '', '0', '1', '1508147228', '1508147228', null);
INSERT INTO `menu` VALUES ('24', '8', '应用设置', '2', '<img src=\"/static/system/img/cog.png\"/>', '0', '/system/setting/index', '', '1', '1', '1508147838', '1508227822', null);
INSERT INTO `menu` VALUES ('25', '8', 'Banner管理', '2', '<img src=\"/static/system/img/img_ico.png\"/>', '0', '/system/banner/index', '', '1', '1', '1509329651', '1509329651', null);

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '邀请人ID',
  `openid` varchar(255) DEFAULT NULL COMMENT '微信openid',
  `book_money` int(11) DEFAULT NULL COMMENT '书币',
  `vip_end` int(11) DEFAULT NULL COMMENT '会员结束时间',
  `created_at` int(255) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `login_at` int(11) DEFAULT NULL COMMENT ' 最近登录时间',
  `login_ip` varchar(255) DEFAULT NULL COMMENT ' 最近登录IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='读者 基本信息';

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('1', null, 'gdfgdfgdfgd4546454', '60', '1999999999', '1508470762', '1509180973', '1508470762', '192.168.0.1');

-- ----------------------------
-- Table structure for reader_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `reader_bookmark`;
CREATE TABLE `reader_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL COMMENT '读者ID',
  `book_id` int(11) DEFAULT NULL COMMENT ' 小说ID',
  `content_id` int(11) DEFAULT NULL COMMENT ' 内容 ID',
  `created_at` int(11) DEFAULT NULL COMMENT ' 创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT ' 更新时间',
  `read_at` int(11) DEFAULT NULL COMMENT ' 最近阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='读者 书签';

-- ----------------------------
-- Records of reader_bookmark
-- ----------------------------
INSERT INTO `reader_bookmark` VALUES ('27', null, '5', '4', '1509960756', '1509961491', '1509960756');

-- ----------------------------
-- Table structure for reader_bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `reader_bookshelf`;
CREATE TABLE `reader_bookshelf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL COMMENT '读者ID',
  `book_id` int(11) DEFAULT NULL COMMENT '小说 ID',
  `content_id` int(11) DEFAULT NULL COMMENT '最近阅读内容ID',
  `created_at` int(11) DEFAULT NULL COMMENT ' 创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  `read_at` int(11) DEFAULT NULL COMMENT '最近阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='读者 书架';

-- ----------------------------
-- Records of reader_bookshelf
-- ----------------------------
INSERT INTO `reader_bookshelf` VALUES ('2', null, '1', null, '1509699485', '1509699485', null);
INSERT INTO `reader_bookshelf` VALUES ('7', null, '5', '4', '1509951130', '1510042018', '1510042018');

-- ----------------------------
-- Table structure for reader_readlast
-- ----------------------------
DROP TABLE IF EXISTS `reader_readlast`;
CREATE TABLE `reader_readlast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reader_id` int(11) DEFAULT NULL COMMENT '读者ID',
  `book_id` int(11) DEFAULT NULL COMMENT ' 小说ID',
  `content_id` int(11) DEFAULT NULL COMMENT ' 内容 ID',
  `created_at` int(11) DEFAULT NULL COMMENT ' 创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT ' 更新时间',
  `read_at` int(11) DEFAULT NULL COMMENT ' 最近阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='读者 最近阅读';

-- ----------------------------
-- Records of reader_readlast
-- ----------------------------
INSERT INTO `reader_readlast` VALUES ('22', '1', '5', '3', '1509696579', '1509696579', '1509696579');
INSERT INTO `reader_readlast` VALUES ('24', '1', '5', '4', '1509950709', '1509950710', '1509950710');
INSERT INTO `reader_readlast` VALUES ('25', null, '5', '4', '1509952170', '1510042018', '1510042018');
INSERT INTO `reader_readlast` VALUES ('26', null, '2', null, '1510039620', '1510039620', '1510039620');
INSERT INTO `reader_readlast` VALUES ('27', null, '3', '1', '1510128649', '1510128742', '1510128742');
INSERT INTO `reader_readlast` VALUES ('28', null, '11', null, '1510190249', '1510190287', '1510190287');

-- ----------------------------
-- Table structure for recharge_orders
-- ----------------------------
DROP TABLE IF EXISTS `recharge_orders`;
CREATE TABLE `recharge_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '充值类型，0书币，1会员',
  `orders_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '微信交易号',
  `reader_id` int(11) DEFAULT NULL COMMENT '读者ID',
  `price` int(11) DEFAULT NULL COMMENT ' 订单金额（￥）',
  `number` int(11) DEFAULT NULL COMMENT '购买书币 或会员时长',
  `gift_num` int(11) DEFAULT NULL COMMENT ' 充值赠送书币  或会员时长',
  `pay_num` float DEFAULT NULL COMMENT ' 支付金额',
  `result_code` varchar(255) DEFAULT NULL COMMENT ' 支付返回码',
  `created_at` int(11) DEFAULT NULL COMMENT ' 创建时间',
  `finished_at` int(11) DEFAULT NULL COMMENT ' 完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值与会员 订单';

-- ----------------------------
-- Records of recharge_orders
-- ----------------------------

-- ----------------------------
-- Table structure for recharge_price
-- ----------------------------
DROP TABLE IF EXISTS `recharge_price`;
CREATE TABLE `recharge_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0' COMMENT '充值类型，0书币，1会员',
  `price` int(11) DEFAULT NULL COMMENT '价格（￥）',
  `number` int(11) DEFAULT NULL COMMENT '书币 或会员时长',
  `gift_num` int(11) DEFAULT NULL COMMENT '充值 赠送书币 或会员时长',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值与会员 价格';

-- ----------------------------
-- Records of recharge_price
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '上级 ID',
  `name` varchar(255) DEFAULT NULL COMMENT ' 名称',
  `is_admin` tinyint(1) DEFAULT '0' COMMENT '角色类型，0受约束角色，1超级管理员',
  `level` int(11) DEFAULT NULL COMMENT ' 层级',
  `infos` text COMMENT ' 描述',
  `menu_ids` text COMMENT '授权菜单ID集合',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，0禁用，1启用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='权限与角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '0', '内置超级管理员', '1', '1', '', '[]', '1', '1507947384', '1508117290', null);
INSERT INTO `role` VALUES ('2', '1', '内置管理员', '0', '2', '', '[\"1\",\"2\",\"5\",\"6\",\"7\",\"4\",\"8\"]', '1', '1507947460', '1508147309', null);

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `qr_code` text COMMENT '公众号二维码',
  `appid` varchar(255) DEFAULT NULL COMMENT '微信appid',
  `appsecret` varchar(255) DEFAULT NULL COMMENT '微信secret',
  `mchid` varchar(255) DEFAULT NULL COMMENT '商户号',
  `mchkey` varchar(255) DEFAULT NULL COMMENT '商户密钥',
  `logo` text,
  `title` varchar(255) DEFAULT NULL COMMENT '网站标题',
  `keyword` varchar(255) DEFAULT NULL COMMENT ' 关键词',
  `description` text COMMENT ' 描述',
  `favicon` text COMMENT 'favicon',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='应用配置';

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', 'XX小说', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQGh8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM2daSHN1LTlmZDMxMDAwMDAwN18AAgQB2_VZAwQAAAAA', 'wx54f10549c50ce050', 'dd860df8562da122b03cbfcb75f73714', 'cc', 'dd', null, 'XX小说首页', '', '', null, '1508231690', '1510018138');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `name` varchar(255) DEFAULT '' COMMENT ' 名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `infos` text COMMENT ' 描述',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT ' 密码',
  `secret_key` varchar(255) DEFAULT NULL COMMENT ' 密钥',
  `login_at` int(11) DEFAULT NULL COMMENT '最近登录时间',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '最近登录IP',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，0禁用，1启用',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '', '', '', '', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 'e94e5817cbf45ba73ae22527672dafdd', '1510213570', '127.0.0.1', '1', '1507970329', '1508144712', null);
INSERT INTO `user` VALUES ('2', '2', '', '', '', '', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '9df991ab8755df426239cef0afa87077', '1510213552', '127.0.0.1', '1', '1507971362', '1508141160', null);
