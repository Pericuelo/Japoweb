<?php
/**
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_1
 * @license    GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewGetlist extends JView {
    	
    function display() {
        $model =& $this->getModel();
		
		// Las categorias llegaran en un string de la forma "4|13|2|"
		$catString = JRequest::getVar('categorias');
		$catArray = explode("|", $catString);
		
		// Si las categorias deben ser union o intersección: "union", "inters"
		$catJoin = JRequest::getVar('catJoin');
		
		$terminos = $model->getTerminosByCategorias($catArray,$catJoin);
		$this->assignRef('terminos',$terminos);
		
		// El formato llegara en un string, que será "cols" o "grid"
		$formato  = JRequest::getVar('formato');
		$this->assign('formato',$formato);
		
		// La información a mostrar llegará en un string  del formato img|kana|sign. Los posibles valores son: img, kana, kanji i sign
		$infoString = JRequest::getVar('info');
		$infoArray = explode("|", $infoString);
		$this->assign('info',$infoArray);
		
		// Order
		// 1.- Imagen, 2.- Kana, 3.- Romaji 4.- Kanji 5.- Significado
		$order = JRequest::getVar('order');
		$order = explode(",", $order);
		$orderValues = array(1 => 'img', 2 => 'kana', 3 => 'romaji', 4 => 'kanji', 5 => 'sign');
		foreach($order as $o) {
			if(in_array($orderValues[$o], $infoArray)) {
				$ordArr[] = $orderValues[$o];
			}
		}
		
		$this->assign('ordenedArray', $ordArr);
		
		if(JRequest::getVar('out') == "csv") {
			parent::display('csv');
		} else {
			parent::display('pdf');
		}
	}

	function displayImage($file, $cols = false) {
		$text = '';
			
		if($cols) {
			$text = '<td class="image">';
			if(is_file("images/img_vocabulario/peques/".$file)) {
				$text .= '<span><img src="images/img_vocabulario/peques/'.$file.'"/></span>';
			}
			$text .= '</td>';
		} else {
			$text = '<div class="image">';
			if(is_file("images/img_vocabulario/peques/".$file)) {
				$text .= '<img src="images/img_vocabulario/peques/'.$file.'"/>';
			}
			$text .= "</div>";
		}
		
		return $text;
	}
}

