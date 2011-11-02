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

insert  into `jos_components`(`id`,`name`,`link`,`menuid`,`parent`,`admin_menu_link`,`admin_menu_alt`,`option`,`ordering`,`admin_menu_img`,`iscore`,`params`,`enabled`) values (1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n',1),(2,'Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,'',1),(3,'Clients','',0,1,'option=com_banners&c=client','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,'',1),(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/component.png',0,'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n',1),(5,'Links','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,'',1),(6,'Categories','',0,4,'option=com_categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,'',1),(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/component.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(8,'Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,'',1),(9,'Categories','',0,7,'option=com_categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(10,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,'',1),(11,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,'',1),(12,'Feeds','',0,11,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n',1),(13,'Categories','',0,11,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,'',1),(14,'User','option=com_user',0,0,'','','com_user',0,'',1,'',1),(15,'Search','option=com_search',0,0,'option=com_search','Search Statistics','com_search',0,'js/ThemeOffice/component.png',1,'enabled=0\n\n',1),(16,'Categories','',0,1,'option=com_categories&section=com_banner','Categories','',3,'',1,'',1),(17,'Wrapper','option=com_wrapper',0,0,'','Wrapper','com_wrapper',0,'',1,'',1),(18,'Mail To','',0,0,'','','com_mailto',0,'',1,'',1),(19,'Media Manager','',0,0,'option=com_media','Media Manager','com_media',0,'',1,'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n',1),(20,'Articles','option=com_content',0,0,'','','com_content',0,'',1,'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_item_navigation=0\nshow_readmore=0\nshow_vote=0\nshow_icons=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=0\nshow_hits=0\nfeed_summary=1\nfilter_tags=\nfilter_attritbutes=\n\n',1),(21,'Configuration Manager','',0,0,'','Configuration','com_config',0,'',1,'',1),(22,'Installation Manager','',0,0,'','Installer','com_installer',0,'',1,'',1),(23,'Language Manager','',0,0,'','Languages','com_languages',0,'',1,'',1),(24,'Mass mail','',0,0,'','Mass Mail','com_massmail',0,'',1,'mailSubjectPrefix=\nmailBodySuffix=\n\n',1),(25,'Menu Editor','',0,0,'','Menu Editor','com_menus',0,'',1,'',1),(27,'Messaging','',0,0,'','Messages','com_messages',0,'',1,'',1),(28,'Modules Manager','',0,0,'','Modules','com_modules',0,'',1,'',1),(29,'Plugin Manager','',0,0,'','Plugins','com_plugins',0,'',1,'',1),(30,'Template Manager','',0,0,'','Templates','com_templates',0,'',1,'',1),(31,'User Manager','',0,0,'','Users','com_users',0,'',1,'allowUserRegistration=0\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=0\n\n',1),(32,'Cache Manager','',0,0,'','Cache','com_cache',0,'',1,'',1),(33,'Control Panel','',0,0,'','Control Panel','com_cpanel',0,'',1,'',1),(34,'Japoweb','option=com_japoweb',0,0,'option=com_japoweb','Japoweb','com_japoweb',0,'js/ThemeOffice/component.png',0,'',1);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `jos_content` */

insert  into `jos_content`(`id`,`title`,`alias`,`title_alias`,`introtext`,`fulltext`,`state`,`sectionid`,`mask`,`catid`,`created`,`created_by`,`created_by_alias`,`modified`,`modified_by`,`checked_out`,`checked_out_time`,`publish_up`,`publish_down`,`images`,`urls`,`attribs`,`version`,`parentid`,`ordering`,`metakey`,`metadesc`,`access`,`hits`,`metadata`) values (1,'Bienvenido a EOIjisho','bienvenido','','<p> </p>\r\n<p>EOIjisho es una herramienta web, creada por y para estudiantes de Japonés, que ayuda en el aprendizaje del vocabulario y los kanjis de este idioma.</p>\r\n<p>Se trata de una plataforma colaborativa que los mismos estudiantes crean y amplían.</p>\r\n<p>De momento ofrece generación de listas para estudiar vocabulario, pero en breve dispondrá de exámenes online personalizados y muchas otras funcionalidades.</p>\r\n<p>Lo que estás viendo es una versión BETA en plena evolución y mejora, así que disfrútala y no te asustes si algo falla XD. <br /><br />Toda crítica, error detectado e idea ayudan a hacer de EOIjisho una herramienta más útil y completa, no dudes en escribirnos a <strong>eoijisho@gmail.com</strong>.</p>','',1,0,0,0,'2011-10-16 17:51:58',62,'','2011-10-25 20:07:53',62,62,'2011-10-25 20:07:53','2011-10-16 17:51:58','0000-00-00 00:00:00','','','show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',9,0,2,'','',0,0,'robots=\nauthor='),(2,'¿Cómo añadir palabras?','comoanadirpalabras','','<h1 class=\"caption\">Lee esto antes de empezar a añadir palabras... va en serio</h1>\r\n<p class=\"system-pagebreak\">\r\n<p class=\"system-pagebreak\" style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">La base de EOIjisho son las palabras, así que es muy importante añadirlas de manera correcta.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Por favor comprueba la ortografía sobre todo en los campos Kana, Kanji y Significado antes de guardar una palabra.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">A continuación describo para qué sirve cada campo del formulario \"Añadir Palabra\" y explico las particularidades.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Teclado Virtual:</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Para introducir texto en japonés (hiragana, katakana y kanji) la web incorpora un teclado que nos permite hacerlo sin necesidad de instalar nada en nuestro ordenador.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Cuando seleccionemos el campo \"kana\" o \"kanji\" el teclado virtual (que aparece abajo a la derecha) se encargará de traducir el texto que nosotros introduciremos en romaji.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">A medida que escribimos una palabra se muestran las opciones disponibles (1:hiragana 2:katakana 3:kanji...), debemos pulsar el número que marca la opción correcta para que nuestro texto se traduzca de romaji a caracteres japoneses.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><strong><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">NOTA:</span></strong><span><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\"> </span></span><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Los navegadores de internet suelen mostrar la lista de las últimas palabras que hemos escrito en un formulario. En nuestro caso esta lista suele tapar las opciones que nos está mostrando el teclado virtual. Para ocultar la lista de palabras que nos muestra nuestro navegador web podemos pulsar la tecla \"Esc\".</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Campo \"Kana\":</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">En este campo introduciremos la palabra en Hiragana o Katakana, es obligatorio.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Cuando el cursor sale de este campo, la web busca palabras coincidentes para que no introduzcamos palabras repetidas. Si la palabra ya existe (y la hemos escrito correctamente), se nos mostrará una ventana con las palabras existentes para modificarlas o corregirlas. Os explicaré más sobre modificar palabras un poco más abajo.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">El campo de texto de la derecha muestra la transcripción romaji de la palabra introducida.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Campo \"Kanji\":</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Si estás muy motivado o conoces el kanji de la palabra que estás introduciendo, puedes ponerlo aquí. No es un campo obligatorio, pero será de gran utilidad a partir del segundo cuatrimestre.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">En este campo el Teclado Virtual está activo.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Campo \"Significado\":</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Es obligatorio y debes escribir en él el significado en<span> </span><strong>Castellano y minúsculas</strong><span> </span>(a menos que sea un nombre propio) de la palabra que estás introduciendo.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Cuando el cursor sale de este campo, se muestran imágenes que contienen esa palabra debajo del campo \"buscar imágenes\". La mayoría de las veces esto ahorra tener que buscarlas después.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Campo \"Categorías\":</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Para poder generar listas de estudio, hemos de etiquetar las palabras con categorías. Ejemplos de categorías son: lección 1, profesiones, países...</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Una palabra no etiquetada no saldrá en ninguna lista, así que hay que poner al menos una etiqueta por palabra. De hecho lo ideal es poner al menos 2: lección X (donde X es el numero de lección del kyookasho en la que aparece la palabra) y otra etiqueta descriptiva (profesiones, objetos hogar).</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Debajo del campo \"categorías\" se muestra una lista de etiquetas ordenadas por el número de palabras marcadas con ella, el número de palabras se muestra entre paréntesis.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Si queremos añadir una etiqueta de la lista a la palabra actual solo tenemos que hacer click sobre ella o escribirla. Si la escribimos hay que pulsar \"enter\" para que ésta se añada.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Al añadir una categoría, si existe aparecerá en una píldora azul y si no aparecerá en una naranja. Las categorías naranjas se crearán para la palabra que estás introduciendo, asegúrate de que las categorías que vas a crear no existan con un nombre parecido.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Cuando quieras crear una categoría nueva debes asegurarte de que es explicativa (la categoría \"cosas\" es un ejemplo de poco explicativa, por otra parte \"animales\" y \"vehículos\" son completamente válidas). Esperamos que al principio de curso nos sea fácil crear categorías útiles.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">El botón \"Limpiar\" elimina todas las etiquetas de una palabra, úsalo con cautela.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Campo \"Imagen\":</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Este campo no es obligatorio, pero es una maravilla poder estudiar vocabulario con imágenes bien representativas.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">No selecciones imágenes que tengan marcas de agua o banners de algún banco de imágenes, elige imágenes lo más grandes posible y que solo contengan la palabra en cuestión. Intenta seleccionar imágenes que sean contornos, son mejores a la hora de imprimir.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Si ya has escrito el significado de la palabra que estás introduciendo, verás 20 imágenes asociadas. Si ves una imagen clara y que te gusta, solo tienes que pulsar sobre ella.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Si no ves ninguna imagen válida puedes escribir algo en el campo de texto \"buscar imágenes\" y pulsar \"enter\" para obtener 20 imágenes o pulsar \"Buscar muuuuchas imágenes\" para obtener 100.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Si una palabra se resiste intenta buscarla en inglés, suele dar buenos resultados.</span></p>\r\n<h2 style=\"mso-line-height-alt: 11.25pt; vertical-align: bottom;\"><span style=\"font-size: 12.5pt; font-family: Arial, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Guardar:</span></h2>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Púlsalo solo tras confirmar que todos los campos son correctos, en serio...</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\"> </span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">¡Felicidades! Si has llegado hasta aquí sin dormirte, ya sabes todo lo necesario para introducir palabras de manera digna.</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Gracias por tu atención y colaboración</span></p>\r\n<p style=\"margin-top: 0cm; margin-right: 0cm; margin-bottom: 3.75pt; margin-left: 0cm; line-height: 11.25pt;\"><span style=\"font-size: 9pt; font-family: Helvetica, sans-serif; background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: white; background-position: initial initial; background-repeat: initial initial;\">Jose</span></p>\r\n</p>','',1,0,0,0,'2011-10-26 15:01:29',62,'','2011-10-27 13:07:52',62,0,'0000-00-00 00:00:00','2011-10-26 15:01:29','0000-00-00 00:00:00','','','show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',6,0,1,'','',1,0,'robots=\nauthor=');

/*Table structure for table `jos_content_frontpage` */

DROP TABLE IF EXISTS `jos_content_frontpage`;

CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_content_frontpage` */

insert  into `jos_content_frontpage`(`content_id`,`ordering`) values (1,2),(2,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `jos_core_acl_aro` */

insert  into `jos_core_acl_aro`(`id`,`section_value`,`value`,`order_value`,`name`,`hidden`) values (10,'users','62',0,'Administrator',0),(11,'users','63',0,'neko',0),(12,'users','64',0,'iru',0),(13,'users','65',0,'Pere Fonolleda',0),(14,'users','66',0,'Alex',0),(15,'users','67',0,'Rigel',0),(16,'users','68',0,'Rosa Maria Pérez',0),(17,'users','69',0,'Aram Bonmatí',0),(18,'users','70',0,'Aurèlia',0);

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

insert  into `jos_core_acl_groups_aro_map`(`group_id`,`section_value`,`aro_id`) values (18,'',11),(18,'',12),(18,'',13),(18,'',14),(18,'',15),(18,'',16),(18,'',17),(18,'',18),(25,'',10);

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_categoria` */

insert  into `jos_jw_categoria`(`id`,`nombre`,`descripcion`,`num_palabras`) values (1,'nombres','',16),(3,'adjetivos','',1),(6,'calendario','Días de la semana, días del mes, meses',9),(7,'vehículos','',1),(8,'lección 2','',34),(9,'animales','',4),(10,'comida','',6),(13,'fotocopia 1','',19),(14,'lección 1','',2),(15,'profesiones','',7),(16,'ropa','',2),(17,'países','',14),(18,'números','',46);

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
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `jos_jw_imagen` */

insert  into `jos_jw_imagen`(`id`,`id_termino`,`id_user`,`fichero`,`url_original`,`fecha`) values (1,29,63,'1319038278.75.jpg','http://www.educima.com/dibujo-para-colorear-coche-dl6474.jpg','2011-10-19 11:31:18'),(8,462,65,'1319112004.74.jpg','http://eoienglishcorner.wikispaces.com/file/view/casa.gif/45522741/casa.gif','2011-10-20 08:00:05'),(7,457,63,'1319107227.42.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/libro-sobre-naturaleza-dibujos-para-colorear.gif','2011-10-20 06:40:28'),(4,460,65,'1319049421.5555.jpg','http://lh4.ggpht.com/-GivbUxWLeyU/SbTLnrEpfiI/AAAAAAAAHl0/jk18U-SUxdU/Paraguas.jpg','2011-10-19 14:37:01'),(5,461,63,'1319055290.15.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/silla-de-cocina-dibujos-para-colorear.jpg','2011-10-19 16:14:51'),(6,460,63,'1319099992.58.jpg','http://tururutu.files.wordpress.com/2011/01/paraguas-abierto-12286.jpg','2011-10-20 04:39:52'),(9,243,65,'1319112146.13.jpg','http://serenityexecutivesuites.com/photos/bambu3.gif','2011-10-20 08:02:26'),(10,463,65,'1319112199.18.jpg','http://4.bp.blogspot.com/_mtyB5sG_n04/S-h6yG_dnLI/AAAAAAAAACc/tAWkdqKRnKo/s1600/gatico.gif','2011-10-20 08:03:19'),(11,464,65,'1319112236.89.jpg','http://4.bp.blogspot.com/_fSdSbBwOte0/S83rfNEEkNI/AAAAAAAAAJA/GPSVc1tfK8g/s400/perro.jpg','2011-10-20 08:03:57'),(12,465,65,'1319112425.87.jpg','http://moggap.info/components/com_virtuemart/shop_image/product/BASTON_KY_9282L__4dd54fb500310.jpg','2011-10-20 08:07:06'),(13,255,65,'1319112495.66.jpg','http://lh5.ggpht.com/-8ifDPHomP9Y/TKPLdUl09VI/AAAAAAAAAa8/P2GhRRWVVLM/hilo.jpg','2011-10-20 08:08:16'),(14,466,65,'1319112557.13.jpg','http://dibujos.net/images/painted2/201050/427cd8f891fa2dd1dd8e63ede31b6bac.png','2011-10-20 08:09:17'),(15,265,65,'1319112587.19.jpg','http://galeria.colorir.com/images/painted2/201030/c90445b97666bc05ee0212b16d50a6a2.png','2011-10-20 08:09:47'),(16,467,65,'1319112628.18.jpg','http://www.ahiva.info/Colorear/Alimentos/Setas/Seta-02.gif','2011-10-20 08:10:29'),(17,468,65,'1319112675.51.jpg','http://lh4.ggpht.com/-tBF7Xx_o4P0/St4GwlZT3-I/AAAAAAAAJ-4/ggzB5xeSSXo/dulces1.gif.jpg','2011-10-20 08:11:15'),(18,469,65,'1319112830.16.jpg','http://www.coloringpages7.com/Images/animal-coloring-pages/fox-coloring-pages/fox-5-coloring-pages-7-com.jpg','2011-10-20 08:13:50'),(19,470,65,'1319112900.63.jpg','http://www.coloreardibujos.org/wp-content/main/2009_05/mapache-dibujos-para-colorear.jpg','2011-10-20 08:15:01'),(20,31,63,'1319130712.87.jpg','http://galeria.colorir.com/images/painted2/201030/c8cc6cec827c6485e45835b38b4bf853.png','2011-10-20 13:11:54'),(21,471,63,'1319155782.02.jpg','http://www.mode-agentur.info/wp-content/uploads/2009/12/b1_klein150.jpg','2011-10-20 20:09:43'),(22,472,63,'1319155937.39.jpg','http://2.bp.blogspot.com/_18UY_yBMzRo/S6Ev-6BrrAI/AAAAAAAADiY/k6rj2OBOB-k/s400/cal%C3%A7as%2Bcolorir.jpg','2011-10-20 20:12:17'),(23,473,63,'1319156525.99.jpg','http://bp3.blogger.com/_nLZy6cZ8AJw/R4FUggFKgOI/AAAAAAAABEE/F0o7gixY45s/s320/cup_coffee.png','2011-10-20 20:22:06'),(24,474,63,'1319156715.92.jpg','http://www.educima.com/dibujo-para-colorear-hamburguesa-dl10108.jpg','2011-10-20 20:25:15'),(25,475,63,'1319156839.26.jpg','http://4.bp.blogspot.com/-9m2IFGcGxFU/Tk29YVfBYoI/AAAAAAAAACk/ssZv9sN4xr0/s1600/falda-dibujos-para-colorear.jpg','2011-10-20 20:27:19'),(26,476,63,'1319157788.74.jpg','http://www.educima.com/foto-libro-2-p14843.jpg','2011-10-20 20:43:09'),(27,477,63,'1319158025.84.jpg','http://www.supercoloring.com/wp-content/main/2009_05/creamy-cake-coloring-page.jpg','2011-10-20 20:47:06'),(28,478,63,'1319158273.52.jpg','http://www.supercoloring.com/wp-content/main/2009_10/coke-coloring-page.jpg','2011-10-20 20:51:13'),(29,479,63,'1319158349.47.jpg','http://www.blancodesigns.com.br/riscos_desenhos/acessorios/desenho_risco_bolsa1-g.gif','2011-10-20 20:52:30'),(30,480,63,'1319158686.49.jpg','http://www.midi-classics.com/cd.gif','2011-10-20 20:58:06'),(31,481,63,'1319158903.27.jpg','http://lh5.ggpht.com/-VHAT3rKa7-I/SbhdJ4UNsSI/AAAAAAAALcA/E0Z6vWvKWU4/Zapatos.jpg','2011-10-20 21:01:43'),(32,482,63,'1319159126.72.jpg','http://www.clker.com/cliparts/b/0/3/7/1206576685673534961rygle_Hat_Outline.svg.hi.png','2011-10-20 21:05:27'),(33,483,63,'1319159224.74.jpg','http://www.educima.com/dibujo-para-colorear-zapatillas-de-deporte-dm19418.jpg','2011-10-20 21:07:05'),(34,484,63,'1319159312.26.jpg','http://lh6.ggpht.com/-RHX9AL53Jzc/SbTMsbv8j_I/AAAAAAAAHu0/yBMVTteyaNI/Naranja.jpg','2011-10-20 21:08:32'),(42,486,63,'1319199874.9.jpg','http://www.decalsground.com/img_b/vinyl-decal-sticker-621.jpg','2011-10-21 08:24:35'),(41,485,63,'1319199506.18.jpg','http://www.stayuniq.com/shop/1609-1862-thickbox/vero-moda-crazy-time-jeans.jpg','2011-10-21 08:18:26'),(37,487,63,'1319160694.87.jpg','http://lh4.ggpht.com/-f1T9MeUBXoo/S5eSeIf4kVI/AAAAAAAAMpw/BRK_uEm74dU/toalla.jpg','2011-10-20 21:31:35'),(38,488,63,'1319161074.42.jpg','http://www.deskidea.com/es/img2/2011/07/s0888000st-boligrafo-parker-premier-de-luxe-st-34671.gif','2011-10-20 21:37:55'),(43,458,63,'1319200692.28.jpg','http://www.comprascompulsivas.com/wp-content/uploads/2010/06/BackwardsClock_LRG.jpg','2011-10-21 08:38:13'),(44,489,66,'1319447989.32.jpg','http://farm5.static.flickr.com/4021/5122208116_1b8848df63.jpg','2011-10-24 05:19:49'),(45,491,66,'1319553592.97.jpg','http://lh3.ggpht.com/-g8fsPmmWcfo/TOlMUKuhOMI/AAAAAAAAIUw/6kMX3uT4b4c/hamburguesa_t11.jpg','2011-10-25 10:39:53'),(55,497,70,'1319899385.jpg','http://wchaverri.files.wordpress.com/2011/01/abogado.png%3Fw%3D150','2011-10-29 10:43:05'),(51,492,63,'1319583326.12.jpg','http://lh4.ggpht.com/-lrCu3L6Ysz4/S46wVpN7duI/AAAAAAAACGs/dZTzXVNbxGc/Enfermera-ATS.jpg','2011-10-25 18:55:26'),(52,68,63,'1319583729.14.jpg','http://www.clker.com/cliparts/B/w/y/F/H/r/animal-number-one-line-art-hi.png','2011-10-25 19:02:09'),(53,495,70,'1319899262.52.jpg','http://4.bp.blogspot.com/_5Y_DjFtrgXU/SFU8kpQ-gYI/AAAAAAAAAFs/VoZcFlvMbxI/s320/estudiante%2B4.jpg','2011-10-29 10:41:02'),(54,496,70,'1319899330.65.jpg','http://www.educima.com/empleado-t22426.jpg','2011-10-29 10:42:10'),(50,490,63,'1319573807.76.jpg','http://image.spreadshirt.com/image-server/image/design/418559/type/png/width/190/height/190/espana_design.png','2011-10-25 16:16:48'),(56,62,70,'1319899466.13.jpg','http://diarioelcondor.cl/wp-content/uploads/2011/08/profesor-300x276.jpg','2011-10-29 10:44:26'),(57,493,70,'1319899665.08.jpg','http://diarioelcondor.cl/wp-content/uploads/2011/08/profesor-300x276.jpg','2011-10-29 10:47:45'),(58,498,70,'1319899798.62.jpg','http://www.cuentosparacolorear.com/colorear/profesiones/varios/reportera.gif','2011-10-29 10:49:59'),(59,494,70,'1319899985.12.jpg','http://farm3.static.flickr.com/2129/5746677487_40cbc69534.jpg','2011-10-29 10:53:05'),(60,73,70,'1319923293.23.jpg','http://school.discoveryeducation.com/clipart/images/fun-2.gif','2011-10-29 17:21:35'),(61,79,70,'1319923344.33.jpg','http://school.discoveryeducation.com/clipart/images/fun-3.gif','2011-10-29 17:22:24'),(62,499,70,'1319923470.8.jpg','http://haventeam.com/betsie/parser.cgi/0005/www.abcteach.com/free/f/fingerspell_4_bw.jpg','2011-10-29 17:24:31'),(63,89,70,'1319923523.91.jpg','http://school.discoveryeducation.com/clipart/images/fun-5.gif','2011-10-29 17:25:24'),(64,499,70,'1319923611.26.jpg','http://musiccourt.files.wordpress.com/2010/12/4.gif%3Fw%3D800%26h%3D460','2011-10-29 17:26:51'),(65,95,70,'1319923687.03.jpg','http://lh4.ggpht.com/-18Vy2vfq4dk/S99soaX_zHI/AAAAAAAAEyE/GL4TlRK-X2I/n%252525C2%252525BA6%252525C2%252525B4-1.jpg','2011-10-29 17:28:07'),(66,500,70,'1319923751.06.jpg','http://lh5.ggpht.com/-jxegQjN6Vqw/S7s-ay-yYGI/AAAAAAAAQCE/unZG8eL31us/7--1.jpg','2011-10-29 17:29:11'),(67,107,70,'1319923806.3.jpg','http://lh3.ggpht.com/-_G6jHxc32Ig/TZfMRHozzhI/AAAAAAAAcB4/APMxWBCbp0M/n8-1.JPG','2011-10-29 17:30:06'),(68,501,70,'1319923866.04.jpg','http://l.thumbs.canstockphoto.com/canstock5132445.jpg','2011-10-29 17:31:06'),(69,502,70,'1319923929.2.jpg','http://charlestonparliament.com/wp-content/uploads/2011/05/10.png','2011-10-29 17:32:09'),(70,535,69,'1320175323.17.jpg','http://www.luxiosy.com/images/pictures/mexico.jpg','2011-11-01 15:22:03'),(71,536,69,'1320175563.21.jpg','http://image.spreadshirt.net/image-server/v1/compositions/6941612/views/1,width%3D178,height%3D178/negro-usa-estados-unidos-de-america-camiseta_design.png','2011-11-01 15:26:03'),(72,537,69,'1320175634.8.jpg','http://cdn5.fotosearch.com/bthumb/ARP/ARP114/Japan.jpg','2011-11-01 15:27:14'),(73,538,69,'1320175671.91.jpg','http://l.thumbs.canstockphoto.com/canstock6995537.jpg','2011-11-01 15:27:52'),(74,539,69,'1320175739.68.jpg','http://i688.photobucket.com/albums/vv250/14Jazmhine/koreasouth.jpg','2011-11-01 15:29:00'),(75,540,69,'1320175768.37.jpg','http://rajasthan.bjsm.org/home/modules/mod_mappa_italia/images/nero/italia_Italia.gif','2011-11-01 15:29:28'),(76,541,69,'1320175835.78.jpg','http://www.chinamaps.org/images/china-map/maps-of-china/china-blank-map5.gif','2011-11-01 15:30:36'),(77,542,69,'1320175856.53.jpg','http://rlv.zcache.es/icono_del_contorno_de_alemania_folleto-p244592062016788404z85cm_400.jpg','2011-11-01 15:30:57'),(78,543,69,'1320175903.93.jpg','http://l.thumbs.canstockphoto.com/canstock3344992.jpg','2011-11-01 15:31:44'),(79,543,69,'1320175948.96.jpg','http://www.hscripts.com/freeimages/maps/philippines/philippines-map-picture1.gif','2011-11-01 15:32:29'),(80,544,69,'1320176009.25.jpg','http://us.cdn2.123rf.com/168nwm/ludvigcz/ludvigcz0912/ludvigcz091200567/6107036-argentina.jpg','2011-11-01 15:33:31'),(81,545,69,'1320176056.89.jpg','http://0.tqn.com/d/geography/1/0/l/J/ireland.jpg','2011-11-01 15:34:16'),(82,546,69,'1320176109.15.jpg','http://mis.edu.uru.ac.th/learnsquare/courses/308/www.wisegorilla.com/images/worldmaps/india.jpg','2011-11-01 15:35:11'),(83,547,69,'1320176173.76.jpg','http://photos1.fotosearch.com/bthumb/ARP/ARP114/Greece.jpg','2011-11-01 15:36:14'),(84,548,69,'1320176246.1.jpg','http://cdn5.fotosearch.com/bthumb/ARP/ARP114/Canada.jpg','2011-11-01 15:37:26');

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

insert  into `jos_jw_modificacion`(`user_id`,`termino_id`,`fecha`) values (63,29,'2011-10-20 04:38:23'),(63,460,'2011-10-20 04:39:52'),(63,457,'2011-10-20 06:40:28'),(63,458,'2011-10-20 06:47:11'),(65,462,'2011-10-20 08:00:05'),(65,243,'2011-10-20 08:02:26'),(65,255,'2011-10-20 08:08:16'),(65,265,'2011-10-20 08:09:47'),(63,31,'2011-10-20 13:11:54'),(63,486,'2011-10-20 21:27:39'),(66,31,'2011-10-21 04:48:06'),(63,485,'2011-10-21 08:16:22'),(66,489,'2011-10-24 05:19:49'),(66,480,'2011-10-25 10:43:51'),(63,490,'2011-10-25 16:16:48'),(63,480,'2011-10-25 16:27:04'),(63,464,'2011-10-25 16:57:11'),(63,481,'2011-10-25 18:56:05'),(63,68,'2011-10-25 19:02:09'),(63,489,'2011-10-25 20:37:53'),(70,496,'2011-10-29 10:34:53'),(70,495,'2011-10-29 10:36:39'),(70,497,'2011-10-29 10:43:05'),(70,62,'2011-10-29 10:44:26'),(70,493,'2011-10-29 10:47:45'),(70,498,'2011-10-29 10:49:59'),(70,494,'2011-10-29 10:53:05'),(70,73,'2011-10-29 17:21:35'),(70,79,'2011-10-29 17:22:24'),(70,89,'2011-10-29 17:25:24'),(70,499,'2011-10-29 17:26:51'),(70,95,'2011-10-29 17:28:07'),(70,107,'2011-10-29 17:30:06'),(70,68,'2011-10-29 17:33:51'),(70,501,'2011-10-29 17:38:33'),(70,502,'2011-10-29 17:38:47'),(70,506,'2011-10-29 17:46:06'),(68,471,'2011-10-30 13:59:39'),(70,124,'2011-10-30 15:26:42'),(70,125,'2011-10-31 15:04:21'),(68,472,'2011-11-01 09:24:36'),(70,126,'2011-11-01 11:48:36'),(70,127,'2011-11-01 11:50:10'),(70,130,'2011-11-01 11:53:29'),(70,525,'2011-11-01 12:01:10'),(70,512,'2011-11-01 12:05:10'),(70,520,'2011-11-01 12:06:25'),(69,534,'2011-11-01 15:20:25'),(69,543,'2011-11-01 15:32:29');

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
) ENGINE=MyISAM AUTO_INCREMENT=549 DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_termino` */

insert  into `jos_jw_termino`(`id`,`id_user`,`id_user_revision`,`kanji`,`es_kanji`,`kunyomi`,`onyomi`,`kana`,`significado`,`capitulo`,`fecha`) values (1,63,0,'日',1,'ひ、～び、～か','ニチ、二、～ジツ','ひ','Día,sol',1,'2011-10-08 14:20:56'),(2,63,0,'日本',0,NULL,NULL,'にほん、にっぽん','Japón',1,'2011-10-08 14:20:56'),(3,63,0,'日曜日',0,NULL,NULL,'にちようび','Domingo',1,'2011-10-08 14:20:56'),(4,63,0,'三日',0,NULL,NULL,'みっか','El 3er día del mes',1,'2011-10-08 14:20:56'),(5,63,0,'月',1,'つき','ゲツ、ガツ','つき','Luna,mes',1,'2011-10-08 14:20:56'),(6,63,0,'月曜日',0,NULL,NULL,'げつようび','Lunes',1,'2011-10-08 14:20:56'),(7,63,0,'一月',0,NULL,NULL,'いちがつ','Enero',1,'2011-10-08 14:20:56'),(8,63,0,'一ヶ月',0,NULL,NULL,'いっかげつ','1 mes',1,'2011-10-08 14:20:56'),(9,63,0,'木',1,'き','モク、ボク','き','Árbol,madera',1,'2011-10-08 14:20:56'),(10,63,0,'木曜日',0,NULL,NULL,'もくようび','Jueves',1,'2011-10-08 14:20:56'),(11,63,0,'木村',0,NULL,NULL,'きむら','Apellido Japonés',1,'2011-10-08 14:20:56'),(12,63,0,'山',1,'やま','サン','やま','Montaña',1,'2011-10-08 14:20:56'),(13,63,0,'山下',0,NULL,NULL,'やました','Apellido Japonés',1,'2011-10-08 14:20:56'),(14,63,0,'火山',0,NULL,NULL,'かざん','Volcán',1,'2011-10-08 14:20:56'),(15,63,0,'富士山',0,NULL,NULL,'ふじさん','El Monte Fuji',1,'2011-10-08 14:20:56'),(16,63,0,'川',1,'かわ','セン','かわ','Río',1,'2011-10-08 14:20:56'),(17,63,0,'ナイル川',0,NULL,NULL,'ナイルがわ','El río Nilo',1,'2011-10-08 14:20:56'),(18,63,0,'田',1,'た、～だ','デン',NULL,'campo de arroz',1,'2011-10-08 14:20:56'),(19,63,0,'田んぼ',0,NULL,NULL,'たんぼ','Campo de arroz',1,'2011-10-08 14:20:56'),(20,63,0,'田中',0,NULL,NULL,'たなか','Apellido Japonés',1,'2011-10-08 14:20:56'),(21,63,0,'山田',0,NULL,NULL,'やまだ','Apellido Japonés',1,'2011-10-08 14:20:56'),(22,63,0,'人',1,'ひと','ジン、ニン','ひと','Persona',1,'2011-10-08 14:20:56'),(23,63,0,'三人',0,NULL,NULL,'さんいん','3 personas',1,'2011-10-08 14:20:56'),(24,63,0,'日本人',0,NULL,NULL,'にほんじん','Persona de nacionalidad japonesa',1,'2011-10-08 14:20:56'),(25,63,0,'口',1,'くち','コウ','くち','Boca',1,'2011-10-08 14:20:56'),(26,63,0,'入口',0,NULL,NULL,'いりぐち','Entrada',1,'2011-10-08 14:20:56'),(27,63,0,'出口',0,NULL,NULL,'でぐち','Salida',1,'2011-10-08 14:20:56'),(28,63,0,'人口',0,NULL,NULL,'じんこう','Población',1,'2011-10-08 14:20:56'),(29,63,0,'車',1,'くるま','シャ','くるま','Coche',1,'2011-10-08 14:20:56'),(30,63,0,'自動車',0,NULL,NULL,'じどうしゃ','Automóvil',1,'2011-10-08 14:20:56'),(31,63,0,'',0,NULL,NULL,'ぼおし','sombrero',1,'2011-10-08 14:20:56'),(32,63,0,'電車',0,NULL,NULL,'でんしゃ','Tren',1,'2011-10-08 14:20:56'),(33,63,0,'門',1,NULL,'モン','もん','Portal',1,'2011-10-08 14:20:56'),(34,63,0,'専門',0,NULL,NULL,'せんもん','Especialidad',1,'2011-10-08 14:20:56'),(35,63,0,'火',1,'ひ','カ','ひ','Fuego',2,'2011-10-08 14:20:56'),(36,63,0,'火曜日',0,NULL,NULL,'かようび','Martes',2,'2011-10-08 14:20:56'),(37,63,0,'火事',0,NULL,NULL,'かじ','Un fuego',2,'2011-10-08 14:20:56'),(38,63,0,'水',1,'みず','スイ','みず','Agua',2,'2011-10-08 14:20:56'),(39,63,0,'水曜日',0,NULL,NULL,'すいようび','Miércoles',2,'2011-10-08 14:20:56'),(40,63,0,'水田',0,NULL,NULL,'すいでん','Campo de arroz',2,'2011-10-08 14:20:56'),(41,63,0,'お金',0,NULL,NULL,'おかね','Dinero',2,'2011-10-08 14:20:56'),(42,63,0,'金',1,'かね','キン','きん','Oro',2,'2011-10-08 14:20:56'),(43,63,0,'金曜日',0,NULL,NULL,'きにようび','Viernes',2,'2011-10-08 14:20:56'),(44,63,0,'金田',0,NULL,NULL,'かねだ','Apellido Japonés',2,'2011-10-08 14:20:56'),(45,63,0,'土',1,'つち','ド','つち','Tierra',2,'2011-10-08 14:20:56'),(46,63,0,'土曜日',0,NULL,NULL,'どようび','Sábado',2,'2011-10-08 14:20:56'),(47,63,0,'土木工学',0,NULL,NULL,'どぼくどうがく','Ingeniería civil',2,'2011-10-08 14:20:56'),(48,63,0,'土木技師',0,NULL,NULL,'どぼくぎし','Ingeniero civil',2,'2011-10-08 14:20:56'),(49,63,0,'子',1,'こ','シ',NULL,'Niño',2,'2011-10-08 14:20:56'),(50,63,0,'男の子',0,NULL,NULL,'おとこのこ','Niño,chico',2,'2011-10-08 14:20:56'),(51,63,0,'女の子',0,NULL,NULL,'おんあのこ','Niña,chica',2,'2011-10-08 14:20:56'),(52,63,0,'女子学生',0,NULL,NULL,'じょしがくせい','Una estudiante',2,'2011-10-08 14:20:56'),(53,63,0,'女',1,'おんな','ジョ','おんあ','Mujer',2,'2011-10-08 14:20:56'),(54,63,0,'女の人',0,NULL,NULL,'おんあのひと','Mujer',2,'2011-10-08 14:20:56'),(55,63,0,'彼女',0,NULL,NULL,'かのじょ','Ella',2,'2011-10-08 14:20:56'),(56,63,0,'学',1,'まな・ぶ','ガク、カッ～',NULL,'Estudiante',2,'2011-10-08 14:20:56'),(57,63,0,'大学生',0,NULL,NULL,'だいがくせい','Estudiante universitario',2,'2011-10-08 14:20:56'),(58,63,0,'学校',0,NULL,NULL,'がっこう','Escuela',2,'2011-10-08 14:20:56'),(59,63,0,'大学',0,NULL,NULL,'だいがく','Universidad',2,'2011-10-08 14:20:56'),(60,63,0,'生',1,'い・きる、う・まれる','セイ',NULL,'Vivir',2,'2011-10-08 14:20:56'),(61,63,0,'生まれる',0,NULL,NULL,'うまれる','Nacer',2,'2011-10-08 14:20:56'),(62,63,0,'先生',0,NULL,NULL,'せんせい','profesor',2,'2011-10-08 14:20:56'),(63,63,0,'先月',0,NULL,NULL,'せんげつ','El mes pasado',2,'2011-10-08 14:20:56'),(64,63,0,'先週',0,NULL,NULL,'せんしゅう','La semana pasada',2,'2011-10-08 14:20:56'),(65,63,0,'先',1,'さき','セン','さき','Más adelante,punta,extremidad,delante,primero',2,'2011-10-08 14:20:56'),(66,63,0,'私',1,'わたし、わたくし','シ','わたし、わたくし','Yo',2,'2011-10-08 14:20:56'),(67,63,0,'私立大学',0,NULL,NULL,'しりつだいがく','Universidad privada',2,'2011-10-08 14:20:56'),(68,63,0,'一',1,'ひと・つ','イチ','いち','Nº1',3,'2011-10-08 14:20:56'),(69,63,0,'一つ',0,NULL,NULL,'ひとつ','1 cosa',3,'2011-10-08 14:20:56'),(70,63,0,'一人',0,NULL,NULL,'ひとり','1 persona',3,'2011-10-08 14:20:56'),(71,63,0,'一年',0,NULL,NULL,'いちねん','1 año',3,'2011-10-08 14:20:56'),(72,63,0,'一日',0,NULL,NULL,'ついたち','1er día del mes',3,'2011-10-08 14:20:56'),(73,63,0,'二',1,'ふた・つ','二','に','Nº 2',3,'2011-10-08 14:20:56'),(74,63,0,'二月',0,NULL,NULL,'にがつ','Febrero',3,'2011-10-08 14:20:56'),(75,63,0,'二つ',0,NULL,NULL,'ふたつ','2 cosas',3,'2011-10-08 14:20:56'),(76,63,0,'二人',0,NULL,NULL,'ふたり','2 personas',3,'2011-10-08 14:20:56'),(77,63,0,'二年',0,NULL,NULL,'にねん','2 años',3,'2011-10-08 14:20:56'),(78,63,0,'二日',0,NULL,NULL,'ふつか','2º día del mes',3,'2011-10-08 14:20:56'),(79,63,0,'三',1,'みっ・つ','サン','さん','Nº 3',3,'2011-10-08 14:20:56'),(80,63,0,'三月',0,NULL,NULL,'さんがつ','Marzo',3,'2011-10-08 14:20:56'),(81,63,0,'三つ',0,NULL,NULL,'みっつ','3 cosas',3,'2011-10-08 14:20:56'),(82,63,0,'三年',0,NULL,NULL,'さんえん','3 años',3,'2011-10-08 14:20:56'),(83,63,0,'四',1,'よっ・つ、よん、よ','シ','よん、よ','Nº4',3,'2011-10-08 14:20:56'),(84,63,0,'四月',0,NULL,NULL,'しがつ','Abril',3,'2011-10-08 14:20:56'),(85,63,0,'四つ',0,NULL,NULL,'よっつ','4 cosas',3,'2011-10-08 14:20:56'),(86,63,0,'四人',0,NULL,NULL,'よにん','4 personas',3,'2011-10-08 14:20:56'),(87,63,0,'四年',0,NULL,NULL,'よねん','4 años',3,'2011-10-08 14:20:56'),(88,63,0,'四日',0,NULL,NULL,'よっか','4º día del mes',3,'2011-10-08 14:20:56'),(89,63,0,'五',1,'いっ・つ','ゴ','ご','Nº 5',3,'2011-10-08 14:20:56'),(90,63,0,'五月',0,NULL,NULL,'ごがつ','Mayo',3,'2011-10-08 14:20:56'),(91,63,0,'五つ',0,NULL,NULL,'いつつ','5 cosas',3,'2011-10-08 14:20:56'),(92,63,0,'五人',0,NULL,NULL,'ごにん','5 personas',3,'2011-10-08 14:20:56'),(93,63,0,'五年',0,NULL,NULL,'ごねん','5 años',3,'2011-10-08 14:20:56'),(94,63,0,'五日',0,NULL,NULL,'いつか','5o día del mes',3,'2011-10-08 14:20:56'),(95,63,0,'六',1,'むっ・つ','ロク','ろく','Nº 6',3,'2011-10-08 14:20:56'),(96,63,0,'六月',0,NULL,NULL,'ろくがつ','Junio',3,'2011-10-08 14:20:56'),(97,63,0,'六つ',0,NULL,NULL,'むっつ','6 cosas',3,'2011-10-08 14:20:56'),(98,63,0,'六人',0,NULL,NULL,'ろくにん','6 personas',3,'2011-10-08 14:20:56'),(99,63,0,'六年',0,NULL,NULL,'ろくねん','6 años',3,'2011-10-08 14:20:56'),(100,63,0,'六日',0,NULL,NULL,'むいか','6º día del mes',3,'2011-10-08 14:20:56'),(101,63,0,'七',1,'なな・つ、なな','シチ','なな、しち','Nº7',3,'2011-10-08 14:20:56'),(102,63,0,'七月',0,NULL,NULL,'しちがつ','Julio',3,'2011-10-08 14:20:56'),(103,63,0,'七つ',0,NULL,NULL,'ななつ','7 cosas',3,'2011-10-08 14:20:56'),(104,63,0,'七人',0,NULL,NULL,'ななにん、しちにん','7 personas',3,'2011-10-08 14:20:56'),(105,63,0,'七年',0,NULL,NULL,'しちねん','7 años',3,'2011-10-08 14:20:56'),(106,63,0,'七日',0,NULL,NULL,'なのか','7º día del mes',3,'2011-10-08 14:20:56'),(107,63,0,'八',1,'やっ・つ','ハチ','はち','Nº 8',3,'2011-10-08 14:20:56'),(108,63,0,'八月',0,NULL,NULL,'はちがつ','Agosto',3,'2011-10-08 14:20:56'),(109,63,0,'八つ',0,NULL,NULL,'やっつ','8 cosas',3,'2011-10-08 14:20:56'),(110,63,0,'八人',0,NULL,NULL,'はちにん','8 personas',3,'2011-10-08 14:20:56'),(111,63,0,'八年',0,NULL,NULL,'はちねん','8 años',3,'2011-10-08 14:20:56'),(112,63,0,'八日',0,NULL,NULL,'ようか','8º día del mes',3,'2011-10-08 14:20:56'),(113,63,0,'九',1,'ここの・つ','キュウ、ク','く、きゅう','Nº9',3,'2011-10-08 14:20:56'),(114,63,0,'九月',0,NULL,NULL,'くがつ','Septiembre',3,'2011-10-08 14:20:56'),(115,63,0,'九つ',0,NULL,NULL,'ここのつ','9 cosas',3,'2011-10-08 14:20:56'),(116,63,0,'九人',0,NULL,NULL,'きゅうにん','9 personas',3,'2011-10-08 14:20:56'),(117,63,0,'九年',0,NULL,NULL,'きゅうねん','9 años',3,'2011-10-08 14:20:56'),(118,63,0,'九日',0,NULL,NULL,'ここのか','9º día del mes',3,'2011-10-08 14:20:56'),(119,63,0,'十',1,'とお','ジュウ','とお','Nº10,10 cosas',3,'2011-10-08 14:20:56'),(120,63,0,'十月',0,NULL,NULL,'じゅうがつ','Octubre',3,'2011-10-08 14:20:56'),(121,63,0,'十人',0,NULL,NULL,'じゅうにん','10 personas',3,'2011-10-08 14:20:56'),(122,63,0,'十年',0,NULL,NULL,'じゅうねん','10 años',3,'2011-10-08 14:20:56'),(123,63,0,'十日',0,NULL,NULL,'とおか','10º día del mes',3,'2011-10-08 14:20:56'),(124,63,0,'百',1,NULL,'ヒャク','ひゃく','Nº 100',3,'2011-10-08 14:20:56'),(125,63,0,'三百',0,NULL,NULL,'さんびゃく','Nº 300',3,'2011-10-08 14:20:56'),(126,63,0,'六百',0,NULL,NULL,'ろっぴゃく','Nº　600',3,'2011-10-08 14:20:56'),(127,63,0,'八百',0,NULL,NULL,'はっぴゃく','Nº 800',3,'2011-10-08 14:20:56'),(128,63,0,'一千',0,NULL,NULL,'いっせん','Nº1000',3,'2011-10-08 14:20:56'),(129,63,0,'千',1,'ち','セン','せん','Nº1000',3,'2011-10-08 14:20:56'),(130,63,0,'三千',0,NULL,NULL,'さんぜん','Nº 3.000',3,'2011-10-08 14:20:56'),(131,63,0,'八千',0,NULL,NULL,'はっせん','Nº8000',3,'2011-10-08 14:20:56'),(132,63,0,'千葉県',0,NULL,NULL,'ちばけん','Prefectura de Chiva',3,'2011-10-08 14:20:56'),(133,63,0,'百万人',0,NULL,NULL,'ひゃくまんにん','1 millón de personas',3,'2011-10-08 14:20:56'),(134,63,0,'一万円',0,NULL,NULL,'いちまんえん','10000 yenes',3,'2011-10-08 14:20:56'),(135,63,0,'万',1,NULL,'マン','まん','Nº10000',3,'2011-10-08 14:20:56'),(136,63,0,'円',1,NULL,'エン','えん','Yen (moneda japonesa)',3,'2011-10-08 14:20:56'),(137,63,0,'円形',0,NULL,NULL,'えんけい','Círculo',3,'2011-10-08 14:20:56'),(138,63,0,'二千五百六円',0,NULL,NULL,'にせんごひゃくろくえん','2506 yenes',3,'2011-10-08 14:20:56'),(139,63,0,'年',1,'とし','ネン','とし','Año',3,'2011-10-08 14:20:56'),(140,63,0,'年上',0,NULL,NULL,'としうえ','Mayor,de mayor edad',3,'2011-10-08 14:20:56'),(141,63,0,'去年',0,NULL,NULL,'きょねん','El año pasado',3,'2011-10-08 14:20:56'),(142,63,0,'今年',0,NULL,NULL,'ことし','Este año',3,'2011-10-08 14:20:56'),(143,63,0,'来年',0,NULL,NULL,'らいねん','El año próximo',3,'2011-10-08 14:20:56'),(144,63,0,'上',1,'うえ、あ・がる、あ・げる、のぼ・る','ジョウ','うえ','Encima',4,'2011-10-08 14:20:56'),(145,63,0,'上がる',0,NULL,NULL,'あがる','Subir,elevarse',4,'2011-10-08 14:20:56'),(146,63,0,'上げる',0,NULL,NULL,'あげる','Subir,elevar',4,'2011-10-08 14:20:56'),(147,63,0,'上手',0,NULL,NULL,'じょうず','Hábil',4,'2011-10-08 14:20:56'),(148,63,0,'上る',0,NULL,NULL,'のぼる','Subir (a lugares altos)',4,'2011-10-08 14:20:56'),(149,63,0,'下',1,'した、さ・がる、さ・げる、くだ・る、お・りる','カ、ゲ','した','Debajo',4,'2011-10-08 14:20:56'),(150,63,0,'下がる',0,NULL,NULL,'さがる','Bajarse',4,'2011-10-08 14:20:56'),(151,63,0,'下げる',0,NULL,NULL,'さげる','Bajar',4,'2011-10-08 14:20:56'),(152,63,0,'下手',0,NULL,NULL,'へた','Torpe',4,'2011-10-08 14:20:56'),(153,63,0,'地下',0,NULL,NULL,'ちか','Subterraneo',4,'2011-10-08 14:20:56'),(154,63,0,'年下',0,NULL,NULL,'としした','Menor,de menor edad',4,'2011-10-08 14:20:56'),(155,63,0,'下車する',0,NULL,NULL,'げしゃする','Bajar de un vehículo',4,'2011-10-08 14:20:56'),(156,63,0,'中',1,'なか','チュウ、～ジュウ','なか','Dentro',4,'2011-10-08 14:20:56'),(157,63,0,'一日中',0,NULL,NULL,'いちにちじゅう','Todo el día',4,'2011-10-08 14:20:56'),(158,63,0,'中心',0,NULL,NULL,'ちゅうしん','Centro',4,'2011-10-08 14:20:56'),(159,63,0,'中学',0,NULL,NULL,'ちゅうがく','Escuela de secundaria',4,'2011-10-08 14:20:56'),(160,63,0,'中学校',0,NULL,NULL,'ちゅうがっこう','Escuela de secundaria',4,'2011-10-08 14:20:56'),(161,63,0,'大',1,'おお・きい','ダイ、タイ',NULL,'Grande',4,'2011-10-08 14:20:56'),(162,63,0,'大人',0,NULL,NULL,'おとな','Adulto',4,'2011-10-08 14:20:56'),(163,63,0,'大切な',0,NULL,NULL,'たいせつな','Importante',4,'2011-10-08 14:20:56'),(164,63,0,'小',1,'ちい・さい、こ、お','ショウ',NULL,'Pequeño',4,'2011-10-08 14:20:56'),(165,63,0,'小人',0,NULL,NULL,'こども','Niño',4,'2011-10-08 14:20:56'),(166,63,0,'小学校',0,NULL,NULL,'しょうがっこう','Escuela de primaria',4,'2011-10-08 14:20:56'),(167,63,0,'本',1,'もと','ホン','ほん','Libro,raíz,origen,principal,verdad',4,'2011-10-08 14:20:56'),(168,63,0,'山本',0,NULL,NULL,'やまもと','Apellido japonés',4,'2011-10-08 14:20:56'),(169,63,0,'本日',0,NULL,NULL,'ほんじつ','Hoy',4,'2011-10-08 14:20:56'),(170,63,0,'本店',0,NULL,NULL,'ほんてん','Sede,oficina central,central,casa matriz',4,'2011-10-08 14:20:56'),(171,63,0,'半',1,NULL,'ハン',NULL,'Mitad',4,'2011-10-08 14:20:56'),(172,63,0,'半年',0,NULL,NULL,'はんとし','Medio año,6 meses',4,'2011-10-08 14:20:56'),(173,63,0,'半分',0,NULL,NULL,'はんぶん','Mitad,medio',4,'2011-10-08 14:20:56'),(174,63,0,'三時半',0,NULL,NULL,'さんじはん','Las 3 y media',4,'2011-10-08 14:20:56'),(175,63,0,'半日',0,NULL,NULL,'はんいち','Mediodía',4,'2011-10-08 14:20:56'),(176,63,0,'分かる',0,NULL,NULL,'わかる','Entender',4,'2011-10-08 14:20:56'),(177,63,0,'分ける',0,NULL,NULL,'わける','Dividir,partir',4,'2011-10-08 14:20:56'),(178,63,0,'分かれる',0,NULL,NULL,'わかれる','Separarse,ramificarse',4,'2011-10-08 14:20:56'),(179,63,0,'十分',0,NULL,NULL,'じゅっぷん、じっぷん','10 minutos',4,'2011-10-08 14:20:56'),(180,63,0,'五分',0,NULL,NULL,'ごふん','5 minutos',4,'2011-10-08 14:20:56'),(181,63,0,'分',1,'わ・かれる、わ・かる、わ・ける','ブン、フン、～プン','ふん','Minuto',4,'2011-10-08 14:20:56'),(182,63,0,'力',1,'ちから','リョク、リキ','ちから','Poder,fuerza,habilidad',4,'2011-10-08 14:20:56'),(183,63,0,'力学',0,NULL,NULL,'りきがく','Dinámica',4,'2011-10-08 14:20:56'),(184,63,0,'水力',0,NULL,NULL,'すいりょく','El poder del agua',4,'2011-10-08 14:20:56'),(185,63,0,'火力',0,NULL,NULL,'かりょく','El poder del fuego',4,'2011-10-08 14:20:56'),(186,63,0,'何',1,'なに、なん',NULL,'なに、なん','¿Qué?',4,'2011-10-08 14:20:56'),(187,63,0,'何年',0,NULL,NULL,'なんねん','¿Qué año?',4,'2011-10-08 14:20:56'),(188,63,0,'明',1,'あか・るい、あ・ける','メイ',NULL,'Brillante,luz',5,'2011-10-08 14:20:56'),(189,63,0,'明るい',0,NULL,NULL,'あかるい','Claro, luminoso',5,'2011-10-08 14:20:56'),(190,63,0,'明ける',0,NULL,NULL,'あける','Terminar un periodo y empezar otro',5,'2011-10-08 14:20:56'),(191,63,0,'明日',0,NULL,NULL,'あす、あした、みょうにち','Mañana',5,'2011-10-08 14:20:56'),(192,63,0,'説明する',0,NULL,NULL,'せつめいする','Explicar',5,'2011-10-08 14:20:56'),(193,63,0,'休',1,'やす・む','キュウ',NULL,'Descanso',5,'2011-10-08 14:20:56'),(194,63,0,'休む',0,NULL,NULL,'やすむ','Descansar, faltar al trabajo o escuela',5,'2011-10-08 14:20:56'),(195,63,0,'休み',0,NULL,NULL,'やすみ','Vacaciones, día libre',5,'2011-10-08 14:20:56'),(196,63,0,'休日',0,NULL,NULL,'きゅうじつ','Día festivo',5,'2011-10-08 14:20:56'),(197,63,0,'体',1,'やす・む','キュウ','からだ','Cuerpo / Salud',5,'2011-10-08 14:20:56'),(198,63,0,'体力',0,NULL,NULL,'たいりょく','Fuerza física',5,'2011-10-08 14:20:56'),(199,63,0,'体育',0,NULL,NULL,'たいいく','Atletismo, educación física',5,'2011-10-08 14:20:56'),(200,63,0,'好',1,'す・き','コウ',NULL,'Amor,gustar,favorito',5,'2011-10-08 14:20:56'),(201,63,0,'好き',0,NULL,NULL,'すき','Gustar',5,'2011-10-08 14:20:56'),(202,63,0,'好かれる',0,NULL,NULL,'すかれる','Ser querido',5,'2011-10-08 14:20:56'),(203,63,0,'好物',0,NULL,NULL,'こうぶつ','Comida favorita',5,'2011-10-08 14:20:56'),(204,63,0,'男',1,'おとこ','ダン、ナン',NULL,'Hombre,varón,macho',5,'2011-10-08 14:20:56'),(205,63,0,'男の人',0,NULL,NULL,'おとこのひと','Hombre',5,'2011-10-08 14:20:56'),(206,63,0,'男子学生',0,NULL,NULL,'だんしがくせい','Estudiante (masculino)',5,'2011-10-08 14:20:56'),(207,63,0,'長男',0,NULL,NULL,'ちょうなん','Primogénito',5,'2011-10-08 14:20:56'),(208,63,0,'林',1,'はやし','リン','はやし','Bosquecillo',5,'2011-10-08 14:20:56'),(209,63,0,'林業',0,NULL,NULL,'りんぎょう','Silvicultura',5,'2011-10-08 14:20:56'),(210,63,0,'小林',0,NULL,NULL,'こばやし','Apellido japonés',5,'2011-10-08 14:20:56'),(211,63,0,'森',1,'もり','シン','もり','Bosque,selva',5,'2011-10-08 14:20:56'),(212,63,0,'森林',0,NULL,NULL,'しんりん','Selva',5,'2011-10-08 14:20:56'),(213,63,0,'森田',0,NULL,NULL,'もりた','Apellido japonés',5,'2011-10-08 14:20:56'),(214,63,0,'間',1,'あいだ','カン','あいだ','Entre,intervalo',5,'2011-10-08 14:20:56'),(215,63,0,'その間に',0,NULL,NULL,'そのあいだに','Mientras tanto',5,'2011-10-08 14:20:56'),(216,63,0,'間に合う',0,NULL,NULL,'まにあう','Llegar a tiempo',5,'2011-10-08 14:20:56'),(217,63,0,'一年間',0,NULL,NULL,'いちねんかん','Un año',5,'2011-10-08 14:20:56'),(218,63,0,'時間',0,NULL,NULL,'じかん','Tiempo',5,'2011-10-08 14:20:56'),(219,63,0,'畑',1,NULL,'ハタケ、ハタ','はたけ','Campo cultivado',5,'2011-10-08 14:20:56'),(220,63,0,'田畑',0,NULL,NULL,'たはた','Campos',5,'2011-10-08 14:20:56'),(221,63,0,'花畑',0,NULL,NULL,'はなばた','Jardín de flores',5,'2011-10-08 14:20:56'),(222,63,0,'岩',1,'いわ','ガン','いわ','Roca',5,'2011-10-08 14:20:56'),(223,63,0,'岩石',0,NULL,NULL,'がんせき','Roca',5,'2011-10-08 14:20:56'),(224,63,0,'岩山',0,NULL,NULL,'いわやま','Montaña rocosa',5,'2011-10-08 14:20:56'),(225,63,0,'岩田',0,NULL,NULL,'いわた','Apellido japonés',5,'2011-10-08 14:20:56'),(226,63,0,'火山岩',0,NULL,NULL,'かざんがん','Roca volcánica',5,'2011-10-08 14:20:56'),(227,63,0,'目',1,'め','モク','め','Ojo, vista,cosa',6,'2011-10-08 14:20:56'),(228,63,0,'目次',0,NULL,NULL,'もくじ','Índice',6,'2011-10-08 14:20:56'),(229,63,0,'目上',0,NULL,NULL,'めうえ','Superior',6,'2011-10-08 14:20:56'),(230,63,0,'目下',0,NULL,NULL,'めした','Inferior',6,'2011-10-08 14:20:56'),(231,63,0,'耳',1,'みみ','ジ','みみ','Oreja',6,'2011-10-08 14:20:56'),(232,63,0,'耳鼻科',0,NULL,NULL,'じびか','Otorrinología',6,'2011-10-08 14:20:56'),(233,63,0,'手',1,'て','シュ','て','Mano',6,'2011-10-08 14:20:56'),(234,63,0,'手紙',0,NULL,NULL,'てがみ','Carta',6,'2011-10-08 14:20:56'),(235,63,0,'歌手',0,NULL,NULL,'かしゅ','Cantante',6,'2011-10-08 14:20:56'),(236,63,0,'足',1,'あし、た・りる、た・す','ソク','あし','Pierna,par,suficiente',6,'2011-10-08 14:20:56'),(237,63,0,'二足',0,NULL,NULL,'にそく','2 pares',6,'2011-10-08 14:20:56'),(238,63,0,'足りる',0,NULL,NULL,'たりる','Bastar, ser suficiente',6,'2011-10-08 14:20:56'),(239,63,0,'足す',0,NULL,NULL,'たす','Sumar',6,'2011-10-08 14:20:56'),(240,63,0,'雨',1,'あめ','ウ','あめ','Lluvia',6,'2011-10-08 14:20:56'),(241,63,0,'雨天',0,NULL,NULL,'うてん','Lluvia',6,'2011-10-08 14:20:56'),(242,63,0,'大雨',0,NULL,NULL,'おおあめ','Tormenta',6,'2011-10-08 14:20:56'),(243,63,0,'竹',1,'たけ','チク','たけ','Bambú',6,'2011-10-08 14:20:56'),(244,63,0,'竹田',0,NULL,NULL,'たけだ','Apellido japonés',6,'2011-10-08 14:20:56'),(245,63,0,'竹の子',0,NULL,NULL,'たけのこ','Brote de bambú',6,'2011-10-08 14:20:56'),(246,63,0,'米',1,'こめ','マイ、ベイ','こめ','Arroz,América',6,'2011-10-08 14:20:56'),(247,63,0,'中米',0,NULL,NULL,'ちゅうべい','Centro América',6,'2011-10-08 14:20:56'),(248,63,0,'米国',0,NULL,NULL,'べいこく','América',6,'2011-10-08 14:20:56'),(249,63,0,'新米',0,NULL,NULL,'しんまい','Arroz de la última cosecha',6,'2011-10-08 14:20:56'),(250,63,0,'貝',1,'かい','バイ','かい','Crustaceo',6,'2011-10-08 14:20:56'),(251,63,0,'貝殻',0,NULL,NULL,'かいがら','Concha',6,'2011-10-08 14:20:56'),(252,63,0,'石',1,'いし','セキ','いし','Piedra',6,'2011-10-08 14:20:56'),(253,63,0,'石油',0,NULL,NULL,'せきゆ','Petróleo',6,'2011-10-08 14:20:56'),(254,63,0,'化石',0,NULL,NULL,'かせき','Fósil',6,'2011-10-08 14:20:56'),(255,63,0,'糸',1,'いと','し','いと','Hilo,cuerda',6,'2011-10-08 14:20:56'),(256,63,0,'毛糸',0,NULL,NULL,'けいと','(hilo de) lana',6,'2011-10-08 14:20:56'),(257,63,0,'花',1,'はな','カ','はな','Flor',7,'2011-10-08 14:20:56'),(258,63,0,'花火',0,NULL,NULL,'はなび','Fuegos artificiales',7,'2011-10-08 14:20:56'),(259,63,0,'花びん',0,NULL,NULL,'かびん','Jarrón',7,'2011-10-08 14:20:56'),(260,63,0,'茶',1,NULL,'チャ、サ',NULL,'Té',7,'2011-10-08 14:20:56'),(261,63,0,'日本茶',0,NULL,NULL,'にほんちゃ','Té japonés',7,'2011-10-08 14:20:56'),(262,63,0,'お茶',0,NULL,NULL,'おちゃ','Té japonés',7,'2011-10-08 14:20:56'),(263,63,0,'紅茶',0,NULL,NULL,'こうちゃ','Té inglés',7,'2011-10-08 14:20:56'),(264,63,0,'喫茶店',0,NULL,NULL,'きっさんてん','Cafetería',7,'2011-10-08 14:20:56'),(265,63,0,'肉',1,NULL,'ニク','にく','Carne',7,'2011-10-08 14:20:56'),(266,63,0,'牛肉',0,NULL,NULL,'ぎゅうにく','Carne de ternera',7,'2011-10-08 14:20:56'),(267,63,0,'鳥肉',0,NULL,NULL,'とりにく','Carne de pollo',7,'2011-10-08 14:20:56'),(268,63,0,'肉体',0,NULL,NULL,'にくたい','Cuerpo',7,'2011-10-08 14:20:56'),(269,63,0,'文',1,NULL,'ブン','ぶん','Oración',7,'2011-10-08 14:20:56'),(270,63,0,'文学',0,NULL,NULL,'ぶんがく','Literatura',7,'2011-10-08 14:20:56'),(271,63,0,'文部省',0,NULL,NULL,'もんぶしょう','Ministerio de educación',7,'2011-10-08 14:20:56'),(272,63,0,'文部科学省',0,NULL,NULL,'もんぶかがくしょう','Ministerio de educación',7,'2011-10-08 14:20:56'),(273,63,0,'字',1,NULL,'ジ','じ','Letra, escritura',7,'2011-10-08 14:20:56'),(274,63,0,'文字',0,NULL,NULL,'もじ、もんじ','Letra, escritura',7,'2011-10-08 14:20:56'),(275,63,0,'漢字',0,NULL,NULL,'かんじ','Kanji',7,'2011-10-08 14:20:56'),(276,63,0,'数字',0,NULL,NULL,'すうじ','Números',7,'2011-10-08 14:20:56'),(277,63,0,'物',1,'もの','ブツ、モツ','もの','Cosa',7,'2011-10-08 14:20:56'),(278,63,0,'生物',0,NULL,NULL,'せいぶつ','Ser vivo',7,'2011-10-08 14:20:56'),(279,63,0,'買い物',0,NULL,NULL,'かいもの','Compra',7,'2011-10-08 14:20:56'),(280,63,0,'飲み物',0,NULL,NULL,'のみもの','Bebida',7,'2011-10-08 14:20:56'),(281,63,0,'食べ物',0,NULL,NULL,'たべもの','Comida',7,'2011-10-08 14:20:56'),(282,63,0,'乗り物',0,NULL,NULL,'のりもの','Vehículo',7,'2011-10-08 14:20:56'),(283,63,0,'見物する',0,NULL,NULL,'けんぶつする','Visitar',7,'2011-10-08 14:20:56'),(284,63,0,'荷物',0,NULL,NULL,'にもつ','Paquete, equipaje',7,'2011-10-08 14:20:56'),(285,63,0,'牛',1,'うし','ギュウ','うし','Vaca,toro,ganado',7,'2011-10-08 14:20:56'),(286,63,0,'子牛',0,NULL,NULL,'こうし','Ternera',7,'2011-10-08 14:20:56'),(287,63,0,'牛乳',0,NULL,NULL,'ぎゅうにゅう','Leche',7,'2011-10-08 14:20:56'),(288,63,0,'馬',1,'うま','バ','うま','Caballo',7,'2011-10-08 14:20:56'),(289,63,0,'馬車',0,NULL,NULL,'ばしゃ','Carruaje, carro',7,'2011-10-08 14:20:56'),(290,63,0,'馬力',0,NULL,NULL,'ばりき','Caballos de vapor',7,'2011-10-08 14:20:56'),(291,63,0,'馬肉',0,NULL,NULL,'ばにく','Carne de caballo',7,'2011-10-08 14:20:56'),(292,63,0,'鳥',1,'とり','チョウ','とり','Ave',7,'2011-10-08 14:20:56'),(293,63,0,'白鳥',0,NULL,NULL,'はくちょう','Cisne',7,'2011-10-08 14:20:57'),(294,63,0,'野鳥',0,NULL,NULL,'やちょう','Pájaro silvestre',7,'2011-10-08 14:20:57'),(295,63,0,'焼き鳥',0,NULL,NULL,'やきとり','Pincho de pollo asado',7,'2011-10-08 14:20:57'),(296,63,0,'一石二鳥',0,NULL,NULL,'いっせきにちょう','Matar dos pájaros de un tiro',7,'2011-10-08 14:20:57'),(297,63,0,'魚',1,'さかな、うお','ギョ','さかな','Pez, pescado',7,'2011-10-08 14:20:57'),(298,63,0,'人魚',0,NULL,NULL,'にんぎょ','Sirena',7,'2011-10-08 14:20:57'),(299,63,0,'焼き魚',0,NULL,NULL,'やきざかな','Pescado asado',7,'2011-10-08 14:20:57'),(300,63,0,'金魚',0,NULL,NULL,'きんぎょ','Pececillo de colores',7,'2011-10-08 14:20:57'),(301,63,0,'新',1,'あたら・しい','シン',NULL,'Nuevo',8,'2011-10-08 14:20:57'),(302,63,0,'新しい',0,NULL,NULL,'あたらしい','Nuevo',8,'2011-10-08 14:20:57'),(303,63,0,'新車',0,NULL,NULL,'しんしゃ','Coche nuevo',8,'2011-10-08 14:20:57'),(304,63,0,'新聞',0,NULL,NULL,'しんぶん','Periódico',8,'2011-10-08 14:20:57'),(305,63,0,'新年',0,NULL,NULL,'しんねん','Año nuevo',8,'2011-10-08 14:20:57'),(306,63,0,'古',1,'ふる・い','コ',NULL,'Viejo',8,'2011-10-08 14:20:57'),(307,63,0,'古い',0,NULL,NULL,'ふるい','Viejo',8,'2011-10-08 14:20:57'),(308,63,0,'古本',0,NULL,NULL,'ふるほん','Libro viejo',8,'2011-10-08 14:20:57'),(309,63,0,'中古車',0,NULL,NULL,'ちゅうこしゃ','Coche de 2ª mano',8,'2011-10-08 14:20:57'),(310,63,0,'長',1,'なが・い','チョウ',NULL,'Largo',8,'2011-10-08 14:20:57'),(311,63,0,'長い',0,NULL,NULL,'ながい','Largo',8,'2011-10-08 14:20:57'),(312,63,0,'長野県',0,NULL,NULL,'ながのけん','Prefectura de Nagano',8,'2011-10-08 14:20:57'),(313,63,0,'長女',0,NULL,NULL,'ちょうじょ','Primogénita',8,'2011-10-08 14:20:57'),(314,63,0,'学長',0,NULL,NULL,'がくちょう','Rector/a de universidad',8,'2011-10-08 14:20:57'),(315,63,0,'校長',0,NULL,NULL,'こうちょう','Director de la escuela',8,'2011-10-08 14:20:57'),(316,63,0,'社長',0,NULL,NULL,'しゃちょう','Presidente de la compañía',8,'2011-10-08 14:20:57'),(317,63,0,'課長',0,NULL,NULL,'かちょう','Jefe de departamento',8,'2011-10-08 14:20:57'),(318,63,0,'短',1,'みじか・い','タン',NULL,'Corto',8,'2011-10-08 14:20:57'),(319,63,0,'短い',0,NULL,NULL,'みじかい','Corto',8,'2011-10-08 14:20:57'),(320,63,0,'短時間',0,NULL,NULL,'たんじかん','Poco tiempo',8,'2011-10-08 14:20:57'),(321,63,0,'短大',0,NULL,NULL,'たんだい','Universidad para carreras de 2 años',8,'2011-10-08 14:20:57'),(322,63,0,'高',1,'たか・い','コウ',NULL,'Caro,Alto',8,'2011-10-08 14:20:57'),(323,63,0,'高い',0,NULL,NULL,'たかい','Caro,Alto',8,'2011-10-08 14:20:57'),(324,63,0,'高橋',0,NULL,NULL,'たかはし','Apellido japonés',8,'2011-10-08 14:20:57'),(325,63,0,'高校',0,NULL,NULL,'こうこう','Instituto de bachillerato',8,'2011-10-08 14:20:57'),(326,63,0,'高等学校',0,NULL,NULL,'こうとうがっこう','Instituto de bachillerato',8,'2011-10-08 14:20:57'),(327,63,0,'高速',0,NULL,NULL,'こうそく','Alta velocidad',8,'2011-10-08 14:20:57'),(328,63,0,'高速道路',0,NULL,NULL,'こうそくどうろ','Autopista',8,'2011-10-08 14:20:57'),(329,63,0,'安',1,'やす・い','アン',NULL,'Barato',8,'2011-10-08 14:20:57'),(330,63,0,'安い',0,NULL,NULL,'やすい','Barato',8,'2011-10-08 14:20:57'),(331,63,0,'安全な',0,NULL,NULL,'あんぜんな','Seguro',8,'2011-10-08 14:20:57'),(332,63,0,'安心する',0,NULL,NULL,'あんしんする','Tranquilizarse',8,'2011-10-08 14:20:57'),(333,63,0,'安売り',0,NULL,NULL,'やすうり','Venta de saldos',8,'2011-10-08 14:20:57'),(334,63,0,'低',1,'ひく・い','テイ',NULL,'Bajo',8,'2011-10-08 14:20:57'),(335,63,0,'低い',0,NULL,NULL,'ひくい','Bajo',8,'2011-10-08 14:20:57'),(336,63,0,'低温',0,NULL,NULL,'ていおん','Temperatura baja',8,'2011-10-08 14:20:57'),(337,63,0,'暗',1,'くら・い','アン',NULL,'Oscuro',8,'2011-10-08 14:20:57'),(338,63,0,'暗い',0,NULL,NULL,'くらい','Oscuro',8,'2011-10-08 14:20:57'),(339,63,0,'暗室',0,NULL,NULL,'あんしつ','Cuarto oscuro',8,'2011-10-08 14:20:57'),(340,63,0,'多',1,'おお・い','タ',NULL,'Bastante,Mucho',8,'2011-10-08 14:20:57'),(341,63,0,'多い',0,NULL,NULL,'おおい','Haber en abundancia',8,'2011-10-08 14:20:57'),(342,63,0,'多数',0,NULL,NULL,'たすう','Número',8,'2011-10-08 14:20:57'),(343,63,0,'多少',0,NULL,NULL,'たしょう','Algo',8,'2011-10-08 14:20:57'),(344,63,0,'少',1,'すく・ない、すこ・し','ショウ',NULL,'Poco',8,'2011-10-08 14:20:57'),(345,63,0,'少ない',0,NULL,NULL,'すくない','Haver poco',8,'2011-10-08 14:20:57'),(346,63,0,'少し',0,NULL,NULL,'すこし','Poco',8,'2011-10-08 14:20:57'),(347,63,0,'少年',0,NULL,NULL,'しょうねん','Joven, muchacho',8,'2011-10-08 14:20:57'),(348,63,0,'少女',0,NULL,NULL,'しょうじょ','Chica, muchacha',8,'2011-10-08 14:20:57'),(349,63,0,'少年雑誌',0,NULL,NULL,'しょうねんざっし','Revista para chicos',8,'2011-10-08 14:20:57'),(350,63,0,'少女雑誌',0,NULL,NULL,'しょうじょざっし','Revista para chicas',8,'2011-10-08 14:20:57'),(351,64,0,'行',1,'いく・、おこな・う','コウ、ギョウ',NULL,'Ir,llevar a cabo,línea',9,'2011-10-08 14:20:57'),(352,64,0,'行う',0,NULL,NULL,'おこなう','Hacer,actuar,efectuar',9,'2011-10-08 14:20:57'),(353,64,0,'行く',0,NULL,NULL,'いく','Ir',9,'2011-10-08 14:20:57'),(354,64,0,'行う',0,NULL,NULL,'おこなう','Hacer,actuar,efectuar',9,'2011-10-08 14:20:57'),(355,64,0,'旅行',0,NULL,NULL,'りょこう','Viaje',9,'2011-10-08 14:20:57'),(356,64,0,'二行目',0,NULL,NULL,'にぎょうめ','2ª línea',9,'2011-10-08 14:20:57'),(357,64,0,'来',1,'く・る','ライ',NULL,'venir',9,'2011-10-08 14:20:57'),(358,64,0,'来る',0,NULL,NULL,'くる','venir',9,'2011-10-08 14:20:57'),(359,64,0,'帰国する',0,NULL,NULL,'きこくする','regresar a su país',9,'2011-10-08 14:20:57'),(360,64,0,'帰す',0,NULL,NULL,'かえす','hacer volver,hacer regresar',9,'2011-10-08 14:20:57'),(361,64,0,'食',1,'た・べる','ショク',NULL,'comer',9,'2011-10-08 14:20:57'),(362,64,0,'食べる',0,NULL,NULL,'たべる','comer',9,'2011-10-08 14:20:57'),(363,64,0,'食事',0,NULL,NULL,'しょくじ','Comida',9,'2011-10-08 14:20:57'),(364,64,0,'食べもの',0,NULL,NULL,'たべもの','comida',9,'2011-10-08 14:20:57'),(365,64,0,'夕食',0,NULL,NULL,'ゆうくじ','almuerzo',9,'2011-10-08 14:20:57'),(366,64,0,'飲',1,'の・む','イン',NULL,'beber',9,'2011-10-08 14:20:57'),(367,64,0,'飲む',0,NULL,NULL,'のむ','beber',9,'2011-10-08 14:20:57'),(368,64,0,'飲み物',0,NULL,NULL,'のみもの','bebida',9,'2011-10-08 14:20:57'),(369,64,0,'飲酒',0,NULL,NULL,'いんしゅ','beber alcohol',9,'2011-10-08 14:20:57'),(370,64,0,'見',1,'み・る、み・える、み・せる','ケン',NULL,'ver,mirar',9,'2011-10-08 14:20:57'),(371,64,0,'みる',0,NULL,NULL,'みる','ver,mirar',9,'2011-10-08 14:20:57'),(372,64,0,'見える',0,NULL,NULL,'みえる','verse',9,'2011-10-08 14:20:57'),(373,64,0,'見せる',0,NULL,NULL,'みせる','mostrar',9,'2011-10-08 14:20:57'),(374,64,0,'意見',0,NULL,NULL,'いけん','opinión',9,'2011-10-08 14:20:57'),(375,64,0,'見物する',0,NULL,NULL,'けんぶつする','visitar(turismo)',9,'2011-10-08 14:20:57'),(376,64,0,'聞',1,'き・く、き・こえる','ブン',NULL,'oir,preguntar',9,'2011-10-08 14:20:57'),(377,64,0,'聞く',0,NULL,NULL,'きく','oir,preguntar',9,'2011-10-08 14:20:57'),(378,64,0,'聞こえる',0,NULL,NULL,'きこえる','oirse',9,'2011-10-08 14:20:57'),(379,64,0,'新聞',0,NULL,NULL,'しんぶん','diario',9,'2011-10-08 14:20:57'),(380,64,0,'読',1,'よ・む','ドク',NULL,'leer',9,'2011-10-08 14:20:57'),(381,64,0,'読む',0,NULL,NULL,'よむ','leer',9,'2011-10-08 14:20:57'),(382,64,0,'読み',0,NULL,NULL,'よみ','manera de leer,pronunciación',9,'2011-10-08 14:20:57'),(383,64,0,'読者',0,NULL,NULL,'どくしゃ','lector',9,'2011-10-08 14:20:57'),(384,64,0,'読書',0,NULL,NULL,'どくしょ','lectura(como actividad)',9,'2011-10-08 14:20:57'),(385,64,0,'書',1,'か・く','ショク',NULL,'escribir, libro, documento',9,'2011-10-08 14:20:57'),(386,64,0,'書く',0,NULL,NULL,'かく','escribir',9,'2011-10-08 14:20:57'),(387,64,0,'下書き',0,NULL,NULL,'したがき','borrador',9,'2011-10-08 14:20:57'),(388,64,0,'書道',0,NULL,NULL,'しょどう','caligrafía japonesa',9,'2011-10-08 14:20:57'),(389,64,0,'書店',0,NULL,NULL,'しょてん','librería',9,'2011-10-08 14:20:57'),(390,64,0,'話',1,'はな・す','ワ',NULL,'hablar',9,'2011-10-08 14:20:57'),(391,64,0,'話す',0,NULL,NULL,'はなす','hablar',9,'2011-10-08 14:20:57'),(392,64,0,'話',0,NULL,NULL,'はなし','historia,lo que se cuenta',9,'2011-10-08 14:20:57'),(393,64,0,'会話',0,NULL,NULL,'かいわ','conversación',9,'2011-10-08 14:20:57'),(394,64,0,'電話',0,NULL,NULL,'でんわ','teléfono',9,'2011-10-08 14:20:57'),(395,64,0,'買',1,'か・う','バイ',NULL,'comprar',9,'2011-10-08 14:20:57'),(396,64,0,'買う',0,NULL,NULL,'かう','comprar',9,'2011-10-08 14:20:57'),(397,64,0,'買い物',0,NULL,NULL,'かいもの','compra',9,'2011-10-08 14:20:57'),(398,64,0,'教',1,'おし・える','ギョウ',NULL,'enseñar',9,'2011-10-08 14:20:57'),(399,64,0,'教える',0,NULL,NULL,'おしえる','enseñar',9,'2011-10-08 14:20:57'),(400,64,0,'教育',0,NULL,NULL,'きょういく','educación,enseñanza',9,'2011-10-08 14:20:57'),(401,64,0,'居室',0,NULL,NULL,'きょうしつ','aula',9,'2011-10-08 14:20:57'),(402,64,0,'協会',0,NULL,NULL,'きょうかい','iglesia',9,'2011-10-08 14:20:57'),(403,64,0,'朝',1,'あさ','チョウ','あさ','mañana',10,'2011-10-08 14:20:57'),(404,64,0,'朝日',0,NULL,NULL,'あさひ','sol de la mañana/naciente',10,'2011-10-08 14:20:57'),(405,64,0,'朝食',0,NULL,NULL,'ちょうしょく','desayuno',10,'2011-10-08 14:20:57'),(406,64,0,'昼',1,'ひる','チュウ','ひる','mediodía,día',10,'2011-10-08 14:20:57'),(407,64,0,'昼食',0,NULL,NULL,'ひるごはん','almuerzo',10,'2011-10-08 14:20:57'),(408,64,0,'昼寝する',0,NULL,NULL,'ひるねする','hacer la siesta',10,'2011-10-08 14:20:57'),(409,64,0,'昼休み',0,NULL,NULL,'ひるやすみ','descanso para almorzar',10,'2011-10-08 14:20:57'),(410,64,0,'夜',1,'よる、よ','ヤ','よる','noche',10,'2011-10-08 14:20:57'),(411,64,0,'今夜',0,NULL,NULL,'こんや','esta noche',10,'2011-10-08 14:20:57'),(412,64,0,'夜食',0,NULL,NULL,'やしょく','resopón',10,'2011-10-08 14:20:57'),(413,64,0,'晩',1,'ばん','バン','ばん','noche,primera parte de la noche',10,'2011-10-08 14:20:57'),(414,64,0,'今晩',0,NULL,NULL,'こんばん','esta noche',10,'2011-10-08 14:20:57'),(415,64,0,'晩御飯',0,NULL,NULL,'ばんごはん','cena',10,'2011-10-08 14:20:57'),(416,64,0,'夕',1,'ゆう','セキ',NULL,'atardecer',10,'2011-10-08 14:20:57'),(417,64,0,'夕べ',0,NULL,NULL,'ゆうべ','atardecer/anochecer',10,'2011-10-08 14:20:57'),(418,64,0,'夕食',0,NULL,NULL,'ゆうしょく','cena',10,'2011-10-08 14:20:57'),(419,64,0,'七夕',0,NULL,NULL,'たなばた','fiesta de las estrellas',10,'2011-10-08 14:20:57'),(420,64,0,'方',1,'かた、~がた','ホウ',NULL,'dirección,manera,persona (formal)',10,'2011-10-08 14:20:57'),(421,64,0,'食べ方',0,NULL,NULL,'たべかた','manera de comer',10,'2011-10-08 14:20:57'),(422,64,0,'方法',0,NULL,NULL,'ほうほう','manera',10,'2011-10-08 14:20:57'),(423,64,0,'~ほう',0,NULL,NULL,'~ほう','dirección',10,'2011-10-08 14:20:57'),(424,64,0,'夕方',0,NULL,NULL,'ゆうがた','atardecer',10,'2011-10-08 14:20:57'),(425,64,0,'午',1,NULL,'ゴ',NULL,'mediodía',10,'2011-10-08 14:20:57'),(426,64,0,'午前',0,NULL,NULL,'ごぜん','antes mediodía',10,'2011-10-08 14:20:57'),(427,64,0,'午後',0,NULL,NULL,'ごご','después mediodía',10,'2011-10-08 14:20:57'),(428,64,0,'正午',0,NULL,NULL,'しょうご','mediodía',10,'2011-10-08 14:20:57'),(429,64,0,'前',1,'まえ','ゼン','まえ','antes,delante',10,'2011-10-08 14:20:57'),(430,64,0,'一年前',0,NULL,NULL,'いちねんまえ','hace un año',10,'2011-10-08 14:20:57'),(431,64,0,'前半',0,NULL,NULL,'ぜんはん','primera mitad',10,'2011-10-08 14:20:57'),(432,64,0,'前方',0,NULL,NULL,'ぜんぽう','hacia delante',10,'2011-10-08 14:20:57'),(433,64,0,'後',1,'あと、のち、うしろ','ゴ、コウ','あと','después,detrás',10,'2011-10-08 14:20:57'),(434,64,0,'~年後',0,NULL,NULL,'~ねんご','x años más tarde',10,'2011-10-08 14:20:57'),(435,64,0,'後ろ',0,NULL,NULL,'うしろ','detrás',10,'2011-10-08 14:20:57'),(436,64,0,'後半',0,NULL,NULL,'こうはん','segunda mitad',10,'2011-10-08 14:20:57'),(437,64,0,'毎',1,'~ごと','マイ',NULL,'cada',10,'2011-10-08 14:20:57'),(438,64,0,'毎日',0,NULL,NULL,'まいにち','cada día',10,'2011-10-08 14:20:57'),(439,64,0,'毎朝',0,NULL,NULL,'まいあさ','cada mañana',10,'2011-10-08 14:20:57'),(440,64,0,'毎夕、毎晩、毎夜',0,NULL,NULL,'まいゆう、まいばん、まいよ','cada noche',10,'2011-10-08 14:20:57'),(441,64,0,'毎年',0,NULL,NULL,'まいねん','cada año',10,'2011-10-08 14:20:57'),(442,64,0,'毎週',0,NULL,NULL,'まいしゅう','cada semana',10,'2011-10-08 14:20:57'),(443,64,0,'毎月',0,NULL,NULL,'まいげつ','cada mes',10,'2011-10-08 14:20:57'),(444,64,0,'毎度',0,NULL,NULL,'まいど','cada vez',10,'2011-10-08 14:20:57'),(445,64,0,'週',1,'せんにゅう','シュウ',NULL,'semana',10,'2011-10-08 14:20:57'),(446,64,0,'先週、今週、来週',0,NULL,NULL,'せんしゅう、こんしゅう、らいしゅう','semana pasada, esta, próxima',10,'2011-10-08 14:20:57'),(447,64,0,'週末',0,NULL,NULL,'しゅうまつ','fin de semana',10,'2011-10-08 14:20:57'),(448,64,0,'一週間',0,NULL,NULL,'いっしゅうかん','una semana',10,'2011-10-08 14:20:57'),(449,64,0,'曜',1,'ひへん','ヨウ',NULL,'dia de la semana',10,'2011-10-08 14:20:57'),(450,64,0,'何曜日',0,NULL,NULL,'なんようび','qué día de la semana',10,'2011-10-08 14:20:57'),(451,64,0,'月曜日',0,NULL,NULL,'げつようび','lunes',10,'2011-10-08 14:20:57'),(457,65,0,'本',0,NULL,NULL,'ほん','Libro',NULL,'2011-10-12 20:27:24'),(458,65,0,'',0,NULL,NULL,'とけい','Reloj',NULL,'2011-10-12 20:34:52'),(459,65,0,'大きい',0,NULL,NULL,'おおきい','Grande',NULL,'2011-10-12 20:36:18'),(460,65,0,'',0,NULL,NULL,'かさ','Paraguas',NULL,'2011-10-19 14:10:12'),(461,65,0,'',0,NULL,NULL,'いす','Silla',NULL,'2011-10-19 14:11:03'),(462,65,0,'',0,NULL,NULL,'いえ','Casa',NULL,'2011-10-20 07:59:39'),(463,65,0,'',0,NULL,NULL,'ねこ','Gato',NULL,'2011-10-20 08:03:19'),(464,65,0,'',0,NULL,NULL,'いぬ','Perro',NULL,'2011-10-20 08:03:57'),(465,65,0,'',0,NULL,NULL,'つえ','Bastón',NULL,'2011-10-20 08:07:06'),(466,65,0,'',0,NULL,NULL,'なす','Berenjena',NULL,'2011-10-20 08:09:17'),(467,65,0,'',0,NULL,NULL,'きのこ','Setas',NULL,'2011-10-20 08:10:29'),(468,65,0,'',0,NULL,NULL,'おかし','Dulces',NULL,'2011-10-20 08:11:15'),(469,65,0,'',0,NULL,NULL,'きつね','Zorro',NULL,'2011-10-20 08:13:50'),(470,65,0,'',0,NULL,NULL,'たぬき','Mapache',NULL,'2011-10-20 08:15:01'),(471,63,0,'',0,NULL,NULL,'ブラウス','blusa',NULL,'2011-10-20 20:09:43'),(472,63,0,'',0,NULL,NULL,'ズボン','pantalones',NULL,'2011-10-20 20:12:17'),(473,63,0,'',0,NULL,NULL,'コーヒー','café',NULL,'2011-10-20 20:22:06'),(474,63,0,'',0,NULL,NULL,'ハンバーガー','hamburguesa',NULL,'2011-10-20 20:25:15'),(475,63,0,'',0,NULL,NULL,'スカート','falda',NULL,'2011-10-20 20:27:19'),(476,63,0,'小説',0,NULL,NULL,'しょおせつ','novela',NULL,'2011-10-20 20:43:09'),(477,63,0,'',0,NULL,NULL,'ケーキ','pastel',NULL,'2011-10-20 20:47:06'),(478,63,0,'',0,NULL,NULL,'コーラ','refresco de cola',NULL,'2011-10-20 20:51:13'),(479,63,0,'',0,NULL,NULL,'かばん','bolso',NULL,'2011-10-20 20:52:30'),(480,63,0,'',0,NULL,NULL,'シーヂー','CD Rom',NULL,'2011-10-20 20:58:06'),(481,63,0,'靴',0,NULL,NULL,'くつ','zapatos',NULL,'2011-10-20 21:01:43'),(482,63,0,'帽子',0,NULL,NULL,'ぼうし','sombrero',NULL,'2011-10-20 21:05:27'),(483,63,0,'',0,NULL,NULL,'スーニカー','zapatillas deportivas',NULL,'2011-10-20 21:07:05'),(484,63,0,'',0,NULL,NULL,'オレンジ','naranja',NULL,'2011-10-20 21:08:32'),(485,63,0,'',0,NULL,NULL,'ジーンズ','pantalones tejanos',NULL,'2011-10-20 21:12:01'),(486,63,0,'',0,NULL,NULL,'かんビール','lata de cerveza',NULL,'2011-10-20 21:19:16'),(487,63,0,'',0,NULL,NULL,'タオル','toalla',NULL,'2011-10-20 21:31:35'),(488,63,0,'',0,NULL,NULL,'ボールペン','bolígrafo',NULL,'2011-10-20 21:37:55'),(489,66,0,'',0,NULL,NULL,'ラーメン','ramen',NULL,'2011-10-24 05:14:59'),(490,66,0,'',0,NULL,NULL,'スペイン','España',NULL,'2011-10-24 05:41:21'),(491,66,0,'',0,NULL,NULL,'ハンバーガ','hamburguesa',NULL,'2011-10-25 10:39:53'),(492,63,0,'',0,NULL,NULL,'かんごふ','enfermera',NULL,'2011-10-25 18:55:26'),(493,70,0,'',0,NULL,NULL,'せんせい','profesor',NULL,'2011-10-27 16:57:03'),(494,70,0,'',0,NULL,NULL,'でざいなあ','diseñador',NULL,'2011-10-28 10:56:03'),(495,70,0,'',0,NULL,NULL,'がくせい','estudiante',NULL,'2011-10-28 10:56:57'),(496,70,0,'',0,NULL,NULL,'かいしゃいん','empleado empresa',NULL,'2011-10-28 10:57:52'),(497,70,0,'',0,NULL,NULL,'べんごし','abogado',NULL,'2011-10-28 14:15:14'),(498,70,0,'',0,NULL,NULL,'じゃあなりすと','periodista',NULL,'2011-10-28 14:18:50'),(499,70,0,'',0,NULL,NULL,'よん  -   し','Nº 4',NULL,'2011-10-29 17:24:31'),(500,70,0,'',0,NULL,NULL,'しち  -  なな','Nº 7',NULL,'2011-10-29 17:29:11'),(501,70,0,'',0,NULL,NULL,'く   -  きゅう','Nº 9',NULL,'2011-10-29 17:31:06'),(502,70,0,'',0,NULL,NULL,'じゅう','Nº 10',NULL,'2011-10-29 17:32:09'),(503,70,0,'',0,NULL,NULL,'しち   -  なな','Nº 7',NULL,'2011-10-29 17:37:51'),(504,70,0,'',0,NULL,NULL,'じゅういち','Nº 11',NULL,'2011-10-29 17:44:48'),(505,70,0,'',0,NULL,NULL,'じゅうに','Nº 12',NULL,'2011-10-29 17:45:17'),(506,70,0,'',0,NULL,NULL,'じゅうさん','Nº 13',NULL,'2011-10-29 17:45:37'),(507,70,0,'',0,NULL,NULL,'じゅうよん','Nº 14',NULL,'2011-10-29 17:46:38'),(508,70,0,'',0,NULL,NULL,'じゅうご','Nº 15',NULL,'2011-10-29 17:47:05'),(509,70,0,'',0,NULL,NULL,'じゅうろく','Nº 16',NULL,'2011-10-29 17:47:40'),(510,70,0,'',0,NULL,NULL,'じゅうなな','Nº 17',NULL,'2011-10-29 17:48:08'),(511,70,0,'',0,NULL,NULL,'じゅうはち','Nº 18',NULL,'2011-10-29 17:48:42'),(512,70,0,'',0,NULL,NULL,'じゅうきゅう','Nº 19',NULL,'2011-10-29 17:49:09'),(513,70,0,'',0,NULL,NULL,'にじゅう','Nº 20',NULL,'2011-10-29 17:49:39'),(514,70,0,'',0,NULL,NULL,'さんじゅう','Nº 30',NULL,'2011-10-30 15:22:57'),(515,70,0,'',0,NULL,NULL,'よんじゅう','Nº 40',NULL,'2011-10-30 15:23:26'),(516,70,0,'',0,NULL,NULL,'ごじゅう','Nº 50',NULL,'2011-10-30 15:23:51'),(517,70,0,'',0,NULL,NULL,'ろくじゅう','Nº 60',NULL,'2011-10-30 15:24:20'),(518,70,0,'',0,NULL,NULL,'ななじゅう','Nº 70',NULL,'2011-10-30 15:24:46'),(519,70,0,'',0,NULL,NULL,'はちじゅう','Nº 80',NULL,'2011-10-30 15:25:15'),(520,70,0,'',0,NULL,NULL,'きゅうじゅう','Nº 90',NULL,'2011-10-30 15:25:40'),(521,70,0,'',0,NULL,NULL,'にひゃく','Nº 200',NULL,'2011-10-30 15:27:18'),(522,70,0,'',0,NULL,NULL,'よんひゃく','Nº 400',NULL,'2011-10-31 15:04:53'),(523,70,0,'',0,NULL,NULL,'ごひゃく','Nº 500',NULL,'2011-10-31 15:05:17'),(524,70,0,'',0,NULL,NULL,'ななひゃく','Nº 700',NULL,'2011-11-01 11:49:14'),(525,70,0,'',0,NULL,NULL,'きゅうひゃく','Nº 900',NULL,'2011-11-01 11:50:50'),(526,70,0,'',0,NULL,NULL,'せん - いっせん','Nº 1.000',NULL,'2011-11-01 11:52:23'),(527,70,0,'',0,NULL,NULL,'にせん','Nº 2.000',NULL,'2011-11-01 11:52:52'),(528,70,0,'',0,NULL,NULL,'よんせん','Nº 4.000',NULL,'2011-11-01 11:54:14'),(529,70,0,'',0,NULL,NULL,'ごせん','Nº 5.000',NULL,'2011-11-01 11:56:11'),(530,70,0,'',0,NULL,NULL,'ろくせん','Nº 6.000',NULL,'2011-11-01 11:56:43'),(531,70,0,'',0,NULL,NULL,'ななせん','Nº 7.000',NULL,'2011-11-01 11:57:18'),(532,70,0,'',0,NULL,NULL,'はっせん','Nº 8.000',NULL,'2011-11-01 11:58:25'),(533,70,0,'',0,NULL,NULL,'きゅうせん','Nº 9.000',NULL,'2011-11-01 11:59:23'),(534,69,0,'',0,NULL,NULL,'すみません','disculpa',NULL,'2011-11-01 15:18:22'),(535,69,0,'',0,NULL,NULL,'めきしこ','México',NULL,'2011-11-01 15:22:03'),(536,69,0,'',0,NULL,NULL,'あめりか','Estados Unidos de América',NULL,'2011-11-01 15:26:03'),(537,69,0,'',0,NULL,NULL,'にほん','Japón',NULL,'2011-11-01 15:27:14'),(538,69,0,'',0,NULL,NULL,'おおすとりあ','Austria',NULL,'2011-11-01 15:27:52'),(539,69,0,'',0,NULL,NULL,'かんこく','Corea del Sur',NULL,'2011-11-01 15:29:00'),(540,69,0,'',0,NULL,NULL,'いたりあ','Italia',NULL,'2011-11-01 15:29:28'),(541,69,0,'',0,NULL,NULL,'ちゅうごく','China',NULL,'2011-11-01 15:30:36'),(542,69,0,'',0,NULL,NULL,'どいつ','Alemania',NULL,'2011-11-01 15:30:57'),(543,69,0,'',0,NULL,NULL,'ふぃりぴん','Filipinas',NULL,'2011-11-01 15:31:44'),(544,69,0,'',0,NULL,NULL,'あるぜんちん','Argentina',NULL,'2011-11-01 15:33:31'),(545,69,0,'',0,NULL,NULL,'あいるらんど','Irlanda',NULL,'2011-11-01 15:34:16'),(546,69,0,'',0,NULL,NULL,'いんど','India',NULL,'2011-11-01 15:35:11'),(547,69,0,'',0,NULL,NULL,'ぎりしゃ','Grecia',NULL,'2011-11-01 15:36:13'),(548,69,0,'',0,NULL,NULL,'かなだ','Canadá',NULL,'2011-11-01 15:37:26');

/*Table structure for table `jos_jw_termino_categoria` */

DROP TABLE IF EXISTS `jos_jw_termino_categoria`;

CREATE TABLE `jos_jw_termino_categoria` (
  `id_termino` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id_termino`,`id_categoria`),
  KEY `FK_categoria` (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `jos_jw_termino_categoria` */

insert  into `jos_jw_termino_categoria`(`id_termino`,`id_categoria`) values (3,6),(6,6),(10,6),(29,7),(29,8),(36,6),(39,6),(43,6),(46,6),(68,8),(68,18),(73,18),(79,18),(89,18),(95,18),(107,18),(124,18),(125,18),(126,18),(127,18),(130,18),(243,1),(243,8),(255,1),(255,8),(265,1),(265,8),(265,10),(450,6),(451,6),(457,1),(458,1),(458,8),(458,13),(459,3),(460,1),(460,8),(461,1),(461,8),(462,1),(462,8),(463,1),(463,8),(463,9),(464,1),(464,8),(464,9),(465,1),(465,8),(466,1),(466,8),(466,10),(467,1),(467,8),(467,10),(468,1),(468,8),(468,10),(469,1),(469,8),(469,9),(470,1),(470,8),(470,9),(471,8),(471,13),(471,16),(472,8),(472,13),(472,16),(473,8),(473,13),(474,8),(474,13),(475,8),(475,13),(476,8),(476,13),(477,8),(477,13),(478,8),(478,13),(479,8),(479,13),(480,13),(481,8),(481,13),(481,16),(482,8),(482,13),(483,8),(483,13),(484,8),(484,13),(485,8),(485,13),(486,8),(486,13),(487,8),(487,13),(488,8),(488,13),(489,10),(490,14),(490,17),(491,10),(492,14),(492,15),(493,15),(494,15),(495,15),(496,15),(497,15),(498,15),(499,18),(500,18),(501,18),(502,18),(503,18),(504,18),(505,18),(506,18),(507,18),(508,18),(509,18),(510,18),(511,18),(512,18),(513,18),(514,18),(515,18),(516,18),(517,18),(518,18),(519,18),(520,18),(521,18),(522,18),(523,18),(524,18),(525,18),(526,18),(527,18),(528,18),(529,18),(530,18),(531,18),(532,18),(533,18),(535,17),(536,17),(537,17),(538,17),(539,17),(540,17),(541,17),(542,17),(543,17),(544,17),(545,17),(546,17),(547,17),(548,17);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `jos_menu` */

insert  into `jos_menu`(`id`,`menutype`,`name`,`alias`,`link`,`type`,`published`,`parent`,`componentid`,`sublevel`,`ordering`,`checked_out`,`checked_out_time`,`pollid`,`browserNav`,`access`,`utaccess`,`params`,`lft`,`rgt`,`home`) values (1,'mainmenu','¿Que es EOIjisho?','home','index.php?option=com_content&view=frontpage','component',1,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,3,'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,1),(2,'mainmenu','Japoweb default','japoweb-default','index.php?option=com_japoweb&view=old','component',0,0,34,0,2,62,'2011-10-25 10:02:30',0,0,0,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(3,'mainmenu','Añadir Palabra','add-termino','index.php?option=com_japoweb&view=addtermino','component',1,0,34,0,3,62,'2011-10-25 10:46:14',0,0,1,0,'page_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(4,'mainmenu','Crear Listas de Vocabulario','crear-lista','index.php?option=com_japoweb&view=getlist','component',1,0,34,0,4,0,'0000-00-00 00:00:00',0,0,0,0,'page_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(5,'mainmenu','Editar Perfil','editar-perfil','index.php?option=com_user&view=user&layout=form','component',1,0,14,0,5,0,'0000-00-00 00:00:00',0,0,1,0,'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0);

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

insert  into `jos_modules`(`id`,`title`,`content`,`ordering`,`position`,`checked_out`,`checked_out_time`,`published`,`module`,`numnews`,`access`,`showtitle`,`params`,`iscore`,`client_id`,`control`) values (1,'Main Menu','',0,'user3',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,1,'menutype=mainmenu\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=-nav\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n',1,0,''),(2,'Login','',1,'login',62,'2011-10-23 17:36:36',1,'mod_login',0,0,1,'',1,1,''),(3,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,2,1,'',0,1,''),(4,'Recent added Articles','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,2,1,'ordering=c_dsc\nuser_id=0\ncache=0\n\n',0,1,''),(5,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,2,1,'',0,1,''),(6,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,2,1,'',1,1,''),(7,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,2,1,'',1,1,''),(8,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,2,1,'',1,1,''),(9,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,2,1,'',1,1,''),(10,'Logged in Users','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,2,1,'',0,1,''),(11,'Footer','',0,'footer',0,'0000-00-00 00:00:00',1,'mod_footer',0,0,1,'',1,1,''),(12,'Admin Menu','',1,'menu',0,'0000-00-00 00:00:00',1,'mod_menu',0,2,1,'',0,1,''),(13,'Admin SubMenu','',1,'submenu',0,'0000-00-00 00:00:00',1,'mod_submenu',0,2,1,'',0,1,''),(14,'User Status','',1,'status',0,'0000-00-00 00:00:00',1,'mod_status',0,2,1,'',0,1,''),(15,'Title','',1,'title',0,'0000-00-00 00:00:00',1,'mod_title',0,2,1,'',0,1,''),(16,'Login','',0,'top',62,'2011-10-23 17:37:01',1,'mod_login',0,0,0,'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n',0,0,'');

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

insert  into `jos_session`(`username`,`time`,`session_id`,`guest`,`userid`,`usertype`,`gid`,`client_id`,`data`) values ('','1320247960','598da30fe85a247d0ed681c00e7001da',1,0,'',0,0,'__default|a:8:{s:22:\"session.client.browser\";s:106:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.106 Safari/535.2\";s:15:\"session.counter\";i:3;s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/eoijisho/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"c7ccd06d9fb844f42ed27419162c7ab9\";s:19:\"session.timer.start\";i:1320247332;s:18:\"session.timer.last\";i:1320247332;s:17:\"session.timer.now\";i:1320247367;}'),('neko','1320247969','4d81748902e02f3a7633b99a324788da',0,63,'Registered',18,0,'__default|a:8:{s:22:\"session.client.browser\";s:106:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.106 Safari/535.2\";s:15:\"session.counter\";i:6;s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":19:{s:2:\"id\";s:2:\"63\";s:4:\"name\";s:4:\"neko\";s:8:\"username\";s:4:\"neko\";s:5:\"email\";s:16:\"josexu@gmail.com\";s:8:\"password\";s:65:\"eec5e3c9e538a3e5f49474c97b046f2c:470tnjwKh6beUQsc6Od9bmCUvgIGaL4m\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:10:\"Registered\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"0\";s:3:\"gid\";s:2:\"18\";s:12:\"registerDate\";s:19:\"2011-10-09 15:32:48\";s:13:\"lastvisitDate\";s:19:\"2011-10-29 17:01:24\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:56:\"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n\";s:3:\"aid\";i:1;s:5:\"guest\";i:0;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:66:\"/home/eoijisho/public_html/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":5:{s:14:\"admin_language\";s:0:\"\";s:8:\"language\";s:0:\"\";s:6:\"editor\";s:0:\"\";s:8:\"helpsite\";s:0:\"\";s:8:\"timezone\";s:1:\"0\";}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}}s:13:\"session.token\";s:32:\"c7ccd06d9fb844f42ed27419162c7ab9\";s:19:\"session.timer.start\";i:1320247332;s:18:\"session.timer.last\";i:1320247961;s:17:\"session.timer.now\";i:1320247969;}');

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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `jos_users` */

insert  into `jos_users`(`id`,`name`,`username`,`email`,`password`,`usertype`,`block`,`sendEmail`,`gid`,`registerDate`,`lastvisitDate`,`activation`,`params`) values (62,'Administrator','admin','japoweb@japoweb.com','fc7d51bb2b83c7932e46a85836df4947:Wk2S3KuWg5jM0KskkRPdZqT7ISMoDWv3','Super Administrator',0,1,25,'2011-10-09 13:36:39','2011-10-29 10:03:21','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(63,'neko','neko','josexu@gmail.com','eec5e3c9e538a3e5f49474c97b046f2c:470tnjwKh6beUQsc6Od9bmCUvgIGaL4m','Registered',0,0,18,'2011-10-09 15:32:48','2011-11-02 15:32:41','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(64,'iru','iru','iru.bcn@gmail.com','27d49f4bb71144062cad1392748dcf26','Registered',0,0,18,'2011-10-09 15:33:00','0000-00-00 00:00:00','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(65,'Pere Fonolleda','Pericuelo','peterpunkz@gmail.com','0e15996bfb42588fdcf928d43e6dd324:CAEWqLZorLzxuhLXzae3XIEgMUbfEdyj','Registered',0,0,18,'2011-10-09 15:36:54','2011-10-27 14:17:55','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(66,'Alex','Alex','amartinez0526@gmail.com','3133492b1a126b597226bf70a8447aad:XsjkzwIpqy3unWKoWpaKtjpRzjoHmsfn','Registered',0,0,18,'2011-10-21 07:52:40','2011-10-27 11:19:52','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(67,'Rigel','katkaddajjen','rigel.esteve@gmail.com','6f97482068dd45cb470bfd926f92e95d:uRha4QNJOtHImujbd2EsAtgJQGH6jBKV','Registered',0,0,18,'2011-10-26 06:53:30','2011-10-29 12:07:53','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(68,'Rosa Maria Pérez','rosamary','rosambarna@gmail.com','b1b878c61a76772b4bc0c765f7905873:SmSdRC62DXwpgL9KWW8mh6pFMYHUvpNE','Registered',0,0,18,'2011-10-26 06:54:03','2011-11-01 13:59:06','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(69,'Aram Bonmatí','ARAM','arambonmati@yahoo.com','ea10202cb82060380c7050dbfd7059d5:356ZQMhfEVTP2Y3lJGas09oOkMjCweF7','Registered',0,0,18,'2011-10-26 19:58:54','2011-11-01 18:40:14','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),(70,'Aurèlia','aurelia','medusaurelia@gmail.com','711712a684b52a2297dfa7d5526c87bd:mGOoCrfGBZItNfQZwecfKFrOxKQtMJ9d','Registered',0,0,18,'2011-10-26 21:04:04','2011-11-01 16:07:02','','admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

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
