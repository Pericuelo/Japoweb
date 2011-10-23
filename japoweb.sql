/*
SQLyog Community v9.20 
MySQL - 5.0.91-community : Database - eoijisho_main
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `eoijisho_main`;

/*Table structure for table `jos_banner` */

DROP TABLE IF EXISTS `jos_banner`;

CREATE TABLE `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_banner` */

/*Table structure for table `jos_bannerclient` */

DROP TABLE IF EXISTS `jos_bannerclient`;

CREATE TABLE `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_bannerclient` */

/*Table structure for table `jos_bannertrack` */

DROP TABLE IF EXISTS `jos_bannertrack`;

CREATE TABLE `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_bannertrack` */

/*Table structure for table `jos_categories` */

DROP TABLE IF EXISTS `jos_categories`;

CREATE TABLE `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_categories` */

/*Table structure for table `jos_components` */

DROP TABLE IF EXISTS `jos_components`;

CREATE TABLE `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `jos_components` */

insert  into `jos_components`(`id`,`name`,`link`,`menuid`,`parent`,`admin_menu_link`,`admin_menu_alt`,`option`,`ordering`,`admin_menu_img`,`iscore`,`params`,`enabled`) values (1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n',1),(2,'Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,'',1),(3,'Clients','',0,1,'option=com_banners&c=client','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,'',1),(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/component.png',0,'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n',1),(5,'Links','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,'',1),(6,'Categories','',0,4,'option=com_categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,'',1),(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/component.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(8,'Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,'',1),(9,'Categories','',0,7,'option=com_categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(10,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,'',1),(11,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,'',1),(12,'Feeds','',0,11,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n',1),(13,'Categories','',0,11,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,'',1),(14,'User','option=com_user',0,0,'','','com_user',0,'',1,'',1),(15,'Search','option=com_search',0,0,'option=com_search','Search Statistics','com_search',0,'js/ThemeOffice/component.png',1,'enabled=0\n\n',1),(16,'Categories','',0,1,'option=com_categories&section=com_banner','Categories','',3,'',1,'',1),(17,'Wrapper','option=com_wrapper',0,0,'','Wrapper','com_wrapper',0,'',1,'',1),(18,'Mail To','',0,0,'','','com_mailto',0,'',1,'',1),(19,'Media Manager','',0,0,'option=com_media','Media Manager','com_media',0,'',1,'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n',1),(20,'Articles','option=com_content',0,0,'','','com_content',0,'',1,'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=0\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n',1),(21,'Configuration Manager','',0,0,'','Configuration','com_config',0,'',1,'',1),(22,'Installation Manager','',0,0,'','Installer','com_installer',0,'',1,'',1),(23,'Language Manager','',0,0,'','Languages','com_languages',0,'',1,'',1),(24,'Mass mail','',0,0,'','Mass Mail','com_massmail',0,'',1,'mailSubjectPrefix=\nmailBodySuffix=\n\n',1),(25,'Menu Editor','',0,0,'','Menu Editor','com_menus',0,'',1,'',1),(27,'Messaging','',0,0,'','Messages','com_messages',0,'',1,'',1),(28,'Modules Manager','',0,0,'','Modules','com_modules',0,'',1,'',1),(29,'Plugin Manager','',0,0,'','Plugins','com_plugins',0,'',1,'',1),(30,'Template Manager','',0,0,'','Templates','com_templates',0,'',1,'',1),(31,'User Manager','',0,0,'','Users','com_users',0,'',1,'allowUserRegistration=0\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=0\n\n',1),(32,'Cache Manager','',0,0,'','Cache','com_cache',0,'',1,'',1),(33,'Control Panel','',0,0,'','Control Panel','com_cpanel',0,'',1,'',1),(34,'Japoweb','option=com_japoweb',0,0,'option=com_japoweb','Japoweb','com_japoweb',0,'js/ThemeOffice/component.png',0,'',1);

/*Table structure for table `jos_contact_details` */

DROP TABLE IF EXISTS `jos_contact_details`;

CREATE TABLE `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_contact_details` */

/*Table structure for table `jos_content` */

DROP TABLE IF EXISTS `jos_content`;

CREATE TABLE `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_content` */

insert  into `jos_content`(`id`,`title`,`alias`,`title_alias`,`introtext`,`fulltext`,`state`,`sectionid`,`mask`,`catid`,`created`,`created_by`,`created_by_alias`,`modified`,`modified_by`,`checked_out`,`checked_out_time`,`publish_up`,`publish_down`,`images`,`urls`,`attribs`,`version`,`parentid`,`ordering`,`metakey`,`metadesc`,`access`,`hits`,`metadata`) values (1,'Article de test','article-de-test','','<h1>The Problem With Popplers</h1>\r\n<p>Pansy. Hey, what kinda party is this? There\'s no booze and only one hooker. Man, I\'m sore all over. I feel like I just went ten rounds with mighty Thor.</p>\r\n<h2>That\'s Lobstertainment</h2>\r\n<p>Bender, hurry! This fuel\'s expensive! Also, we\'re dying! How much did you make me? Now, now. Perfectly symmetrical violence never solved anything. And why did \'I\' have to take a cab? Spare me your space age technobabble, Attila the Hun! I saw you with those two \"ladies of the evening\" at Elzars. Explain that.</p>\r\n<ul>\r\n<li>And why did \'I\' have to take a cab?</li>\r\n<li>Bender, I didn\'t know you liked cooking. That\'s so cute.</li>\r\n<li>Ugh, it\'s filthy! Why not create a National Endowment for Strip Clubs while we\'re at it?</li>\r\n</ul>\r\n<h3>The Sting</h3>\r\n<p>We don\'t have a brig. No! The cat shelter\'s on to me. Pansy. Or a guy who burns down a bar for the insurance money! Is today\'s hectic lifestyle making you tense and impatient? I just want to talk. It has nothing to do with mating. Fry, that doesn\'t make sense.</p>\r\n<h4>I, Roommate</h4>\r\n<p>Oh, I don\'t have time for this. I have to go and buy a single piece of fruit with a coupon and then return it, making people wait behind me while I complain. Leela\'s gonna kill me. When I was first asked to make a film about my nephew, Hubert Farnsworth, I thought \"Why should I?\" Then later, Leela made the film. But if I did make it, you can bet there would have been more topless women on motorcycles. Roll film! Can we have Bender Burgers again? This opera\'s as lousy as it is brilliant! Your lyrics lack subtlety. You can\'t just have your characters announce how they feel. That makes me feel angry!</p>\r\n<ol>\r\n<li>For example, if you killed your grandfather, you\'d cease to exist!</li>\r\n<li>I\'ll get my kit!</li>\r\n<li>Yep, I remember. They came in last at the Olympics, then retired to promote alcoholic beverages!</li>\r\n<li>I\'m sorry, guys. I never meant to hurt you. Just to destroy everything you ever believed in.</li>\r\n<li>Good man. Nixon\'s pro-war and pro-family.</li>\r\n</ol>\r\n<h5>I Dated a Robot</h5>\r\n<p>Oh, how awful. Did he at least die painlessly? …To shreds, you say. Well, how is his wife holding up? …To shreds, you say. I feel like I was mauled by Jesus. I was all of history\'s great robot actors - Acting Unit 0.8; Thespomat; David Duchovny! Kids have names? I was having the most wonderful dream. Except you were there, and you were there, and you were there!</p>','',1,0,0,0,'2011-10-16 17:51:58',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2011-10-16 17:51:58','0000-00-00 00:00:00','','','show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',1,0,1,'','',0,0,'robots=\nauthor=');

/*Table structure for table `jos_content_frontpage` */

DROP TABLE IF EXISTS `jos_content_frontpage`;

CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_content_frontpage` */

insert  into `jos_content_frontpage`(`content_id`,`ordering`) values (1,1);

/*Table structure for table `jos_content_rating` */

DROP TABLE IF EXISTS `jos_content_rating`;

CREATE TABLE `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_content_rating` */

/*Table structure for table `jos_core_acl_aro` */

DROP TABLE IF EXISTS `jos_core_acl_aro`;

CREATE TABLE `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro` */

insert  into `jos_core_acl_aro`(`id`,`section_value`,`value`,`order_value`,`name`,`hidden`) values (10,'users','62',0,'Administrator',0),(11,'users','63',0,'neko',0),(12,'users','64',0,'iru',0),(13,'users','65',0,'Pere Fonolleda',0),(14,'users','66',0,'Alex',0);

/*Table structure for table `jos_core_acl_aro_groups` */

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;

CREATE TABLE `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_groups` */

insert  into `jos_core_acl_aro_groups`(`id`,`parent_id`,`name`,`lft`,`rgt`,`value`) values (17,0,'ROOT',1,22,'ROOT'),(28,17,'USERS',2,21,'USERS'),(29,28,'Public Frontend',3,12,'Public Frontend'),(18,29,'Registered',4,11,'Registered'),(19,18,'Author',5,10,'Author'),(20,19,'Editor',6,9,'Editor'),(21,20,'Publisher',7,8,'Publisher'),(30,28,'Public Backend',13,20,'Public Backend'),(23,30,'Manager',14,19,'Manager'),(24,23,'Administrator',15,18,'Administrator'),(25,24,'Super Administrator',16,17,'Super Administrator');

/*Table structure for table `jos_core_acl_aro_map` */

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;

CREATE TABLE `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_map` */

/*Table structure for table `jos_core_acl_aro_sections` */

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;

CREATE TABLE `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro_sections` */

insert  into `jos_core_acl_aro_sections`(`id`,`value`,`order_value`,`name`,`hidden`) values (10,'users',1,'Users',0);

/*Table structure for table `jos_core_acl_groups_aro_map` */

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;

CREATE TABLE `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_groups_aro_map` */

insert  into `jos_core_acl_groups_aro_map`(`group_id`,`section_value`,`aro_id`) values (18,'',11),(18,'',12),(18,'',13),(18,'',14),(25,'',10);

/*Table structure for table `jos_core_log_items` */

DROP TABLE IF EXISTS `jos_core_log_items`;

CREATE TABLE `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_log_items` */

/*Table structure for table `jos_core_log_searches` */

DROP TABLE IF EXISTS `jos_core_log_searches`;

CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_log_searches` */

/*Table structure for table `jos_groups` */

DROP TABLE IF EXISTS `jos_groups`;

CREATE TABLE `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_groups` */

insert  into `jos_groups`(`id`,`name`) values (0,'Public'),(1,'Registered'),(2,'Special');

/*Table structure for table `jos_jw_categoria` */

DROP TABLE IF EXISTS `jos_jw_categoria`;

CREATE TABLE `jos_jw_categoria` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `num_palabras` int(10) unsigned default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_categoria` */

insert  into `jos_jw_categoria`(`id`,`nombre`,`descripcion`,`num_palabras`) values (1,'nombre','',16),(2,'verbo','',0),(3,'adjetivo','',1),(4,'adjetivo -i','',1),(5,'adjetivo -na','',1),(6,'calendario','Días de la semana, días del mes, meses',9),(7,'vehículos','',1),(8,'lección 1','',34),(9,'animales','',4),(10,'comida','',4),(11,'vegetales','',2),(12,'vehiculos','',0),(13,'cosas','',19);

/*Table structure for table `jos_jw_imagen` */

DROP TABLE IF EXISTS `jos_jw_imagen`;

