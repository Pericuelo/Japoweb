<?php
/**
 * @package    	Joomla Japoweb
 * @subpackage 	Component
 * @autor		Jose L. Rodríguez
 * @license    	GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewAddtermino extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$terminos = $model->getTermino(JRequest::getVar('id'));
				
		echo json_encode($terminos);
    }
}