<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelGetlist extends JModel {
		
	function getCategorias() {
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT id, nombre FROM #__jw_categoria");
		
		return $db->loadObjectList();
	}
	
	/**
	 * Array $catArray array con los id's de las categorias (la última celda habitualmente estará vacia)
	 */
	function getTerminosByCategorias($catArray) {
			
		$db =& JFactory::getDBO();
		
		$query = "SELECT DISTINCT(t.id), kanji, kana, significado, i.fichero AS img FROM #__jw_termino AS t LEFT JOIN #__jw_termino_categoria AS tc ON tc.id_termino = t.id ";
		$query .= "LEFT JOIN #__jw_imagen AS i ON t.id = i.id_termino ";
		$query .= "WHERE tc.id_categoria IN (";
		
		$first = true;
		
		foreach($catArray as $categoria) {
			if($categoria != '') {
				if(!$first)
					$query .= ",";
					
				$query .= "$categoria";
				$first = false;
			}
		}
		
		$query .= ") GROUP BY t.id";
		
		$db->setQuery($query);
		
		return $db->loadObjectList();
	}
}