CREATE TABLE `jos_jw_imagen` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_termino` int(10) unsigned NOT NULL,
  `id_user` int(11) NOT NULL,
  `fichero` varchar(20) collate utf8_unicode_ci NOT NULL,
  `url_original` varchar(256) collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `id_termino` (`id_termino`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `jos_jw_imagen` */

insert  into `jos_jw_imagen`(`id`,`id_termino`,`id_user`,`fichero`,`url_original`,`fecha`) values (1,29,63,'1319038278.75.jpg','http://www.educima.com/dibujo-para-colorear-coche-dl6474.jpg','2011-10-19 11:31:18'),(8,462,65,'1319112004.74.jpg','http://eoienglishcorner.wikispaces.com/file/view/casa.gif/45522741/casa.gif','2011-10-20 08:00:05'),(7,457,63,'1319107227.42.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/libro-sobre-naturaleza-dibujos-para-colorear.gif','2011-10-20 06:40:28'),(4,460,65,'1319049421.5555.jpg','http://lh4.ggpht.com/-GivbUxWLeyU/SbTLnrEpfiI/AAAAAAAAHl0/jk18U-SUxdU/Paraguas.jpg','2011-10-19 14:37:01'),(5,461,63,'1319055290.15.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/silla-de-cocina-dibujos-para-colorear.jpg','2011-10-19 16:14:51'),(6,460,63,'1319099992.58.jpg','http://tururutu.files.wordpress.com/2011/01/paraguas-abierto-12286.jpg','2011-10-20 04:39:52'),(9,243,65,'1319112146.13.jpg','http://serenityexecutivesuites.com/photos/bambu3.gif','2011-10-20 08:02:26'),(10,463,65,'1319112199.18.jpg','http://4.bp.blogspot.com/_mtyB5sG_n04/S-h6yG_dnLI/AAAAAAAAACc/tAWkdqKRnKo/s1600/gatico.gif','2011-10-20 08:03:19'),(11,464,65,'1319112236.89.jpg','http://4.bp.blogspot.com/_fSdSbBwOte0/S83rfNEEkNI/AAAAAAAAAJA/GPSVc1tfK8g/s400/perro.jpg','2011-10-20 08:03:57'),(12,465,65,'1319112425.87.jpg','http://moggap.info/components/com_virtuemart/shop_image/product/BASTON_KY_9282L__4dd54fb500310.jpg','2011-10-20 08:07:06'),(13,255,65,'1319112495.66.jpg','http://lh5.ggpht.com/-8ifDPHomP9Y/TKPLdUl09VI/AAAAAAAAAa8/P2GhRRWVVLM/hilo.jpg','2011-10-20 08:08:16'),(14,466,65,'1319112557.13.jpg','http://dibujos.net/images/painted2/201050/427cd8f891fa2dd1dd8e63ede31b6bac.png','2011-10-20 08:09:17'),(15,265,65,'1319112587.19.jpg','http://galeria.colorir.com/images/painted2/201030/c90445b97666bc05ee0212b16d50a6a2.png','2011-10-20 08:09:47'),(16,467,65,'1319112628.18.jpg','http://www.ahiva.info/Colorear/Alimentos/Setas/Seta-02.gif','2011-10-20 08:10:29'),(17,468,65,'1319112675.51.jpg','http://lh4.ggpht.com/-tBF7Xx_o4P0/St4GwlZT3-I/AAAAAAAAJ-4/ggzB5xeSSXo/dulces1.gif.jpg','2011-10-20 08:11:15'),(18,469,65,'1319112830.16.jpg','http://www.coloringpages7.com/Images/animal-coloring-pages/fox-coloring-pages/fox-5-coloring-pages-7-com.jpg','2011-10-20 08:13:50'),(19,470,65,'1319112900.63.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/mapache-dibujos-para-colorear.jpg','2011-10-20 08:15:01'),(20,31,63,'1319130712.87.jpg','http://galeria.colorir.com/images/painted2/201030/c8cc6cec827c6485e45835b38b4bf853.png','2011-10-20 13:11:54'),(21,471,63,'1319155782.02.jpg','http://www.mode-agentur.info/wp-content/uploads/2009/12/b1_klein150.jpg','2011-10-20 20:09:43'),(22,472,63,'1319155937.39.jpg','http://2.bp.blogspot.com/_18UY_yBMzRo/S6Ev-6BrrAI/AAAAAAAADiY/k6rj2OBOB-k/s400/cal%C3%A7as%2Bcolorir.jpg','2011-10-20 20:12:17'),(23,473,63,'1319156525.99.jpg','http://bp3.blogger.com/_nLZy6cZ8AJw/R4FUggFKgOI/AAAAAAAABEE/F0o7gixY45s/s320/cup_coffee.png','2011-10-20 20:22:06'),(24,474,63,'1319156715.92.jpg','http://www.educima.com/dibujo-para-colorear-hamburguesa-dl10108.jpg','2011-10-20 20:25:15'),(25,475,63,'1319156839.26.jpg','http://4.bp.blogspot.com/-9m2IFGcGxFU/Tk29YVfBYoI/AAAAAAAAACk/ssZv9sN4xr0/s1600/falda-dibujos-para-colorear.jpg','2011-10-20 20:27:19'),(26,476,63,'1319157788.74.jpg','http://www.educima.com/foto-libro-2-p14843.jpg','2011-10-20 20:43:09'),(27,477,63,'1319158025.84.jpg','http://www.supercoloring.com/wp-content/main/2009_05/creamy-cake-coloring-page.jpg','2011-10-20 20:47:06'),(28,478,63,'1319158273.52.jpg','http://www.supercoloring.com/wp-content/main/2009_10/coke-coloring-page.jpg','2011-10-20 20:51:13'),(29,479,63,'1319158349.47.jpg','http://www.blancodesigns.com.br/riscos_desenhos/acessorios/desenho_risco_bolsa1-g.gif','2011-10-20 20:52:30'),(30,480,63,'1319158686.49.jpg','http://www.midi-classics.com/cd.gif','2011-10-20 20:58:06'),(31,481,63,'1319158903.27.jpg','http://lh5.ggpht.com/-VHAT3rKa7-I/SbhdJ4UNsSI/AAAAAAAALcA/E0Z6vWvKWU4/Zapatos.jpg','2011-10-20 21:01:43'),(32,482,63,'1319159126.72.jpg','http://www.clker.com/cliparts/b/0/3/7/1206576685673534961rygle_Hat_Outline.svg.hi.png','2011-10-20 21:05:27'),(33,483,63,'1319159224.74.jpg','http://www.educima.com/dibujo-para-colorear-zapatillas-de-deporte-dm19418.jpg','2011-10-20 21:07:05'),(34,484,63,'1319159312.26.jpg','http://lh6.ggpht.com/-RHX9AL53Jzc/SbTMsbv8j_I/AAAAAAAAHu0/yBMVTteyaNI/Naranja.jpg','2011-10-20 21:08:32'),(42,486,63,'1319199874.9.jpg','http://www.decalsground.com/img_b/vinyl-decal-sticker-621.jpg','2011-10-21 08:24:35'),(41,485,63,'1319199506.18.jpg','http://www.stayuniq.com/shop/1609-1862-thickbox/vero-moda-crazy-time-jeans.jpg','2011-10-21 08:18:26'),(37,487,63,'1319160694.87.jpg','http://lh4.ggpht.com/-f1T9MeUBXoo/S5eSeIf4kVI/AAAAAAAAMpw/BRK_uEm74dU/toalla.jpg','2011-10-20 21:31:35'),(38,488,63,'1319161074.42.jpg','http://www.deskidea.com/es/img2/2011/07/s0888000st-boligrafo-parker-premier-de-luxe-st-34671.gif','2011-10-20 21:37:55'),(43,458,63,'1319200692.28.jpg','http://www.comprascompulsivas.com/wp-content/uploads/2010/06/BackwardsClock_LRG.jpg','2011-10-21 08:38:13');

/*Table structure for table `jos_jw_modificacion` */

DROP TABLE IF EXISTS `jos_jw_modificacion`;

CREATE TABLE `jos_jw_modificacion` (
  `user_id` int(11) NOT NULL,
  `termino_id` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY  (`user_id`,`termino_id`),
  KEY `termino_id` (`termino_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_modificacion` */

insert  into `jos_jw_modificacion`(`user_id`,`termino_id`,`fecha`) values (63,29,'2011-10-20 04:38:23'),(63,460,'2011-10-20 04:39:52'),(63,457,'2011-10-20 06:40:28'),(63,458,'2011-10-20 06:47:11'),(65,462,'2011-10-20 08:00:05'),(65,243,'2011-10-20 08:02:26'),(65,255,'2011-10-20 08:08:16'),(65,265,'2011-10-20 08:09:47'),(63,31,'2011-10-20 13:11:54'),(63,486,'2011-10-20 21:27:39'),(66,31,'2011-10-21 04:48:06'),(63,485,'2011-10-21 08:16:22');

/*Table structure for table `jos_jw_termino` */

DROP TABLE IF EXISTS `jos_jw_termino`;

CREATE TABLE `jos_jw_termino` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_user` int(11) NOT NULL,
  `id_user_revision` int(11) NOT NULL,
  `kanji` varchar(20) character set utf8 collate utf8_unicode_ci default NULL,
  `es_kanji` int(1) unsigned NOT NULL default '0',
  `kunyomi` varchar(80) character set utf8 collate utf8_unicode_ci default NULL,
  `onyomi` varchar(80) character set utf8 collate utf8_unicode_ci default NULL,
  `kana` varchar(30) character set utf8 collate utf8_unicode_ci default NULL,
  `significado` varchar(128) character set utf8 collate utf8_unicode_ci NOT NULL,
  `capitulo` tinyint(3) unsigned default NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `capitulo` (`capitulo`),
  KEY `id_user` (`id_user`),
  KEY `id_user_revision` (`id_user_revision`)
) ENGINE=MyISAM AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_termino` */

insert  into `jos_jw_termino`(`id`,`id_user`,`id_user_revision`,`kanji`,`es_kanji`,`kunyomi`,`onyomi`,`kana`,`significado`,`capitulo`,`fecha`) values (1,63,0,'日',1,'ひ、～び、～か','ニチ、二、～ジツ','ひ','Día,sol',1,'2011-10-08 14:20:56'),(2,63,0,'日本',0,NULL,NULL,'にほん、にっぽん','Japón',1,'2011-10-08 14:20:56'),(3,63,0,'日曜日',0,NULL,NULL,'にちようび','Domingo',1,'2011-10-08 14:20:56'),(4,63,0,'三日',0,NULL,NULL,'みっか','El 3er día del mes',1,'2011-10-08 14:20:56'),(5,63,0,'月',1,'つき','ゲツ、ガツ','つき','Luna,mes',1,'2011-10-08 14:20:56'),(6,63,0,'月曜日',0,NULL,NULL,'げつようび','Lunes',1,'2011-10-08 14:20:56'),(7,63,0,'一月',0,NULL,NULL,'いちがつ','Enero',1,'2011-10-08 14:20:56'),(8,63,0,'一ヶ月',0,NULL,NULL,'いっかげつ','1 mes',1,'2011-10-08 14:20:56'),(9,63,0,'木',1,'き','モク、ボク','き','Árbol,madera',1,'2011-10-08 14:20:56'),(10,63,0,'木曜日',0,NULL,NULL,'もくようび','Jueves',1,'2011-10-08 14:20:56'),(11,63,0,'木村',0,NULL,NULL,'きむら','Apellido Japonés',1,'2011-10-08 14:20:56'),(12,63,0,'山',1,'やま','サン','やま','Montaña',1,'2011-10-08 14:20:56'),(13,63,0,'山下',0,NULL,NULL,'やました','Apellido Japonés',1,'2011-10-08 14:20:56'),(14,63,0,'火山',0,NULL,NULL,'かざん','Volcán',1,'2011-10-08 14:20:56'),(15,63,0,'富士山',0,NULL,NULL,'ふじさん','El Monte Fuji',1,'2011-10-08 14:20:56'),(16,63,0,'川',1,'かわ','セン','かわ','Río',1,'2011-10-08 14:20:56'),(17,63,0,'ナイル川',0,NULL,NULL,'ナイルがわ','El río Nilo',1,'2011-10-08 14:20:56'),(18,63,0,'田',1,'た、～だ','デン',NULL,'campo de arroz',1,'2011-10-08 14:20:56'),(19,63,0,'田んぼ',0,NULL,NULL,'たんぼ','Campo de arroz',1,'2011-10-08 14:20:56'),(20,63,0,'田中',0,NULL,NULL,'たなか','Apellido Japonés',1,'2011-10-08 14:20:56'),(21,63,0,'山田',0,NULL,NULL,'やまだ','Apellido Japonés',1,'2011-10-08 14:20:56'),(22,63,0,'人',1,'ひと','ジン、ニン','ひと','Persona',1,'2011-10-08 14:20:56'),(23,63,0,'三人',0,NULL,NULL,'さんいん','3 personas',1,'2011-10-08 14:20:56'),(24,63,0,'日本人',0,NULL,NULL,'にほんじん','Persona de nacionalidad japonesa',1,'2011-10-08 14:20:56'),(25,63,0,'口',1,'くち','コウ','くち','Boca',1,'2011-10-08 14:20:56'),(26,63,0,'入口',0,NULL,NULL,'いりぐち','Entrada',1,'2011-10-08 14:20:56'),(27,63,0,'出口',0,NULL,NULL,'でぐち','Salida',1,'2011-10-08 14:20:56'),(28,63,0,'人口',0,NULL,NULL,'じんこう','Población',1,'2011-10-08 14:20:56'),(29,63,0,'車',1,'くるま','シャ','くるま','Coche',1,'2011-10-08 14:20:56'),(30,63,0,'自動車',0,NULL,NULL,'じどうしゃ','Automóvil',1,'2011-10-08 14:20:56'),(31,63,0,'',0,NULL,NULL,'ぼおし','sombrero',1,'2011-10-08 14:20:56'),(32,63,0,'電車',0,NULL,NULL,'でんしゃ','Tren',1,'2011-10-08 14:20:56'),(33,63,0,'門',1,NULL,'モン','もん','Portal',1,'2011-10-08 14:20:56'),(34,63,0,'専門',0,NULL,NULL,'せんもん','Especialidad',1,'2011-10-08 14:20:56'),(35,63,0,'火',1,'ひ','カ','ひ','Fuego',2,'2011-10-08 14:20:56'),(36,63,0,'火曜日',0,NULL,NULL,'かようび','Martes',2,'2011-10-08 14:20:56'),(37,63,0,'火事',0,NULL,NULL,'かじ','Un fuego',2,'2011-10-08 14:20:56'),(38,63,0,'水',1,'みず','スイ','みず','Agua',2,'2011-10-08 14:20:56'),(39,63,0,'水曜日',0,NULL,NULL,'すいようび','Miércoles',2,'2011-10-08 14:20:56'),(40,63,0,'水田',0,NULL,NULL,'すいでん','Campo de arroz',2,'2011-10-08 14:20:56'),(41,63,0,'お金',0,NULL,NULL,'おかね','Dinero',2,'2011-10-08 14:20:56'),(42,63,0,'金',1,'かね','キン','きん','Oro',2,'2011-10-08 14:20:56'),(43,63,0,'金曜日',0,NULL,NULL,'きにようび','Viernes',2,'2011-10-08 14:20:56'),(44,63,0,'金田',0,NULL,NULL,'かねだ','Apellido Japonés',2,'2011-10-08 14:20:56'),(45,63,0,'土',1,'つち','ド','つち','Tierra',2,'2011-10-08 14:20:56'),(46,63,0,'土曜日',0,NULL,NULL,'どようび','Sábado',2,'2011-10-08 14:20:56'),(47,63,0,'土木工学',0,NULL,NULL,'どぼくどうがく','Ingeniería civil',2,'2011-10-08 14:20:56'),(48,63,0,'土木技師',0,NULL,NULL,'どぼくぎし','Ingeniero civil',2,'2011-10-08 14:20:56'),(49,63,0,'子',1,'こ','シ',NULL,'Niño',2,'2011-10-08 14:20:56'),(50,63,0,'男の子',0,NULL,NULL,'おとこのこ','Niño,chico',2,'2011-10-08 14:20:56'),(51,63,0,'女の子',0,NULL,NULL,'おんあのこ','Niña,chica',2,'2011-10-08 14:20:56'),(52,63,0,'女子学生',0,NULL,NULL,'じょしがくせい','Una estudiante',2,'2011-10-08 14:20:56'),(53,63,0,'女',1,'おんな','ジョ','おんあ','Mujer',2,'2011-10-08 14:20:56'),(54,63,0,'女の人',0,NULL,NULL,'おんあのひと','Mujer',2,'2011-10-08 14:20:56'),(55,63,0,'彼女',0,NULL,NULL,'かのじょ','Ella',2,'2011-10-08 14:20:56'),(56,63,0,'学',1,'まな・ぶ','ガク、カッ～',NULL,'Estudiante',2,'2011-10-08 14:20:56'),(57,63,0,'大学生',0,NULL,NULL,'だいがくせい','Estudiante universitario',2,'2011-10-08 14:20:56'),(58,63,0,'学校',0,NULL,NULL,'がっこう','Escuela',2,'2011-10-08 14:20:56'),(59,63,0,'大学',0,NULL,NULL,'だいがく','Universidad',2,'2011-10-08 14:20:56'),(60,63,0,'生',1,'い・きる、う・まれる','セイ',NULL,'Vivir',2,'2011-10-08 14:20:56'),(61,63,0,'生まれる',0,NULL,NULL,'うまれる','Nacer',2,'2011-10-08 14:20:56'),(62,63,0,'先生',0,NULL,NULL,'せんせい','Profesor',2,'2011-10-08 14:20:56'),(63,63,0,'先月',0,NULL,NULL,'せんげつ','El mes pasado',2,'2011-10-08 14:20:56'),(64,63,0,'先週',0,NULL,NULL,'せんしゅう','La semana pasada',2,'2011-10-08 14:20:56'),(65,63,0,'先',1,'さき','セン','さき','Más adelante,punta,extremidad,delante,primero',2,'2011-10-08 14:20:56'),(66,63,0,'私',1,'わたし、わたくし','シ','わたし、わたくし','Yo',2,'2011-10-08 14:20:56'),(67,63,0,'私立大学',0,NULL,NULL,'しりつだいがく','Universidad privada',2,'2011-10-08 14:20:56'),(68,63,0,'一',1,'ひと・つ','イチ','いち','Nº1',3,'2011-10-08 14:20:56'),(69,63,0,'一つ',0,NULL,NULL,'ひとつ','1 cosa',3,'2011-10-08 14:20:56'),(70,63,0,'一人',0,NULL,NULL,'ひとり','1 persona',3,'2011-10-08 14:20:56'),(71,63,0,'一年',0,NULL,NULL,'いちねん','1 año',3,'2011-10-08 14:20:56'),(72,63,0,'一日',0,NULL,NULL,'ついたち','1er día del mes',3,'2011-10-08 14:20:56'),(73,63,0,'二',1,'ふた・つ','二','に','Nº2',3,'2011-10-08 14:20:56'),(74,63,0,'二月',0,NULL,NULL,'にがつ','Febrero',3,'2011-10-08 14:20:56'),(75,63,0,'二つ',0,NULL,NULL,'ふたつ','2 cosas',3,'2011-10-08 14:20:56'),(76,63,0,'二人',0,NULL,NULL,'ふたり','2 personas',3,'2011-10-08 14:20:56'),(77,63,0,'二年',0,NULL,NULL,'にねん','2 años',3,'2011-10-08 14:20:56'),(78,63,0,'二日',0,NULL,NULL,'ふつか','2º día del mes',3,'2011-10-08 14:20:56'),(79,63,0,'三',1,'みっ・つ','サン','さん','Nº3',3,'2011-10-08 14:20:56'),(80,63,0,'三月',0,NULL,NULL,'さんがつ','Marzo',3,'2011-10-08 14:20:56'),(81,63,0,'三つ',0,NULL,NULL,'みっつ','3 cosas',3,'2011-10-08 14:20:56'),(82,63,0,'三年',0,NULL,NULL,'さんえん','3 años',3,'2011-10-08 14:20:56'),(83,63,0,'四',1,'よっ・つ、よん、よ','シ','よん、よ','Nº4',3,'2011-10-08 14:20:56'),(84,63,0,'四月',0,NULL,NULL,'しがつ','Abril',3,'2011-10-08 14:20:56'),(85,63,0,'四つ',0,NULL,NULL,'よっつ','4 cosas',3,'2011-10-08 14:20:56'),(86,63,0,'四人',0,NULL,NULL,'よにん','4 personas',3,'2011-10-08 14:20:56'),(87,63,0,'四年',0,NULL,NULL,'よねん','4 años',3,'2011-10-08 14:20:56'),(88,63,0,'四日',0,NULL,NULL,'よっか','4º día del mes',3,'2011-10-08 14:20:56'),(89,63,0,'五',1,'いっ・つ','ゴ','ご','Nº5',3,'2011-10-08 14:20:56'),(90,63,0,'五月',0,NULL,NULL,'ごがつ','Mayo',3,'2011-10-08 14:20:56'),(91,63,0,'五つ',0,NULL,NULL,'いつつ','5 cosas',3,'2011-10-08 14:20:56'),(92,63,0,'五人',0,NULL,NULL,'ごにん','5 personas',3,'2011-10-08 14:20:56'),(93,63,0,'五年',0,NULL,NULL,'ごねん','5 años',3,'2011-10-08 14:20:56'),(94,63,0,'五日',0,NULL,NULL,'いつか','5o día del mes',3,'2011-10-08 14:20:56'),(95,63,0,'六',1,'むっ・つ','ロク','ろく','Nº6',3,'2011-10-08 14:20:56'),(96,63,0,'六月',0,NULL,NULL,'ろくがつ','Junio',3,'2011-10-08 14:20:56'),(97,63,0,'六つ',0,NULL,NULL,'むっつ','6 cosas',3,'2011-10-08 14:20:56'),(98,63,0,'六人',0,NULL,NULL,'ろくにん','6 personas',3,'2011-10-08 14:20:56'),(99,63,0,'六年',0,NULL,NULL,'ろくねん','6 años',3,'2011-10-08 14:20:56'),(100,63,0,'六日',0,NULL,NULL,'むいか','6º día del mes',3,'2011-10-08 14:20:56'),(101,63,0,'七',1,'なな・つ、なな','シチ','なな、しち','Nº7',3,'2011-10-08 14:20:56'),(102,63,0,'七月',0,NULL,NULL,'しちがつ','Julio',3,'2011-10-08 14:20:56'),(103,63,0,'七つ',0,NULL,NULL,'ななつ','7 cosas',3,'2011-10-08 14:20:56'),(104,63,0,'七人',0,NULL,NULL,'ななにん、しちにん','7 personas',3,'2011-10-08 14:20:56'),(105,63,0,'七年',0,NULL,NULL,'しちねん','7 años',3,'2011-10-08 14:20:56'),(106,63,0,'七日',0,NULL,NULL,'なのか','7º día del mes',3,'2011-10-08 14:20:56'),(107,63,0,'八',1,'やっ・つ','ハチ','はち','Nº8',3,'2011-10-08 14:20:56'),(108,63,0,'八月',0,NULL,NULL,'はちがつ','Agosto',3,'2011-10-08 14:20:56'),(109,63,0,'八つ',0,NULL,NULL,'やっつ','8 cosas',3,'2011-10-08 14:20:56'),(110,63,0,'八人',0,NULL,NULL,'はちにん','8 personas',3,'2011-10-08 14:20:56'),(111,63,0,'八年',0,NULL,NULL,'はちねん','8 años',3,'2011-10-08 14:20:56'),(112,63,0,'八日',0,NULL,NULL,'ようか','8º día del mes',3,'2011-10-08 14:20:56'),(113,63,0,'九',1,'ここの・つ','キュウ、ク','く、きゅう','Nº9',3,'2011-10-08 14:20:56'),(114,63,0,'九月',0,NULL,NULL,'くがつ','Septiembre',3,'2011-10-08 14:20:56'),(115,63,0,'九つ',0,NULL,NULL,'ここのつ','9 cosas',3,'2011-10-08 14:20:56'),(116,63,0,'九人',0,NULL,NULL,'きゅうにん','9 personas',3,'2011-10-08 14:20:56'),(117,63,0,'九年',0,NULL,NULL,'きゅうねん','9 años',3,'2011-10-08 14:20:56'),(118,63,0,'九日',0,NULL,NULL,'ここのか','9º día del mes',3,'2011-10-08 14:20:56'),(119,63,0,'十',1,'とお','ジュウ','とお','Nº10,10 cosas',3,'2011-10-08 14:20:56'),(120,63,0,'十月',0,NULL,NULL,'じゅうがつ','Octubre',3,'2011-10-08 14:20:56'),(121,63,0,'十人',0,NULL,NULL,'じゅうにん','10 personas',3,'2011-10-08 14:20:56'),(122,63,0,'十年',0,NULL,NULL,'じゅうねん','10 años',3,'2011-10-08 14:20:56'),(123,63,0,'十日',0,NULL,NULL,'とおか','10º día del mes',3,'2011-10-08 14:20:56'),(124,63,0,'百',1,NULL,'ヒャク','ひゃく','Nº100',3,'2011-10-08 14:20:56'),(125,63,0,'三百',0,NULL,NULL,'さんびゃく','Nº300',3,'2011-10-08 14:20:56'),(126,63,0,'六百',0,NULL,NULL,'ろっぴゃく','Nº600',3,'2011-10-08 14:20:56'),(127,63,0,'八百',0,NULL,NULL,'はっぴゃく','Nº800',3,'2011-10-08 14:20:56'),(128,63,0,'一千',0,NULL,NULL,'いっせん','Nº1000',3,'2011-10-08 14:20:56'),(129,63,0,'千',1,'ち','セン','せん','Nº1000',3,'2011-10-08 14:20:56'),(130,63,0,'三千',0,NULL,NULL,'さんぜん','Nº3000',3,'2011-10-08 14:20:56'),(131,63,0,'八千',0,NULL,NULL,'はっせん','Nº8000',3,'2011-10-08 14:20:56'),(132,63,0,'千葉県',0,NULL,NULL,'ちばけん','Prefectura de Chiva',3,'2011-10-08 14:20:56'),(133,63,0,'百万人',0,NULL,NULL,'ひゃくまんにん','1 millón de personas',3,'2011-10-08 14:20:56'),(134,63,0,'一万円',0,NULL,NULL,'いちまんえん','10000 yenes',3,'2011-10-08 14:20:56'),(135,63,0,'万',1,NULL,'マン','まん','Nº10000',3,'2011-10-08 14:20:56'),(136,63,0,'円',1,NULL,'エン','えん','Yen (moneda japonesa)',3,'2011-10-08 14:20:56'),(137,63,0,'円形',0,NULL,NULL,'えんけい','Círculo',3,'2011-10-08 14:20:56'),(138,63,0,'二千五百六円',0,NULL,NULL,'にせんごひゃくろくえん','2506 yenes',3,'2011-10-08 14:20:56'),(139,63,0,'年',1,'とし','ネン','とし','Año',3,'2011-10-08 14:20:56'),(140,63,0,'年上',0,NULL,NULL,'としうえ','Mayor,de mayor edad',3,'2011-10-08 14:20:56'),(141,63,0,'去年',0,NULL,NULL,'きょねん','El año pasado',3,'2011-10-08 14:20:56'),(142,63,0,'今年',0,NULL,NULL,'ことし','Este año',3,'2011-10-08 14:20:56'),(143,63,0,'来年',0,NULL,NULL,'らいねん','El año próximo',3,'2011-10-08 14:20:56'),(144,63,0,'上',1,'うえ、あ・がる、あ・げる、のぼ・る','ジョウ','うえ','Encima',4,'2011-10-08 14:20:56'),(145,63,0,'上がる',0,NULL,NULL,'あがる','Subir,elevarse',4,'2011-10-08 14:20:56'),(146,63,0,'上げる',0,NULL,NULL,'あげる','Subir,elevar',4,'2011-10-08 14:20:56'),(147,63,0,'上手',0,NULL,NULL,'じょうず','Hábil',4,'2011-10-08 14:20:56'),(148,63,0,'上る',0,NULL,NULL,'のぼる','Subir (a lugares altos)',4,'2011-10-08 14:20:56'),(149,63,0,'下',1,'した、さ・がる、さ・げる、くだ・る、お・りる','カ、ゲ','した','Debajo',4,'2011-10-08 14:20:56'),(150,63,0,'下がる',0,NULL,NULL,'さがる','Bajarse',4,'2011-10-08 14:20:56'),(151,63,0,'下げる',0,NULL,NULL,'さげる','Bajar',4,'2011-10-08 14:20:56'),(152,63,0,'下手',0,NULL,NULL,'へた','Torpe',4,'2011-10-08 14:20:56'),(153,63,0,'地下',0,NULL,NULL,'ちか','Subterraneo',4,'2011-10-08 14:20:56'),(154,63,0,'年下',0,NULL,NULL,'としした','Menor,de menor edad',4,'2011-10-08 14:20:56'),(155,63,0,'下車する',0,NULL,NULL,'げしゃする','Bajar de un vehículo',4,'2011-10-08 14:20:56'),(156,63,0,'中',1,'なか','チュウ、～ジュウ','なか','Dentro',4,'2011-10-08 14:20:56'),(157,63,0,'一日中',0,NULL,NULL,'いちにちじゅう','Todo el día',4,'2011-10-08 14:20:56'),(158,63,0,'中心',0,NULL,NULL,'ちゅうしん','Centro',4,'2011-10-08 14:20:56'),(159,63,0,'中学',0,NULL,NULL,'ちゅうがく','Escuela de secundaria',4,'2011-10-08 14:20:56'),(160,63,0,'中学校',0,NULL,NULL,'ちゅうがっこう','Escuela de secundaria',4,'2011-10-08 14:20:56'),(161,63,0,'大',1,'おお・きい','ダイ、タイ',NULL,'Grande',4,'2011-10-08 14:20:56'),(162,63,0,'大人',0,NULL,NULL,'おとな','Adulto',4,'2011-10-08 14:20:56'),(163,63,0,'大切な',0,NULL,NULL,'たいせつな','Importante',4,'2011-10-08 14:20:56'),(164,63,0,'小',1,'ちい・さい、こ、お','ショウ',NULL,'Pequeño',4,'2011-10-08 14:20:56'),(165,63,0,'小人',0,NULL,NULL,'こども','Niño',4,'2011-10-08 14:20:56'),(166,63,0,'小学校',0,NULL,NULL,'しょうがっこう','Escuela de primaria',4,'2011-10-08 14:20:56'),(167,63,0,'本',1,'もと','ホン','ほん','Libro,raíz,origen,principal,verdad',4,'2011-10-08 14:20:56'),(168,63,0,'山本',0,NULL,NULL,'やまもと','Apellido japonés',4,'2011-10-08 14:20:56'),(169,63,0,'本日',0,NULL,NULL,'ほんじつ','Hoy',4,'2011-10-08 14:20:56'),(170,63,0,'本店',0,NULL,NULL,'ほんてん','Sede,oficina central,central,casa matriz',4,'2011-10-08 14:20:56'),(171,63,0,'半',1,NULL,'ハン',NULL,'Mitad',4,'2011-10-08 14:20:56'),(172,63,0,'半年',0,NULL,NULL,'はんとし','Medio año,6 meses',4,'2011-10-08 14:20:56'),(173,63,0,'半分',0,NULL,NULL,'はんぶん','Mitad,medio',4,'2011-10-08 14:20:56'),(174,63,0,'三時半',0,NULL,NULL,'さんじはん','Las 3 y media',4,'2011-10-08 14:20:56'),(175,63,0,'半日',0,NULL,NULL,'はんいち','Mediodía',4,'2011-10-08 14:20:56'),(176,63,0,'分かる',0,NULL,NULL,'わかる','Entender',4,'2011-10-08 14:20:56'),(177,63,0,'分ける',0,NULL,NULL,'わける','Dividir,partir',4,'2011-10-08 14:20:56'),(178,63,0,'分かれる',0,NULL,NULL,'わかれる','Separarse,ramificarse',4,'2011-10-08 14:20:56'),(179,63,0,'十分',0,NULL,NULL,'じゅっぷん、じっぷん','10 minutos',4,'2011-10-08 14:20:56'),(180,63,0,'五分',0,NULL,NULL,'ごふん','5 minutos',4,'2011-10-08 14:20:56'),(181,63,0,'分',1,'わ・かれる、わ・かる、わ・ける','ブン、フン、～プン','ふん','Minuto',4,'2011-10-08 14:20:56'),(182,63,0,'力',1,'ちから','リョク、リキ','ちから','Poder,fuerza,habilidad',4,'2011-10-08 14:20:56'),(183,63,0,'力学',0,NULL,NULL,'りきがく','Dinámica',4,'2011-10-08 14:20:56'),(184,63,0,'水力',0,NULL,NULL,'すいりょく','El poder del agua',4,'2011-10-08 14:20:56'),(185,63,0,'火力',0,NULL,NULL,'かりょく','El poder del fuego',4,'2011-10-08 14:20:56'),(186,63,0,'何',1,'なに、なん',NULL,'なに、なん','¿Qué?',4,'2011-10-08 14:20:56'),(187,63,0,'何年',0,NULL,NULL,'なんねん','¿Qué año?',4,'2011-10-08 14:20:56'),(188,63,0,'明',1,'あか・るい、あ・ける','メイ',NULL,'Brillante,luz',5,'2011-10-08 14:20:56'),(189,63,0,'明るい',0,NULL,NULL,'あかるい','Claro, luminoso',5,'2011-10-08 14:20:56'),(190,63,0,'明ける',0,NULL,NULL,'あける','Terminar un periodo y empezar otro',5,'2011-10-08 14:20:56'),(191,63,0,'明日',0,NULL,NULL,'あす、あした、みょうにち','Mañana',5,'2011-10-08 14:20:56'),(192,63,0,'説明する',0,NULL,NULL,'せつめいする','Explicar',5,'2011-10-08 14:20:56'),(193,63,0,'休',1,'やす・む','キュウ',NULL,'Descanso',5,'2011-10-08 14:20:56'),(194,63,0,'休む',0,NULL,NULL,'やすむ','Descansar, faltar al trabajo o escuela',5,'2011-10-08 14:20:56'),(195,63,0,'休み',0,NULL,NULL,'やすみ','Vacaciones, día libre',5,'2011-10-08 14:20:56'),(196,63,0,'休日',0,NULL,NULL,'きゅうじつ','Día festivo',5,'2011-10-08 14:20:56'),(197,63,0,'体',1,'やす・む','キュウ','からだ','Cuerpo / Salud',5,'2011-10-08 14:20:56'),(198,63,0,'体力',0,NULL,NULL,'たいりょく','Fuerza física',5,'2011-10-08 14:20:56'),(199,63,0,'体育',0,NULL,NULL,'たいいく','Atletismo, educación física',5,'2011-10-08 14:20:56'),(200,63,0,'好',1,'す・き','コウ',NULL,'Amor,gustar,favorito',5,'2011-10-08 14:20:56'),(201,63,0,'好き',0,NULL,NULL,'すき','Gustar',5,'2011-10-08 14:20:56'),(202,63,0,'好かれる',0,NULL,NULL,'すかれる','Ser querido',5,'2011-10-08 14:20:56'),(203,63,0,'好物',0,NULL,NULL,'こうぶつ','Comida favorita',5,'2011-10-08 14:20:56'),(204,63,0,'男',1,'おとこ','ダン、ナン',NULL,'Hombre,varón,macho',5,'2011-10-08 14:20:56'),(205,63,0,'男の人',0,NULL,NULL,'おとこのひと','Hombre',5,'2011-10-08 14:20:56'),(206,63,0,'男子学生',0,NULL,NULL,'だんしがくせい','Estudiante (masculino)',5,'2011-10-08 14:20:56'),(207,63,0,'長男',0,NULL,NULL,'ちょうなん','Primogénito',5,'2011-10-08 14:20:56'),(208,63,0,'林',1,'はやし','リン','はやし','Bosquecillo',5,'2011-10-08 14:20:56'),(209,63,0,'林業',0,NULL,NULL,'りんぎょう','Silvicultura',5,'2011-10-08 14:20:56'),(210,63,0,'小林',0,NULL,NULL,'こばやし','Apellido japonés',5,'2011-10-08 14:20:56'),(211,63,0,'森',1,'もり','シン','もり','Bosque,selva',5,'2011-10-08 14:20:56'),(212,63,0,'森林',0,NULL,NULL,'しんりん','Selva',5,'2011-10-08 14:20:56'),(213,63,0,'森田',0,NULL,NULL,'もりた','Apellido japonés',5,'2011-10-08 14:20:56'),(214,63,0,'間',1,'あいだ','カン','あいだ','Entre,intervalo',5,'2011-10-08 14:20:56'),(215,63,0,'その間に',0,NULL,NULL,'そのあいだに','Mientras tanto',5,'2011-10-08 14:20:56'),(216,63,0,'間に合う',0,NULL,NULL,'まにあう','Llegar a tiempo',5,'2011-10-08 14:20:56'),(217,63,0,'一年間',0,NULL,NULL,'いちねんかん','Un año',5,'2011-10-08 14:20:56'),(218,63,0,'時間',0,NULL,NULL,'じかん','Tiempo',5,'2011-10-08 14:20:56'),(219,63,0,'畑',1,NULL,'ハタケ、ハタ','はたけ','Campo cultivado',5,'2011-10-08 14:20:56'),(220,63,0,'田畑',0,NULL,NULL,'たはた','Campos',5,'2011-10-08 14:20:56'),(221,63,0,'花畑',0,NULL,NULL,'はなばた','Jardín de flores',5,'2011-10-08 14:20:56'),(222,63,0,'岩',1,'いわ','ガン','いわ','Roca',5,'2011-10-08 14:20:56'),(223,63,0,'岩石',0,NULL,NULL,'がんせき','Roca',5,'2011-10-08 14:20:56'),(224,63,0,'岩山',0,NULL,NULL,'いわやま','Montaña rocosa',5,'2011-10-08 14:20:56'),(225,63,0,'岩田',0,NULL,NULL,'いわた','Apellido japonés',5,'2011-10-08 14:20:56'),(226,63,0,'火山岩',0,NULL,NULL,'かざんがん','Roca volcánica',5,'2011-10-08 14:20:56'),(227,63,0,'目',1,'め','モク','め','Ojo, vista,cosa',6,'2011-10-08 14:20:56'),(228,63,0,'目次',0,NULL,NULL,'もくじ','Índice',6,'2011-10-08 14:20:56'),(229,63,0,'目上',0,NULL,NULL,'めうえ','Superior',6,'2011-10-08 14:20:56'),(230,63,0,'目下',0,NULL,NULL,'めした','Inferior',6,'2011-10-08 14:20:56'),(231,63,0,'耳',1,'みみ','ジ','みみ','Oreja',6,'2011-10-08 14:20:56'),(232,63,0,'耳鼻科',0,NULL,NULL,'じびか','Otorrinología',6,'2011-10-08 14:20:56'),(233,63,0,'手',1,'て','シュ','て','Mano',6,'2011-10-08 14:20:56'),(234,63,0,'手紙',0,NULL,NULL,'てがみ','Carta',6,'2011-10-08 14:20:56'),(235,63,0,'歌手',0,NULL,NULL,'かしゅ','Cantante',6,'2011-10-08 14:20:56'),(236,63,0,'足',1,'あし、た・りる、た・す','ソク','あし','Pierna,par,suficiente',6,'2011-10-08 14:20:56'),(237,63,0,'二足',0,NULL,NULL,'にそく','2 pares',6,'2011-10-08 14:20:56'),(238,63,0,'足りる',0,NULL,NULL,'たりる','Bastar, ser suficiente',6,'2011-10-08 14:20:56'),(239,63,0,'足す',0,NULL,NULL,'たす','Sumar',6,'2011-10-08 14:20:56'),(240,63,0,'雨',1,'あめ','ウ','あめ','Lluvia',6,'2011-10-08 14:20:56'),(241,63,0,'雨天',0,NULL,NULL,'うてん','Lluvia',6,'2011-10-08 14:20:56'),(242,63,0,'大雨',0,NULL,NULL,'おおあめ','Tormenta',6,'2011-10-08 14:20:56'),(243,63,0,'竹',1,'たけ','チク','たけ','Bambú',6,'2011-10-08 14:20:56'),(244,63,0,'竹田',0,NULL,NULL,'たけだ','Apellido japonés',6,'2011-10-08 14:20:56'),(245,63,0,'竹の子',0,NULL,NULL,'たけのこ','Brote de bambú',6,'2011-10-08 14:20:56'),(246,63,0,'米',1,'こめ','マイ、ベイ','こめ','Arroz,América',6,'2011-10-08 14:20:56'),(247,63,0,'中米',0,NULL,NULL,'ちゅうべい','Centro América',6,'2011-10-08 14:20:56'),(248,63,0,'米国',0,NULL,NULL,'べいこく','América',6,'2011-10-08 14:20:56'),(249,63,0,'新米',0,NULL,NULL,'しんまい','Arroz de la última cosecha',6,'2011-10-08 14:20:56'),(250,63,0,'貝',1,'かい','バイ','かい','Crustaceo',6,'2011-10-08 14:20:56'),(251,63,0,'貝殻',0,NULL,NULL,'かいがら','Concha',6,'2011-10-08 14:20:56'),(252,63,0,'石',1,'いし','セキ','いし','Piedra',6,'2011-10-08 14:20:56'),(253,63,0,'石油',0,NULL,NULL,'せきゆ','Petróleo',6,'2011-10-08 14:20:56'),(254,63,0,'化石',0,NULL,NULL,'かせき','Fósil',6,'2011-10-08 14:20:56'),(255,63,0,'糸',1,'いと','し','いと','Hilo,cuerda',6,'2011-10-08 14:20:56'),(256,63,0,'毛糸',0,NULL,NULL,'けいと','(hilo de) lana',6,'2011-10-08 14:20:56'),(257,63,0,'花',1,'はな','カ','はな','Flor',7,'2011-10-08 14:20:56'),(258,63,0,'花火',0,NULL,NULL,'はなび','Fuegos artificiales',7,'2011-10-08 14:20:56'),(259,63,0,'花びん',0,NULL,NULL,'かびん','Jarrón',7,'2011-10-08 14:20:56'),(260,63,0,'茶',1,NULL,'チャ、サ',NULL,'Té',7,'2011-10-08 14:20:56'),(261,63,0,'日本茶',0,NULL,NULL,'にほんちゃ','Té japonés',7,'2011-10-08 14:20:56'),(262,63,0,'お茶',0,NULL,NULL,'おちゃ','Té japonés',7,'2011-10-08 14:20:56'),(263,63,0,'紅茶',0,NULL,NULL,'こうちゃ','Té inglés',7,'2011-10-08 14:20:56'),(264,63,0,'喫茶店',0,NULL,NULL,'きっさんてん','Cafetería',7,'2011-10-08 14:20:56'),(265,63,0,'肉',1,NULL,'ニク','にく','Carne',7,'2011-10-08 14:20:56'),(266,63,0,'牛肉',0,NULL,NULL,'ぎゅうにく','Carne de ternera',7,'2011-10-08 14:20:56'),(267,63,0,'鳥肉',0,NULL,NULL,'とりにく','Carne de pollo',7,'2011-10-08 14:20:56'),(268,63,0,'肉体',0,NULL,NULL,'にくたい','Cuerpo',7,'2011-10-08 14:20:56'),(269,63,0,'文',1,NULL,'ブン','ぶん','Oración',7,'2011-10-08 14:20:56'),(270,63,0,'文学',0,NULL,NULL,'ぶんがく','Literatura',7,'2011-10-08 14:20:56'),(271,63,0,'文部省',0,NULL,NULL,'もんぶしょう','Ministerio de educación',7,'2011-10-08 14:20:56'),(272,63,0,'文部科学省',0,NULL,NULL,'もんぶかがくしょう','Ministerio de educación',7,'2011-10-08 14:20:56'),(273,63,0,'字',1,NULL,'ジ','じ','Letra, escritura',7,'2011-10-08 14:20:56'),(274,63,0,'文字',0,NULL,NULL,'もじ、もんじ','Letra, escritura',7,'2011-10-08 14:20:56'),(275,63,0,'漢字',0,NULL,NULL,'かんじ','Kanji',7,'2011-10-08 14:20:56'),(276,63,0,'数字',0,NULL,NULL,'すうじ','Números',7,'2011-10-08 14:20:56'),(277,63,0,'物',1,'もの','ブツ、モツ','もの','Cosa',7,'2011-10-08 14:20:56'),(278,63,0,'生物',0,NULL,NULL,'せいぶつ','Ser vivo',7,'2011-10-08 14:20:56'),(279,63,0,'買い物',0,NULL,NULL,'かいもの','Compra',7,'2011-10-08 14:20:56'),(280,63,0,'飲み物',0,NULL,NULL,'のみもの','Bebida',7,'2011-10-08 14:20:56'),(281,63,0,'食べ物',0,NULL,NULL,'たべもの','Comida',7,'2011-10-08 14:20:56'),(282,63,0,'乗り物',0,NULL,NULL,'のりもの','Vehículo',7,'2011-10-08 14:20:56'),(283,63,0,'見物する',0,NULL,NULL,'けんぶつする','Visitar',7,'2011-10-08 14:20:56'),(284,63,0,'荷物',0,NULL,NULL,'にもつ','Paquete, equipaje',7,'2011-10-08 14:20:56'),(285,63,0,'牛',1,'うし','ギュウ','うし','Vaca,toro,ganado',7,'2011-10-08 14:20:56'),(286,63,0,'子牛',0,NULL,NULL,'こうし','Ternera',7,'2011-10-08 14:20:56'),(287,63,0,'牛乳',0,NULL,NULL,'ぎゅうにゅう','Leche',7,'2011-10-08 14:20:56'),(288,63,0,'馬',1,'うま','バ','うま','Caballo',7,'2011-10-08 14:20:56'),(289,63,0,'馬車',0,NULL,NULL,'ばしゃ','Carruaje, carro',7,'2011-10-08 14:20:56'),(290,63,0,'馬力',0,NULL,NULL,'ばりき','Caballos de vapor',7,'2011-10-08 14:20:56'),(291,63,0,'馬肉',0,NULL,NULL,'ばにく','Carne de caballo',7,'2011-10-08 14:20:56'),(292,63,0,'鳥',1,'とり','チョウ','とり','Ave',7,'2011-10-08 14:20:56'),(293,63,0,'白鳥',0,NULL,NULL,'はくちょう','Cisne',7,'2011-10-08 14:20:57'),(294,63,0,'野鳥',0,NULL,NULL,'やちょう','Pájaro silvestre',7,'2011-10-08 14:20:57'),(295,63,0,'焼き鳥',0,NULL,NULL,'やきとり','Pincho de pollo asado',7,'2011-10-08 14:20:57'),(296,63,0,'一石二鳥',0,NULL,NULL,'いっせきにちょう','Matar dos pájaros de un tiro',7,'2011-10-08 14:20:57'),(297,63,0,'魚',1,'さかな、うお','ギョ','さかな','Pez, pescado',7,'2011-10-08 14:20:57'),(298,63,0,'人魚',0,NULL,NULL,'にんぎょ','Sirena',7,'2011-10-08 14:20:57'),(299,63,0,'焼き魚',0,NULL,NULL,'やきざかな','Pescado asado',7,'2011-10-08 14:20:57'),(300,63,0,'金魚',0,NULL,NULL,'きんぎょ','Pececillo de colores',7,'2011-10-08 14:20:57'),(301,63,0,'新',1,'あたら・しい','シン',NULL,'Nuevo',8,'2011-10-08 14:20:57'),(302,63,0,'新しい',0,NULL,NULL,'あたらしい','Nuevo',8,'2011-10-08 14:20:57'),(303,63,0,'新車',0,NULL,NULL,'しんしゃ','Coche nuevo',8,'2011-10-08 14:20:57'),(304,63,0,'新聞',0,NULL,NULL,'しんぶん','Periódico',8,'2011-10-08 14:20:57'),(305,63,0,'新年',0,NULL,NULL,'しんねん','Año nuevo',8,'2011-10-08 14:20:57'),(306,63,0,'古',1,'ふる・い','コ',NULL,'Viejo',8,'2011-10-08 14:20:57'),(307,63,0,'古い',0,NULL,NULL,'ふるい','Viejo',8,'2011-10-08 14:20:57'),(308,63,0,'古本',0,NULL,NULL,'ふるほん','Libro viejo',8,'2011-10-08 14:20:57'),(309,63,0,'中古車',0,NULL,NULL,'ちゅうこしゃ','Coche de 2ª mano',8,'2011-10-08 14:20:57'),(310,63,0,'長',1,'なが・い','チョウ',NULL,'Largo',8,'2011-10-08 14:20:57'),(311,63,0,'長い',0,NULL,NULL,'ながい','Largo',8,'2011-10-08 14:20:57'),(312,63,0,'長野県',0,NULL,NULL,'ながのけん','Prefectura de Nagano',8,'2011-10-08 14:20:57'),(313,63,0,'長女',0,NULL,NULL,'ちょうじょ','Primogénita',8,'2011-10-08 14:20:57'),(314,63,0,'学長',0,NULL,NULL,'がくちょう','Rector/a de universidad',8,'2011-10-08 14:20:57'),(315,63,0,'校長',0,NULL,NULL,'こうちょう','Director de la escuela',8,'2011-10-08 14:20:57'),(316,63,0,'社長',0,NULL,NULL,'しゃちょう','Presidente de la compañía',8,'2011-10-08 14:20:57'),(317,63,0,'課長',0,NULL,NULL,'かちょう','Jefe de departamento',8,'2011-10-08 14:20:57'),(318,63,0,'短',1,'みじか・い','タン',NULL,'Corto',8,'2011-10-08 14:20:57'),(319,63,0,'短い',0,NULL,NULL,'みじかい','Corto',8,'2011-10-08 14:20:57'),(320,63,0,'短時間',0,NULL,NULL,'たんじかん','Poco tiempo',8,'2011-10-08 14:20:57'),(321,63,0,'短大',0,NULL,NULL,'たんだい','Universidad para carreras de 2 años',8,'2011-10-08 14:20:57'),(322,63,0,'高',1,'たか・い','コウ',NULL,'Caro,Alto',8,'2011-10-08 14:20:57'),(323,63,0,'高い',0,NULL,NULL,'たかい','Caro,Alto',8,'2011-10-08 14:20:57'),(324,63,0,'高橋',0,NULL,NULL,'たかはし','Apellido japonés',8,'2011-10-08 14:20:57'),(325,63,0,'高校',0,NULL,NULL,'こうこう','Instituto de bachillerato',8,'2011-10-08 14:20:57'),(326,63,0,'高等学校',0,NULL,NULL,'こうとうがっこう','Instituto de bachillerato',8,'2011-10-08 14:20:57'),(327,63,0,'高速',0,NULL,NULL,'こうそく','Alta velocidad',8,'2011-10-08 14:20:57'),(328,63,0,'高速道路',0,NULL,NULL,'こうそくどうろ','Autopista',8,'2011-10-08 14:20:57'),(329,63,0,'安',1,'やす・い','アン',NULL,'Barato',8,'2011-10-08 14:20:57'),(330,63,0,'安い',0,NULL,NULL,'やすい','Barato',8,'2011-10-08 14:20:57'),(331,63,0,'安全な',0,NULL,NULL,'あんぜんな','Seguro',8,'2011-10-08 14:20:57'),(332,63,0,'安心する',0,NULL,NULL,'あんしんする','Tranquilizarse',8,'2011-10-08 14:20:57'),(333,63,0,'安売り',0,NULL,NULL,'やすうり','Venta de saldos',8,'2011-10-08 14:20:57'),(334,63,0,'低',1,'ひく・い','テイ',NULL,'Bajo',8,'2011-10-08 14:20:57'),(335,63,0,'低い',0,NULL,NULL,'ひくい','Bajo',8,'2011-10-08 14:20:57'),(336,63,0,'低温',0,NULL,NULL,'ていおん','Temperatura baja',8,'2011-10-08 14:20:57'),(337,63,0,'暗',1,'くら・い','アン',NULL,'Oscuro',8,'2011-10-08 14:20:57'),(338,63,0,'暗い',0,NULL,NULL,'くらい','Oscuro',8,'2011-10-08 14:20:57'),(339,63,0,'暗室',0,NULL,NULL,'あんしつ','Cuarto oscuro',8,'2011-10-08 14:20:57'),(340,63,0,'多',1,'おお・い','タ',NULL,'Bastante,Mucho',8,'2011-10-08 14:20:57'),(341,63,0,'多い',0,NULL,NULL,'おおい','Haber en abundancia',8,'2011-10-08 14:20:57'),(342,63,0,'多数',0,NULL,NULL,'たすう','Número',8,'2011-10-08 14:20:57'),(343,63,0,'多少',0,NULL,NULL,'たしょう','Algo',8,'2011-10-08 14:20:57'),(344,63,0,'少',1,'すく・ない、すこ・し','ショウ',NULL,'Poco',8,'2011-10-08 14:20:57'),(345,63,0,'少ない',0,NULL,NULL,'すくない','Haver poco',8,'2011-10-08 14:20:57'),(346,63,0,'少し',0,NULL,NULL,'すこし','Poco',8,'2011-10-08 14:20:57'),(347,63,0,'少年',0,NULL,NULL,'しょうねん','Joven, muchacho',8,'2011-10-08 14:20:57'),(348,63,0,'少女',0,NULL,NULL,'しょうじょ','Chica, muchacha',8,'2011-10-08 14:20:57'),(349,63,0,'少年雑誌',0,NULL,NULL,'しょうねんざっし','Revista para chicos',8,'2011-10-08 14:20:57'),(350,63,0,'少女雑誌',0,NULL,NULL,'しょうじょざっし','Revista para chicas',8,'2011-10-08 14:20:57'),(351,64,0,'行',1,'いく・、おこな・う','コウ、ギョウ',NULL,'Ir,llevar a cabo,línea',9,'2011-10-08 14:20:57'),(352,64,0,'行う',0,NULL,NULL,'おこなう','Hacer,actuar,efectuar',9,'2011-10-08 14:20:57'),(353,64,0,'行く',0,NULL,NULL,'いく','Ir',9,'2011-10-08 14:20:57'),(354,64,0,'行う',0,NULL,NULL,'おこなう','Hacer,actuar,efectuar',9,'2011-10-08 14:20:57'),(355,64,0,'旅行',0,NULL,NULL,'りょこう','Viaje',9,'2011-10-08 14:20:57'),(356,64,0,'二行目',0,NULL,NULL,'にぎょうめ','2ª línea',9,'2011-10-08 14:20:57'),(357,64,0,'来',1,'く・る','ライ',NULL,'venir',9,'2011-10-08 14:20:57'),(358,64,0,'来る',0,NULL,NULL,'くる','venir',9,'2011-10-08 14:20:57'),(359,64,0,'帰国する',0,NULL,NULL,'きこくする','regresar a su país',9,'2011-10-08 14:20:57'),(360,64,0,'帰す',0,NULL,NULL,'かえす','hacer volver,hacer regresar',9,'2011-10-08 14:20:57'),(361,64,0,'食',1,'た・べる','ショク',NULL,'comer',9,'2011-10-08 14:20:57'),(362,64,0,'食べる',0,NULL,NULL,'たべる','comer',9,'2011-10-08 14:20:57'),(363,64,0,'食事',0,NULL,NULL,'しょくじ','Comida',9,'2011-10-08 14:20:57'),(364,64,0,'食べもの',0,NULL,NULL,'たべもの','comida',9,'2011-10-08 14:20:57'),(365,64,0,'夕食',0,NULL,NULL,'ゆうくじ','almuerzo',9,'2011-10-08 14:20:57'),(366,64,0,'飲',1,'の・む','イン',NULL,'beber',9,'2011-10-08 14:20:57'),(367,64,0,'飲む',0,NULL,NULL,'のむ','beber',9,'2011-10-08 14:20:57'),(368,64,0,'飲み物',0,NULL,NULL,'のみもの','bebida',9,'2011-10-08 14:20:57'),(369,64,0,'飲酒',0,NULL,NULL,'いんしゅ','beber alcohol',9,'2011-10-08 14:20:57'),(370,64,0,'見',1,'み・る、み・える、み・せる','ケン',NULL,'ver,mirar',9,'2011-10-08 14:20:57'),(371,64,0,'みる',0,NULL,NULL,'みる','ver,mirar',9,'2011-10-08 14:20:57'),(372,64,0,'見える',0,NULL,NULL,'みえる','verse',9,'2011-10-08 14:20:57'),(373,64,0,'見せる',0,NULL,NULL,'みせる','mostrar',9,'2011-10-08 14:20:57'),(374,64,0,'意見',0,NULL,NULL,'いけん','opinión',9,'2011-10-08 14:20:57'),(375,64,0,'見物する',0,NULL,NULL,'けんぶつする','visitar(turismo)',9,'2011-10-08 14:20:57'),(376,64,0,'聞',1,'き・く、き・こえる','ブン',NULL,'oir,preguntar',9,'2011-10-08 14:20:57'),(377,64,0,'聞く',0,NULL,NULL,'きく','oir,preguntar',9,'2011-10-08 14:20:57'),(378,64,0,'聞こえる',0,NULL,NULL,'きこえる','oirse',9,'2011-10-08 14:20:57'),(379,64,0,'新聞',0,NULL,NULL,'しんぶん','diario',9,'2011-10-08 14:20:57'),(380,64,0,'読',1,'よ・む','ドク',NULL,'leer',9,'2011-10-08 14:20:57'),(381,64,0,'読む',0,NULL,NULL,'よむ','leer',9,'2011-10-08 14:20:57'),(382,64,0,'読み',0,NULL,NULL,'よみ','manera de leer,pronunciación',9,'2011-10-08 14:20:57'),(383,64,0,'読者',0,NULL,NULL,'どくしゃ','lector',9,'2011-10-08 14:20:57'),(384,64,0,'読書',0,NULL,NULL,'どくしょ','lectura(como actividad)',9,'2011-10-08 14:20:57'),(385,64,0,'書',1,'か・く','ショク',NULL,'escribir, libro, documento',9,'2011-10-08 14:20:57'),(386,64,0,'書く',0,NULL,NULL,'かく','escribir',9,'2011-10-08 14:20:57'),(387,64,0,'下書き',0,NULL,NULL,'したがき','borrador',9,'2011-10-08 14:20:57'),(388,64,0,'書道',0,NULL,NULL,'しょどう','caligrafía japonesa',9,'2011-10-08 14:20:57'),(389,64,0,'書店',0,NULL,NULL,'しょてん','librería',9,'2011-10-08 14:20:57'),(390,64,0,'話',1,'はな・す','ワ',NULL,'hablar',9,'2011-10-08 14:20:57'),(391,64,0,'話す',0,NULL,NULL,'はなす','hablar',9,'2011-10-08 14:20:57'),(392,64,0,'話',0,NULL,NULL,'はなし','historia,lo que se cuenta',9,'2011-10-08 14:20:57'),(393,64,0,'会話',0,NULL,NULL,'かいわ','conversación',9,'2011-10-08 14:20:57'),(394,64,0,'電話',0,NULL,NULL,'でんわ','teléfono',9,'2011-10-08 14:20:57'),(395,64,0,'買',1,'か・う','バイ',NULL,'comprar',9,'2011-10-08 14:20:57'),(396,64,0,'買う',0,NULL,NULL,'かう','comprar',9,'2011-10-08 14:20:57'),(397,64,0,'買い物',0,NULL,NULL,'かいもの','compra',9,'2011-10-08 14:20:57'),(398,64,0,'教',1,'おし・える','ギョウ',NULL,'enseñar',9,'2011-10-08 14:20:57'),(399,64,0,'教える',0,NULL,NULL,'おしえる','enseñar',9,'2011-10-08 14:20:57'),(400,64,0,'教育',0,NULL,NULL,'きょういく','educación,enseñanza',9,'2011-10-08 14:20:57'),(401,64,0,'居室',0,NULL,NULL,'きょうしつ','aula',9,'2011-10-08 14:20:57'),(402,64,0,'協会',0,NULL,NULL,'きょうかい','iglesia',9,'2011-10-08 14:20:57'),(403,64,0,'朝',1,'あさ','チョウ','あさ','mañana',10,'2011-10-08 14:20:57'),(404,64,0,'朝日',0,NULL,NULL,'あさひ','sol de la mañana/naciente',10,'2011-10-08 14:20:57'),(405,64,0,'朝食',0,NULL,NULL,'ちょうしょく','desayuno',10,'2011-10-08 14:20:57'),(406,64,0,'昼',1,'ひる','チュウ','ひる','mediodía,día',10,'2011-10-08 14:20:57'),(407,64,0,'昼食',0,NULL,NULL,'ひるごはん','almuerzo',10,'2011-10-08 14:20:57'),(408,64,0,'昼寝する',0,NULL,NULL,'ひるねする','hacer la siesta',10,'2011-10-08 14:20:57'),(409,64,0,'昼休み',0,NULL,NULL,'ひるやすみ','descanso para almorzar',10,'2011-10-08 14:20:57'),(410,64,0,'夜',1,'よる、よ','ヤ','よる','noche',10,'2011-10-08 14:20:57'),(411,64,0,'今夜',0,NULL,NULL,'こんや','esta noche',10,'2011-10-08 14:20:57'),(412,64,0,'夜食',0,NULL,NULL,'やしょく','resopón',10,'2011-10-08 14:20:57'),(413,64,0,'晩',1,'ばん','バン','ばん','noche,primera parte de la noche',10,'2011-10-08 14:20:57'),(414,64,0,'今晩',0,NULL,NULL,'こんばん','esta noche',10,'2011-10-08 14:20:57'),(415,64,0,'晩御飯',0,NULL,NULL,'ばんごはん','cena',10,'2011-10-08 14:20:57'),(416,64,0,'夕',1,'ゆう','セキ',NULL,'atardecer',10,'2011-10-08 14:20:57'),(417,64,0,'夕べ',0,NULL,NULL,'ゆうべ','atardecer/anochecer',10,'2011-10-08 14:20:57'),(418,64,0,'夕食',0,NULL,NULL,'ゆうしょく','cena',10,'2011-10-08 14:20:57'),(419,64,0,'七夕',0,NULL,NULL,'たなばた','fiesta de las estrellas',10,'2011-10-08 14:20:57'),(420,64,0,'方',1,'かた、~がた','ホウ',NULL,'dirección,manera,persona (formal)',10,'2011-10-08 14:20:57'),(421,64,0,'食べ方',0,NULL,NULL,'たべかた','manera de comer',10,'2011-10-08 14:20:57'),(422,64,0,'方法',0,NULL,NULL,'ほうほう','manera',10,'2011-10-08 14:20:57'),(423,64,0,'~ほう',0,NULL,NULL,'~ほう','dirección',10,'2011-10-08 14:20:57'),(424,64,0,'夕方',0,NULL,NULL,'ゆうがた','atardecer',10,'2011-10-08 14:20:57'),(425,64,0,'午',1,NULL,'ゴ',NULL,'mediodía',10,'2011-10-08 14:20:57'),(426,64,0,'午前',0,NULL,NULL,'ごぜん','antes mediodía',10,'2011-10-08 14:20:57'),(427,64,0,'午後',0,NULL,NULL,'ごご','después mediodía',10,'2011-10-08 14:20:57'),(428,64,0,'正午',0,NULL,NULL,'しょうご','mediodía',10,'2011-10-08 14:20:57'),(429,64,0,'前',1,'まえ','ゼン','まえ','antes,delante',10,'2011-10-08 14:20:57'),(430,64,0,'一年前',0,NULL,NULL,'いちねんまえ','hace un año',10,'2011-10-08 14:20:57'),(431,64,0,'前半',0,NULL,NULL,'ぜんはん','primera mitad',10,'2011-10-08 14:20:57'),(432,64,0,'前方',0,NULL,NULL,'ぜんぽう','hacia delante',10,'2011-10-08 14:20:57'),(433,64,0,'後',1,'あと、のち、うしろ','ゴ、コウ','あと','después,detrás',10,'2011-10-08 14:20:57'),(434,64,0,'~年後',0,NULL,NULL,'~ねんご','x años más tarde',10,'2011-10-08 14:20:57'),(435,64,0,'後ろ',0,NULL,NULL,'うしろ','detrás',10,'2011-10-08 14:20:57'),(436,64,0,'後半',0,NULL,NULL,'こうはん','segunda mitad',10,'2011-10-08 14:20:57'),(437,64,0,'毎',1,'~ごと','マイ',NULL,'cada',10,'2011-10-08 14:20:57'),(438,64,0,'毎日',0,NULL,NULL,'まいにち','cada día',10,'2011-10-08 14:20:57'),(439,64,0,'毎朝',0,NULL,NULL,'まいあさ','cada mañana',10,'2011-10-08 14:20:57'),(440,64,0,'毎夕、毎晩、毎夜',0,NULL,NULL,'まいゆう、まいばん、まいよ','cada noche',10,'2011-10-08 14:20:57'),(441,64,0,'毎年',0,NULL,NULL,'まいねん','cada año',10,'2011-10-08 14:20:57'),(442,64,0,'毎週',0,NULL,NULL,'まいしゅう','cada semana',10,'2011-10-08 14:20:57'),(443,64,0,'毎月',0,NULL,NULL,'まいげつ','cada mes',10,'2011-10-08 14:20:57'),(444,64,0,'毎度',0,NULL,NULL,'まいど','cada vez',10,'2011-10-08 14:20:57'),(445,64,0,'週',1,'せんにゅう','シュウ',NULL,'semana',10,'2011-10-08 14:20:57'),(446,64,0,'先週、今週、来週',0,NULL,NULL,'せんしゅう、こんしゅう、らいしゅう','semana pasada, esta, próxima',10,'2011-10-08 14:20:57'),(447,64,0,'週末',0,NULL,NULL,'しゅうまつ','fin de semana',10,'2011-10-08 14:20:57'),(448,64,0,'一週間',0,NULL,NULL,'いっしゅうかん','una semana',10,'2011-10-08 14:20:57'),(449,64,0,'曜',1,'ひへん','ヨウ',NULL,'dia de la semana',10,'2011-10-08 14:20:57'),(450,64,0,'何曜日',0,NULL,NULL,'なんようび','qué día de la semana',10,'2011-10-08 14:20:57'),(451,64,0,'月曜日',0,NULL,NULL,'げつようび','lunes',10,'2011-10-08 14:20:57'),(457,65,0,'本',0,NULL,NULL,'ほん','Libro',NULL,'2011-10-12 20:27:24'),(458,65,0,'',0,NULL,NULL,'とけい','Reloj',NULL,'2011-10-12 20:34:52'),(459,65,0,'大きい',0,NULL,NULL,'おおきい','Grande',NULL,'2011-10-12 20:36:18'),(460,65,0,'',0,NULL,NULL,'かさ','Paraguas',NULL,'2011-10-19 14:10:12'),(461,65,0,'',0,NULL,NULL,'いす','Silla',NULL,'2011-10-19 14:11:03'),(462,65,0,'',0,NULL,NULL,'いえ','Casa',NULL,'2011-10-20 07:59:39'),(463,65,0,'',0,NULL,NULL,'ねこ','Gato',NULL,'2011-10-20 08:03:19'),(464,65,0,'',0,NULL,NULL,'いぬ','Perro',NULL,'2011-10-20 08:03:57'),(465,65,0,'',0,NULL,NULL,'つえ','Bastón',NULL,'2011-10-20 08:07:06'),(466,65,0,'',0,NULL,NULL,'なす','Berenjena',NULL,'2011-10-20 08:09:17'),(467,65,0,'',0,NULL,NULL,'きのこ','Setas',NULL,'2011-10-20 08:10:29'),(468,65,0,'',0,NULL,NULL,'おかし','Dulces',NULL,'2011-10-20 08:11:15'),(469,65,0,'',0,NULL,NULL,'きつね','Zorro',NULL,'2011-10-20 08:13:50'),(470,65,0,'',0,NULL,NULL,'たぬき','Mapache',NULL,'2011-10-20 08:15:01'),(471,63,0,'',0,NULL,NULL,'ブラウス','blusa',NULL,'2011-10-20 20:09:43'),(472,63,0,'',0,NULL,NULL,'ズボン','pantalones',NULL,'2011-10-20 20:12:17'),(473,63,0,'',0,NULL,NULL,'コーヒー','café',NULL,'2011-10-20 20:22:06'),(474,63,0,'',0,NULL,NULL,'ハンバーガー','hamburguesa',NULL,'2011-10-20 20:25:15'),(475,63,0,'',0,NULL,NULL,'スカート','falda',NULL,'2011-10-20 20:27:19'),(476,63,0,'小説',0,NULL,NULL,'しょおせつ','novela',NULL,'2011-10-20 20:43:09'),(477,63,0,'',0,NULL,NULL,'ケーキ','pastel',NULL,'2011-10-20 20:47:06'),(478,63,0,'',0,NULL,NULL,'コーラ','refresco de cola',NULL,'2011-10-20 20:51:13'),(479,63,0,'',0,NULL,NULL,'かばん','bolso',NULL,'2011-10-20 20:52:30'),(480,63,0,'',0,NULL,NULL,'シーヂー','CD',NULL,'2011-10-20 20:58:06'),(481,63,0,'靴',0,NULL,NULL,'くつ','zapatos',NULL,'2011-10-20 21:01:43'),(482,63,0,'帽子',0,NULL,NULL,'ぼうし','sombrero',NULL,'2011-10-20 21:05:27'),(483,63,0,'',0,NULL,NULL,'スーニカー','zapatillas deportivas',NULL,'2011-10-20 21:07:05'),(484,63,0,'',0,NULL,NULL,'オレンジ','naranja',NULL,'2011-10-20 21:08:32'),(485,63,0,'',0,NULL,NULL,'ジーンズ','pantalones tejanos',NULL,'2011-10-20 21:12:01'),(486,63,0,'',0,NULL,NULL,'かんビール','lata de cerveza',NULL,'2011-10-20 21:19:16'),(487,63,0,'',0,NULL,NULL,'タオル','toalla',NULL,'2011-10-20 21:31:35'),(488,63,0,'',0,NULL,NULL,'ボールペン','bolígrafo',NULL,'2011-10-20 21:37:55');

/*Table structure for table `jos_jw_termino_categoria` */

DROP TABLE IF EXISTS `jos_jw_termino_categoria`;

CREATE TABLE `jos_jw_termino_categoria` (
  `id_termino` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id_termino`,`id_categoria`),
  KEY `FK_categoria` (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_termino_categoria` */

insert  into `jos_jw_termino_categoria`(`id_termino`,`id_categoria`) values (3,6),(6,6),(10,6),(29,7),(29,8),(36,6),(39,6),(43,6),(46,6),(243,1),(243,8),(255,1),(255,8),(265,1),(265,8),(265,10),(450,6),(451,6),(457,1),(458,1),(458,8),(458,13),(459,3),(459,4),(459,5),(460,1),(460,8),(461,1),(461,8),(462,1),(462,8),(463,1),(463,8),(463,9),(464,1),(464,8),(464,9),(465,1),(465,8),(466,1),(466,8),(466,10),(466,11),(467,1),(467,8),(467,10),(467,11),(468,1),(468,8),(468,10),(469,1),(469,8),(469,9),(470,1),(470,8),(470,9),(471,8),(471,13),(472,8),(472,13),(473,8),(473,13),(474,8),(474,13),(475,8),(475,13),(476,8),(476,13),(477,8),(477,13),(478,8),(478,13),(479,8),(479,13),(480,8),(480,13),(481,8),(481,13),(482,8),(482,13),(483,8),(483,13),(484,8),(484,13),(485,8),(485,13),(486,8),(486,13),(487,8),(487,13),(488,8),(488,13);

/*Table structure for table `jos_menu` */

DROP TABLE IF EXISTS `jos_menu`;

CREATE TABLE `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `jos_menu` */

insert  into `jos_menu`(`id`,`menutype`,`name`,`alias`,`link`,`type`,`published`,`parent`,`componentid`,`sublevel`,`ordering`,`checked_out`,`checked_out_time`,`pollid`,`browserNav`,`access`,`utaccess`,`params`,`lft`,`rgt`,`home`) values (1,'mainmenu','Home','home','index.php?option=com_content&view=frontpage','component',1,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,3,'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,1),(2,'mainmenu','Japoweb default','japoweb-default','index.php?option=com_japoweb&view=old','component',0,0,34,0,2,0,'0000-00-00 00:00:00',0,0,0,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(3,'mainmenu','Add Termino','add-termino','index.php?option=com_japoweb&view=addtermino','component',1,0,34,0,3,0,'0000-00-00 00:00:00',0,0,1,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(4,'mainmenu','Crear lista','crear-lista','index.php?option=com_japoweb&view=getlist','component',1,0,34,0,4,0,'0000-00-00 00:00:00',0,0,0,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0);

/*Table structure for table `jos_menu_types` */

DROP TABLE IF EXISTS `jos_menu_types`;

CREATE TABLE `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `jos_menu_types` */

insert  into `jos_menu_types`(`id`,`menutype`,`title`,`description`) values (1,'mainmenu','Main Menu','The main menu for the site');

/*Table structure for table `jos_messages` */

DROP TABLE IF EXISTS `jos_messages`;

CREATE TABLE `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_messages` */

/*Table structure for table `jos_messages_cfg` */

DROP TABLE IF EXISTS `jos_messages_cfg`;

CREATE TABLE `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_messages_cfg` */

/*Table structure for table `jos_migration_backlinks` */

DROP TABLE IF EXISTS `jos_migration_backlinks`;

CREATE TABLE `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_migration_backlinks` */

/*Table structure for table `jos_modules` */

DROP TABLE IF EXISTS `jos_modules`;

CREATE TABLE `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `jos_modules` */

insert  into `jos_modules`(`id`,`title`,`content`,`ordering`,`position`,`checked_out`,`checked_out_time`,`published`,`module`,`numnews`,`access`,`showtitle`,`params`,`iscore`,`client_id`,`control`) values (1,'Main Menu','',1,'left',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,1,'menutype=mainmenu\nmoduleclass_sfx=_menu\n',1,0,''),(2,'Login','',1,'login',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'',1,1,''),(3,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,2,1,'',0,1,''),(4,'Recent added Articles','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,2,1,'ordering=c_dsc\nuser_id=0\ncache=0\n\n',0,1,''),(5,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,2,1,'',0,1,''),(6,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,2,1,'',1,1,''),(7,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,2,1,'',1,1,''),(8,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,2,1,'',1,1,''),(9,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,2,1,'',1,1,''),(10,'Logged in Users','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,2,1,'',0,1,''),(11,'Footer','',0,'footer',0,'0000-00-00 00:00:00',1,'mod_footer',0,0,1,'',1,1,''),(12,'Admin Menu','',1,'menu',0,'0000-00-00 00:00:00',1,'mod_menu',0,2,1,'',0,1,''),(13,'Admin SubMenu','',1,'submenu',0,'0000-00-00 00:00:00',1,'mod_submenu',0,2,1,'',0,1,''),(14,'User Status','',1,'status',0,'0000-00-00 00:00:00',1,'mod_status',0,2,1,'',0,1,''),(15,'Title','',1,'title',0,'0000-00-00 00:00:00',1,'mod_title',0,2,1,'',0,1,''),(16,'Login','',2,'left',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n',0,0,'');

/*Table structure for table `jos_modules_menu` */

DROP TABLE IF EXISTS `jos_modules_menu`;

CREATE TABLE `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_modules_menu` */

insert  into `jos_modules_menu`(`moduleid`,`menuid`) values (1,0),(16,0);

/*Table structure for table `jos_newsfeeds` */

DROP TABLE IF EXISTS `jos_newsfeeds`;

CREATE TABLE `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_newsfeeds` */

/*Table structure for table `jos_plugins` */

DROP TABLE IF EXISTS `jos_plugins`;

CREATE TABLE `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `jos_plugins` */

insert  into `jos_plugins`(`id`,`name`,`element`,`folder`,`access`,`ordering`,`published`,`iscore`,`client_id`,`checked_out`,`checked_out_time`,`params`) values (1,'Authentication - Joomla','joomla','authentication',0,1,1,1,0,0,'0000-00-00 00:00:00',''),(2,'Authentication - LDAP','ldap','authentication',0,2,0,1,0,0,'0000-00-00 00:00:00','host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),(3,'Authentication - GMail','gmail','authentication',0,4,0,0,0,0,'0000-00-00 00:00:00',''),(4,'Authentication - OpenID','openid','authentication',0,3,0,0,0,0,'0000-00-00 00:00:00',''),(5,'User - Joomla!','joomla','user',0,0,1,0,0,0,'0000-00-00 00:00:00','autoregister=1\n\n'),(6,'Search - Content','content','search',0,1,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),(7,'Search - Contacts','contacts','search',0,3,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(8,'Search - Categories','categories','search',0,4,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(9,'Search - Sections','sections','search',0,5,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(10,'Search - Newsfeeds','newsfeeds','search',0,6,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(11,'Search - Weblinks','weblinks','search',0,2,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(12,'Content - Pagebreak','pagebreak','content',0,10000,1,1,0,0,'0000-00-00 00:00:00','enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),(13,'Content - Rating','vote','content',0,4,1,1,0,0,'0000-00-00 00:00:00',''),(14,'Content - Email Cloaking','emailcloak','content',0,5,1,0,0,0,'0000-00-00 00:00:00','mode=1\n\n'),(15,'Content - Code Hightlighter (GeSHi)','geshi','content',0,5,0,0,0,0,'0000-00-00 00:00:00',''),(16,'Content - Load Module','loadmodule','content',0,6,1,0,0,0,'0000-00-00 00:00:00','enabled=1\nstyle=0\n\n'),(17,'Content - Page Navigation','pagenavigation','content',0,2,1,1,0,0,'0000-00-00 00:00:00','position=1\n\n'),(18,'Editor - No Editor','none','editors',0,0,1,1,0,0,'0000-00-00 00:00:00',''),(19,'Editor - TinyMCE','tinymce','editors',0,0,1,1,0,0,'0000-00-00 00:00:00','mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),(20,'Editor - XStandard Lite 2.0','xstandard','editors',0,0,0,1,0,0,'0000-00-00 00:00:00',''),(21,'Editor Button - Image','image','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(22,'Editor Button - Pagebreak','pagebreak','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(23,'Editor Button - Readmore','readmore','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(24,'XML-RPC - Joomla','joomla','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(25,'XML-RPC - Blogger API','blogger','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00','catid=1\nsectionid=0\n\n'),(27,'System - SEF','sef','system',0,1,1,0,0,0,'0000-00-00 00:00:00',''),(28,'System - Debug','debug','system',0,2,1,0,0,0,'0000-00-00 00:00:00','queries=1\nmemory=1\nlangauge=1\n\n'),(29,'System - Legacy','legacy','system',0,3,0,1,0,0,'0000-00-00 00:00:00','route=0\n\n'),(30,'System - Cache','cache','system',0,4,0,1,0,0,'0000-00-00 00:00:00','browsercache=0\ncachetime=15\n\n'),(31,'System - Log','log','system',0,5,0,1,0,0,'0000-00-00 00:00:00',''),(32,'System - Remember Me','remember','system',0,6,1,1,0,0,'0000-00-00 00:00:00',''),(33,'System - Backlink','backlink','system',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(34,'System - Mootools Upgrade','mtupgrade','system',0,8,1,1,0,0,'0000-00-00 00:00:00','');

/*Table structure for table `jos_poll_data` */

DROP TABLE IF EXISTS `jos_poll_data`;

CREATE TABLE `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_data` */

/*Table structure for table `jos_poll_date` */

DROP TABLE IF EXISTS `jos_poll_date`;

CREATE TABLE `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_date` */

/*Table structure for table `jos_poll_menu` */

DROP TABLE IF EXISTS `jos_poll_menu`;

CREATE TABLE `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_poll_menu` */

/*Table structure for table `jos_polls` */

DROP TABLE IF EXISTS `jos_polls`;

CREATE TABLE `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_polls` */

/*Table structure for table `jos_sections` */

DROP TABLE IF EXISTS `jos_sections`;

CREATE TABLE `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_sections` */

/*Table structure for table `jos_session` */

DROP TABLE IF EXISTS `jos_session`;

CREATE TABLE `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_session` */

insert  into `jos_session`(`username`,`time`,`session_id`,`guest`,`userid`,`usertype`,`gid`,`client_id`,`data`) values ('','1319372474','b9be578848c0d469be09b98d177523c0',1,0,'',0,0,'__default|a:9:{s:15:\"session.counter\";i:6;s:19:\"session.timer.start\";i:1319372421;s:18:\"session.timer.last\";i:1319372461;s:17:\"session.timer.now\";i:1319372474;s:22:\"session.client.browser\";s:70:\"Mozilla/5.0 (X11; Linux x86_64; rv:7.0.1) Gecko/20100101 Firefox/7.0.1\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/eoijisho/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:16:\"com_mailto.links\";a:1:{s:40:\"fb50e59f991eda281bab24324a62c9d55fe4595a\";O:8:\"stdClass\":2:{s:4:\"link\";s:81:\"http://eoijisho.tk/index.php?option=com_content&view=article&id=1:article-de-test\";s:6:\"expiry\";i:1319372423;}}s:13:\"session.token\";s:32:\"2398e0ec3f8d2d5edb94dc72c9b11d08\";}'),('','1319372477','a59e1e88a135ffdc0ac1a1e7f8438f83',1,0,'',0,0,'__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1319372477;s:18:\"session.timer.last\";i:1319372477;s:17:\"session.timer.now\";i:1319372477;s:22:\"session.client.browser\";s:107:\"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.0 Safari/533.3\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/eoijisho/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}}'),('','1319372482','aefe8ef422308e453d65cd17af694215',1,0,'',0,0,'__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1319372482;s:18:\"session.timer.last\";i:1319372482;s:17:\"session.timer.now\";i:1319372482;s:22:\"session.client.browser\";s:107:\"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Qt/4.7.0 Safari/533.3\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/eoijisho/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}}');

/*Table structure for table `jos_stats_agents` */

DROP TABLE IF EXISTS `jos_stats_agents`;

CREATE TABLE `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_stats_agents` */

/*Table structure for table `jos_templates_menu` */

DROP TABLE IF EXISTS `jos_templates_menu`;

CREATE TABLE `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_templates_menu` */

insert  into `jos_templates_menu`(`template`,`menuid`,`client_id`) values ('japoweb',0,0),('khepri',0,1);

/*Table structure for table `jos_users` */

DROP TABLE IF EXISTS `jos_users`;

CREATE TABLE `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `jos_users` */

insert  into `jos_users`(`id`,`name`,`username`,`email`,`password`,`usertype`,`block`,`sendEmail`,`gid`,`registerDate`,`lastvisitDate`,`activation`,`params`) values (62,'Administrator','admin','japoweb@japoweb.com','fc7d51bb2b83c7932e46a85836df4947:Wk2S3KuWg5jM0KskkRPdZqT7ISMoDWv3','Super Administrator',0,1,25,'2011-10-09 13:36:39','2011-10-21 07:51:56','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(63,'neko','neko','josexu@gmail.com','eec5e3c9e538a3e5f49474c97b046f2c:470tnjwKh6beUQsc6Od9bmCUvgIGaL4m','Registered',0,0,18,'2011-10-09 15:32:48','2011-10-22 17:22:00','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(64,'iru','iru','iru.bcn@gmail.com','27d49f4bb71144062cad1392748dcf26','Registered',0,0,18,'2011-10-09 15:33:00','0000-00-00 00:00:00','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(65,'Pere Fonolleda','Pericuelo','peterpunkz@gmail.com','0e15996bfb42588fdcf928d43e6dd324:CAEWqLZorLzxuhLXzae3XIEgMUbfEdyj','Registered',0,0,18,'2011-10-09 15:36:54','2011-10-21 07:54:28','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(66,'Alex','Alex','amartinez0526@gmail.com','44c9275e3c9304ee405d8677c8a6e76a:BXlLG8J1EOs8siyZqDYOXOZr7xfKmJGJ','Registered',0,0,18,'2011-10-21 07:52:40','2011-10-21 08:43:45','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

/*Table structure for table `jos_weblinks` */

DROP TABLE IF EXISTS `jos_weblinks`;

CREATE TABLE `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_weblinks` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
