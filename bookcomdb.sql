/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.24 : Database - bookcomdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookcomdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bookcomdb`;

/*Table structure for table `booknews` */

DROP TABLE IF EXISTS `booknews`;

CREATE TABLE `booknews` (
  `bnid` int NOT NULL AUTO_INCREMENT,
  `newscont` longtext,
  `writer` varchar(30) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `bkwriter` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `booker` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `issaled` varchar(3) DEFAULT NULL,
  `saleway` varchar(30) DEFAULT NULL,
  `imgsrc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bnid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `booknews` */

insert  into `booknews`(`bnid`,`newscont`,`writer`,`origin`,`bkwriter`,`time`,`title`,`booker`,`price`,`issaled`,`saleway`,`imgsrc`) values 
(1,'<p>\r\n	我费尽千辛万苦收藏了鲁迅的一些初版书，比现在《鲁迅全集》更原汁原味，书封全由鲁迅设计，要不是要搬走也不会卖掉，怕弄丢弄坏了，只允许本地交易，望购买者好好珍藏！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src=\"/WebCompetition1/attached/image/20210515/20210515172658_70.jpg\" alt=\"\" width=\"120\" height=\"168\" title=\"\" align=\"\" />《呐喊》第一版 100元\r\n</p>\r\n<p>\r\n	<img src=\"/WebCompetition1/attached/image/20210515/20210515172731_733.jpg\" alt=\"\" width=\"120\" height=\"168\" title=\"\" align=\"\" />《彷徨》第一版 100元\r\n</p>\r\n<p>\r\n	<img src=\"/WebCompetition1/attached/image/20210515/20210515172810_906.jpg\" alt=\"\" width=\"120\" height=\"168\" title=\"\" align=\"\" />《故事新篇》第一版 100元\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','aaa','aaa','鲁迅','2021-04-20 23:20:25','罕见珍品！鲁迅早期出版旧物收集 不议价','',300,'已销售','私聊','images/book-3.jpg'),
(5,'<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	《棋王》是当代作家<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%98%BF%E5%9F%8E/3938048\">阿城</a>的一部短篇小说。小说被视作是新时期“<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%AF%BB%E6%A0%B9%E6%96%87%E5%AD%A6/10969142\">寻根文学</a>”的发韧之作。故事讲述了在文革时代，知青“棋呆子”王一生四处寻找对手下棋、拼棋的故事。小说语言抛弃了20世纪80年代惯有的语言逻辑转而回归宋明小说的语境之中，朴实而飘逸俊美。<a name=\"ref_[1-3]_5131859\"></a>&nbsp;\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	《棋王》是阿城的处女作，1984年发表于《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%8A%E6%B5%B7%E6%96%87%E5%AD%A6/10049289\">上海文学</a>》。小说发表后，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%8E%8B%E8%92%99/441\">王蒙</a>撰文高度赞赏了这篇小说，指出这是在那个特殊的时代“对人的智慧、注意力、精力和潜力的一种礼赞”。\r\n</div>','zhangsan','上海三联书店有限公司','阿城','2021-05-11 12:00:32','棋王','',34.8,'曾售出','私聊','images/book-5.jpg'),
(6,'<p style=\"font-size:16px;font-weight:normal;color:#646464;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	<span class=\"head_title_name\" style=\"color:#323232;\">“神秘”的三星堆文化，著名作家岳南集二十年功力写就。</span>\r\n</p>\r\n<p style=\"font-size:16px;font-weight:normal;color:#646464;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	<span class=\"head_title_name\" style=\"color:#323232;\">新买未拆</span>\r\n</p>\r\n<p style=\"font-size:16px;font-weight:normal;color:#646464;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	<span class=\"head_title_name\" style=\"color:#323232;\">不砍价，谢谢<img src=\"http://localhost:8080/WebCompetition1/editor/plugins/emoticons/images/81.gif\" border=\"0\" alt=\"\" /><br />\r\n</span>\r\n</p>','zhangsan','商务印书馆','岳南','2021-05-11 12:06:36','天赐王国 三星堆的秘密，将考古发掘与史海钩沉融于一炉，作家岳南签名精装珍藏本，附赠3张精美卡片','',49,'待出售','微信','images/book-1.jpg'),
(7,'<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	小说讲述阿尔及利亚的奥兰发生瘟疫，突如其来的瘟疫让人不知所措。政客狂妄无知，掩饰诿过，甚至想利用灾难来获取利益；原来过着委靡不振生活的小人物，凭著黑市门路，为人民带来各种禁品，突然成为了城中的风云人物；小百姓恐慌无助、自私贪婪，每天都只是过著颓废生活。瘟疫城市被重重封锁，无人能够自由进出。被困在城中的人民，朝思暮想着住在城外的亲朋好友。一位到城公干的记者被迫过著无亲无友的生活，只有寄望参与自愿队消磨时间。主角里厄医师这时挺身而出救助病人，与一些同道成了莫逆之交。不过，他的妻子却远在疗养院，生死未卜。最终鼠疫退却了，然而尽管喧天的锣鼓冲淡了人们对疾病的恐惧，可是奥兰人永远不会忘记鼠疫曾给他们带来的梦魔。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#333333;font-family:arial, helvetica, clean;font-size:14px;background-color:#FFFFFA;\"><strong>阿尔贝·加缪（Albert&nbsp;Camus，1913—1960），法国声名卓著的小说家、散文家和剧作家，“存在主义”文学的大师。1957年因“热情而冷静地阐明了当代向人类良知提出的种种问题”而获诺贝尔文学奖，是有史以来最年轻的诺奖获奖作家之一。</strong></span><strong></strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>','aaa','电子书','加缪','2021-05-15 16:57:04','正版包邮 鼠疫正版加缪','',9.5,'待出售','私聊','images/book-2.jpg'),
(8,'<img src=\"/WebCompetition1/attached/image/20210515/20210515171615_432.jpg\" alt=\"\" />','aaa','华中科技大学出版社','古斯塔夫.勒庞','2021-05-15 17:16:24','乌合之众大众心理研究','',14.8,'已销售','支付宝','images/book-4.jpg');

