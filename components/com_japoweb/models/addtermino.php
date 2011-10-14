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
	
	function createTermino($kana, $kanji, $significado, $categorias, $categorias_nombre, $idUser, $google_image, $original_image) {
		$db =& JFactory::getDBO();

		//Guardamos las imagenes si las hay
		if($google_image != ""){
			include (JPATH_COMPONENT_SITE . 'assets' . DS . 'libs' . DS . 'aux_func.php');
			$img_name = array_sum(explode(' ', microtime()));
			//$img_extension = $ext = end(explode('.', $filename));
			$ok = salvar_http_a_local($google_image, 'img_vocabulario' . DS . 'peques' . DS . $img_name . '.jpg');
			if(!$ok) $google_image = "";
			//Aquí podriamos descargar la imagen original
		}
		//Creamos las categorías necesarias
		$categoriasArr = explode("|", $categorias);
		$categorias_nombreArr = explode("|", $categorias_nombre);
		if(!empty($categoriasArr)) {
			for($i = 0; $i < sizeof($categoriasArr); $i++){
				if($categorias_nombreArr[$i] == 'null'){
					//Creamos categoria
					$query = "INSERT INTO #__jw_categoria (`nombre`) VALUES ('$categorias_nombreArr[$i]')";
			
					$db->setQuery($query);
					$success = $db->query();
					if(!$success) {
						$error = $db->getErrorMsg();
						JError::raiseWarning( 100, $error );
						JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
					} else {
						$categoriasArr[$i] = $db->insertid();						
					}				
 				} else {
 				//Comprobamos correcta
					$query = "SELECT id FROM #__jw_categoria WHERE id = '$categoriasArr[$i]'";
 					$db->setQuery($query);
					$db->query();
					if ($db->getNumRows != 1){
						//No hemos de cancelar por esto... a lo mejor conseguimos guardar la palabra
						$categoriasArr[$i] = null;	
					}				
				}
			}
		}
		
		//Creamos o actualizamos el termino	
		$query = "SELECT id FROM #__jw_termino WHERE kana = '$kana'";
		$db->setQuery($query);
		$db->query();
		if ($db->getNumRows != 1){
		//UPDATE
			$query = "UPDATE #__jw_termino SET (`id_user`, `kanji`, `kana`, `significado`, `fecha`) VALUES";
			$query .= "($idUser, \"$kanji\", \"$kana\", \"$significado\")";
			
			$db->setQuery($query);
			$success = $db->query();
		} else {
		//INSERT
			$query = "INSERT INTO #__jw_termino (`id_user`, `kanji`, `kana`, `significado`, `fecha`) VALUES";
			$query .= "($idUser, \"$kanji\", \"$kana\", \"$significado\")";
			
			$db->setQuery($query);
			$success = $db->query();
		}

		$query = "INSERT INTO #__jw_termino (`id_user`, `kanji`, `kana`, `significado`, `fecha`) VALUES";
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