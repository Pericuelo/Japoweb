<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelAddtermino extends JModel {
		
	function getCategorias() {
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT id, nombre FROM #__jw_categoria");
		
		return $db->loadObjectList();
	}
	
	/**
	 * String kana
	 * String kanji
	 * String significado
	 * String categorias formado por id's separados por una pipe | (ej: 1|4|16|2|)
	 * Int idUser usuario que crea la palabra
	 */
	
	function createTermino($kana, $kanji, $significado, $categorias, $idUser) {
		$db =& JFactory::getDBO();
		
		$query = "INSERT INTO #__jw_termino (`id_user`, `kanji`, `kana`, `significado`) VALUES";
		$query .= "($idUser, \"$kanji\", \"$kana\", \"$significado\")";
		
		$db->setQuery($query);
		$success = $db->query();
		if(!$success) {
			$error = $db->getErrorMsg();
			JError::raiseWarning( 100, $error );
			JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
		} else {
			$id = $db->insertid();
			$categoriasArr = explode("|", $categorias);
			if(!empty($categoriasArr)) {
				$sql = "INSERT INTO #__jw_termino_categoria (id_termino, id_categoria) VALUES";
				$first = true;
				foreach($categoriasArr as $categoria) {
					// Faltaria un check para saber si la categoria existe y es correcta (por posibles errores de js).
					if($categoria != '')  {
						if(!$first)
							$sql .= ", ";
					
						$sql .= "($id, $categoria)";
						$first = false;
	 				}
				}
				$db->setQuery($sql);
				$success = $db->query();
				if(!$success) {
					$error = $db->getErrorMsg();
					JError::raiseWarning( 100, $error );
					JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
				} else {
					JFactory::getApplication()->enqueueMessage( 'El termino '.$kana.' se ha creado correctamente' );
					JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
				}
			} else {
				JFactory::getApplication()->enqueueMessage( 'El termino '.$kana.' se ha creado correctamente' );
				JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
			}
		}
	}
}