/*Table structure for table `communicate` */

DROP TABLE IF EXISTS `communicate`;

CREATE TABLE `communicate` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `becaller` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=846 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `communicate` */

insert  into `communicate`(`cid`,`username`,`content`,`time`,`becaller`) values 
(3,'zhangsan','Hi!','2021-05-15 23:26:05','aaa'),
(4,'zhangsan','Hallo!','2021-05-10 01:44:09','root'),
(5,'root','Hi!','2021-05-10 01:44:33','zhangsan'),
(6,'zhangsan','abcd','2021-05-10 01:45:00','root'),
(8,'root','Test!','2021-05-10 01:45:25','zhangsan'),
(840,'zhangsan','1234','2021-05-15 13:38:35','abc'),
(842,'zhangsan','鲁迅著的初版那三本我已经拍好了，记得发货！<img src=\"http://localhost:8080/WebCompetition1/editor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2021-05-15 23:25:27','aaa'),
(843,'aaa','待会我会发货的<img src=\"http://localhost:8080/WebCompetition1/editor/plugins/emoticons/images/89.gif\" border=\"0\" alt=\"\" />','2021-05-15 23:27:15','zhangsan'),
(844,'zhangsan','Hello!','2021-05-16 21:50:29','aaa'),
(845,'zhangsan','Hello!<img src=\"http://localhost:8080/WebCompetition1/editor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2021-05-16 22:20:48','root');

/*Table structure for table `jifen` */

DROP TABLE IF EXISTS `jifen`;

CREATE TABLE `jifen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `jifen` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `jifen` */

insert  into `jifen`(`id`,`username`,`jifen`,`time`) values 
(1,'zhangsan',10,'2021-05-07 01:03:10'),
(3,'zhangsan',10,'2021-05-07 23:48:44'),
(4,'aaa',30,'2021-05-08 01:20:08'),
(5,'abc',0,'2021-05-11 11:15:30'),
(6,'aaa',5,'2021-05-16 22:27:22');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `newscont` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `writer` varchar(30) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `imgsrc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `news` */

