<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelOld extends JModel {
	
	function getLastChapter() {
		$db =& JFactory::getDBO();
		$sql = "SELECT MAX(capitulo) FROM #__jw_termino";
		$db->setQuery($sql);
		
		return $db->loadResult();
	}
	
	function getKanjis() {
		$db =& JFactory::getDBO();
		$sql = "SELECT id, kanji, significado, kunyomi, onyomi, capitulo FROM #__jw_termino WHERE es_kanji <> 0 ORDER BY capitulo, id";
		$db->setQuery($sql);
		
		return $db->loadAssocList();
	}
	
	function getKanjisFromChapter($chapterId) {
		$db =& JFactory::getDBO();
		$sql = "SELECT id, kanji FROM #__jw_termino WHERE capitulo=$chapterId AND es_kanji <> 0 ORDER BY id";
		$db->setQuery($sql);
		
		return $db->loadAssocList();
	}
	
}