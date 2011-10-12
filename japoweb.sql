-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 12-10-2011 a les 21:00:31
-- Versió del servidor: 5.1.54
-- Versió de PHP : 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `japoweb`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_banner`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_bannerclient`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_categories`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Bolcant dades de la taula `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'Japoweb', 'option=com_japoweb', 0, 0, 'option=com_japoweb', 'Japoweb', 'com_japoweb', 0, 'js/ThemeOffice/component.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_contact_details`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_content`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_content_frontpage`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Bolcant dades de la taula `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'neko', 0),
(12, 'users', '64', 0, 'iru', 0),
(13, 'users', '65', 0, 'Pere Fonolleda', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Bolcant dades de la taula `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Bolcant dades de la taula `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 11),
(18, '', 12),
(18, '', 13),
(25, '', 10);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_jw_categoria`
--

CREATE TABLE IF NOT EXISTS `jos_jw_categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `jos_jw_categoria`
--

INSERT INTO `jos_jw_categoria` (`id`, `nombre`, `descripcion`) VALUES
(1, 'nombre', ''),
(2, 'verbo', ''),
(3, 'adjetivo', ''),
(4, 'adjetivo -i', ''),
(5, 'adjetivo -na', ''),
(6, 'calendario', 'Días de la semana, días del mes, meses');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_jw_imagen`
--

CREATE TABLE IF NOT EXISTS `jos_jw_imagen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_termino` int(10) unsigned NOT NULL,
  `id_user` int(11) NOT NULL,
  `fichero` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `url_original` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_termino` (`id_termino`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_jw_imagen`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_jw_modificacion`
--

CREATE TABLE IF NOT EXISTS `jos_jw_modificacion` (
  `user_id` int(11) NOT NULL,
  `termino_id` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`termino_id`),
  KEY `termino_id` (`termino_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_jw_modificacion`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_jw_termino`
--

CREATE TABLE IF NOT EXISTS `jos_jw_termino` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_user_revision` int(11) NOT NULL,
  `kanji` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `es_kanji` int(1) unsigned NOT NULL DEFAULT '0',
  `kunyomi` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `onyomi` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `kana` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `significado` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `capitulo` tinyint(3) unsigned DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `capitulo` (`capitulo`),
  KEY `id_user` (`id_user`),
  KEY `id_user_revision` (`id_user_revision`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=461 ;

--
-- Bolcant dades de la taula `jos_jw_termino`
--

INSERT INTO `jos_jw_termino` (`id`, `id_user`, `id_user_revision`, `kanji`, `es_kanji`, `kunyomi`, `onyomi`, `kana`, `significado`, `capitulo`, `fecha`) VALUES
(1, 63, 0, '日', 1, 'ひ、～び、～か', 'ニチ、二、～ジツ', 'ひ', 'Día,sol', 1, '2011-10-08 14:20:56'),
(2, 63, 0, '日本', 0, NULL, NULL, 'にほん、にっぽん', 'Japón', 1, '2011-10-08 14:20:56'),
(3, 63, 0, '日曜日', 0, NULL, NULL, 'にちようび', 'Domingo', 1, '2011-10-08 14:20:56'),
(4, 63, 0, '三日', 0, NULL, NULL, 'みっか', 'El 3er día del mes', 1, '2011-10-08 14:20:56'),
(5, 63, 0, '月', 1, 'つき', 'ゲツ、ガツ', 'つき', 'Luna,mes', 1, '2011-10-08 14:20:56'),
(6, 63, 0, '月曜日', 0, NULL, NULL, 'げつようび', 'Lunes', 1, '2011-10-08 14:20:56'),
(7, 63, 0, '一月', 0, NULL, NULL, 'いちがつ', 'Enero', 1, '2011-10-08 14:20:56'),
(8, 63, 0, '一ヶ月', 0, NULL, NULL, 'いっかげつ', '1 mes', 1, '2011-10-08 14:20:56'),
(9, 63, 0, '木', 1, 'き', 'モク、ボク', 'き', 'Árbol,madera', 1, '2011-10-08 14:20:56'),
(10, 63, 0, '木曜日', 0, NULL, NULL, 'もくようび', 'Jueves', 1, '2011-10-08 14:20:56'),
(11, 63, 0, '木村', 0, NULL, NULL, 'きむら', 'Apellido Japonés', 1, '2011-10-08 14:20:56'),
(12, 63, 0, '山', 1, 'やま', 'サン', 'やま', 'Montaña', 1, '2011-10-08 14:20:56'),
(13, 63, 0, '山下', 0, NULL, NULL, 'やました', 'Apellido Japonés', 1, '2011-10-08 14:20:56'),
(14, 63, 0, '火山', 0, NULL, NULL, 'かざん', 'Volcán', 1, '2011-10-08 14:20:56'),
(15, 63, 0, '富士山', 0, NULL, NULL, 'ふじさん', 'El Monte Fuji', 1, '2011-10-08 14:20:56'),
(16, 63, 0, '川', 1, 'かわ', 'セン', 'かわ', 'Río', 1, '2011-10-08 14:20:56'),
(17, 63, 0, 'ナイル川', 0, NULL, NULL, 'ナイルがわ', 'El río Nilo', 1, '2011-10-08 14:20:56'),
(18, 63, 0, '田', 1, 'た、～だ', 'デン', NULL, 'campo de arroz', 1, '2011-10-08 14:20:56'),
(19, 63, 0, '田んぼ', 0, NULL, NULL, 'たんぼ', 'Campo de arroz', 1, '2011-10-08 14:20:56'),
(20, 63, 0, '田中', 0, NULL, NULL, 'たなか', 'Apellido Japonés', 1, '2011-10-08 14:20:56'),
(21, 63, 0, '山田', 0, NULL, NULL, 'やまだ', 'Apellido Japonés', 1, '2011-10-08 14:20:56'),
(22, 63, 0, '人', 1, 'ひと', 'ジン、ニン', 'ひと', 'Persona', 1, '2011-10-08 14:20:56'),
(23, 63, 0, '三人', 0, NULL, NULL, 'さんいん', '3 personas', 1, '2011-10-08 14:20:56'),
(24, 63, 0, '日本人', 0, NULL, NULL, 'にほんじん', 'Persona de nacionalidad japonesa', 1, '2011-10-08 14:20:56'),
(25, 63, 0, '口', 1, 'くち', 'コウ', 'くち', 'Boca', 1, '2011-10-08 14:20:56'),
(26, 63, 0, '入口', 0, NULL, NULL, 'いりぐち', 'Entrada', 1, '2011-10-08 14:20:56'),
(27, 63, 0, '出口', 0, NULL, NULL, 'でぐち', 'Salida', 1, '2011-10-08 14:20:56'),
(28, 63, 0, '人口', 0, NULL, NULL, 'じんこう', 'Población', 1, '2011-10-08 14:20:56'),
(29, 63, 0, '車', 1, 'くるま', 'シャ', 'くるま', 'Coche', 1, '2011-10-08 14:20:56'),
(30, 63, 0, '自動車', 0, NULL, NULL, 'じどうしゃ', 'Automóvil', 1, '2011-10-08 14:20:56'),
(31, 63, 0, '自転車', 0, NULL, NULL, 'じてんしゃ', 'Bicicleta', 1, '2011-10-08 14:20:56'),
(32, 63, 0, '電車', 0, NULL, NULL, 'でんしゃ', 'Tren', 1, '2011-10-08 14:20:56'),
(33, 63, 0, '門', 1, NULL, 'モン', 'もん', 'Portal', 1, '2011-10-08 14:20:56'),
(34, 63, 0, '専門', 0, NULL, NULL, 'せんもん', 'Especialidad', 1, '2011-10-08 14:20:56'),
(35, 63, 0, '火', 1, 'ひ', 'カ', 'ひ', 'Fuego', 2, '2011-10-08 14:20:56'),
(36, 63, 0, '火曜日', 0, NULL, NULL, 'かようび', 'Martes', 2, '2011-10-08 14:20:56'),
(37, 63, 0, '火事', 0, NULL, NULL, 'かじ', 'Un fuego', 2, '2011-10-08 14:20:56'),
(38, 63, 0, '水', 1, 'みず', 'スイ', 'みず', 'Agua', 2, '2011-10-08 14:20:56'),
(39, 63, 0, '水曜日', 0, NULL, NULL, 'すいようび', 'Miércoles', 2, '2011-10-08 14:20:56'),
(40, 63, 0, '水田', 0, NULL, NULL, 'すいでん', 'Campo de arroz', 2, '2011-10-08 14:20:56'),
(41, 63, 0, 'お金', 0, NULL, NULL, 'おかね', 'Dinero', 2, '2011-10-08 14:20:56'),
(42, 63, 0, '金', 1, 'かね', 'キン', 'きん', 'Oro', 2, '2011-10-08 14:20:56'),
(43, 63, 0, '金曜日', 0, NULL, NULL, 'きにようび', 'Viernes', 2, '2011-10-08 14:20:56'),
(44, 63, 0, '金田', 0, NULL, NULL, 'かねだ', 'Apellido Japonés', 2, '2011-10-08 14:20:56'),
(45, 63, 0, '土', 1, 'つち', 'ド', 'つち', 'Tierra', 2, '2011-10-08 14:20:56'),
(46, 63, 0, '土曜日', 0, NULL, NULL, 'どようび', 'Sábado', 2, '2011-10-08 14:20:56'),
(47, 63, 0, '土木工学', 0, NULL, NULL, 'どぼくどうがく', 'Ingeniería civil', 2, '2011-10-08 14:20:56'),
(48, 63, 0, '土木技師', 0, NULL, NULL, 'どぼくぎし', 'Ingeniero civil', 2, '2011-10-08 14:20:56'),
(49, 63, 0, '子', 1, 'こ', 'シ', NULL, 'Niño', 2, '2011-10-08 14:20:56'),
(50, 63, 0, '男の子', 0, NULL, NULL, 'おとこのこ', 'Niño,chico', 2, '2011-10-08 14:20:56'),
(51, 63, 0, '女の子', 0, NULL, NULL, 'おんあのこ', 'Niña,chica', 2, '2011-10-08 14:20:56'),
(52, 63, 0, '女子学生', 0, NULL, NULL, 'じょしがくせい', 'Una estudiante', 2, '2011-10-08 14:20:56'),
(53, 63, 0, '女', 1, 'おんな', 'ジョ', 'おんあ', 'Mujer', 2, '2011-10-08 14:20:56'),
(54, 63, 0, '女の人', 0, NULL, NULL, 'おんあのひと', 'Mujer', 2, '2011-10-08 14:20:56'),
(55, 63, 0, '彼女', 0, NULL, NULL, 'かのじょ', 'Ella', 2, '2011-10-08 14:20:56'),
(56, 63, 0, '学', 1, 'まな・ぶ', 'ガク、カッ～', NULL, 'Estudiante', 2, '2011-10-08 14:20:56'),
(57, 63, 0, '大学生', 0, NULL, NULL, 'だいがくせい', 'Estudiante universitario', 2, '2011-10-08 14:20:56'),
(58, 63, 0, '学校', 0, NULL, NULL, 'がっこう', 'Escuela', 2, '2011-10-08 14:20:56'),
(59, 63, 0, '大学', 0, NULL, NULL, 'だいがく', 'Universidad', 2, '2011-10-08 14:20:56'),
(60, 63, 0, '生', 1, 'い・きる、う・まれる', 'セイ', NULL, 'Vivir', 2, '2011-10-08 14:20:56'),
(61, 63, 0, '生まれる', 0, NULL, NULL, 'うまれる', 'Nacer', 2, '2011-10-08 14:20:56'),
(62, 63, 0, '先生', 0, NULL, NULL, 'せんせい', 'Profesor', 2, '2011-10-08 14:20:56'),
(63, 63, 0, '先月', 0, NULL, NULL, 'せんげつ', 'El mes pasado', 2, '2011-10-08 14:20:56'),
(64, 63, 0, '先週', 0, NULL, NULL, 'せんしゅう', 'La semana pasada', 2, '2011-10-08 14:20:56'),
(65, 63, 0, '先', 1, 'さき', 'セン', 'さき', 'Más adelante,punta,extremidad,delante,primero', 2, '2011-10-08 14:20:56'),
(66, 63, 0, '私', 1, 'わたし、わたくし', 'シ', 'わたし、わたくし', 'Yo', 2, '2011-10-08 14:20:56'),
(67, 63, 0, '私立大学', 0, NULL, NULL, 'しりつだいがく', 'Universidad privada', 2, '2011-10-08 14:20:56'),
(68, 63, 0, '一', 1, 'ひと・つ', 'イチ', 'いち', 'Nº1', 3, '2011-10-08 14:20:56'),
(69, 63, 0, '一つ', 0, NULL, NULL, 'ひとつ', '1 cosa', 3, '2011-10-08 14:20:56'),
(70, 63, 0, '一人', 0, NULL, NULL, 'ひとり', '1 persona', 3, '2011-10-08 14:20:56'),
(71, 63, 0, '一年', 0, NULL, NULL, 'いちねん', '1 año', 3, '2011-10-08 14:20:56'),
(72, 63, 0, '一日', 0, NULL, NULL, 'ついたち', '1er día del mes', 3, '2011-10-08 14:20:56'),
(73, 63, 0, '二', 1, 'ふた・つ', '二', 'に', 'Nº2', 3, '2011-10-08 14:20:56'),
(74, 63, 0, '二月', 0, NULL, NULL, 'にがつ', 'Febrero', 3, '2011-10-08 14:20:56'),
(75, 63, 0, '二つ', 0, NULL, NULL, 'ふたつ', '2 cosas', 3, '2011-10-08 14:20:56'),
(76, 63, 0, '二人', 0, NULL, NULL, 'ふたり', '2 personas', 3, '2011-10-08 14:20:56'),
(77, 63, 0, '二年', 0, NULL, NULL, 'にねん', '2 años', 3, '2011-10-08 14:20:56'),
(78, 63, 0, '二日', 0, NULL, NULL, 'ふつか', '2º día del mes', 3, '2011-10-08 14:20:56'),
(79, 63, 0, '三', 1, 'みっ・つ', 'サン', 'さん', 'Nº3', 3, '2011-10-08 14:20:56'),
(80, 63, 0, '三月', 0, NULL, NULL, 'さんがつ', 'Marzo', 3, '2011-10-08 14:20:56'),
(81, 63, 0, '三つ', 0, NULL, NULL, 'みっつ', '3 cosas', 3, '2011-10-08 14:20:56'),
(82, 63, 0, '三年', 0, NULL, NULL, 'さんえん', '3 años', 3, '2011-10-08 14:20:56'),
(83, 63, 0, '四', 1, 'よっ・つ、よん、よ', 'シ', 'よん、よ', 'Nº4', 3, '2011-10-08 14:20:56'),
(84, 63, 0, '四月', 0, NULL, NULL, 'しがつ', 'Abril', 3, '2011-10-08 14:20:56'),
(85, 63, 0, '四つ', 0, NULL, NULL, 'よっつ', '4 cosas', 3, '2011-10-08 14:20:56'),
(86, 63, 0, '四人', 0, NULL, NULL, 'よにん', '4 personas', 3, '2011-10-08 14:20:56'),
(87, 63, 0, '四年', 0, NULL, NULL, 'よねん', '4 años', 3, '2011-10-08 14:20:56'),
(88, 63, 0, '四日', 0, NULL, NULL, 'よっか', '4º día del mes', 3, '2011-10-08 14:20:56'),
(89, 63, 0, '五', 1, 'いっ・つ', 'ゴ', 'ご', 'Nº5', 3, '2011-10-08 14:20:56'),
(90, 63, 0, '五月', 0, NULL, NULL, 'ごがつ', 'Mayo', 3, '2011-10-08 14:20:56'),
(91, 63, 0, '五つ', 0, NULL, NULL, 'いつつ', '5 cosas', 3, '2011-10-08 14:20:56'),
(92, 63, 0, '五人', 0, NULL, NULL, 'ごにん', '5 personas', 3, '2011-10-08 14:20:56'),
(93, 63, 0, '五年', 0, NULL, NULL, 'ごねん', '5 años', 3, '2011-10-08 14:20:56'),
(94, 63, 0, '五日', 0, NULL, NULL, 'いつか', '5o día del mes', 3, '2011-10-08 14:20:56'),
(95, 63, 0, '六', 1, 'むっ・つ', 'ロク', 'ろく', 'Nº6', 3, '2011-10-08 14:20:56'),
(96, 63, 0, '六月', 0, NULL, NULL, 'ろくがつ', 'Junio', 3, '2011-10-08 14:20:56'),
(97, 63, 0, '六つ', 0, NULL, NULL, 'むっつ', '6 cosas', 3, '2011-10-08 14:20:56'),
(98, 63, 0, '六人', 0, NULL, NULL, 'ろくにん', '6 personas', 3, '2011-10-08 14:20:56'),
(99, 63, 0, '六年', 0, NULL, NULL, 'ろくねん', '6 años', 3, '2011-10-08 14:20:56'),
(100, 63, 0, '六日', 0, NULL, NULL, 'むいか', '6º día del mes', 3, '2011-10-08 14:20:56'),
(101, 63, 0, '七', 1, 'なな・つ、なな', 'シチ', 'なな、しち', 'Nº7', 3, '2011-10-08 14:20:56'),
(102, 63, 0, '七月', 0, NULL, NULL, 'しちがつ', 'Julio', 3, '2011-10-08 14:20:56'),
(103, 63, 0, '七つ', 0, NULL, NULL, 'ななつ', '7 cosas', 3, '2011-10-08 14:20:56'),
(104, 63, 0, '七人', 0, NULL, NULL, 'ななにん、しちにん', '7 personas', 3, '2011-10-08 14:20:56'),
(105, 63, 0, '七年', 0, NULL, NULL, 'しちねん', '7 años', 3, '2011-10-08 14:20:56'),
(106, 63, 0, '七日', 0, NULL, NULL, 'なのか', '7º día del mes', 3, '2011-10-08 14:20:56'),
(107, 63, 0, '八', 1, 'やっ・つ', 'ハチ', 'はち', 'Nº8', 3, '2011-10-08 14:20:56'),
(108, 63, 0, '八月', 0, NULL, NULL, 'はちがつ', 'Agosto', 3, '2011-10-08 14:20:56'),
(109, 63, 0, '八つ', 0, NULL, NULL, 'やっつ', '8 cosas', 3, '2011-10-08 14:20:56'),
(110, 63, 0, '八人', 0, NULL, NULL, 'はちにん', '8 personas', 3, '2011-10-08 14:20:56'),
(111, 63, 0, '八年', 0, NULL, NULL, 'はちねん', '8 años', 3, '2011-10-08 14:20:56'),
(112, 63, 0, '八日', 0, NULL, NULL, 'ようか', '8º día del mes', 3, '2011-10-08 14:20:56'),
(113, 63, 0, '九', 1, 'ここの・つ', 'キュウ、ク', 'く、きゅう', 'Nº9', 3, '2011-10-08 14:20:56'),
(114, 63, 0, '九月', 0, NULL, NULL, 'くがつ', 'Septiembre', 3, '2011-10-08 14:20:56'),
(115, 63, 0, '九つ', 0, NULL, NULL, 'ここのつ', '9 cosas', 3, '2011-10-08 14:20:56'),
(116, 63, 0, '九人', 0, NULL, NULL, 'きゅうにん', '9 personas', 3, '2011-10-08 14:20:56'),
(117, 63, 0, '九年', 0, NULL, NULL, 'きゅうねん', '9 años', 3, '2011-10-08 14:20:56'),
(118, 63, 0, '九日', 0, NULL, NULL, 'ここのか', '9º día del mes', 3, '2011-10-08 14:20:56'),
(119, 63, 0, '十', 1, 'とお', 'ジュウ', 'とお', 'Nº10,10 cosas', 3, '2011-10-08 14:20:56'),
(120, 63, 0, '十月', 0, NULL, NULL, 'じゅうがつ', 'Octubre', 3, '2011-10-08 14:20:56'),
(121, 63, 0, '十人', 0, NULL, NULL, 'じゅうにん', '10 personas', 3, '2011-10-08 14:20:56'),
(122, 63, 0, '十年', 0, NULL, NULL, 'じゅうねん', '10 años', 3, '2011-10-08 14:20:56'),
(123, 63, 0, '十日', 0, NULL, NULL, 'とおか', '10º día del mes', 3, '2011-10-08 14:20:56'),
(124, 63, 0, '百', 1, NULL, 'ヒャク', 'ひゃく', 'Nº100', 3, '2011-10-08 14:20:56'),
(125, 63, 0, '三百', 0, NULL, NULL, 'さんびゃく', 'Nº300', 3, '2011-10-08 14:20:56'),
(126, 63, 0, '六百', 0, NULL, NULL, 'ろっぴゃく', 'Nº600', 3, '2011-10-08 14:20:56'),
(127, 63, 0, '八百', 0, NULL, NULL, 'はっぴゃく', 'Nº800', 3, '2011-10-08 14:20:56'),
(128, 63, 0, '一千', 0, NULL, NULL, 'いっせん', 'Nº1000', 3, '2011-10-08 14:20:56'),
(129, 63, 0, '千', 1, 'ち', 'セン', 'せん', 'Nº1000', 3, '2011-10-08 14:20:56'),
(130, 63, 0, '三千', 0, NULL, NULL, 'さんぜん', 'Nº3000', 3, '2011-10-08 14:20:56'),
(131, 63, 0, '八千', 0, NULL, NULL, 'はっせん', 'Nº8000', 3, '2011-10-08 14:20:56'),
(132, 63, 0, '千葉県', 0, NULL, NULL, 'ちばけん', 'Prefectura de Chiva', 3, '2011-10-08 14:20:56'),
(133, 63, 0, '百万人', 0, NULL, NULL, 'ひゃくまんにん', '1 millón de personas', 3, '2011-10-08 14:20:56'),
(134, 63, 0, '一万円', 0, NULL, NULL, 'いちまんえん', '10000 yenes', 3, '2011-10-08 14:20:56'),
(135, 63, 0, '万', 1, NULL, 'マン', 'まん', 'Nº10000', 3, '2011-10-08 14:20:56'),
(136, 63, 0, '円', 1, NULL, 'エン', 'えん', 'Yen (moneda japonesa)', 3, '2011-10-08 14:20:56'),
(137, 63, 0, '円形', 0, NULL, NULL, 'えんけい', 'Círculo', 3, '2011-10-08 14:20:56'),
(138, 63, 0, '二千五百六円', 0, NULL, NULL, 'にせんごひゃくろくえん', '2506 yenes', 3, '2011-10-08 14:20:56'),
(139, 63, 0, '年', 1, 'とし', 'ネン', 'とし', 'Año', 3, '2011-10-08 14:20:56'),
(140, 63, 0, '年上', 0, NULL, NULL, 'としうえ', 'Mayor,de mayor edad', 3, '2011-10-08 14:20:56'),
(141, 63, 0, '去年', 0, NULL, NULL, 'きょねん', 'El año pasado', 3, '2011-10-08 14:20:56'),
(142, 63, 0, '今年', 0, NULL, NULL, 'ことし', 'Este año', 3, '2011-10-08 14:20:56'),
(143, 63, 0, '来年', 0, NULL, NULL, 'らいねん', 'El año próximo', 3, '2011-10-08 14:20:56'),
(144, 63, 0, '上', 1, 'うえ、あ・がる、あ・げる、のぼ・る', 'ジョウ', 'うえ', 'Encima', 4, '2011-10-08 14:20:56'),
(145, 63, 0, '上がる', 0, NULL, NULL, 'あがる', 'Subir,elevarse', 4, '2011-10-08 14:20:56'),
(146, 63, 0, '上げる', 0, NULL, NULL, 'あげる', 'Subir,elevar', 4, '2011-10-08 14:20:56'),
(147, 63, 0, '上手', 0, NULL, NULL, 'じょうず', 'Hábil', 4, '2011-10-08 14:20:56'),
(148, 63, 0, '上る', 0, NULL, NULL, 'のぼる', 'Subir (a lugares altos)', 4, '2011-10-08 14:20:56'),
(149, 63, 0, '下', 1, 'した、さ・がる、さ・げる、くだ・る、お・りる', 'カ、ゲ', 'した', 'Debajo', 4, '2011-10-08 14:20:56'),
(150, 63, 0, '下がる', 0, NULL, NULL, 'さがる', 'Bajarse', 4, '2011-10-08 14:20:56'),
(151, 63, 0, '下げる', 0, NULL, NULL, 'さげる', 'Bajar', 4, '2011-10-08 14:20:56'),
(152, 63, 0, '下手', 0, NULL, NULL, 'へた', 'Torpe', 4, '2011-10-08 14:20:56'),
(153, 63, 0, '地下', 0, NULL, NULL, 'ちか', 'Subterraneo', 4, '2011-10-08 14:20:56'),
(154, 63, 0, '年下', 0, NULL, NULL, 'としした', 'Menor,de menor edad', 4, '2011-10-08 14:20:56'),
(155, 63, 0, '下車する', 0, NULL, NULL, 'げしゃする', 'Bajar de un vehículo', 4, '2011-10-08 14:20:56'),
(156, 63, 0, '中', 1, 'なか', 'チュウ、～ジュウ', 'なか', 'Dentro', 4, '2011-10-08 14:20:56'),
(157, 63, 0, '一日中', 0, NULL, NULL, 'いちにちじゅう', 'Todo el día', 4, '2011-10-08 14:20:56'),
(158, 63, 0, '中心', 0, NULL, NULL, 'ちゅうしん', 'Centro', 4, '2011-10-08 14:20:56'),
(159, 63, 0, '中学', 0, NULL, NULL, 'ちゅうがく', 'Escuela de secundaria', 4, '2011-10-08 14:20:56'),
(160, 63, 0, '中学校', 0, NULL, NULL, 'ちゅうがっこう', 'Escuela de secundaria', 4, '2011-10-08 14:20:56'),
(161, 63, 0, '大', 1, 'おお・きい', 'ダイ、タイ', NULL, 'Grande', 4, '2011-10-08 14:20:56'),
(162, 63, 0, '大人', 0, NULL, NULL, 'おとな', 'Adulto', 4, '2011-10-08 14:20:56'),
(163, 63, 0, '大切な', 0, NULL, NULL, 'たいせつな', 'Importante', 4, '2011-10-08 14:20:56'),
(164, 63, 0, '小', 1, 'ちい・さい、こ、お', 'ショウ', NULL, 'Pequeño', 4, '2011-10-08 14:20:56'),
(165, 63, 0, '小人', 0, NULL, NULL, 'こども', 'Niño', 4, '2011-10-08 14:20:56'),
(166, 63, 0, '小学校', 0, NULL, NULL, 'しょうがっこう', 'Escuela de primaria', 4, '2011-10-08 14:20:56'),
(167, 63, 0, '本', 1, 'もと', 'ホン', 'ほん', 'Libro,raíz,origen,principal,verdad', 4, '2011-10-08 14:20:56'),
(168, 63, 0, '山本', 0, NULL, NULL, 'やまもと', 'Apellido japonés', 4, '2011-10-08 14:20:56'),
(169, 63, 0, '本日', 0, NULL, NULL, 'ほんじつ', 'Hoy', 4, '2011-10-08 14:20:56'),
(170, 63, 0, '本店', 0, NULL, NULL, 'ほんてん', 'Sede,oficina central,central,casa matriz', 4, '2011-10-08 14:20:56'),
(171, 63, 0, '半', 1, NULL, 'ハン', NULL, 'Mitad', 4, '2011-10-08 14:20:56'),
(172, 63, 0, '半年', 0, NULL, NULL, 'はんとし', 'Medio año,6 meses', 4, '2011-10-08 14:20:56'),
(173, 63, 0, '半分', 0, NULL, NULL, 'はんぶん', 'Mitad,medio', 4, '2011-10-08 14:20:56'),
(174, 63, 0, '三時半', 0, NULL, NULL, 'さんじはん', 'Las 3 y media', 4, '2011-10-08 14:20:56'),
(175, 63, 0, '半日', 0, NULL, NULL, 'はんいち', 'Mediodía', 4, '2011-10-08 14:20:56'),
(176, 63, 0, '分かる', 0, NULL, NULL, 'わかる', 'Entender', 4, '2011-10-08 14:20:56'),
(177, 63, 0, '分ける', 0, NULL, NULL, 'わける', 'Dividir,partir', 4, '2011-10-08 14:20:56'),
(178, 63, 0, '分かれる', 0, NULL, NULL, 'わかれる', 'Separarse,ramificarse', 4, '2011-10-08 14:20:56'),
(179, 63, 0, '十分', 0, NULL, NULL, 'じゅっぷん、じっぷん', '10 minutos', 4, '2011-10-08 14:20:56'),
(180, 63, 0, '五分', 0, NULL, NULL, 'ごふん', '5 minutos', 4, '2011-10-08 14:20:56'),
(181, 63, 0, '分', 1, 'わ・かれる、わ・かる、わ・ける', 'ブン、フン、～プン', 'ふん', 'Minuto', 4, '2011-10-08 14:20:56'),
(182, 63, 0, '力', 1, 'ちから', 'リョク、リキ', 'ちから', 'Poder,fuerza,habilidad', 4, '2011-10-08 14:20:56'),
(183, 63, 0, '力学', 0, NULL, NULL, 'りきがく', 'Dinámica', 4, '2011-10-08 14:20:56'),
(184, 63, 0, '水力', 0, NULL, NULL, 'すいりょく', 'El poder del agua', 4, '2011-10-08 14:20:56'),
(185, 63, 0, '火力', 0, NULL, NULL, 'かりょく', 'El poder del fuego', 4, '2011-10-08 14:20:56'),
(186, 63, 0, '何', 1, 'なに、なん', NULL, 'なに、なん', '¿Qué?', 4, '2011-10-08 14:20:56'),
(187, 63, 0, '何年', 0, NULL, NULL, 'なんねん', '¿Qué año?', 4, '2011-10-08 14:20:56'),
(188, 63, 0, '明', 1, 'あか・るい、あ・ける', 'メイ', NULL, 'Brillante,luz', 5, '2011-10-08 14:20:56'),
(189, 63, 0, '明るい', 0, NULL, NULL, 'あかるい', 'Claro, luminoso', 5, '2011-10-08 14:20:56'),
(190, 63, 0, '明ける', 0, NULL, NULL, 'あける', 'Terminar un periodo y empezar otro', 5, '2011-10-08 14:20:56'),
(191, 63, 0, '明日', 0, NULL, NULL, 'あす、あした、みょうにち', 'Mañana', 5, '2011-10-08 14:20:56'),
(192, 63, 0, '説明する', 0, NULL, NULL, 'せつめいする', 'Explicar', 5, '2011-10-08 14:20:56'),
(193, 63, 0, '休', 1, 'やす・む', 'キュウ', NULL, 'Descanso', 5, '2011-10-08 14:20:56'),
(194, 63, 0, '休む', 0, NULL, NULL, 'やすむ', 'Descansar, faltar al trabajo o escuela', 5, '2011-10-08 14:20:56'),
(195, 63, 0, '休み', 0, NULL, NULL, 'やすみ', 'Vacaciones, día libre', 5, '2011-10-08 14:20:56'),
(196, 63, 0, '休日', 0, NULL, NULL, 'きゅうじつ', 'Día festivo', 5, '2011-10-08 14:20:56'),
(197, 63, 0, '体', 1, 'やす・む', 'キュウ', 'からだ', 'Cuerpo / Salud', 5, '2011-10-08 14:20:56'),
(198, 63, 0, '体力', 0, NULL, NULL, 'たいりょく', 'Fuerza física', 5, '2011-10-08 14:20:56'),
(199, 63, 0, '体育', 0, NULL, NULL, 'たいいく', 'Atletismo, educación física', 5, '2011-10-08 14:20:56'),
(200, 63, 0, '好', 1, 'す・き', 'コウ', NULL, 'Amor,gustar,favorito', 5, '2011-10-08 14:20:56'),
(201, 63, 0, '好き', 0, NULL, NULL, 'すき', 'Gustar', 5, '2011-10-08 14:20:56'),
(202, 63, 0, '好かれる', 0, NULL, NULL, 'すかれる', 'Ser querido', 5, '2011-10-08 14:20:56'),
(203, 63, 0, '好物', 0, NULL, NULL, 'こうぶつ', 'Comida favorita', 5, '2011-10-08 14:20:56'),
(204, 63, 0, '男', 1, 'おとこ', 'ダン、ナン', NULL, 'Hombre,varón,macho', 5, '2011-10-08 14:20:56'),
(205, 63, 0, '男の人', 0, NULL, NULL, 'おとこのひと', 'Hombre', 5, '2011-10-08 14:20:56'),
(206, 63, 0, '男子学生', 0, NULL, NULL, 'だんしがくせい', 'Estudiante (masculino)', 5, '2011-10-08 14:20:56'),
(207, 63, 0, '長男', 0, NULL, NULL, 'ちょうなん', 'Primogénito', 5, '2011-10-08 14:20:56'),
(208, 63, 0, '林', 1, 'はやし', 'リン', 'はやし', 'Bosquecillo', 5, '2011-10-08 14:20:56'),
(209, 63, 0, '林業', 0, NULL, NULL, 'りんぎょう', 'Silvicultura', 5, '2011-10-08 14:20:56'),
(210, 63, 0, '小林', 0, NULL, NULL, 'こばやし', 'Apellido japonés', 5, '2011-10-08 14:20:56'),
(211, 63, 0, '森', 1, 'もり', 'シン', 'もり', 'Bosque,selva', 5, '2011-10-08 14:20:56'),
(212, 63, 0, '森林', 0, NULL, NULL, 'しんりん', 'Selva', 5, '2011-10-08 14:20:56'),
(213, 63, 0, '森田', 0, NULL, NULL, 'もりた', 'Apellido japonés', 5, '2011-10-08 14:20:56'),
(214, 63, 0, '間', 1, 'あいだ', 'カン', 'あいだ', 'Entre,intervalo', 5, '2011-10-08 14:20:56'),
(215, 63, 0, 'その間に', 0, NULL, NULL, 'そのあいだに', 'Mientras tanto', 5, '2011-10-08 14:20:56'),
(216, 63, 0, '間に合う', 0, NULL, NULL, 'まにあう', 'Llegar a tiempo', 5, '2011-10-08 14:20:56'),
(217, 63, 0, '一年間', 0, NULL, NULL, 'いちねんかん', 'Un año', 5, '2011-10-08 14:20:56'),
(218, 63, 0, '時間', 0, NULL, NULL, 'じかん', 'Tiempo', 5, '2011-10-08 14:20:56'),
(219, 63, 0, '畑', 1, NULL, 'ハタケ、ハタ', 'はたけ', 'Campo cultivado', 5, '2011-10-08 14:20:56'),
(220, 63, 0, '田畑', 0, NULL, NULL, 'たはた', 'Campos', 5, '2011-10-08 14:20:56'),
(221, 63, 0, '花畑', 0, NULL, NULL, 'はなばた', 'Jardín de flores', 5, '2011-10-08 14:20:56'),
(222, 63, 0, '岩', 1, 'いわ', 'ガン', 'いわ', 'Roca', 5, '2011-10-08 14:20:56'),
(223, 63, 0, '岩石', 0, NULL, NULL, 'がんせき', 'Roca', 5, '2011-10-08 14:20:56'),
(224, 63, 0, '岩山', 0, NULL, NULL, 'いわやま', 'Montaña rocosa', 5, '2011-10-08 14:20:56'),
(225, 63, 0, '岩田', 0, NULL, NULL, 'いわた', 'Apellido japonés', 5, '2011-10-08 14:20:56'),
(226, 63, 0, '火山岩', 0, NULL, NULL, 'かざんがん', 'Roca volcánica', 5, '2011-10-08 14:20:56'),
(227, 63, 0, '目', 1, 'め', 'モク', 'め', 'Ojo, vista,cosa', 6, '2011-10-08 14:20:56'),
(228, 63, 0, '目次', 0, NULL, NULL, 'もくじ', 'Índice', 6, '2011-10-08 14:20:56'),
(229, 63, 0, '目上', 0, NULL, NULL, 'めうえ', 'Superior', 6, '2011-10-08 14:20:56'),
(230, 63, 0, '目下', 0, NULL, NULL, 'めした', 'Inferior', 6, '2011-10-08 14:20:56'),
(231, 63, 0, '耳', 1, 'みみ', 'ジ', 'みみ', 'Oreja', 6, '2011-10-08 14:20:56'),
(232, 63, 0, '耳鼻科', 0, NULL, NULL, 'じびか', 'Otorrinología', 6, '2011-10-08 14:20:56'),
(233, 63, 0, '手', 1, 'て', 'シュ', 'て', 'Mano', 6, '2011-10-08 14:20:56'),
(234, 63, 0, '手紙', 0, NULL, NULL, 'てがみ', 'Carta', 6, '2011-10-08 14:20:56'),
(235, 63, 0, '歌手', 0, NULL, NULL, 'かしゅ', 'Cantante', 6, '2011-10-08 14:20:56'),
(236, 63, 0, '足', 1, 'あし、た・りる、た・す', 'ソク', 'あし', 'Pierna,par,suficiente', 6, '2011-10-08 14:20:56'),
(237, 63, 0, '二足', 0, NULL, NULL, 'にそく', '2 pares', 6, '2011-10-08 14:20:56'),
(238, 63, 0, '足りる', 0, NULL, NULL, 'たりる', 'Bastar, ser suficiente', 6, '2011-10-08 14:20:56'),
(239, 63, 0, '足す', 0, NULL, NULL, 'たす', 'Sumar', 6, '2011-10-08 14:20:56'),
(240, 63, 0, '雨', 1, 'あめ', 'ウ', 'あめ', 'Lluvia', 6, '2011-10-08 14:20:56'),
(241, 63, 0, '雨天', 0, NULL, NULL, 'うてん', 'Lluvia', 6, '2011-10-08 14:20:56'),
(242, 63, 0, '大雨', 0, NULL, NULL, 'おおあめ', 'Tormenta', 6, '2011-10-08 14:20:56'),
(243, 63, 0, '竹', 1, 'たけ', 'チク', 'たけ', 'Bambú', 6, '2011-10-08 14:20:56'),
(244, 63, 0, '竹田', 0, NULL, NULL, 'たけだ', 'Apellido japonés', 6, '2011-10-08 14:20:56'),
(245, 63, 0, '竹の子', 0, NULL, NULL, 'たけのこ', 'Brote de bambú', 6, '2011-10-08 14:20:56'),
(246, 63, 0, '米', 1, 'こめ', 'マイ、ベイ', 'こめ', 'Arroz,América', 6, '2011-10-08 14:20:56'),
(247, 63, 0, '中米', 0, NULL, NULL, 'ちゅうべい', 'Centro América', 6, '2011-10-08 14:20:56'),
(248, 63, 0, '米国', 0, NULL, NULL, 'べいこく', 'América', 6, '2011-10-08 14:20:56'),
(249, 63, 0, '新米', 0, NULL, NULL, 'しんまい', 'Arroz de la última cosecha', 6, '2011-10-08 14:20:56'),
(250, 63, 0, '貝', 1, 'かい', 'バイ', 'かい', 'Crustaceo', 6, '2011-10-08 14:20:56'),
(251, 63, 0, '貝殻', 0, NULL, NULL, 'かいがら', 'Concha', 6, '2011-10-08 14:20:56'),
(252, 63, 0, '石', 1, 'いし', 'セキ', 'いし', 'Piedra', 6, '2011-10-08 14:20:56'),
(253, 63, 0, '石油', 0, NULL, NULL, 'せきゆ', 'Petróleo', 6, '2011-10-08 14:20:56'),
(254, 63, 0, '化石', 0, NULL, NULL, 'かせき', 'Fósil', 6, '2011-10-08 14:20:56'),
(255, 63, 0, '糸', 1, 'いと', 'し', 'いと', 'Hilo,cuerda', 6, '2011-10-08 14:20:56'),
(256, 63, 0, '毛糸', 0, NULL, NULL, 'けいと', '(hilo de) lana', 6, '2011-10-08 14:20:56'),
(257, 63, 0, '花', 1, 'はな', 'カ', 'はな', 'Flor', 7, '2011-10-08 14:20:56'),
(258, 63, 0, '花火', 0, NULL, NULL, 'はなび', 'Fuegos artificiales', 7, '2011-10-08 14:20:56'),
(259, 63, 0, '花びん', 0, NULL, NULL, 'かびん', 'Jarrón', 7, '2011-10-08 14:20:56'),
(260, 63, 0, '茶', 1, NULL, 'チャ、サ', NULL, 'Té', 7, '2011-10-08 14:20:56'),
(261, 63, 0, '日本茶', 0, NULL, NULL, 'にほんちゃ', 'Té japonés', 7, '2011-10-08 14:20:56'),
(262, 63, 0, 'お茶', 0, NULL, NULL, 'おちゃ', 'Té japonés', 7, '2011-10-08 14:20:56'),
(263, 63, 0, '紅茶', 0, NULL, NULL, 'こうちゃ', 'Té inglés', 7, '2011-10-08 14:20:56'),
(264, 63, 0, '喫茶店', 0, NULL, NULL, 'きっさんてん', 'Cafetería', 7, '2011-10-08 14:20:56'),
(265, 63, 0, '肉', 1, NULL, 'ニク', 'にく', 'Carne', 7, '2011-10-08 14:20:56'),
(266, 63, 0, '牛肉', 0, NULL, NULL, 'ぎゅうにく', 'Carne de ternera', 7, '2011-10-08 14:20:56'),
(267, 63, 0, '鳥肉', 0, NULL, NULL, 'とりにく', 'Carne de pollo', 7, '2011-10-08 14:20:56'),
(268, 63, 0, '肉体', 0, NULL, NULL, 'にくたい', 'Cuerpo', 7, '2011-10-08 14:20:56'),
(269, 63, 0, '文', 1, NULL, 'ブン', 'ぶん', 'Oración', 7, '2011-10-08 14:20:56'),
(270, 63, 0, '文学', 0, NULL, NULL, 'ぶんがく', 'Literatura', 7, '2011-10-08 14:20:56'),
(271, 63, 0, '文部省', 0, NULL, NULL, 'もんぶしょう', 'Ministerio de educación', 7, '2011-10-08 14:20:56'),
(272, 63, 0, '文部科学省', 0, NULL, NULL, 'もんぶかがくしょう', 'Ministerio de educación', 7, '2011-10-08 14:20:56'),
(273, 63, 0, '字', 1, NULL, 'ジ', 'じ', 'Letra, escritura', 7, '2011-10-08 14:20:56'),
(274, 63, 0, '文字', 0, NULL, NULL, 'もじ、もんじ', 'Letra, escritura', 7, '2011-10-08 14:20:56'),
(275, 63, 0, '漢字', 0, NULL, NULL, 'かんじ', 'Kanji', 7, '2011-10-08 14:20:56'),
(276, 63, 0, '数字', 0, NULL, NULL, 'すうじ', 'Números', 7, '2011-10-08 14:20:56'),
(277, 63, 0, '物', 1, 'もの', 'ブツ、モツ', 'もの', 'Cosa', 7, '2011-10-08 14:20:56'),
(278, 63, 0, '生物', 0, NULL, NULL, 'せいぶつ', 'Ser vivo', 7, '2011-10-08 14:20:56'),
(279, 63, 0, '買い物', 0, NULL, NULL, 'かいもの', 'Compra', 7, '2011-10-08 14:20:56'),
(280, 63, 0, '飲み物', 0, NULL, NULL, 'のみもの', 'Bebida', 7, '2011-10-08 14:20:56'),
(281, 63, 0, '食べ物', 0, NULL, NULL, 'たべもの', 'Comida', 7, '2011-10-08 14:20:56'),
(282, 63, 0, '乗り物', 0, NULL, NULL, 'のりもの', 'Vehículo', 7, '2011-10-08 14:20:56'),
(283, 63, 0, '見物する', 0, NULL, NULL, 'けんぶつする', 'Visitar', 7, '2011-10-08 14:20:56'),
(284, 63, 0, '荷物', 0, NULL, NULL, 'にもつ', 'Paquete, equipaje', 7, '2011-10-08 14:20:56'),
(285, 63, 0, '牛', 1, 'うし', 'ギュウ', 'うし', 'Vaca,toro,ganado', 7, '2011-10-08 14:20:56'),
(286, 63, 0, '子牛', 0, NULL, NULL, 'こうし', 'Ternera', 7, '2011-10-08 14:20:56'),
(287, 63, 0, '牛乳', 0, NULL, NULL, 'ぎゅうにゅう', 'Leche', 7, '2011-10-08 14:20:56'),
(288, 63, 0, '馬', 1, 'うま', 'バ', 'うま', 'Caballo', 7, '2011-10-08 14:20:56'),
(289, 63, 0, '馬車', 0, NULL, NULL, 'ばしゃ', 'Carruaje, carro', 7, '2011-10-08 14:20:56'),
(290, 63, 0, '馬力', 0, NULL, NULL, 'ばりき', 'Caballos de vapor', 7, '2011-10-08 14:20:56'),
(291, 63, 0, '馬肉', 0, NULL, NULL, 'ばにく', 'Carne de caballo', 7, '2011-10-08 14:20:56'),
(292, 63, 0, '鳥', 1, 'とり', 'チョウ', 'とり', 'Ave', 7, '2011-10-08 14:20:56'),
(293, 63, 0, '白鳥', 0, NULL, NULL, 'はくちょう', 'Cisne', 7, '2011-10-08 14:20:57'),
(294, 63, 0, '野鳥', 0, NULL, NULL, 'やちょう', 'Pájaro silvestre', 7, '2011-10-08 14:20:57'),
(295, 63, 0, '焼き鳥', 0, NULL, NULL, 'やきとり', 'Pincho de pollo asado', 7, '2011-10-08 14:20:57'),
(296, 63, 0, '一石二鳥', 0, NULL, NULL, 'いっせきにちょう', 'Matar dos pájaros de un tiro', 7, '2011-10-08 14:20:57'),
(297, 63, 0, '魚', 1, 'さかな、うお', 'ギョ', 'さかな', 'Pez, pescado', 7, '2011-10-08 14:20:57'),
(298, 63, 0, '人魚', 0, NULL, NULL, 'にんぎょ', 'Sirena', 7, '2011-10-08 14:20:57'),
(299, 63, 0, '焼き魚', 0, NULL, NULL, 'やきざかな', 'Pescado asado', 7, '2011-10-08 14:20:57'),
(300, 63, 0, '金魚', 0, NULL, NULL, 'きんぎょ', 'Pececillo de colores', 7, '2011-10-08 14:20:57'),
(301, 63, 0, '新', 1, 'あたら・しい', 'シン', NULL, 'Nuevo', 8, '2011-10-08 14:20:57'),
(302, 63, 0, '新しい', 0, NULL, NULL, 'あたらしい', 'Nuevo', 8, '2011-10-08 14:20:57'),
(303, 63, 0, '新車', 0, NULL, NULL, 'しんしゃ', 'Coche nuevo', 8, '2011-10-08 14:20:57'),
(304, 63, 0, '新聞', 0, NULL, NULL, 'しんぶん', 'Periódico', 8, '2011-10-08 14:20:57'),
(305, 63, 0, '新年', 0, NULL, NULL, 'しんねん', 'Año nuevo', 8, '2011-10-08 14:20:57'),
(306, 63, 0, '古', 1, 'ふる・い', 'コ', NULL, 'Viejo', 8, '2011-10-08 14:20:57'),
(307, 63, 0, '古い', 0, NULL, NULL, 'ふるい', 'Viejo', 8, '2011-10-08 14:20:57'),
(308, 63, 0, '古本', 0, NULL, NULL, 'ふるほん', 'Libro viejo', 8, '2011-10-08 14:20:57'),
(309, 63, 0, '中古車', 0, NULL, NULL, 'ちゅうこしゃ', 'Coche de 2ª mano', 8, '2011-10-08 14:20:57'),
(310, 63, 0, '長', 1, 'なが・い', 'チョウ', NULL, 'Largo', 8, '2011-10-08 14:20:57'),
(311, 63, 0, '長い', 0, NULL, NULL, 'ながい', 'Largo', 8, '2011-10-08 14:20:57'),
(312, 63, 0, '長野県', 0, NULL, NULL, 'ながのけん', 'Prefectura de Nagano', 8, '2011-10-08 14:20:57'),
(313, 63, 0, '長女', 0, NULL, NULL, 'ちょうじょ', 'Primogénita', 8, '2011-10-08 14:20:57'),
(314, 63, 0, '学長', 0, NULL, NULL, 'がくちょう', 'Rector/a de universidad', 8, '2011-10-08 14:20:57'),
(315, 63, 0, '校長', 0, NULL, NULL, 'こうちょう', 'Director de la escuela', 8, '2011-10-08 14:20:57'),
(316, 63, 0, '社長', 0, NULL, NULL, 'しゃちょう', 'Presidente de la compañía', 8, '2011-10-08 14:20:57'),
(317, 63, 0, '課長', 0, NULL, NULL, 'かちょう', 'Jefe de departamento', 8, '2011-10-08 14:20:57'),
(318, 63, 0, '短', 1, 'みじか・い', 'タン', NULL, 'Corto', 8, '2011-10-08 14:20:57'),
(319, 63, 0, '短い', 0, NULL, NULL, 'みじかい', 'Corto', 8, '2011-10-08 14:20:57'),
(320, 63, 0, '短時間', 0, NULL, NULL, 'たんじかん', 'Poco tiempo', 8, '2011-10-08 14:20:57'),
(321, 63, 0, '短大', 0, NULL, NULL, 'たんだい', 'Universidad para carreras de 2 años', 8, '2011-10-08 14:20:57'),
(322, 63, 0, '高', 1, 'たか・い', 'コウ', NULL, 'Caro,Alto', 8, '2011-10-08 14:20:57'),
(323, 63, 0, '高い', 0, NULL, NULL, 'たかい', 'Caro,Alto', 8, '2011-10-08 14:20:57'),
(324, 63, 0, '高橋', 0, NULL, NULL, 'たかはし', 'Apellido japonés', 8, '2011-10-08 14:20:57'),
(325, 63, 0, '高校', 0, NULL, NULL, 'こうこう', 'Instituto de bachillerato', 8, '2011-10-08 14:20:57'),
(326, 63, 0, '高等学校', 0, NULL, NULL, 'こうとうがっこう', 'Instituto de bachillerato', 8, '2011-10-08 14:20:57'),
(327, 63, 0, '高速', 0, NULL, NULL, 'こうそく', 'Alta velocidad', 8, '2011-10-08 14:20:57'),
(328, 63, 0, '高速道路', 0, NULL, NULL, 'こうそくどうろ', 'Autopista', 8, '2011-10-08 14:20:57'),
(329, 63, 0, '安', 1, 'やす・い', 'アン', NULL, 'Barato', 8, '2011-10-08 14:20:57'),
(330, 63, 0, '安い', 0, NULL, NULL, 'やすい', 'Barato', 8, '2011-10-08 14:20:57'),
(331, 63, 0, '安全な', 0, NULL, NULL, 'あんぜんな', 'Seguro', 8, '2011-10-08 14:20:57'),
(332, 63, 0, '安心する', 0, NULL, NULL, 'あんしんする', 'Tranquilizarse', 8, '2011-10-08 14:20:57'),
(333, 63, 0, '安売り', 0, NULL, NULL, 'やすうり', 'Venta de saldos', 8, '2011-10-08 14:20:57'),
(334, 63, 0, '低', 1, 'ひく・い', 'テイ', NULL, 'Bajo', 8, '2011-10-08 14:20:57'),
(335, 63, 0, '低い', 0, NULL, NULL, 'ひくい', 'Bajo', 8, '2011-10-08 14:20:57'),
(336, 63, 0, '低温', 0, NULL, NULL, 'ていおん', 'Temperatura baja', 8, '2011-10-08 14:20:57'),
(337, 63, 0, '暗', 1, 'くら・い', 'アン', NULL, 'Oscuro', 8, '2011-10-08 14:20:57'),
(338, 63, 0, '暗い', 0, NULL, NULL, 'くらい', 'Oscuro', 8, '2011-10-08 14:20:57'),
(339, 63, 0, '暗室', 0, NULL, NULL, 'あんしつ', 'Cuarto oscuro', 8, '2011-10-08 14:20:57'),
(340, 63, 0, '多', 1, 'おお・い', 'タ', NULL, 'Bastante,Mucho', 8, '2011-10-08 14:20:57'),
(341, 63, 0, '多い', 0, NULL, NULL, 'おおい', 'Haber en abundancia', 8, '2011-10-08 14:20:57'),
(342, 63, 0, '多数', 0, NULL, NULL, 'たすう', 'Número', 8, '2011-10-08 14:20:57'),
(343, 63, 0, '多少', 0, NULL, NULL, 'たしょう', 'Algo', 8, '2011-10-08 14:20:57'),
(344, 63, 0, '少', 1, 'すく・ない、すこ・し', 'ショウ', NULL, 'Poco', 8, '2011-10-08 14:20:57'),
(345, 63, 0, '少ない', 0, NULL, NULL, 'すくない', 'Haver poco', 8, '2011-10-08 14:20:57'),
(346, 63, 0, '少し', 0, NULL, NULL, 'すこし', 'Poco', 8, '2011-10-08 14:20:57'),
(347, 63, 0, '少年', 0, NULL, NULL, 'しょうねん', 'Joven, muchacho', 8, '2011-10-08 14:20:57'),
(348, 63, 0, '少女', 0, NULL, NULL, 'しょうじょ', 'Chica, muchacha', 8, '2011-10-08 14:20:57'),
(349, 63, 0, '少年雑誌', 0, NULL, NULL, 'しょうねんざっし', 'Revista para chicos', 8, '2011-10-08 14:20:57'),
(350, 63, 0, '少女雑誌', 0, NULL, NULL, 'しょうじょざっし', 'Revista para chicas', 8, '2011-10-08 14:20:57'),
(351, 64, 0, '行', 1, 'いく・、おこな・う', 'コウ、ギョウ', NULL, 'Ir,llevar a cabo,línea', 9, '2011-10-08 14:20:57'),
(352, 64, 0, '行う', 0, NULL, NULL, 'おこなう', 'Hacer,actuar,efectuar', 9, '2011-10-08 14:20:57'),
(353, 64, 0, '行く', 0, NULL, NULL, 'いく', 'Ir', 9, '2011-10-08 14:20:57'),
(354, 64, 0, '行う', 0, NULL, NULL, 'おこなう', 'Hacer,actuar,efectuar', 9, '2011-10-08 14:20:57'),
(355, 64, 0, '旅行', 0, NULL, NULL, 'りょこう', 'Viaje', 9, '2011-10-08 14:20:57'),
(356, 64, 0, '二行目', 0, NULL, NULL, 'にぎょうめ', '2ª línea', 9, '2011-10-08 14:20:57'),
(357, 64, 0, '来', 1, 'く・る', 'ライ', NULL, 'venir', 9, '2011-10-08 14:20:57'),
(358, 64, 0, '来る', 0, NULL, NULL, 'くる', 'venir', 9, '2011-10-08 14:20:57'),
(359, 64, 0, '帰国する', 0, NULL, NULL, 'きこくする', 'regresar a su país', 9, '2011-10-08 14:20:57'),
(360, 64, 0, '帰す', 0, NULL, NULL, 'かえす', 'hacer volver,hacer regresar', 9, '2011-10-08 14:20:57'),
(361, 64, 0, '食', 1, 'た・べる', 'ショク', NULL, 'comer', 9, '2011-10-08 14:20:57'),
(362, 64, 0, '食べる', 0, NULL, NULL, 'たべる', 'comer', 9, '2011-10-08 14:20:57'),
(363, 64, 0, '食事', 0, NULL, NULL, 'しょくじ', 'Comida', 9, '2011-10-08 14:20:57'),
(364, 64, 0, '食べもの', 0, NULL, NULL, 'たべもの', 'comida', 9, '2011-10-08 14:20:57'),
(365, 64, 0, '夕食', 0, NULL, NULL, 'ゆうくじ', 'almuerzo', 9, '2011-10-08 14:20:57'),
(366, 64, 0, '飲', 1, 'の・む', 'イン', NULL, 'beber', 9, '2011-10-08 14:20:57'),
(367, 64, 0, '飲む', 0, NULL, NULL, 'のむ', 'beber', 9, '2011-10-08 14:20:57'),
(368, 64, 0, '飲み物', 0, NULL, NULL, 'のみもの', 'bebida', 9, '2011-10-08 14:20:57'),
(369, 64, 0, '飲酒', 0, NULL, NULL, 'いんしゅ', 'beber alcohol', 9, '2011-10-08 14:20:57'),
(370, 64, 0, '見', 1, 'み・る、み・える、み・せる', 'ケン', NULL, 'ver,mirar', 9, '2011-10-08 14:20:57'),
(371, 64, 0, 'みる', 0, NULL, NULL, 'みる', 'ver,mirar', 9, '2011-10-08 14:20:57'),
(372, 64, 0, '見える', 0, NULL, NULL, 'みえる', 'verse', 9, '2011-10-08 14:20:57'),
(373, 64, 0, '見せる', 0, NULL, NULL, 'みせる', 'mostrar', 9, '2011-10-08 14:20:57'),
(374, 64, 0, '意見', 0, NULL, NULL, 'いけん', 'opinión', 9, '2011-10-08 14:20:57'),
(375, 64, 0, '見物する', 0, NULL, NULL, 'けんぶつする', 'visitar(turismo)', 9, '2011-10-08 14:20:57'),
(376, 64, 0, '聞', 1, 'き・く、き・こえる', 'ブン', NULL, 'oir,preguntar', 9, '2011-10-08 14:20:57'),
(377, 64, 0, '聞く', 0, NULL, NULL, 'きく', 'oir,preguntar', 9, '2011-10-08 14:20:57'),
(378, 64, 0, '聞こえる', 0, NULL, NULL, 'きこえる', 'oirse', 9, '2011-10-08 14:20:57'),
(379, 64, 0, '新聞', 0, NULL, NULL, 'しんぶん', 'diario', 9, '2011-10-08 14:20:57'),
(380, 64, 0, '読', 1, 'よ・む', 'ドク', NULL, 'leer', 9, '2011-10-08 14:20:57'),
(381, 64, 0, '読む', 0, NULL, NULL, 'よむ', 'leer', 9, '2011-10-08 14:20:57'),
(382, 64, 0, '読み', 0, NULL, NULL, 'よみ', 'manera de leer,pronunciación', 9, '2011-10-08 14:20:57'),
(383, 64, 0, '読者', 0, NULL, NULL, 'どくしゃ', 'lector', 9, '2011-10-08 14:20:57'),
(384, 64, 0, '読書', 0, NULL, NULL, 'どくしょ', 'lectura(como actividad)', 9, '2011-10-08 14:20:57'),
(385, 64, 0, '書', 1, 'か・く', 'ショク', NULL, 'escribir, libro, documento', 9, '2011-10-08 14:20:57'),
(386, 64, 0, '書く', 0, NULL, NULL, 'かく', 'escribir', 9, '2011-10-08 14:20:57'),
(387, 64, 0, '下書き', 0, NULL, NULL, 'したがき', 'borrador', 9, '2011-10-08 14:20:57'),
(388, 64, 0, '書道', 0, NULL, NULL, 'しょどう', 'caligrafía japonesa', 9, '2011-10-08 14:20:57'),
(389, 64, 0, '書店', 0, NULL, NULL, 'しょてん', 'librería', 9, '2011-10-08 14:20:57'),
(390, 64, 0, '話', 1, 'はな・す', 'ワ', NULL, 'hablar', 9, '2011-10-08 14:20:57'),
(391, 64, 0, '話す', 0, NULL, NULL, 'はなす', 'hablar', 9, '2011-10-08 14:20:57'),
(392, 64, 0, '話', 0, NULL, NULL, 'はなし', 'historia,lo que se cuenta', 9, '2011-10-08 14:20:57'),
(393, 64, 0, '会話', 0, NULL, NULL, 'かいわ', 'conversación', 9, '2011-10-08 14:20:57'),
(394, 64, 0, '電話', 0, NULL, NULL, 'でんわ', 'teléfono', 9, '2011-10-08 14:20:57'),
(395, 64, 0, '買', 1, 'か・う', 'バイ', NULL, 'comprar', 9, '2011-10-08 14:20:57'),
(396, 64, 0, '買う', 0, NULL, NULL, 'かう', 'comprar', 9, '2011-10-08 14:20:57'),
(397, 64, 0, '買い物', 0, NULL, NULL, 'かいもの', 'compra', 9, '2011-10-08 14:20:57'),
(398, 64, 0, '教', 1, 'おし・える', 'ギョウ', NULL, 'enseñar', 9, '2011-10-08 14:20:57'),
(399, 64, 0, '教える', 0, NULL, NULL, 'おしえる', 'enseñar', 9, '2011-10-08 14:20:57'),
(400, 64, 0, '教育', 0, NULL, NULL, 'きょういく', 'educación,enseñanza', 9, '2011-10-08 14:20:57'),
(401, 64, 0, '居室', 0, NULL, NULL, 'きょうしつ', 'aula', 9, '2011-10-08 14:20:57'),
(402, 64, 0, '協会', 0, NULL, NULL, 'きょうかい', 'iglesia', 9, '2011-10-08 14:20:57'),
(403, 64, 0, '朝', 1, 'あさ', 'チョウ', 'あさ', 'mañana', 10, '2011-10-08 14:20:57'),
(404, 64, 0, '朝日', 0, NULL, NULL, 'あさひ', 'sol de la mañana/naciente', 10, '2011-10-08 14:20:57'),
(405, 64, 0, '朝食', 0, NULL, NULL, 'ちょうしょく', 'desayuno', 10, '2011-10-08 14:20:57'),
(406, 64, 0, '昼', 1, 'ひる', 'チュウ', 'ひる', 'mediodía,día', 10, '2011-10-08 14:20:57'),
(407, 64, 0, '昼食', 0, NULL, NULL, 'ひるごはん', 'almuerzo', 10, '2011-10-08 14:20:57'),
(408, 64, 0, '昼寝する', 0, NULL, NULL, 'ひるねする', 'hacer la siesta', 10, '2011-10-08 14:20:57'),
(409, 64, 0, '昼休み', 0, NULL, NULL, 'ひるやすみ', 'descanso para almorzar', 10, '2011-10-08 14:20:57'),
(410, 64, 0, '夜', 1, 'よる、よ', 'ヤ', 'よる', 'noche', 10, '2011-10-08 14:20:57'),
(411, 64, 0, '今夜', 0, NULL, NULL, 'こんや', 'esta noche', 10, '2011-10-08 14:20:57'),
(412, 64, 0, '夜食', 0, NULL, NULL, 'やしょく', 'resopón', 10, '2011-10-08 14:20:57'),
(413, 64, 0, '晩', 1, 'ばん', 'バン', 'ばん', 'noche,primera parte de la noche', 10, '2011-10-08 14:20:57'),
(414, 64, 0, '今晩', 0, NULL, NULL, 'こんばん', 'esta noche', 10, '2011-10-08 14:20:57'),
(415, 64, 0, '晩御飯', 0, NULL, NULL, 'ばんごはん', 'cena', 10, '2011-10-08 14:20:57'),
(416, 64, 0, '夕', 1, 'ゆう', 'セキ', NULL, 'atardecer', 10, '2011-10-08 14:20:57'),
(417, 64, 0, '夕べ', 0, NULL, NULL, 'ゆうべ', 'atardecer/anochecer', 10, '2011-10-08 14:20:57'),
(418, 64, 0, '夕食', 0, NULL, NULL, 'ゆうしょく', 'cena', 10, '2011-10-08 14:20:57'),
(419, 64, 0, '七夕', 0, NULL, NULL, 'たなばた', 'fiesta de las estrellas', 10, '2011-10-08 14:20:57'),
(420, 64, 0, '方', 1, 'かた、~がた', 'ホウ', NULL, 'dirección,manera,persona (formal)', 10, '2011-10-08 14:20:57'),
(421, 64, 0, '食べ方', 0, NULL, NULL, 'たべかた', 'manera de comer', 10, '2011-10-08 14:20:57'),
(422, 64, 0, '方法', 0, NULL, NULL, 'ほうほう', 'manera', 10, '2011-10-08 14:20:57'),
(423, 64, 0, '~ほう', 0, NULL, NULL, '~ほう', 'dirección', 10, '2011-10-08 14:20:57'),
(424, 64, 0, '夕方', 0, NULL, NULL, 'ゆうがた', 'atardecer', 10, '2011-10-08 14:20:57'),
(425, 64, 0, '午', 1, NULL, 'ゴ', NULL, 'mediodía', 10, '2011-10-08 14:20:57'),
(426, 64, 0, '午前', 0, NULL, NULL, 'ごぜん', 'antes mediodía', 10, '2011-10-08 14:20:57'),
(427, 64, 0, '午後', 0, NULL, NULL, 'ごご', 'después mediodía', 10, '2011-10-08 14:20:57'),
(428, 64, 0, '正午', 0, NULL, NULL, 'しょうご', 'mediodía', 10, '2011-10-08 14:20:57'),
(429, 64, 0, '前', 1, 'まえ', 'ゼン', 'まえ', 'antes,delante', 10, '2011-10-08 14:20:57'),
(430, 64, 0, '一年前', 0, NULL, NULL, 'いちねんまえ', 'hace un año', 10, '2011-10-08 14:20:57'),
(431, 64, 0, '前半', 0, NULL, NULL, 'ぜんはん', 'primera mitad', 10, '2011-10-08 14:20:57'),
(432, 64, 0, '前方', 0, NULL, NULL, 'ぜんぽう', 'hacia delante', 10, '2011-10-08 14:20:57'),
(433, 64, 0, '後', 1, 'あと、のち、うしろ', 'ゴ、コウ', 'あと', 'después,detrás', 10, '2011-10-08 14:20:57'),
(434, 64, 0, '~年後', 0, NULL, NULL, '~ねんご', 'x años más tarde', 10, '2011-10-08 14:20:57'),
(435, 64, 0, '後ろ', 0, NULL, NULL, 'うしろ', 'detrás', 10, '2011-10-08 14:20:57'),
(436, 64, 0, '後半', 0, NULL, NULL, 'こうはん', 'segunda mitad', 10, '2011-10-08 14:20:57'),
(437, 64, 0, '毎', 1, '~ごと', 'マイ', NULL, 'cada', 10, '2011-10-08 14:20:57'),
(438, 64, 0, '毎日', 0, NULL, NULL, 'まいにち', 'cada día', 10, '2011-10-08 14:20:57'),
(439, 64, 0, '毎朝', 0, NULL, NULL, 'まいあさ', 'cada mañana', 10, '2011-10-08 14:20:57'),
(440, 64, 0, '毎夕、毎晩、毎夜', 0, NULL, NULL, 'まいゆう、まいばん、まいよ', 'cada noche', 10, '2011-10-08 14:20:57'),
(441, 64, 0, '毎年', 0, NULL, NULL, 'まいねん', 'cada año', 10, '2011-10-08 14:20:57'),
(442, 64, 0, '毎週', 0, NULL, NULL, 'まいしゅう', 'cada semana', 10, '2011-10-08 14:20:57'),
(443, 64, 0, '毎月', 0, NULL, NULL, 'まいげつ', 'cada mes', 10, '2011-10-08 14:20:57'),
(444, 64, 0, '毎度', 0, NULL, NULL, 'まいど', 'cada vez', 10, '2011-10-08 14:20:57'),
(445, 64, 0, '週', 1, 'せんにゅう', 'シュウ', NULL, 'semana', 10, '2011-10-08 14:20:57'),
(446, 64, 0, '先週、今週、来週', 0, NULL, NULL, 'せんしゅう、こんしゅう、らいしゅう', 'semana pasada, esta, próxima', 10, '2011-10-08 14:20:57'),
(447, 64, 0, '週末', 0, NULL, NULL, 'しゅうまつ', 'fin de semana', 10, '2011-10-08 14:20:57'),
(448, 64, 0, '一週間', 0, NULL, NULL, 'いっしゅうかん', 'una semana', 10, '2011-10-08 14:20:57'),
(449, 64, 0, '曜', 1, 'ひへん', 'ヨウ', NULL, 'dia de la semana', 10, '2011-10-08 14:20:57'),
(450, 64, 0, '何曜日', 0, NULL, NULL, 'なんようび', 'qué día de la semana', 10, '2011-10-08 14:20:57'),
(451, 64, 0, '月曜日', 0, NULL, NULL, 'げつようび', 'lunes', 10, '2011-10-08 14:20:57'),
(457, 65, 0, '本', 0, NULL, NULL, 'ほん', 'Libro', NULL, '2011-10-12 20:27:24'),
(458, 65, 0, '', 0, NULL, NULL, 'とけい', 'Reloj', NULL, '2011-10-12 20:34:52'),
(459, 65, 0, '大きい', 0, NULL, NULL, 'おおきい', 'Grande', NULL, '2011-10-12 20:36:18');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_jw_termino_categoria`
--

CREATE TABLE IF NOT EXISTS `jos_jw_termino_categoria` (
  `id_termino` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_termino`,`id_categoria`),
  KEY `FK_categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_jw_termino_categoria`
--

INSERT INTO `jos_jw_termino_categoria` (`id_termino`, `id_categoria`) VALUES
(457, 1),
(458, 1),
(459, 3),
(459, 4),
(459, 5);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Bolcant dades de la taula `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Japoweb default', 'japoweb-default', 'index.php?option=com_japoweb&view=old', 'component', 1, 0, 34, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'mainmenu', 'Add Termino', 'add-termino', 'index.php?option=com_japoweb&view=addtermino', 'component', 1, 0, 34, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_messages`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Bolcant dades de la taula `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'Login', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(16, 0);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Bolcant dades de la taula `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 8, 1, 1, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_polls`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_poll_data`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_sections`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('Pericuelo', '1318444893', 'sm67bbfupkqjqrngl12csuadp0', 0, 65, 'Registered', 18, 0, '__default|a:8:{s:22:"session.client.browser";s:70:"Mozilla/5.0 (X11; Linux x86_64; rv:7.0.1) Gecko/20100101 Firefox/7.0.1";s:15:"session.counter";i:36;s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"65";s:4:"name";s:14:"Pere Fonolleda";s:8:"username";s:9:"Pericuelo";s:5:"email";s:20:"peterpunkz@gmail.com";s:8:"password";s:65:"0e15996bfb42588fdcf928d43e6dd324:CAEWqLZorLzxuhLXzae3XIEgMUbfEdyj";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"Registered";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"0";s:3:"gid";s:2:"18";s:12:"registerDate";s:19:"2011-10-09 15:36:54";s:13:"lastvisitDate";s:19:"2011-10-12 17:58:18";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:1;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:74:"/home/pere/aptanaWorkspace/japoweb/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:19:"session.timer.start";i:1318443324;s:18:"session.timer.last";i:1318444880;s:17:"session.timer.now";i:1318444893;s:13:"session.token";s:32:"e5a6370e706646c32fae33c8b22e1f1f";}');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Estructura de la taula `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Bolcant dades de la taula `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('japoweb', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Bolcant dades de la taula `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'japoweb@japoweb.com', 'c40042179c3187f3037e60da0cb8914b:7hNtStP4IFb4oPYgAXk8tOkBXmWdPtkH', 'Super Administrator', 0, 1, 25, '2011-10-09 13:36:39', '2011-10-12 17:57:47', '', ''),
(63, 'neko', 'neko', 'josexu@gmail.com', '27d49f4bb71144062cad1392748dcf26', 'Registered', 0, 0, 18, '2011-10-09 15:32:48', '0000-00-00 00:00:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(64, 'iru', 'iru', 'iru.bcn@gmail.com', '27d49f4bb71144062cad1392748dcf26', 'Registered', 0, 0, 18, '2011-10-09 15:33:00', '0000-00-00 00:00:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(65, 'Pere Fonolleda', 'Pericuelo', 'peterpunkz@gmail.com', '0e15996bfb42588fdcf928d43e6dd324:CAEWqLZorLzxuhLXzae3XIEgMUbfEdyj', 'Registered', 0, 0, 18, '2011-10-09 15:36:54', '2011-10-12 18:15:31', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

-- --------------------------------------------------------

--
-- Estructura de la taula `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Bolcant dades de la taula `jos_weblinks`
--


--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `jos_jw_imagen`
--
ALTER TABLE `jos_jw_imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`id_termino`) REFERENCES `jos_jw_termino` (`id`),
  ADD CONSTRAINT `imagen_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `jos_users` (`id`);

--
-- Restriccions per la taula `jos_jw_modificacion`
--
ALTER TABLE `jos_jw_modificacion`
  ADD CONSTRAINT `modificacion_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jos_users` (`id`),
  ADD CONSTRAINT `modificacion_ibfk_2` FOREIGN KEY (`termino_id`) REFERENCES `jos_jw_termino` (`id`);

--
-- Restriccions per la taula `jos_jw_termino`
--
ALTER TABLE `jos_jw_termino`
  ADD CONSTRAINT `termino_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `jos_users` (`id`);

--
-- Restriccions per la taula `jos_jw_termino_categoria`
--
ALTER TABLE `jos_jw_termino_categoria`
  ADD CONSTRAINT `FK_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `jos_jw_categoria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_termino` FOREIGN KEY (`id_termino`) REFERENCES `jos_jw_termino` (`id`) ON DELETE CASCADE;
