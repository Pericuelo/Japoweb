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
		
		$terminos = $model->getTerminosByCategorias($catArray);
		$this->assignRef('terminos',$terminos);
		
		// El formato llegara en un string, que será "cols" o "grid"
		$formato  = JRequest::getVar('formato');
		$this->assign('formato',$formato);
		
		// La información a mostrar llegará en un string  del formato img|kana|sign. Los posibles valores son: img, kana, kanji i sign
		$infoString = JRequest::getVar('info');
		$infoArray = explode("|", $infoString);
		
		$this->assign('info',$infoArray);
		
		parent::display('pdf');
	}

}

