<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelGetlist extends JModel {
		
	function getCategorias() {
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT id, nombre FROM #__jw_categoria ORDER BY num_palabras DESC");
		
		return $db->loadObjectList();
	}
	
	/**
	 * Array $catArray array con los id's de las categorias (la última celda habitualmente estará vacia)
	 * String $catJoin define como deben juntarse las categorias: "union" o "inters"
	 */
	function getTerminosByCategorias($catArray, $catJoin) {
			
		$db =& JFactory::getDBO();
		
		$query = "SELECT t.id, kanji, kana, significado, i.fichero AS img FROM #__jw_termino AS t LEFT JOIN #__jw_termino_categoria AS tc ON tc.id_termino = t.id ";
		$query .= "LEFT JOIN #__jw_imagen AS i ON t.id = i.id_termino ";
		
		if($catJoin == 'union|') {
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
			
			$query .= ") ";
		} else {
			$query .= "WHERE t.id IN ";
			$first = true;
			foreach($catArray as $categoria) {
				if($categoria != '') {
					if(!$first)
						$query .= " AND t.id IN ";
					
					$db->setQuery("SELECT id_termino FROM #__jw_termino_categoria WHERE id_categoria=$categoria");
					$ids = $db->loadResultArray();
					
					$query .= "(".implode(", ", $ids).")";
					$first = false;
				}
			}
			
			$query .= " ";
		}
		
		$query .= "GROUP BY t.id ORDER BY tc.orden";
		
		$db->setQuery($query);
		
		return $db->loadObjectList();
		
	}
}