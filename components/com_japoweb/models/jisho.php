<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelJisho extends JModel {
		
	function search() {
		$keyword = JRequest::getVar('keyword','','post');
		
		if($keyword != "") {
			$db =& JFactory::getDBO();
		
			$db->setQuery('SELECT id, kanji, kana, significado FROM #__jw_termino WHERE
						kanji LIKE "%'.$keyword.'%" OR kana LIKE "%'.$keyword.'%" OR significado LIKE "%'.$keyword.'%"');
			
			return $db->loadObjectList();
		} else {
			return array();
		}
	}
}