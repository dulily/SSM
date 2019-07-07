/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-07-07 16:02:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻类别号',
  `name` varchar(255) DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '国内');
INSERT INTO `category` VALUES ('2', '国际');
INSERT INTO `category` VALUES ('3', '军事');
INSERT INTO `category` VALUES ('4', '财经');
INSERT INTO `category` VALUES ('5', '娱乐');
INSERT INTO `category` VALUES ('6', '科技');
INSERT INTO `category` VALUES ('7', '游戏');
INSERT INTO `category` VALUES ('8', '房产');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newsid` (`newsid`),
  KEY `userid` (`userid`),
  CONSTRAINT `newsid` FOREIGN KEY (`newsid`) REFERENCES `news` (`id`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '4', '2', '这条新闻不错啊', '2019-07-01 16:01:24');
INSERT INTO `comment` VALUES ('2', '5', '4', '我不喜欢这种类别的新闻', '2019-07-02 16:01:46');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `categoryid` int(11) NOT NULL COMMENT '新闻类别号',
  `title` varchar(10000) DEFAULT NULL COMMENT '新闻标题',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `content` varchar(1000) DEFAULT NULL COMMENT '新闻内容',
  `username` varchar(255) DEFAULT NULL COMMENT '发布人姓名',
  `picture_url` varchar(255) DEFAULT NULL COMMENT '上传图片地址',
  `createtime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  CONSTRAINT `categoryid` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('4', '4', '苹果iPhone 11信息汇总，有望9月下旬上市', '杜丽', '距离苹果秋季发布会还剩下3个月时间。据爆料，苹果今年新iPhone11将会取消Lightning接口，转向USB-C。在外观设计上，新款iPhone仍将继续使用刘海屏设计。', 'admin', '/uploadImg/41560784322862.png', '2019-06-17 23:12:03');
