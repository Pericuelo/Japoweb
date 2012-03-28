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
 
class JapowebViewTest extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$order = JRequest::getVar('order');
		
		$categorias = $model->getCategorias($order);
		
		echo json_encode($categorias);
    }
}