insert  into `news`(`nid`,`newscont`,`writer`,`origin`,`time`,`title`,`imgsrc`) values 
(1,'暂无','新闻发布测试作者','新闻发布测试来源','2021-05-05 23:07:18','新闻发布测试标题','images/login.jpg'),
(20,'<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/13526213256/1000\" width=\"400\" height=\"300\" title=\"\" align=\"\" alt=\"\" /> \r\n</p>\r\n<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/13526213257/1000\" width=\"400\" height=\"300\" title=\"\" align=\"\" alt=\"\" /> \r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5月14日-16日，2021年第二十八届长沙图书交易会在湖南国际会展中心举行。\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此次图交会由湖南省新闻出版局、中国书刊发行业协会指导，中共长沙市委宣传部、长沙市新闻出版局主办，湖南省出版物发行业协会、长沙市出版物发行业协会承办。\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/13526213258/1000\" width=\"400\" height=\"300\" title=\"\" align=\"\" alt=\"\" /> \r\n</p>\r\n<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来自全国26个省、自治区、直辖市的书商聚首相会于长沙，共同掀起一场书香盛宴，为长沙图书交易会添加精彩一笔。同时，本届图书交易会举行了中国共产党党史优秀出版物展示、展销专场；评选发布“2021年长沙人最喜爱的10本书”；“书香长沙”2021购书节等活动。\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<img class=\"content-picture\" src=\"https://inews.gtimg.com/newsapp_bt/0/13526213259/1000\" width=\"400\" height=\"300\" title=\"\" align=\"\" alt=\"\" /> \r\n</p>\r\n<p class=\"one-p\" style=\"text-align:center;font-family:&quot;font-size:18px;\">\r\n	<br />\r\n</p>\r\n<p class=\"one-p\" style=\"font-family:&quot;font-size:18px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长沙市文化市场综合行政执法局全程为图交会保驾护航，截止目前，已查处处理3起投诉情况。\r\n</p>','腾讯新闻客户端自媒体','腾讯网','2021-05-15 23:38:12','2021年第二十八届长沙图书交易会在湖南国际会展中心举行','images/news-1.jpg'),
(21,'<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871521605.jpg\" />\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span><span>发布会现场</span>&nbsp;主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> <strong>中国社会科学网讯</strong>（记者 张娓 通讯员 王小溪）5月13日，由中国社会科学院文学研究所研究员、中国社会科学院研究生院陈才智教授编著的《白居易资料新编》（全十册）（以下简称《新编》）新书发布会暨出版座谈会在京召开。中国社会科学院学部委员、文学研究所所长刘跃进，中国社会科学出版社党委书记、社长赵剑英出席会议并致辞。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871556587.jpg\" /></span></span><span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 《白居易资料新编》全十卷 繁体中文</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 作　　者：陈才智/编著</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 出版时间：2021年1月(1版1次)</span><span> </span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 参会嘉宾有中国社会科学院荣誉学部委员陈铁民，清华大学中文系教授谢思炜，北京大学中文系主任杜晓勤教授，北京大学中文系教授张剑，清华大学出版社学术出版中心编审马庆洲，《博览群书》杂志社社长、主编董山峰，中国社会科学院文学研究所研究员郑永晓、范子烨、祝晓风、刘倩，副研究员王敏庆、李芳、郜同麟，助理研究员朱曦林，中国社会科学出版社文学艺术与新闻传播出版中心主任、编审郭晓鸿以及会议承办方中社博雅总经理陈肖静。发布暨座谈会分别由中国社会科学出版社总编辑魏长宝和中国社会科学院文学研究所古代文学室主任吴光兴主持。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871575576.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学出版社党委书记、社长赵剑英在会上致辞 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 赵剑英首先对《新编》的出版表示热烈祝贺，对作者陈才智研究员表示热烈祝贺与感谢！他说，从选题立项到合同签订，对《新编》书稿都给予了高度关注与支持。如此重视的原因，首先是这套书的研究对象——白居易这位文学家非常重要，他在唐代就不仅在国内诗坛享有盛名，而且受到新罗、日本等国文化界的高度推崇，可以说是一千多年前文化“走出去”的典型范例。其次《新编》的重要价值突出地体现在“新”字上。从陈友琴先生的名作《白居易资料汇编》于1958年出版开始，共30万字，经过半个多世纪的发展，古籍整理、学术研究方面都取得了长足的进展，一版再版的“资料汇编”已无法满足学界的研究需求。而“资料新编”多达676万字。作者花了二十年的时间，做出这样一项嘉惠学林的成果，这种精神非常值得敬佩。可以说，资料新编代表了新世纪、新时代白居易研究领域文献资料收集和整理的水平 。</span><span> </span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 赵剑英还特别指出，中国社会科学院文学研究所不仅在学术研究方面走在相关领域的前列，而且一直以来鼎力支持见效慢、收功少的文献资料建设，为全国从事文学研究的各类人员提供服务，这本身就是“为人民做学问”价值观的生动体现，可以说为学术机构设立了标杆，对出版社编校团队加班加点保质保量完成书稿，社里其他部门大力配合表示了肯定。相信《新编》的面世一定会推动白居易研究掀起热潮。</span><span> </span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 最后赵剑英说，习近平总书记多次强调要推动中华优秀传统文化创造性转化、创新性发展，并认为中华优秀传统文化是中华民族的基因和精神命脉，这是对从事中国历史、考古、文学、哲学和古代文献研究与整理工作的充分肯定与莫大鼓励。前几天，总书记又在给《文史哲》编辑部全体编辑人员回信中指出“增强做中国人的骨气和底气”。所谓底气，我理解首先就是我们有文化自信，就是因为我们拥有诸多像白居易这样的文学大家或思想大家。他们创造的不朽篇章，都是优秀中华传统文化的结晶，是华夏文明的瑰宝，至今仍滋养着中国人的心灵，提升中国人的精神境界。要做到“创造性转化、创新性发展”的一个先决条件，就是要“摸清家底”。《新编》这样的成果，对我们摸清传统文化方面的家底来说，多多益善。希望文学研究所以及其他研究机构推出更多此类力作，我们作为学术出版社，一定全力支持，打造出更多学术精品以惠泽读者。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871591484.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院学部委员、文学研究所所长刘跃进在会上致辞 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 刘跃进指出：“文学所的书该怎么做，文学所的学问到底该怎么做，这是我们每一个文学所的人都应该考虑的问题。继承传统，体现今天的时代特色，两者缺一不可。才智写这部书用了二十年，他广泛搜集资料，过程非常艰辛。我首先要祝贺他，同时要特别感谢剑英社长，感谢出版社。这套书会比一般的书具有更为长久的生命力，这是古籍整理的特色。最后，希望才智再接再厉，回到文本，进一步完成白居易资料的经典集注工作。”</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871608500.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院荣誉学部委员陈铁民在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 陈铁民指出，陈才智的这套书是目前白居易研究史、白居易接受史方面最丰富的一套资料。在写作过程中，作者克服了种种困难，广泛收集资料，同时使用便于读者阅读的体例写出来，是一套重要的文献资料。由于整套书体量很大，社科出版社能出版，功不可没。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871629969.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 清华大学中国语言文学系教授谢思炜在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 谢思炜认为，《新编》完成了白居易校评、注释的前期工作，对学界具有很大的贡献，是非常值得尊敬的。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871646116.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 北京大学中国语言文学系教授杜晓勤在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 杜晓勤说：“才智将大好的青春付与了白居易资料整理，历时二十年，完成了这套书，为学界提供了一份重要的白居易研究资料。”他进而对作者提出了一些具体的建议，并且希望作者在之后的研究中，可以进一步将地方志和域外文献中的白居易研究资料增补进来。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871669468.jpg\" />\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院文学研究所研究员范子烨在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 范子烨认为陈才智是一位“文学科学家”，一方面，他能充分运用先进的科技手段——这是我们这个时代的优势——展开研究；另一方面，学术的选择性很重要，白居易的诗具有丰富的社会生活内涵，文化含量极高，我们能从中看到人民群众的身影，所以陈才智研究“白诗”具有很大的空间。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871673212.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 北京大学中国语言文学系教授张剑在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 张剑指出，《新编》是文学史料整理的重要成果，是白居易整理研究的重要收获，是一部有特色的资料汇编。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871697057.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 清华大学出版社学术出版中心编审马庆洲在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 马庆洲认为，《新编》具有重要的学术价值和资料价值，作为出版业同行，他深知古籍整理类书籍的编校工作非常不易，但古籍整理类书籍是有生命力的，他向中国社会科学出版社表达了敬意。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871711004.jpg\" />\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 《博览群书》杂志社社长、主编董山峰在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 董山峰谈到，学科故事是中国故事的有机组成部分，要讲好中国故事，就要讲好学科故事。学人不仅要讲好自己研究的内容，也要讲好自己的研究内容在本学科谱系中的地位，做好传播性的讲好学科故事的工作，从而推动社会文明的发展。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871734195.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院文学研究所研究员祝晓风在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 祝晓风在对作者表示祝贺和钦佩的同时指出，如此大体量的古籍资料整理，对于我国传统文化的传承具有重要意义，对于出版社的要求也非常高。中国社会科学出版社出版这套书，对于我们增强文化自信具有重要意义。</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 其他学者都对《新编》的出版表示了祝贺，并肯定了中国社会科学出版社出版这套书对学界做出的贡献。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871752627.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院文学研究所古代文学室主任吴光兴在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 吴光兴就《新编》的“资料层级”的问题谈了自己的想法，同时也提出了一些建议。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871775920.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学出版社文学艺术与新闻传播出版中心主任、编审郭晓鸿在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 郭晓鸿回顾《新编》的编校过程，感慨万千：“由于体量大又是繁体字，将近三年时间才面世，确实要感谢出版社各个环节工作人员的倾情付出，也要感谢作者陈才智精益求精的治学态度。”</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871784296.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中社博雅总经理陈肖静在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 陈肖静提到，中社博雅致力于服务学术和学者，我们将继续努力传播优质内容，彰显优秀思想价值。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871955100.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学院文学研究所研究员、中国社会科学院研究生院教授陈才智在会上讲话 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 交流结束后，作者陈才智作了诗意的答谢辞，对出版社、文学所以及师长友人表达了真挚的谢意。他说：“当我们踏上旅途，开车上路，骑车出游，遨游江海，前面如果有人带领，肯定既可避免弯路，不错失美景，也会减少阻力，历陈途而避旧，履新阳于故阴。即使有一天自己独辟蹊径，独创新路，独树一帜，但从前受到的惠泽，一定会积淀在新路的探索之中，所以应该铭感在心——万木虽承新雨露，朝阳犹在旧青山。”</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871972776.jpg\" /></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 中国社会科学出版社总编辑魏长宝作会议总结 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 会议最后，魏长宝用三个关键词作了总结：祝贺，感谢与期望。他期待陈才智研究员关于白居易资料整理和研究的后续成果早日面世，形成系列，扩大影响；同时也欢迎各位学者将自己的古籍整理成果和其他优秀成果拿到中国社会科学出版社出版，期待未来出版社与学者们的深度合作。</span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> &nbsp;<span><img alt=\"\" src=\"http://ex.cssn.cn/zx/bwyc/202105/W020210515423871995433.jpg\" /></span></span>\r\n</p>\r\n<p align=\"center\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 与会人员合影 主办方供图</span>\r\n</p>\r\n<p align=\"left\" style=\"font-family:&quot;color:#595757;background-color:#FFFFFF;font-size:18px !important;\">\r\n	<span> 会议由中国社会科学院文学研究所与中国社会科学出版社共同举办。</span><span></span><span></span>\r\n</p>','张娓 王小溪','中国社会科学网','2021-05-16 10:47:10','《白居易资料新编》（全十册）新书发布会暨出版座谈会在京召开','images/news-2.jpg'),
(22,'<div class=\"app-module_leftSection_EaCvy\" style=\"background-color:#FFFFFF;\">\r\n	<div class=\"index-module_articleWrap_2Zphx\">\r\n		<div class=\"index-module_mediaWrap_213jB\">\r\n			<div class=\"index-module_contentImg_JmmC0\" style=\"text-align:center;\">\r\n				<img src=\"https://pics6.baidu.com/feed/63d0f703918fa0ec2c6c7cee7b0ed8e63f6ddbcf.jpeg?token=d6744cf5e036f63febc99b6aa0960f71\" width=\"200\" class=\"index-module_normal_Bq4DA\" height=\"293\" title=\"\" align=\"\" alt=\"\" /> \r\n			</div>\r\n		</div>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				《民谣》\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				作者：王尧 出版社：译林出版社\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"text-align:left;font-size:16px;color:#333333;\">\r\n				推荐理由：“我坐在码头上，太阳像一张薄薄的纸垫在屁股下。”\r\n			</p>\r\n		</div>\r\n		<p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				时间拨回至一九七二年五月。依水而生的江南大队，漫长的雨水终于停歇，麦子发酵味道笼盖村庄，暗潮涌动于日常。码头边，十四岁的少年等待着了解历史问题的外公，江南大队的人们等待着石油钻井队的大船，然而生活终以脱离人们预计和掌控的方式运行。少年在码头边左顾右盼，在庄舍与镇上间游走返还，在交织缠绕的队史、家族史间出入流连。他于奔跑中成长，于成长中回望，回望里，记忆发酵，生长。历史老树的黄叶，一片片落入《民谣》的故事和人物，飘扬，旋转，飞翔。\r\n			</p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				作者王尧为其首部长篇《民谣》准备了二十余年，藉此完成了他重建个体与历史之间联系的夙愿。《民谣》谱写一个少年的成长精神史，一个村庄的变迁发展史，一个民族的自我更新史。它以个体细微纤弱之小记忆，呈现时代的宏阔酷烈。\r\n			</p>\r\n		</div>\r\n		<div class=\"index-module_mediaWrap_213jB\">\r\n			<div class=\"index-module_contentImg_JmmC0\" style=\"text-align:center;\">\r\n				<img src=\"https://pics6.baidu.com/feed/279759ee3d6d55fbb06c180d3abbce4221a4dd90.jpeg?token=8aca80df4ea73e479bcc12782c8b5552\" width=\"207\" class=\"index-module_normal_Bq4DA\" /> \r\n			</div>\r\n		</div>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				《受命》\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				作者：止庵 出版社：人民文学出版社\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				推荐理由：《受命》是止庵的首部长篇小说，也是一部致敬《史记·伍子胥列传》和《哈姆雷特》的小说。这部作品关乎记忆和爱情，记忆来自既往，还没有退场；爱情指向新生，却无法生长。在这两个完全相反的作用力中间，是一个“日暮途穷”的复仇计划。男女主人公狭路相逢，一个怀揣着秘密，纠缠于噩梦一般的记忆；一个痴想着将来，一往情深灌溉着爱情。悔与憾从而在所难免，意外与紧张也就在情理之中。\r\n			</p>\r\n		</div>\r\n		<div class=\"index-module_mediaWrap_213jB\">\r\n			<div class=\"index-module_contentImg_JmmC0\" style=\"text-align:center;\">\r\n				<img src=\"https://pics5.baidu.com/feed/42a98226cffc1e17e35579441d09770b728de97b.jpeg?token=8d14a596558a25d0b4d4ee1c153026e5\" width=\"200\" class=\"index-module_normal_Bq4DA\" height=\"302\" title=\"\" align=\"\" alt=\"\" /> \r\n			</div>\r\n		</div>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				《谁在敲门》\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				作者：罗伟章 出版社：广西师范大学出版社\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				推荐理由：这是一部具有史诗品格的长河小说。生而为人，不可避免的是，在人生的某个关卡，会遭遇父母亲的离世。至亲的离世往往带来不可跨越的悲伤。\r\n			</p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				小说以“父亲的病”为导火索，采用定向爆破的叙事方式，将子女们的内心世界逐一炸裂，从得知父亲住院时的张皇失措，到病房陪护时的手忙脚乱，从选择放弃治疗时的迫不得已，到直面父亲去世时的追悔莫及，各种复杂微妙的情绪交织在一起，兄弟姐妹间相同的悲痛和不同的难处，凝练成对生死、道德、人性的感慨与叩问。文/记者储文静\r\n			</p>\r\n		</div>\r\n		<div class=\"index-module_mediaWrap_213jB\">\r\n			<div class=\"index-module_contentImg_JmmC0\" style=\"text-align:center;\">\r\n				<img src=\"https://pics2.baidu.com/feed/54fbb2fb43166d228606b59e1fba88ff9152d2ed.jpeg?token=31fa0c23a54ab42840553353baf0d4bf\" width=\"200\" class=\"index-module_normal_Bq4DA\" height=\"289\" title=\"\" align=\"\" alt=\"\" /> \r\n			</div>\r\n		</div>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				《世间文章》\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				作者：黄德海 出版社：作家出版社\r\n			</p>\r\n			<p style=\"text-align:center;font-size:16px;color:#333333;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				推荐理由：选《檀弓》《史记·李斯传》及《赐南越王赵佗书》《轮台诏》等名篇精读，剖析这些文章连接的历史节点，猜想作者面对时代巨澜的心思，进而文章，探索世间大道之通达，读之可拍案，可幽思，可佐酒，更可振奋精神。\r\n			</p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				白居易有言，“文章合为时而著”，所谓“时”，时空、时代、时势也。流传千古的文章，都不在于辞章，而在于历史语境里的人情、人心，在于人性既经受当时当地的塑造，又竭力跳脱此等局限，而成为叩问永恒的不竭元点。\r\n			</p>\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				<br />\r\n			</p>\r\n		</p>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				【来源：潇湘晨报】\r\n			</p>\r\n		</div>\r\n		<div class=\"index-module_textWrap_3ygOc\">\r\n			<p style=\"font-size:16px;color:#333333;text-align:justify;\">\r\n				声明：转载此文是出于传递更多信息之目的。若有来源标注错误或侵犯了您的合法权益，请作者持权属证明与本网联系，我们将及时更正、删除，谢谢。 邮箱地址：newmedia@xxcb.cn\r\n			</p>\r\n		</div>\r\n		<div class=\"index-module_mediaWrap_213jB\">\r\n			<div class=\"index-module_reportContainer_1LjGN\" style=\"text-align:right;\">\r\n				<br />\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>',' 潇湘晨报',' 潇湘晨报','2021-05-16 10:52:16','新书推荐｜致敬《史记·伍子胥列传》和《哈姆雷特》的这本书有多精彩？','images/news-3.jpg');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `owner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `imgsrc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`time`,`owner`,`sex`,`tel`,`address`,`age`,`imgsrc`) values 
(1,'root','root','2021-05-04 02:10:15','管理员','男','12345678901','北京','25','pic/nobody.jpg'),
(2,'zhangsan','1234','2021-05-06 13:46:47','用户','男','12345678901','北京','25','pic/nobody.jpg'),
(3,'lisi','1234','2021-05-07 00:17:06','员工','男','00000000000','0000','26','pic/nobody.jpg'),
(6,'aaa','aaaa','2021-05-08 01:20:08','用户','男','11111111111','aaa','26','pic/nobody.jpg'),
(7,'abc','abcd','2021-05-11 11:15:30','用户','男','12345678901','上海','26','pic/nobody.jpg');

/*Table structure for table `useradvise` */

DROP TABLE IF EXISTS `useradvise`;

CREATE TABLE `useradvise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `admincon` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `useradvise` */

insert  into `useradvise`(`id`,`username`,`content`,`time`,`admincon`) values 
(3,'zhangsan','建议测试','2021-05-07 19:12:57','root: hallo   [2021-05-07 20:18:53]'),
(4,'zhangsan','abcd','2021-05-11 11:14:45','root: 1234   [2021-05-11 11:18:40]'),
(5,'aaa','我的货怎么还没到！','2021-05-16 10:58:56','root: 请等待   [2021-05-16 21:54:08]'),
(6,'zhangsan','1234','2021-05-16 22:22:50','root: 1234   [2021-05-16 22:27:57]');

/*Table structure for table `usersell` */

DROP TABLE IF EXISTS `usersell`;

CREATE TABLE `usersell` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `bnid` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usersell` */

insert  into `usersell`(`id`,`username`,`bnid`,`price`,`time`) values 
(22,'zhangsan',1,300,'2021-05-15 23:08:24'),
(24,'zhangsan',8,14.8,'2021-05-16 21:49:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
