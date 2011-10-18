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

	function getTablaTerminos($kana){
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT * FROM #__jw_termino WHERE kana = '$kana'");		
		$terminos = $db->loadObjectList();
		foreach($terminos as $termino) {
			//Categorias
			//$db->setQuery("SELECT c.id, c.nombre FROM #__jw_termino t, #__jw_categoria c, #__jw_termino_categoria tc 
			//				WHERE t.id = tc.id_termino AND tc.id_categoria = c.id");		
			//$categorias[$termino->id] = $db->loadObjectList();
			
			//Imágenes
			$db->setQuery("SELECT fichero FROM #__jw_imagen 
							WHERE id_termino = ".$termino->id);		
			$result['imagenes'][$termino->id] = $db->loadResult();		
		}
		$result['terminos'] = $terminos;
		//$result['categorias'] = $categorias;
		
		return $result;
	}	
	
	function getTermino($id){
		$db =& JFactory::getDBO();
		$db->setQuery("SELECT kana, kanji, significado FROM #__jw_termino WHERE id = '$id'");		
		$termino = $db->loadObjectList();
		//Categorias
		$db->setQuery("SELECT c.id, c.nombre FROM #__jw_termino t, #__jw_categoria c, #__jw_termino_categoria tc 
						WHERE t.id = tc.id_termino AND tc.id_categoria = c.id AND t.id = $id");		
		$categorias = $db->loadObjectList();
		//Imágen
		$db->setQuery("SELECT fichero FROM #__jw_imagen 
						WHERE id_termino = ".$id);		
		$termino['imagen'] = $db->loadResult();		
		$termino['categorias'] = $categorias;
		
		return $termino;
	}	
	
	/**
	 * String kana
	 * String kanji
	 * String significado
	 * String categorias formado por ids separados por una pipe | (ej: 1|4|16|2)
	 * String categorias_nombre formado por nombres separados por una pipe | (ej: calendario|días)
	 * Int idUser usuario que crea la palabra
	 */
	
	function createTermino($kana, $kanji, $significado, $categorias, $categorias_nombres, $google_image, $original_image, $idUser, $termino) {
		//Comprobamos que se ha enviado el form con javascript tras validar
		$jAp=& JFactory::getApplication();
		if ($_POST['check']!=JUtility::getToken()) {
		   // First verify (by a Javascript error or other methods) that the form has not been submitted without the validation
		   if ($_POST['check']=='post'){
		   	//$jAp->enqueueMessage('Please check all the fields of the form, aub.<br/>
			//If your browser blocks Javascript, then this form will never be successful. This is a security measure.','error');
		   
		   	// If the check still isn't a valid token, do nothing. This might be a spoof attack or other invalid form submission
			JError::raiseWarning( 100, 'Este formulario necesita Javascript para funcionar.' );
			JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
			}
		}

		$db =& JFactory::getDBO();

		//Guardamos las imagenes si las hay
		if($google_image != ""){
			include ('components/com_japoweb/libs/aux_func.php');
			$img_name = array_sum(explode(' ', microtime()));
			//$img_extension = $ext = end(explode('.', $filename));
			//$ok = salvar_http_a_local($google_image, 'images/img_vocabulario/peques/'.$img_name.'.jpg');
			$ok_imagen = salvar_http_a_local($google_image, 'images/img_vocabulario/peques/'.$img_name.'.jpg');
			if(!$ok_imagen){
				JError::raiseWarning( 100, 'img_vocabulario/peques/'.$img_name.'.jpg '+ $google_image);
				JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
				$google_image = "";
			}
			//Aquí podriamos descargar la imagen original
		}
		//Creamos las categorías necesarias
		if ($categorias){
			$categoriasArr = explode("|", $categorias);
			$categorias_nombresArr = explode("|", $categorias_nombres);
		}
		if($categoriasArr) {
			for($i = 0; $i < sizeof($categoriasArr); $i++){
				if($categoriasArr[$i] == 'null'){
					//Creamos categoria
					$query = "INSERT INTO #__jw_categoria (`nombre`) VALUES ('$categorias_nombresArr[$i]')";
			
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
					$res_id = $db->loadResult();
					if ($res_id != $categoriasArr[$i]){
						//No hemos de cancelar por esto... a lo mejor conseguimos guardar la palabra
						$categoriasArr[$i] = null;	
					}				
				}
			}
		}
		
		//Creamos o actualizamos el termino	
		//UPDATE
		/*
			$query = "UPDATE #__jw_termino SET (`id_user`, `kanji`, `kana`, `significado`, `fecha`) VALUES";
			$query .= "($idUser, \"$kanji\", \"$kana\", \"$significado\", now())";
			
			$db->setQuery($query);
			$success = $db->query();
		 */
		 
		//INSERT
		$query = "INSERT INTO #__jw_termino (`id_user`, `kanji`, `kana`, `significado`, `fecha`) VALUES";
		$query .= "($idUser, '$kanji', '$kana', '$significado', now())";
		
		$db->setQuery($query);
		$success = $db->query();
		
		$db->setQuery($query);
		$success = $db->query();
		if(!$success) {
			$error = $db->getErrorMsg();
			JError::raiseWarning( 100, $error );
			JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
		} else {
			$id = $db->insertid();
			//Insertamos Imagen
			$sql_insert_imagen = "INSERT INTO `jos_jw_imagen` (`id_termino`, `id_user`, `fichero`, `url_original`, `fecha`) VALUES
($id, $idUser, '$img_name.jpg', '$original_image', now())";
			$db->setQuery($sql);
			$success = $db->query();
			if (!success) unlink('images/img_vocabulario/peques/'.$img_name.'.jpg'); 
			//Insertamos categorías
			if($categoriasArr) {
				$sql = "INSERT INTO #__jw_termino_categoria (id_termino, id_categoria) VALUES";
				$first = true;
				foreach($categoriasArr as $categoria) {
					// Faltaria un check para saber si la categoria existe y es correcta (por posibles errores de js).
					if($categoria != null)  {
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