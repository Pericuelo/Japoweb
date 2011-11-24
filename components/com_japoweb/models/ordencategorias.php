<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelOrdencategorias extends JModel {
		
	function getCategorias() {
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT id, nombre, num_palabras FROM #__jw_categoria ORDER BY num_palabras DESC");
		
		return $db->loadObjectList();
	}

	function getPalabrasCategoria($id){
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT tc.id_termino, tc.orden, t.kanji, t.kana, t.significado FROM #__jw_termino_categoria tc, #__jw_termino t WHERE tc.id_categoria = ".$id." AND tc.id_termino = t.id ORDER BY tc.orden");		
		$result = $db->loadObjectList();		
		return $result;
	}
	
	function ordenarCategoria($cat_id, $sort_order){
		$db =& JFactory::getDBO();
		$ids = explode(',',$sort_order);
		/* run the update query for each id */
		foreach($ids as $index=>$id) {
			$id = (int) $id;
			if($id != '') {
				$db->setQuery('UPDATE #__jw_termino_categoria SET orden = '.($index + 1).' WHERE id_termino = '.$id.' AND id_categoria = '.$cat_id);
				$success = $db->query();
			}
		}
		JFactory::getApplication()->enqueueMessage( 'La categoría se ha ordenado.' );
		JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=ordencategorias&Itemid=5');
	}
}