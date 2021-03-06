<?php
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.model');
 
class JapowebModelTest extends JModel {
		
	function getCategorias($order = "") {
		$db =& JFactory::getDBO();
		
		switch($order) {
			case "alf":
				$db->setQuery("SELECT id, nombre FROM #__jw_categoria ORDER BY nombre ASC");
				break;
			case "menosP":
				$db->setQuery("SELECT id, nombre FROM #__jw_categoria ORDER BY num_palabras ASC");
				break;
			default:
				$db->setQuery("SELECT id, nombre FROM #__jw_categoria ORDER BY num_palabras DESC");
		}
		
		return $db->loadObjectList();
	}
	
	function getNombreCategorias($ids) {
		$db =& JFactory::getDBO();
		$categorias = array();
		
		foreach($ids as $id) {
			$db->setQuery("SELECT nombre FROM #__jw_categoria WHERE id = $id");
			$categorias[] = $db->loadResult();
		}
		
		return $categorias;
	}
	
	/**
	 * Función que recoge las preguntas para un usuario según su criterio de búsqueda.
	 * Int $userId id del usuario logeado
	 * Array $categoria id de la categoria que se usará para las preguntas
	 * Int $numPreguntas numero de preguntas (valor LIMIT de la query)
	 */
	function getPreguntas($userId, $categoria, $numPreg) {
		$db =& JFactory::getDBO();
		
		// Ids que ya han salido
		$query = "SELECT id_termino FROM #__jw_registro_preguntas WHERE id_user = $userId";
		$db->setQuery($query);
		
		$idsEx = $db->loadResultArray();
		
		// Primero seleccionamos las palabras que aún no le han salido
		$query = "SELECT t.id, kanji, kana, significado, i.fichero as img FROM #__jw_termino AS t LEFT JOIN #__jw_termino_categoria AS tc ON t.id = tc.id_termino";
		$query .= " LEFT JOIN #__jw_registro_preguntas AS rp ON t.id = rp.id_termino LEFT JOIN #__jw_imagen AS i ON t.id = i.id_termino";
		
		$query .= " WHERE ";
		foreach($categoria as $key => $c) {
			if($key != 0)
				$query .= " OR ";
			$query .= "tc.id_categoria = $c";
		}
		$query .= " AND t.id NOT IN (".implode(",",$idsEx).") ";
		$query .= " GROUP BY t.id ORDER BY RAND() LIMIT 0, $numPreg";
		
		$db->setQuery($query);
		
		$pregNuevas = $db->loadObjectList();
		
		$ids = array();
		foreach($pregNuevas as $preg) {
			$ids[] = $preg->id;
		}
		
		$pregHechas = array();
		if(count($pregNuevas) < $numPreg) {
			$limit = $numPreg - count($pregNuevas);
			
			// Si no hay suficientes preguntas con las nuevas, cojemos las que más errores tienen
			$query = "SELECT t.id, kanji, kana, significado, i.fichero as img, (rp.ok - rp.ko) AS balance, (rp.ok + rp.ko) AS total FROM #__jw_termino AS t LEFT JOIN #__jw_termino_categoria AS tc ON t.id = tc.id_termino";
			$query .= " LEFT JOIN #__jw_registro_preguntas AS rp ON t.id = rp.id_termino LEFT JOIN #__jw_imagen AS i ON t.id = i.id_termino";
			$query .= " WHERE ";
			foreach($categoria as $key => $c) {
				if($key != 0)
					$query .= " OR ";
				$query .= "tc.id_categoria = $c";
			}
			$query .= " AND rp.id_user = $userId";
			if(count($ids) > 0)
				$query .= " AND t.id NOT IN (".implode(",",$ids).") ";
			$query .= " GROUP BY t.id ORDER BY total ASC, balance ASC LIMIT 0, $limit";

			$db->setQuery($query);
			$pregHechas = $db->loadObjectList();
		}
		
		$preg = array_merge($pregNuevas,$pregHechas);
		
		return $preg;
	}
	
