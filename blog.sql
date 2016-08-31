/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-08-31 14:18:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blog_admin`
-- ----------------------------
DROP TABLE IF EXISTS `blog_admin`;
CREATE TABLE `blog_admin` (
  `a_id` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `visits_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_admin
-- ----------------------------
INSERT INTO `blog_admin` VALUES ('1', '734399815', 'Doing', 'e10adc3949ba59abbe56e057f20f883e', '男', '2016-08-10 18:05:20', '2016-08-22 18:11:23', '13288508983', null);

-- ----------------------------
-- Table structure for `blog_article`
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `article_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `create_date` datetime DEFAULT NULL,
  `visits_number` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `admin_id` (`admin_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `blog_article_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `blog_admin` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `blog_article_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `user_comment` (`ucomment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('3', '尝试使用微信，每天推荐3首歌（试一下加好友？）', '<p><span style=\"font-size: 15px;\">好友列表刚刚拉到尽头，刚刚好 30 个，所用的时间是：5 年。如邮件显示的，我是在 2011 年使用的微信，那时候的微信很简陋，就是另外一个阿猫阿狗的即时通信，至今搞不明白到底为何火了，约炮？年轻人要独特？QQ 太杂？</span><br></p>', '2016-08-25 15:43:43', '1', null, '1');
INSERT INTO `blog_article` VALUES ('4', '微信朋友圈音乐收集2016-06合集+我的生活（音乐+文字）', '<p><span style=\"font-size: 15px;\">移动端适合分享，适合碎片化，所以就像前面几篇我说的。我应该以后只会频繁在朋友圈发音乐了，这里以后可能成了我最后总结记录的地方了。所以从这个月开始我只总结我朋友圈每个月歌曲的总结。朋友圈音乐我分为：Morning、Nooning、Night，风格有差异，所以是分开下载的。</span></p><p><span style=\"font-size: 15px;\">最近自己在写一个项目，就是我那个：<a href=\"http://i.YouMeek.com\" target=\"_blank\">YouMeek导航</a>，我打算把它做成 Java 版本，然后提供会员入口，还有其他一些新 idea，我想做一个很有我个人特色的导航，我完全不理解现在商业化的那些导航，真的。 用各种标题，用各种下三滥来吸引点击，做编辑的也难受吧？项目目前还在开发后台，权限角色相关的已经好了，现在在实施后台的一些其他模块功能。前台的话可能就一个页面，只是这个 样式和排版让我很烦恼，还有后面的初始化数据，那又是一堆的事情，重新整理或是什么。没办法直接导入，有些数据可能也旧了不合适了。可能这个项目好了之后就是开始写 Linux 相关的东西吧。</span></p><p><span style=\"font-size: 15px;\">科目一应该是这个月中旬会考，应该没啥问题。车的话，中意马自达 CX-4，或是马自达昂克赛拉吧，希望今年年末可以买。</span></p><p><span style=\"font-size: 15px;\">昨天去广州 sony store，在太古汇楼顶，那个地方晚上有风吹着，坐在那里还是不错的。我是去买 MDR-EX750BT，我喜欢出门的时候戴着耳机，我也知道这样不好，但是如果自己一个人出门不听歌的话整个世界都是灰暗的。 蓝牙耳机适合出门，我一直这样觉得，所以出门的耳机我只建议选择蓝牙的。sony 的这款长相确实很好，适合出街。但是音质嘛，我觉得非常一般，我是用 ipod 连接，但是即使我在 store 中它家的播放器其实也很一般。这款耳机我个人觉得至少你花了 30% 的价值在这外观上， 20% 在品牌附加值上。可能这样说也不合理，官网注册会员保修两年，这个成本也是挺高的。算了，大家自己算吧，反正蓝牙耳机一定不要讲太多音质。<br>这个地址是从我博客JD搜索框得到的链接，应该是有收益的吧，我刚刚看了下，我京东的推广，收益了一百零四，用了半年，没啥好说的。</span></p>', '2016-08-25 16:01:01', '2', null, '1');
INSERT INTO `blog_article` VALUES ('10', 'Firefox浏览器自带/内置的书签同步功能说明(配多图+我正在用)', '<p><span style=\"font-size: medium;\">以前一直用<a href=\"http://zhannei.baidu.com/cse/search?s=2519051498532276289&amp;entry=1&amp;q=xmarks\" target=\"_blank\">xmarks</a>同步书签，主要是因为<a href=\"http://zhannei.baidu.com/cse/search?s=2519051498532276289&amp;entry=1&amp;q=chrome%E6%B5%8F%E8%A7%88%E5%99%A8\" target=\"_blank\">chrome浏览器</a>一出来之后，我就喜欢上它了，而<a href=\"http://zhannei.baidu.com/cse/search?s=2519051498532276289&amp;entry=1&amp;q=chrome\" target=\"_blank\">chrome</a>自带的同步功能，因为国内的网络问题，一直出问题，所以那时候我就用了xmarks。但是再后来，我在chrome上安装了很多很多的插件之后，chrome变得很卡，但是那些插件我又不能不用，所以我就抛弃了chrome，转到<a href=\"http://zhannei.baidu.com/cse/search?s=2519051498532276289&amp;entry=1&amp;q=firefox\" target=\"_blank\">firefox</a>下，firefox比较笨重，但是插件装多了，还是比较稳。用firefox最开始我也是用xmarks同步书签，公司电脑，家里电脑，每天都必须同步的，但是xmarks也经常出现网络不通的情况，所以我就得再找其他方式了，后来就试用了下firefox这个自带的同步功能，用过个把月了，可以推荐出来给大家了，很稳定，速度也很快，缺点就是没有类似xmarks那样有多个历史版本记录，但是足够了，只要同步及时。（再唠叨一下，真心恨透了<a href=\"http://zhannei.baidu.com/cse/search?s=2519051498532276289&amp;entry=1&amp;q=IE6\" target=\"_blank\">IE6</a>了，希望大家不要再用它了，也影响其他人不要用它，please。）</span></p><p><span style=\"font-size: medium;\"><img src=\"http://youmeek-image.b0.upaiyun.com/firefox-bookmarks-sync1.jpg\" alt=\"Image\" height=\"682\" width=\"643\"><img src=\"http://youmeek-image.b0.upaiyun.com/firefox-bookmarks-sync2.jpg\" alt=\"Image\" height=\"704\" width=\"829\"></span><br></p>', '2016-08-25 16:14:13', '55', null, '1');
INSERT INTO `blog_article` VALUES ('12', '做国内最好的两个IntelliJ IDEA交流群–提问方式说明(视频教程)', '<p><font>在这里感谢两个人：Freewind、大猫（刚为人父，在此恭喜啦！！）。<br>我希望这两个群以后能成为国内最好的IntelliJ IDEA交流群之二，<br>同时也希望IntelliJ IDEA在国内能有更好的发展。 </font></p><p><font>出这篇文章的主要目的，减少大家在群里出现答非所问的情况，<br>提高部分人的提问能力，也是一篇我个人提问方式的传播。 </font></p><p><font><font><strong><font color=\"#ff0000\">准备两个工具：</font></strong><br></font></font><font color=\"#0080ff\"><strong>GifCam</strong></font></p><p><font><font color=\"#0080ff\"><strong>Ashampoo Snap 6.0.10<br></strong></font></font></p><p><font>提问和解答例子，分为两类： </font></p><p><font><strong>动态类，用工具GifCam：</strong><br>①传统注释的提问<br>②用模版注释的解答 </font></p><p><font><strong>静态类，用工具Snap：（截图</strong>一定要大）<br>①同一个问题，两种提问对比：<br>&nbsp;&nbsp;&nbsp; 文字提问：文件tab标签下那一行的作用？<br>&nbsp;&nbsp;&nbsp; 图片提问：用图片截图的提问<br>②模版例子的参数等其他条件的解说 </font></p><p><font>详细说明两个<strong>工具的设置</strong>：<br>GifCam我没设置过<br>Snap专讲：<br>①文字注明，画图，箭头，编号，模糊<br>②定时捕获（比如在IntelliJ IDEA编辑窗口下右键，常规是没办法捕获的，QQ截图倒是可以）<br>③设置多语言<br>④设置图片输出路径<br>⑤设置快捷键<br>感谢(№秋┟刀┮鱼)反馈，在开着有道词典的时候，且有道词典是开启划词功能的时候，snap截图的时候，编辑下单击的时候会自动保存截图，请大家还是关闭有道的划词功能吧…</font></p><p><img src=\"http://youmeek-image.b0.upaiyun.com/forward-china-best-conversation-group-about-IntelliJ-IDEA.jpg\" alt=\"Image\" height=\"639\" width=\"1307\"><br></p>', '2016-08-25 16:47:46', '0', null, '1');
INSERT INTO `blog_article` VALUES ('15', '我为何使用win8平板+win8平板下的一些个人设置（文字+配图）', '<p><span style=\"font-size: 15px;\"><span style=\"color: red;\">总结：</span>写这篇文章，主要是为了让别人理解我为何使用win8平板，以及我在win8平板下的一些系统设置和软件推荐。（其实还录制了一个演示视频，最后还是算了，不上传了） 在平板这种设备上，我以前买过Android的平板，也用过iPad，但是至今我都没找到我认可这两个系统的方式，我拿他们跟传统的桌面PC进行比较，而且是站在我对桌面PC多年了解的情况下进行比较。 就我个人而言，平板是桌面设备的衍生产品，而在我目前的桌面设备中，家里是win8.1，公司是win7，所以我目前的生态圈是windows阵营的。虽然我工作的时候也会对linux系统进行一些操作， 但是它只是工作中，并没有真正融入我的桌面生活。Mac的话，要组成一个生态圈的代价太大了，目前办不到。</span></p><hr><p><span style=\"font-size: 15px;\">先说下目前市场上主流的win8平板设备等级：<br><span style=\"color: rgb(0, 128, 192);\">第一阶梯</span>，也是我认为是目前win8平板市场是最好的–surface pro3，这个应该没有人会有疑问吧。但是价格摆在那里，一般人伤不起。<br><span style=\"color: rgb(0, 128, 192);\">第二阶梯</span>，应该是dell、acer、asus等国际品牌，价位一般在1000~4000之间不等。<br><span style=\"color: rgb(0, 128, 192);\">第三阶梯</span>，就是国产的台电、昂达、蓝魔这列了，价位一般在900~1500之间不等。</span></p><p><span style=\"font-size: 15px;\">而我买的是低端的台电X98 air 联通3G版，属于第三阶梯，目前基本满足我使用。我买这个win8平板在硬件上是出于这样的考虑：<br><span style=\"color: rgb(0, 128, 192);\">必须支持3G上网</span><br><span style=\"color: rgb(0, 128, 192);\">1500以下价位</span><br><span style=\"color: rgb(0, 128, 192);\">2G内存以上</span><br><span style=\"color: rgb(0, 128, 192);\">32G硬盘以上</span><br><span style=\"color: rgb(0, 128, 192);\">高清屏</span><br>其中，如果平板不支持上网卡的话，我觉得是一种浪费，特别是win8系统的平板，现在的生活都是基于网络和同步的，等下我讲到软件那块你会明白我的。 对于这台X98 air，做工一般，续航一般，或者说什么都一般，但是在1200的价位上，这个配置和做工算是不错的，没啥好吐槽的，也没啥好夸奖的。</span></p><hr><p><span style=\"font-size: 15px;\">硬件就说这么多，接下来就说我今天的重点，系统和软件。 首先我的软件列表有如下内容：<br>福昕阅读器<br>Firefox以及对应扩展（目前启用的有12个）<br>为知笔记<br>搜狗输入法<br>人生日历<br>虾米<br>有道云笔记<br>360浏览器<br>Mactype<br>Notepad++<br>QQ<br>各类VPN软件<br>Advanced SystemCare 6<br>Everything<br>Ccleaner<br>QQ微云同步盘（360云盘我同步公司和家里，微云用来同步PC和平板）<br>有道词典<br>360压缩<br>Potplay<br>Foobar2000<br>PPTV<br>迅雷看看<br>Smart Defrag<br>Start8<br>Office 2013</span></p><p><span style=\"font-size: 15px;\">通过上面这些软件其实已经透露出我为何买win8的平板，不知道是否有人可以看出来。<br><span style=\"color: rgb(0, 128, 192);\">PDF阅读器：</span> 对那些我下载的书籍的原作者我表示抱歉。目前对于PDF，我喜欢阅读+编辑的方式，也是我个人阅读的习惯，而我至今找不到可以比win8更合适编辑PDF的系统了。 我平时是会乱涂乱画的看书者，不画我看不下去。<br>目前我常用两台设备编辑PDF测试的结果：<br>家里的win8.1+i7+ssd+16G内存编辑一个365M的pdf，保存的时候用时20秒左右。<br>台电X98 AIR平板上，同样大小的书籍放在TF卡上，编辑保存需要的时间最长的差不多是90秒左右。<br><span style=\"color: rgb(0, 128, 192);\">Wiz笔记：</span>我爱做笔记和整理笔记，爱阅读。可以说记录这种事，贯穿了我目前的整个生活，平时博客文章也是通过不断记录思考和整理得来的， 而这类笔记软件，我目前多台PC用的都是为知笔记。（需要网络同步）<br><span style=\"color: rgb(0, 128, 192);\">搜狗输入法：</span> 也因为上面两点，我平时经常需要输入内容，而目前Android或是iOS的输入法真的很烂，为什么这么说了，因为我有大量的自定义词库，这些词库可以帮我减少很多事（需要网络同步）<br><span style=\"color: rgb(0, 128, 192);\">Firefox浏览器：</span>目前移动端的浏览器也是一直让我抱怨的，在我常规PC下启用的firefox扩展有22个，目前win8平板上有12个启用扩展。 我依赖这些扩展、以及桌面浏览器良好的添加书签、查看书签、同步书签的方式。但是这些都还不是最重要的，最重要的是RSS的阅读，目前只有web端才是做的最好的，而我需要RSS（需要网络同步）<br><span style=\"color: rgb(0, 128, 192);\">各种视频播放器：</span>有懒人支架，除了看书就是躺在床上看视频了。（需要网络同步，我要看的电影我都是会加入浏览器书签和通过verycd订阅）<br><span style=\"color: rgb(0, 128, 192);\">Office：</span>Word、Excel、PPT，这个没什么好说的。（需要网络同步，通过同步盘软件同步文件）</span></p><hr><p><span style=\"font-size: 15px;\">通过我为何安装这些软件、喜欢这些软件来选择平板，我想你现在应该是明白了吧。所以总结下我目前生活中的设备分工：<br><span style=\"color: rgb(0, 128, 192);\">Android-手机</span>===听歌、闹铃、天气预报、随时记录、查交通+地图、录音、通话、短信、社交软件、临时拍照+录像、临时购物<br><span style=\"color: rgb(0, 128, 192);\">Windows-3G上网平板</span>===看PDF和编辑PDF、看RSS、Firefox浏览+我的书签、PC的输入法词库、做笔记、素材整理、博客草稿、看视频、应急的办公<br><span style=\"color: rgb(0, 128, 192);\">Windows-PC</span>===功能太多了，说不完<br><span style=\"color: rgb(0, 128, 192);\">佳能EOS</span>===摄影</span></p><hr><p><span style=\"font-size: 15px;\">接下来是说一些win8平板上一些我个人习惯的设置：</span><span style=\"font-size: 15px;\">在平板的win8你有一个地方需要优先更改的，方便你操作，那就是更改标题栏的大小。方法：在win8桌面上，右侧滑动，选择“设置”，选择“个性化”，选择右下角“显示”，这里我调整了几个东西： 标题栏，改为24。菜单，12。图标，12。工具提示，12。这是我个人喜好，你们根据你们的情况来分析。</span></p><p>在有鼠标的win8下，我使用音速启动管理桌面。但是到了触摸屏，我不得接受我必须还原到win7下的那种开始菜单，所以我使用了这个软件start8</p><p><a href=\"http://www.ttrar.com/html/Stardock-Start8.html\" target=\"_blank\">http://www.ttrar.com/html/Stardock-Start8.html</a></p><p>把屏幕键盘加到任务栏上，因为有些键，win8的虚拟键盘默认是没有的</p><hr><p>在搜索里面搜索”校准“关键字，然后选择“校准笔和触控输入的屏幕”（这个选项貌似只有触摸的系统才有，我桌面系统没有做到这个选项）	                <a href=\"http://www.wumii.com/item/11xKdWojO\" target=\"_blank\">1</a>            </p><p>                        </p>', '2016-08-27 14:24:04', '0', null, '1');

-- ----------------------------
-- Table structure for `blog_user`
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `head_portrait` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('12', '734399815', 'simpkle', '123456', '男', '2016-08-02 00:00:00', '13288508983', '2016-08-26 16:59:57', '201608242334005260kriiokf');
INSERT INTO `blog_user` VALUES ('13', '123456', 'Doing', '111111', '女', '2016-08-24 00:00:00', '', '2016-09-01 09:27:22', 'default_headPortrait');
INSERT INTO `blog_user` VALUES ('15', '111111', '111111', '123456', '男', null, '13288508983', '2016-08-31 13:34:59', 'default_headPortrait');

-- ----------------------------
-- Table structure for `user_comment`
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `ucomment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ucomment_id`),
  KEY `user_comment_ibfk_1` (`user_id`),
  KEY `user_comment_ibfk_2` (`article_id`),
  CONSTRAINT `user_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`u_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_comment_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_comment
-- ----------------------------
INSERT INTO `user_comment` VALUES ('3', '评论内容', '2016-08-28 23:45:23', '12', '3');
INSERT INTO `user_comment` VALUES ('4', '第二条', '2016-08-29 15:22:28', '12', '3');
INSERT INTO `user_comment` VALUES ('5', '第三条', '2016-08-29 15:22:46', '12', '3');
INSERT INTO `user_comment` VALUES ('7', '第五条', '2016-08-29 17:00:18', '12', '3');
INSERT INTO `user_comment` VALUES ('8', '第六条', '2016-08-29 17:00:40', '12', '3');
INSERT INTO `user_comment` VALUES ('9', '第七条', '2016-08-29 17:01:00', '12', '3');
INSERT INTO `user_comment` VALUES ('10', '第八条', '2016-08-29 17:07:27', '12', '3');
INSERT INTO `user_comment` VALUES ('11', '第九条', '2016-08-29 21:14:40', '12', '3');
INSERT INTO `user_comment` VALUES ('12', '第十条', '2016-08-29 21:14:52', '12', '3');
INSERT INTO `user_comment` VALUES ('13', '第十一条', '2016-08-29 21:15:05', '12', '3');
INSERT INTO `user_comment` VALUES ('14', '第十二条', '2016-08-29 21:15:18', '12', '3');
INSERT INTO `user_comment` VALUES ('15', '第十三条', '2016-08-29 21:15:31', '12', '3');
INSERT INTO `user_comment` VALUES ('16', '第十四条', '2016-08-30 14:54:46', '12', '3');
INSERT INTO `user_comment` VALUES ('17', '第十五条', '2016-08-30 15:01:40', '12', '3');
INSERT INTO `user_comment` VALUES ('18', '第十五条', '2016-08-30 15:01:44', '12', '3');
INSERT INTO `user_comment` VALUES ('19', '第十五条', '2016-08-30 15:01:44', '12', '3');
INSERT INTO `user_comment` VALUES ('20', '第十五条', '2016-08-30 15:01:44', '12', '3');
INSERT INTO `user_comment` VALUES ('21', '第十六条', '2016-08-30 15:02:54', '12', '3');
INSERT INTO `user_comment` VALUES ('22', '第十七条', '2016-08-30 15:03:31', '12', '3');
INSERT INTO `user_comment` VALUES ('23', '第十八条', '2016-08-30 15:10:58', '12', '3');
INSERT INTO `user_comment` VALUES ('24', '第十八条', '2016-08-30 15:11:00', '12', '3');
INSERT INTO `user_comment` VALUES ('25', '第十九条', '2016-08-30 15:15:09', '12', '3');
INSERT INTO `user_comment` VALUES ('26', '第二十条', '2016-08-30 15:25:25', '12', '3');
INSERT INTO `user_comment` VALUES ('27', '第二十一条', '2016-08-30 15:25:44', '12', '3');
INSERT INTO `user_comment` VALUES ('28', '没用', '2016-08-30 15:26:03', '12', '4');
INSERT INTO `user_comment` VALUES ('29', '第二条', '2016-08-30 15:26:24', '12', '4');
INSERT INTO `user_comment` VALUES ('30', '第三条', '2016-08-30 15:26:32', '12', '4');
INSERT INTO `user_comment` VALUES ('31', '第四条', '2016-08-30 15:26:35', '12', '4');
INSERT INTO `user_comment` VALUES ('32', '第五条', '2016-08-30 15:26:39', '12', '4');
INSERT INTO `user_comment` VALUES ('33', '第六条', '2016-08-30 15:26:45', '12', '4');
INSERT INTO `user_comment` VALUES ('34', '第七条', '2016-08-30 15:26:52', '12', '4');
INSERT INTO `user_comment` VALUES ('35', '第八条', '2016-08-30 15:26:56', '12', '4');
INSERT INTO `user_comment` VALUES ('36', '第九条', '2016-08-30 15:27:39', '13', '4');
INSERT INTO `user_comment` VALUES ('37', '第十条', '2016-08-30 15:27:52', '13', '4');
INSERT INTO `user_comment` VALUES ('38', '第十一条', '2016-08-30 15:27:57', '13', '4');
INSERT INTO `user_comment` VALUES ('39', '第十二条', '2016-08-30 15:30:29', '13', '4');
INSERT INTO `user_comment` VALUES ('40', '第十三条', '2016-08-30 21:13:07', '12', '4');