INSERT INTO `news` VALUES ('5', '6', '京东生鲜的终局是制定行业标准', '杜丽', '京东生鲜成为国内首个且唯一获得BRCGS、ISO9001（国际质量管理体系） 双重认证的生鲜电商平台', 'admin', '/uploadImg/51560784333923.png', '2019-06-17 23:12:14');
INSERT INTO `news` VALUES ('6', '1', '全国首条绿色山区高速铁路开通运营', '杜丽', '历时五年建设的成贵铁路乐山至宜宾段开通运营，正式结束了川南地区没有动车的历史。', 'admin', '/uploadImg/21560784448070.png', '2019-06-17 23:14:08');
INSERT INTO `news` VALUES ('7', '2', '摩尔多瓦看守总理宣布政府集体辞职', '杜丽', '摩尔多瓦民主党副主席切博塔里宣布，鉴于目前的局势，民主党决定通过菲利普政府辞职的方式放弃执政', 'admin', '/uploadImg/21560784279177.png', '2019-06-17 23:11:19');
INSERT INTO `news` VALUES ('8', '6', '支付宝的创投江湖', '杜丽', '共享单车集体撤退的时候，哈啰还在前进。', 'admin', '/uploadImg/21560784311032.png', '2019-06-17 23:11:51');
INSERT INTO `news` VALUES ('9', '1', '系好安全带，中国对美国划红线了', '杜丽', '中国在中美贸易战里的三条新红线', 'admin', '/uploadImg/51560784463167.png', '2019-06-17 23:14:24');
INSERT INTO `news` VALUES ('10', '5', '当《这就是街舞》遇上史上最残酷赛制', '杜丽', '仅有的24小时内，所有团体都需要根据音乐进行从无到有的编舞排练，克服各种各样的困难', 'admin', '/uploadImg/31560784296174.png', '2019-06-17 23:11:37');
INSERT INTO `news` VALUES ('11', '3', '抗洪一线，再现满身泥巴的兵！', '杜丽', '解放军和武警部队官兵奋战抢险救灾一线。\r\n临近中午，源城区人武部接地方政府电话通报，辖区内黄子洞河决堤12米，下游突发洪水内涝，26名居民被洪水围困将近1个小时，急需救援。人武部立即启动抗洪抢险应急预案，组织民兵应急分队20余人，携带橡皮艇等防汛应急器材和物资赶赴现场开展救援行动。', 'admin', '/uploadImg/a1560777170708.png', '2019-06-17 21:12:51');
INSERT INTO `news` VALUES ('16', '1', '普陀：刷卡投放赚积分 垃圾袋使用可追溯', '杜丽', '刷卡、按钮、自动开箱、投放，在普陀沈家门滨海新境小区，居民只需将分类后的垃圾投放至对应箱体，垃圾回收箱就会自动称重，换算出积分反馈到智能垃圾分类卡上，积分累积到一定数值后，就能在小区的兑换机上兑换垃圾袋……\r\n\r\n记者从普陀城乡环卫服务有限公司了解到，随着普陀区垃圾分类高标准示范小区建设的有序推进，一批全新的智能生活垃圾回收设备已悄然“进驻”滨海新境、山海华府、外滩华府、海景颐园玉兰园4个小区，使垃圾投放更精准，垃圾袋使用可追溯。“每个垃圾袋上都有一个二维码，居民刷卡领取垃圾袋后，对该垃圾袋使用情况的追踪就开始了。”', 'admin', '/uploadImg/21560784346988.png', '2019-06-17 23:12:27');
INSERT INTO `news` VALUES ('17', '1', '院子只养月季？不如养“4种花”', '杜丽', '很多花友都想要一个属于自己的小花园，其实呢，如果家里有院子的话，我们就可以养护很多花卉了，像月季、绣球花、茉莉花、栀子花等花卉的花朵就很有观赏价值了，这些花卉养护在院子里很好看。有些地方可能光照不足，这时候可以养护一些耐荫的植物，比如吊兰、虎皮兰、龟背竹、绿萝等花卉就不错了。', 'admin', '/uploadImg/31560784365272.png', '2019-06-17 23:12:47');
INSERT INTO `news` VALUES ('18', '7', '粉丝在《超级马里奥》里加入了“吃鸡模式”', '杜丽', '“吃鸡”可以说是先进最流行的游戏模式，不管能不能沾上边，好像游戏里有个“吃鸡”模式就可以火一样。不过说哪个游戏和“吃鸡”最沾不上边那可能就是《超级马里奥》了。不过最近还是有一位粉丝”InfernoPlus“自制了一个网页版的《超级马里奥》吃鸡版游戏。', 'admin', '/uploadImg/11560784383630.png', '2019-06-17 23:13:06');
INSERT INTO `news` VALUES ('19', '7', '阴阳师SSR鬼切新皮肤原稿设计图公开', '杜丽', '争议极大的鬼切新皮肤，其设计者公开了原画，没想到这次的新皮肤是鬼切亲爹画师亲自上阵设计的，其设计的理念和思路等等也一并公开。原稿设计的时候针对鬼切的脸拥有不同的方案，除了鬼角挚爱还有类似猫耳的头饰，其主题核心着重体现在了忍者+夜行上，不是单出的的武士战国风，而是忍者风设计。', 'admin', '/uploadImg/31560784397880.png', '2019-06-17 23:13:18');
INSERT INTO `news` VALUES ('20', '8', '涨了600倍的房价降了！印度为中国带来什么启示？', '杜丽', '高房价也让印度的很多社会问题开始浮现：首先是贫富差距的扩大。高房价导致恒产者恒产，许多买不起房的打工青年，不仅工资收入不高，且要支付高额的房租。其次就是通货膨胀和经济增长放缓，由于工业化和城镇化的势头过去，加上房市的虚假繁荣，导致印度的实体经济增速开始放缓，经济增长率下降至5.9％。受房贷的影响，政府不得不考虑增发货币，卢比越来越不值钱，物价上涨，商品的平均通胀率达到了9.7％！', 'admin', '/uploadImg/41560784411343.png', '2019-06-17 23:13:32');
INSERT INTO `news` VALUES ('21', '2', '45岁！政界新人！斯洛伐克首任女总统宣誓就职', '杜丽', '当地时间6月15日，斯洛伐克首位女总统苏珊娜·恰普托娃宣誓就职，同时，她也以45岁的年龄成为斯洛伐克历史上最年轻的总统。恰普托娃在其就职演说中强调，将在任内打击腐败，推动司法公正。在今年3月30日举行的斯洛伐克第二轮总统选举中，进步斯洛伐克运动党副主席恰普托娃以58.40%的得票率战胜对手谢夫乔维奇，当选斯洛伐克总统。', 'admin', '/uploadImg/31560784423802.png', '2019-06-17 23:13:44');
INSERT INTO `news` VALUES ('22', '2', '索马里首都遭汽车炸弹袭击致10死26伤', '杜丽', '索马里警察部队指挥官巴希尔·阿卜迪·穆罕默德告诉新华社记者，一辆载有简易爆炸装置的汽车当天在索议会大楼附近一个安全检查站爆炸，造成9人死亡、25人受伤。爆炸发生后，索马里安全部队封锁了摩加迪沙多条主干道，以防武装分子再次制造袭击。索马里“青年党”宣称制造了这两起汽车炸弹袭击。索马里“青年党”是与“基地”组织有关联的极端组织，近年来在索马里及其邻国多次发动恐怖袭击。', 'admin', '/uploadImg/11560784435299.png', '2019-06-17 23:13:55');
INSERT INTO `news` VALUES ('23', '2', '普京：“情感上”当然站在中国这边', '杜丽', '在谈及中美关系特点时，普京强调，“理智上”俄没有任何理由干预谈判进程。不过有个意义重大的“但是”，正因为俄中有着“前所未有的高水平良好关系”，“情感上”俄当然站在战略伙伴一方。普京强调，与破坏国际关系结构有关的任何行动都将有损所有经济活动参与者。普京总结说：“因此我们非常期望，理智最终会占上风。”', 'admin', '/uploadImg/51560784265018.png', '2019-06-17 23:11:05');
INSERT INTO `news` VALUES ('24', '2', '这看起来像是虐待儿童', '杜丽', '“美国陆军(@U.S.Army)”14日官方推特发布的视频显示：一个小男孩脸涂迷彩，头戴军盔，唱着美国陆军军歌《陆军勇往直前》(《the Army Goes Rolling Along》)，并双手紧握随身体摆动。视频配有文字称：(这将是)你今天所见之最好的东西。让我们听听你唱军歌。', 'admin', '/uploadImg/31560784195835.png', '2019-06-17 23:09:56');
INSERT INTO `news` VALUES ('25', '2', '美媒：火星沙丘酷似“星际舰队标志”', '杜丽', '报道介绍，声明写道：“它们仍只是沙丘而已，但火星风会继续吹。最终，曾经的沙丘被吹走，在熔岩平原留下这些‘痕迹’。它们记录了曾被熔岩包围的沙丘的存在，也被称为‘沙丘模子’。”\r\n\r\n虽然火星上的星际舰队标志只是一种巧合，但我们确实可以说，火星勘测轨道飞行器在火星实现了“生生不息、繁荣昌盛”（备受《星际迷航》粉丝钟爱的一句台词）。过去13年来，火星勘测轨道飞行器一直在回传高分辨率图像，尽管其设计寿命早已到期。', 'admin', '/uploadImg/21560784183388.png', '2019-06-17 23:09:43');
INSERT INTO `news` VALUES ('26', '2', '新西兰北部发生7.2级地震：官方发布海啸预警', '杜丽', '太平洋海啸预警中心（PTWC）发布海啸预警，新西兰民防组织表示，若发生海啸，预计在两小时后到达新西兰。\r\n\r\n有专业网友分析道：“震中在太平洋板块向澳大利亚板块俯冲前段，即克马德克海沟西侧附近。本次地震规模较大，克马德克群岛大部都可能会有明显震感，但所幸克马德克群岛基本无定居人口；而本次地震也可能会引发局地海啸，但影响范围和规模应当有限，不会造成较明显影响。”', 'admin', '/uploadImg/11560784168555.png', '2019-06-17 23:09:29');
INSERT INTO `news` VALUES ('27', '3', '油轮遇袭事件后，美国白宫考虑向中东增派美军部队', '杜丽', '据美国有线电视新闻网(CNN)6月16日报道，两名直接了解相关讨论的美国官员表示，美国总统特朗普的国家安全小组预计本周将详细讨论，在上周两艘油轮遭到袭击之后，是否向中东增派美国军队。\r\n美国代理国防部长帕特里克·沙纳汉在周五暗示了有关讨论。他表示，“当你看到这种情况，一艘挪威船，一艘日本船，沙特阿拉伯王国，阿联酋，世界上15%的石油流经霍尔木兹海峡，所以我们显然需要制定在形势恶化情况下的应急计划，但我们也需要扩大我们对这种国际形势的支持。', 'admin', '/uploadImg/b1560777290812.png', '2019-06-17 21:14:51');
INSERT INTO `news` VALUES ('28', '3', '基层精准抓建：“一个字”改变了一个营', '杜丽', '基层建设有其独特的抓建方式和运行规律，这是我军长期实践的结晶。一位老基层形象地比喻，各级抓基层不能像螃蟹吃豆腐，吃进去的不多却抓得很乱，搞不清楚基层单位的差异性，“眉毛胡子一把抓”的做法，其结果必然是费力不小，成效不大。中部战区陆军某特战旅党委不断校正基层建设思路，一改过去粗放式的抓建方式，依据各单位实际，具体问题具体分析并具体对待，变面面俱到为重点突破，以点带面，基层建设形势普遍向上向好。', 'admin', '/uploadImg/c1560777409835.png', '2019-06-17 21:16:50');
INSERT INTO `news` VALUES ('29', '3', '这组狰狞的表情，看武警夏日苦练实战', '杜丽', '自5月份开始，武警北京总队执勤第三支队着眼新《大纲》军事训练要求，紧贴实战标准，严密组织预提指挥士官集训，对战术、擒敌、400米障碍、极限体能等19技战术科目进行强化训练，全方位磨炼官兵意志品质，锤炼过硬身体素质，以此提高官兵技战术能力素质。', 'admin', '/uploadImg/d1560777567485.png', '2019-06-17 21:19:28');
INSERT INTO `news` VALUES ('30', '3', '「征兵季」我们的青春，穿军装的样子最美', '杜丽', '你或许，想过迎风扬旗，把每天的太阳迎进祖国的怀抱\r\n你或许，因为他们，有过久久无法平静的心跳\r\n你或许，想要驰骋大漠，青春也有迷彩的样子\r\n把校服换成军装，从卧室转换沙场\r\n2019年的征兵季已经到来\r\n此时此刻正是你用行动追逐心中向往\r\n实现满腔豪情热血的时刻', 'admin', '/uploadImg/e1560777710321.png', '2019-06-17 21:21:51');

-- ----------------------------
-- Table structure for `run`
-- ----------------------------
DROP TABLE IF EXISTS `run`;
CREATE TABLE `run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of run
-- ----------------------------
INSERT INTO `run` VALUES ('1', 'runner', '123456', '123252@qq.com', '/uploadImg/41560784322862.png', '13142551513', 'admin');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `regist_time` datetime DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'duli', '123', '173@qq.com', '2019-07-01 15:59:39', '女', '/uploadImg/41560784322862.png', '13245678643', '2019-07-01 15:58:49', 'yrainly');
INSERT INTO `user` VALUES ('2', 'chen', '123', '391196@qq.com', '2019-07-01 15:59:44', '男', '/uploadImg/41560784322862.png', '124789432', '2019-07-02 15:58:56', 'chenchen');
INSERT INTO `user` VALUES ('3', 'duqin', '123', '10471046@qq.com', '2019-07-02 15:59:47', '女', '/uploadImg/41560784322862.png', '13546464622', '2019-07-04 15:59:01', 'dudu');
INSERT INTO `user` VALUES ('4', 'liang', 'adfdv', '131372@qq.com', '2019-07-02 15:59:50', '男', '/uploadImg/41560784322862.png', '242561', '2019-07-03 15:59:06', 'liangl');