	/**
	 * Procesa los resultados obtenidos por el usuario en función de las preguntas, las respuestas y el tipo de respuesta esperada
	 * Array $preguntas array con los id's de las preguntas
	 * Array $respuestas array con los valores entrados por el usuario
	 * String $respField respuesta que se espera: kana, kanji, sign.
	 */
	function procesarRespuestas($idUser, $preguntas, $respuestas, $respField) {
		$db =& JFactory::getDBO();
		
		$resultadosKo = array(); // Devolvera los resultados negativos (haciendo un count sabremos los positivos)
		
		foreach($preguntas as $key => $idPregunta) {
			$respuesta = $respuestas[$key];
			
			$db->setQuery("SELECT $respField FROM #__jw_termino WHERE id = $idPregunta");
			$rCorrecta = $db->loadResult();
			
			// Miramos si la respuesta tiene varias posibilidades
			$rAOk = false;

			// echo "Antes: rCorrecta: $rCorrecta, respuesta: $respuesta<br/>";
			
			// Eliminamos todo el contenido entre parentesis de la respuesta y la pregunta
			$rCorrecta =  preg_replace('#\(.*\)#', '', $rCorrecta);
			$respuesta =  preg_replace('#\(.*\)#', '', $respuesta);
			
			// echo "Después: rCorrecta: $rCorrecta, respuesta: $respuesta<br/><br/>";
			
			// Para significado
			if($respField == "significado") {
				if(strpos($rCorrecta,",")) {
					// Tiene varias posibles respuestas
					$rCorrectaArray = explode(",",$rCorrecta);
					foreach($rCorrectaArray as $rA) {
						$rAOk = $rAOk || !strcasecmp(trim($rA),trim($respuesta));
					}
				}
				
				// Repetimos el paso anterior para el separador "/"
				if(strpos($rCorrecta,"/")) {
					// Tiene varias posibles respuestas
					$rCorrectaArray = explode("/",$rCorrecta);
					foreach($rCorrectaArray as $rA) {
						$rAOk = $rAOk || !strcasecmp(trim($rA),trim($respuesta));
					}
				}
			}
			
			// Para kana
			if($respField == "kana") {
				if(strpos($rCorrecta,"-")) {
					$rCorrectaArray = explode("-",$rCorrecta);
					foreach($rCorrectaArray as $rA) {
						$rAOk = $rAOk || !strcasecmp(trim($rA),trim($respuesta));
					}
				}
			}
			
			if(!strcasecmp(trim($rCorrecta),trim($respuesta)) || $rAOk) {
				$this->saveOk($idUser, $idPregunta);
			} else {
				$db->setQuery("SELECT kana, kanji, significado FROM #__jw_termino WHERE id = $idPregunta");
				$result = $db->loadObject();
				
				// Usamos el $respuestas[$key] porque $respuesta la hemos sobreescrito sin parentesis
				$result->respuestaKo = $respuestas[$key];
				
				$resultadosKo[] = $result;
				
				$this->saveKo($idUser, $idPregunta);
			}
		}
		
		return $resultadosKo;
	}

	/**
	 * Funcion que guarda una respuesta ok segun user y id del termino
	 * Int $idUser id del usuario
	 * Int $idTermino id del termino
	 */
	function saveOk($idUser, $idTermino) {
		$db =& JFactory::getDBO();
		
		// Miramos si existe esta relacion user <-> termino en la bdd
		$db->setQuery("SELECT count(id_user) FROM #__jw_registro_preguntas WHERE id_user = $idUser AND id_termino = $idTermino");
		
		if($db->loadResult()) {
			// Si existe hacemos un update con un +1 al ok
			$query = "UPDATE #__jw_registro_preguntas SET ok = ok+1 WHERE id_user = $idUser AND id_termino = $idTermino";
		} else {
			// Si no existe la creamos. Por defecto, 1 ok 0 ko.
			$query = "INSERT INTO #__jw_registro_preguntas (id_user, id_termino, ok, ko) VALUES ($idUser, $idTermino, 1, 0)";
		}
		$db->setQuery($query);
		$db->query();
	}
	
	/**
	 * Guarda un registro negativo para una pregunta segun user y termino
	 * Int $idUser id del usuario
	 * Int $idTermino id del termino
	 */
	function saveKo($idUser, $idTermino) {
		$db =& JFactory::getDBO();
		
		// Guardamos a la bdd el ko. Es lo mismo que el if anterior pero al revés (sumamos al ko).
		$db->setQuery("SELECT count(id_user) FROM #__jw_registro_preguntas WHERE id_user = $idUser AND id_termino = $idTermino");
		
		if($db->loadResult()) {
			// Si existe hacemos un update con un +1 al ko
			$query = "UPDATE #__jw_registro_preguntas SET ko = ko+1 WHERE id_user = $idUser AND id_termino = $idTermino";
		} else {
			// Si no existe la creamos. Por defecto, 0 ok 1 ko.
			$query = "INSERT INTO #__jw_registro_preguntas (id_user, id_termino, ok, ko) VALUES ($idUser, $idTermino, 0, 1)";
		}
		$db->setQuery($query);
		$db->query();
	}
}